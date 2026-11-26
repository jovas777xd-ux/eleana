// Panel ELEANA. Mantener esta base separada de ELO y ALEXVAL.
const cliente = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY, {
    auth: { persistSession: false, autoRefreshToken: true, detectSessionInUrl: true }
});
const $ = id => document.getElementById(id);
const elementos = { login: $("login"), panel: $("panel"), recuperacion: $("recuperacion") };
let recuperando = false;
let productos = [];
let fotosOriginales = null;

function mostrar(seccion) {
    for (const [nombre, el] of Object.entries(elementos)) {
        el.style.display = nombre === seccion ? "block" : "none";
    }
}
mostrar("");

function normalizar(texto) {
    return String(texto ?? "").normalize("NFD").replace(/[\u0300-\u036f]/g, "")
        .toLocaleLowerCase("es").trim();
}

// Las fotografías originales no están en carpetas separadas: se incluyeron
// dentro de los 225 registros originales de index.html.
// Se leen solo cuando una administradora tiene acceso al panel.
async function obtenerFotosOriginales() {
    if (fotosOriginales) return fotosOriginales;
    const mapa = new Map();
    try {
        const respuesta = await fetch("../index.html", { cache: "force-cache" });
        if (!respuesta.ok) throw new Error("No se pudo leer el catálogo original.");
        const pagina = await respuesta.text();
        const coincidencia = pagina.match(/const products=(\[[\s\S]*?\]);\s*const productNumbers/);
        if (coincidencia) {
            const originales = JSON.parse(coincidencia[1]);
            for (const p of originales) {
                if (p.id && /^imagenes\/[a-z0-9_-]+\.(jpg|jpeg|png|webp)$/.test(p.image || "")) {
                    mapa.set(p.id, "../" + p.image);
                }
            }
        }
    } catch (error) {
        console.warn("ELEANA: algunas fotos originales no pudieron cargarse.", error);
    }
    fotosOriginales = mapa;
    return mapa;
}

