/* ELEANA: conecta el catalogo original con la tabla eleana_productos.
 * Conserva las 225 fotos incluidas en index.html: las busca por codigo.
 * El diseño, filtros, carrito y WhatsApp siguen siendo los originales.
 */
(async function sincronizarEleana() {
  "use strict";
  const seccion = document.getElementById("catalogo");
  const nota = seccion?.querySelector(".demo");
  const originales = new Map(products.map(p => [p.id, p]));
  const imagenDefault = "data:image/svg+xml;charset=utf-8," +
    encodeURIComponent('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 200 160"><rect width="200" height="160" fill="#252035"/><text x="100" y="82" text-anchor="middle" fill="#d6ff43" font-family="Arial" font-size="15">SIN FOTO</text></svg>');
  const textoSeguro = (v) => String(v ?? "").replace(/[&<>"']/g, c =>
    ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" })[c]);
  const urlImagen = (v) => {
    try {
      const u = new URL(v);
      return u.protocol === "https:" ? u.href : "";
    } catch (_) { return ""; }
  };
  const urlVideo = (v) => {
    try {
      if (!v) return "";
      const u = new URL(v);
      return u.protocol === "https:" ? u.href : "";
    } catch (_) { return ""; }
  };
  const formatoPrecio = (p) =>
    p && p.precio !== null && p.precio !== undefined
      ? new Intl.NumberFormat("es-MX", { style: "currency", currency: "MXN" }).format(Number(p.precio))
      : "Precio a cotizar";

  // Los controladores originales siguen usando render() y update().
  const renderOriginal = render;
  render = function () {
    renderOriginal();
    for (const card of document.querySelectorAll("#products .product")) {
      const boton = card.querySelector("[data-add]");
      const p = boton && products.find(x => x.id === boton.dataset.add);
      const precio = card.querySelector(".product-bottom > span");
      if (precio && p) precio.textContent = formatoPrecio(p);
    }
  };
  const updateOriginal = update;
  update = function () {
    updateOriginal();
    const seleccion = products.filter(p => cart[p.id]);
    const filas = document.querySelectorAll("#cart-items .cart-row");
    filas.forEach((fila, i) => {
      const precio = fila.querySelector("small");
      if (precio && seleccion[i]) precio.textContent = formatoPrecio(seleccion[i]);
    });
  };

  function mostrarEstado(mensaje, error = false) {
    if (nota) {
      nota.textContent = mensaje;
      nota.setAttribute("role", "status");
      nota.style.color = error ? "#ffb2b2" : "";
    }
  }

  async function consultarProductos() {
    const datos = [];
    const porPagina = 500;
    for (let offset = 0; offset < 10000; offset += porPagina) {
      const url = new URL(SUPABASE_URL + "/rest/v1/eleana_productos");
      url.searchParams.set("select", "id,codigo,nombre,descripcion,categoria,precio,imagen,video,activo");
      url.searchParams.set("activo", "eq.true");
      url.searchParams.set("order", "id.asc");
      url.searchParams.set("limit", String(porPagina));
      url.searchParams.set("offset", String(offset));
      const respuesta = await fetch(url.toString(), {
        headers: { apikey: SUPABASE_KEY, Accept: "application/json" },
        cache: "no-store"
      });
      if (!respuesta.ok) {
        throw new Error("No se pudo consultar el inventario (HTTP " + respuesta.status + ").");
      }
      const pagina = await respuesta.json();
      if (!Array.isArray(pagina)) throw new Error("Respuesta de inventario no valida.");
      datos.push(...pagina);
      if (pagina.length < porPagina) break;
    }
    return datos;
  }

  function opcionesCategorias() {
    const contenedor = seccion?.querySelector(".filters");
    if (!contenedor) return;
    contenedor.querySelectorAll("[data-eleana-categoria-extra]").forEach(b => b.remove());
    const disponibles = new Set([...originales.values()].map(p => p.category));
    const botonesOriginales = new Set([...contenedor.querySelectorAll("[data-filter]")].map(b => b.dataset.filter));
    for (const p of products) {
      const categoria = p.category;
      if (!categoria || disponibles.has(categoria) || botonesOriginales.has(categoria)) continue;
      disponibles.add(categoria);
      const boton = document.createElement("button");
      boton.type = "button";
      boton.dataset.filter = categoria;
      boton.dataset.eleanaCategoriaExtra = "1";
      boton.textContent = categoria;
      boton.addEventListener("click", () => {
        filter = categoria;
        contenedor.querySelectorAll("[data-filter]").forEach(b => {
          b.classList.toggle("active", b === boton);
          b.setAttribute("aria-pressed", String(b === boton));
        });
        render();
      });
      contenedor.appendChild(boton);
    }
    if (filter !== "Todos" && !products.some(p => p.category === filter)) {
      filter = "Todos";
      contenedor.querySelectorAll("[data-filter]").forEach(b => {
        const activo = b.dataset.filter === "Todos";
        b.classList.toggle("active", activo);
        b.setAttribute("aria-pressed", String(activo));
      });
    }
  }

  function aplicarInventario(filas) {
    const integrados = filas.filter(x => x.activo).map(row => {
      const original = originales.get(row.codigo);
      const imagenNueva = urlImagen(row.imagen);
      return {
        id: original?.id || ("eleana-db-" + row.id),
        name: textoSeguro(row.nombre),
        category: textoSeguro(row.categoria || "Productos"),
        image: imagenNueva || original?.image || imagenDefault,
        cutout: imagenNueva ? "" : (original?.cutout || ""),
        video: urlVideo(row.video),
        precio: row.precio
      };
    });
    // Mantener la secuencia original de productos y agregar los nuevos al final.
    const orden = new Map([...originales.keys()].map((id, i) => [id, i]));
    integrados.sort((a, b) => (orden.get(a.id) ?? 1000000) - (orden.get(b.id) ?? 1000000));
    products.splice(0, products.length, ...integrados);
    productNumbers.clear();
    products.forEach((producto, i) => productNumbers.set(producto.id, i + 1));
    const visibles = new Set(products.map(p => p.id));
    for (const id of Object.keys(cart)) {
      if (!visibles.has(id)) delete cart[id];
    }
    opcionesCategorias();
    render();
    update();
    seccion.dataset.eleanaSync = "ready";
    mostrarEstado(products.length
      ? "Productos actualizados desde el inventario de ELEANA."
      : "No hay productos visibles por ahora. Vuelve a visitarnos pronto.");
  }

  try {
    mostrarEstado("Actualizando productos...");
    const filas = await consultarProductos();
    aplicarInventario(filas);
  } catch (error) {
    // No usar el arreglo original si no se pueden consultar las visibilidades.
    products.splice(0);
    productNumbers.clear();
    for (const id of Object.keys(cart)) delete cart[id];
    render(); update();
    if (seccion) seccion.dataset.eleanaSync = "ready";
    mostrarEstado("Catálogo temporalmente no disponible. Intenta actualizar la página.", true);
    console.error("ELEANA: error al consultar productos", error);
  }
})();