function urlFotografia(producto) {
    if (/^https:\/\//i.test(String(producto.imagen || ""))) return producto.imagen;
    return fotosOriginales?.get(producto.codigo) || "";
}

async function verificarAcceso() {
    if (recuperando) return;
    const { data: { user }, error } = await cliente.auth.getUser();
    if (error || !user) { mostrar("login"); return; }

    const { data, error: permisoError } = await cliente
        .from("administradores").select("usuario_id")
        .eq("usuario_id", user.id).maybeSingle();
    if (permisoError || !data) {
        $("mensaje").textContent = "Esta cuenta no tiene permisos de administración.";
        await cliente.auth.signOut();
        mostrar("login");
        return;
    }
    mostrar("panel");
    await cargarProductos();
}

cliente.auth.onAuthStateChange(evento => {
    if (evento === "PASSWORD_RECOVERY") {
        recuperando = true;
        mostrar("recuperacion");
    }
});

$("formLogin").addEventListener("submit", async evento => {
    evento.preventDefault();
    $("mensaje").textContent = "Verificando acceso...";
    const email = $("correo").value.trim();
    const password = $("contrasena").value;
    const { error } = await cliente.auth.signInWithPassword({ email, password });
    if (error) {
        $("mensaje").textContent = "No se pudo iniciar sesión. Revisa tus datos.";
        return;
    }
    $("mensaje").textContent = "";
    $("contrasena").value = "";
    await verificarAcceso();
});

$("salir").addEventListener("click", async () => {
    await cliente.auth.signOut();
    $("listaProductos").replaceChildren();
    fotosOriginales = null;
    mostrar("login");
});

$("formRecuperacion").addEventListener("submit", async evento => {
    evento.preventDefault();
    if (!recuperando) return;
    const { data: { user } } = await cliente.auth.getUser();
    if (!user) { $("mensajeRecuperacion").textContent = "Enlace no válido."; return; }
    const { error } = await cliente.auth.updateUser({ password: $("nuevaContrasena").value });
    if (error) { $("mensajeRecuperacion").textContent = error.message; return; }
    await cliente.auth.signOut();
    recuperando = false;
    history.replaceState(null, "", location.pathname);
    $("nuevaContrasena").value = "";
    $("mensaje").textContent = "Contraseña actualizada. Vuelve a iniciar sesión.";
    mostrar("login");
});

async function iniciar() {
    await cliente.auth.initialize();
    if (recuperando) return;
    const parametros = new URLSearchParams(location.search);
    const hash = new URLSearchParams(location.hash.replace(/^#/, ""));
    if (parametros.has("code") || parametros.has("token_hash") ||
        parametros.get("type") === "recovery" || hash.get("type") === "recovery") {
        const { data: { session } } = await cliente.auth.getSession();
        if (session) {
            recuperando = true;
            mostrar("recuperacion");
        } else {
            $("mensajeRecuperacion").textContent = "El enlace ha caducado o no es válido.";
            mostrar("recuperacion");
        }
        return;
    }
    await verificarAcceso();
}

function campoArchivo(archivo) {
    if (!archivo) return null;
    const extensiones = { "image/jpeg": "jpg", "image/png": "png", "image/webp": "webp" };
    if (!extensiones[archivo.type]) throw new Error("Solo JPG, PNG o WEBP.");
    if (archivo.size > 5 * 1024 * 1024) throw new Error("La fotografía no puede superar 5 MB.");
    return extensiones[archivo.type];
}

async function subirFoto(archivo) {
    const ext = campoArchivo(archivo);
    const ruta = "catalogo/" + crypto.randomUUID() + "." + ext;
    const { error } = await cliente.storage.from("productos").upload(ruta, archivo, {
        contentType: archivo.type, upsert: false
    });
    if (error) throw error;
    const { data } = cliente.storage.from("productos").getPublicUrl(ruta);
    return { ruta, url: data.publicUrl };
}

async function retirarFoto(ruta) {
    if (ruta) await cliente.storage.from("productos").remove([ruta]);
}

function nuevaFila(producto) {
    const fila = document.createElement("article");
    fila.className = "producto-fila";
    fila.dataset.busqueda = normalizar([producto.codigo, producto.nombre, producto.categoria].join(" "));

    const marco = document.createElement("div");
    marco.className = "producto-imagen-caja";
    const imagen = urlFotografia(producto);
    if (imagen) {
        const foto = document.createElement("img");
        foto.className = "producto-imagen";
        foto.loading = "lazy";
        foto.alt = producto.nombre;
        foto.src = imagen;
        foto.addEventListener("error", () => { marco.textContent = "Sin foto"; }, { once: true });
        marco.appendChild(foto);
    } else {
        marco.textContent = "Sin foto";
    }
    const datos = document.createElement("div");
    datos.className = "producto-detalles";
    const titulo = document.createElement("strong");
    titulo.className = "producto-nombre";
    titulo.textContent = producto.nombre;
    const meta = document.createElement("p");
    meta.className = "producto-meta";
    meta.textContent = producto.codigo + " · " + producto.categoria;
    const precio = document.createElement("div");
    precio.className = "producto-precio";
    precio.textContent = "Por cotizar";
    const estado = document.createElement("span");
    estado.className = "producto-estado " + (producto.activo ? "visible" : "oculto");
    estado.textContent = producto.activo ? "Visible" : "Oculto";
    datos.append(titulo, meta, precio, estado);

    const acciones = document.createElement("div");
    acciones.className = "producto-acciones";
    const botonEditar = document.createElement("button");
    botonEditar.type = "button";
    botonEditar.textContent = "Editar";
    botonEditar.addEventListener("click", () => {
        $("editarId").value = producto.codigo;
        $("editarNombre").value = producto.nombre;
        $("editarCategoria").value = producto.categoria;
        $("editarVideo").value = producto.video || "";
        $("editarImagen").value = "";
        $("mensajeEditar").textContent = "";
        $("seccionEditar").style.display = "block";
        $("seccionEditar").scrollIntoView({ behavior: "smooth" });
    });

    const botonEstado = document.createElement("button");
    botonEstado.type = "button";
    botonEstado.textContent = producto.activo ? "Ocultar" : "Mostrar";
    botonEstado.addEventListener("click", async () => {
        botonEstado.disabled = true;
        const { error } = await cliente.from("productos")
            .update({ activo: !producto.activo }).eq("codigo", producto.codigo);
        if (error) { alert(error.message); botonEstado.disabled = false; return; }
        await cargarProductos();
    });
    acciones.append(botonEditar, botonEstado);

    if (!producto.activo) {
        const eliminar = document.createElement("button");
        eliminar.type = "button";
        eliminar.className = "accion-eliminar";
        eliminar.textContent = "Eliminar definitivamente";
        eliminar.addEventListener("click", async () => {
            const confirmado = prompt('Escribe "' + producto.nombre + '" para eliminar el producto de forma permanente:');
            if (confirmado === null) return;
            if (confirmado.trim() !== producto.nombre.trim()) {
                alert("El nombre no coincide; no se eliminó.");
                return;
            }
            eliminar.disabled = true;
            const { data, error } = await cliente.from("productos")
                .delete().eq("codigo", producto.codigo).eq("activo", false).select("codigo");
            if (error || !data || data.length !== 1) {
                alert("No se pudo eliminar el producto: " + (error?.message || "permiso denegado"));
                eliminar.disabled = false;
                return;
            }
            if ($("editarId").value === producto.codigo) $("seccionEditar").style.display = "none";
            await cargarProductos();
        });
        acciones.appendChild(eliminar);
    }
    fila.append(marco, datos, acciones);
    return fila;
}

async function cargarProductos() {
    const lista = $("listaProductos");
    $("mensajeProductos").textContent = "Cargando productos...";
    lista.replaceChildren();
    const { data, error } = await cliente.from("productos")
        .select("codigo,nombre,categoria,imagen,recorte,video,activo")
        .order("codigo");
    if (error) {
        $("mensajeProductos").textContent = "Error: " + error.message;
        return;
    }
    productos = data || [];
    if (productos.some(p => !p.imagen)) await obtenerFotosOriginales();
    const fragmento = document.createDocumentFragment();
    for (const p of productos) fragmento.appendChild(nuevaFila(p));
    lista.appendChild(fragmento);
    $("mensajeProductos").textContent = productos.length + " productos registrados.";
    aplicarBusqueda();
}

function aplicarBusqueda() {
    const consulta = normalizar($("buscarProductoAdmin").value);
    const filas = [...$("listaProductos").children];
    let encontrados = 0;
    for (const fila of filas) {
        const mostrar = fila.dataset.busqueda.includes(consulta);
        fila.hidden = !mostrar;
        if (mostrar) encontrados++;
    }
    $("contadorBusqueda").textContent = "Mostrando " + encontrados + " de " + filas.length + " productos.";
}
$("buscarProductoAdmin").addEventListener("input", aplicarBusqueda);
$("actualizarProductos").addEventListener("click", cargarProductos);

$("formProducto").addEventListener("submit", async evento => {
    evento.preventDefault();
    const formulario = evento.currentTarget;
    const boton = formulario.querySelector('button[type="submit"]');
    if (boton.disabled) return;
    const nombre = $("nombreProducto").value.trim();
    const categoria = $("categoriaProducto").value;
    const archivo = $("imagenProducto").files[0];
    const video = $("videoProducto").value.trim() || null;
    if (!nombre || !categoria || !archivo) {
        $("mensajeGuardar").textContent = "Completa nombre, categoría y fotografía.";
        return;
    }
    boton.disabled = true;
    let ruta = "";
    try {
        $("mensajeGuardar").textContent = "Subiendo fotografía...";
        const subida = await subirFoto(archivo);
        ruta = subida.ruta;
        const { error } = await cliente.from("productos").insert({
            nombre, categoria, imagen: subida.url, video, activo: false
        });
        if (error) throw error;
        $("mensajeGuardar").textContent = "Producto guardado como oculto. Presiona Mostrar para publicarlo.";
        formulario.reset();
        ruta = "";
        await cargarProductos();
    } catch (error) {
        await retirarFoto(ruta);
        $("mensajeGuardar").textContent = "No se pudo guardar: " + error.message;
    } finally { boton.disabled = false; }
});

$("formEditar").addEventListener("submit", async evento => {
    evento.preventDefault();
    const boton = evento.currentTarget.querySelector('button[type="submit"]');
    if (boton.disabled) return;
    boton.disabled = true;
    let ruta = "";
    try {
        const cambios = {
            nombre: $("editarNombre").value.trim(),
            categoria: $("editarCategoria").value,
            video: $("editarVideo").value.trim() || null
        };
        if (!cambios.nombre || !cambios.categoria) throw new Error("Completa nombre y categoría.");
        const foto = $("editarImagen").files[0];
        if (foto) {
            $("mensajeEditar").textContent = "Subiendo fotografía...";
            const subida = await subirFoto(foto);
            ruta = subida.ruta;
            cambios.imagen = subida.url;
            cambios.recorte = null; // El recorte antiguo no corresponde a una fotografía nueva.
        }
        const { error } = await cliente.from("productos").update(cambios)
            .eq("codigo", $("editarId").value);
        if (error) throw error;
        ruta = "";
        $("mensajeEditar").textContent = "Cambios guardados correctamente.";
        $("editarImagen").value = "";
        await cargarProductos();
    } catch (error) {
        await retirarFoto(ruta);
        $("mensajeEditar").textContent = "Error: " + error.message;
    } finally { boton.disabled = false; }
});
$("cancelarEdicion").addEventListener("click", () => {
    $("seccionEditar").style.display = "none";
});
iniciar();
