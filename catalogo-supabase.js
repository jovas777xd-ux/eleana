/* ELEANA: conectar el catálogo original a una base de Supabase independiente.
   Este archivo se carga después del script original de index.html.
   En caso de error, NO muestra registros ocultos ni antiguos. */
(async function cargarCatalogoEleana() {
    const contenedor = document.getElementById("products");
    const loader = document.getElementById("eleana-catalogo-loader");
    const originalPorCodigo = new Map(products.map((p, i) => [p.id, { ...p, posicion: i }]));
    const status = document.createElement("p");
    status.setAttribute("role", "status");
    status.textContent = "Cargando catálogo...";
    contenedor.before(status);

    try {
        if (typeof SUPABASE_URL !== "string" || SUPABASE_URL.includes("REEMPLAZAR") ||
            typeof SUPABASE_KEY !== "string" || SUPABASE_KEY.includes("REEMPLAZAR") ||
            !window.supabase) throw new Error("Falta configurar el proyecto Eleana en Supabase.");

        const clientePublico = window.supabase.createClient(SUPABASE_URL, SUPABASE_KEY, {
            auth: { persistSession: false, autoRefreshToken: false }
        });
        const { data, error } = await clientePublico
            .from("productos")
            .select("codigo,nombre,categoria,imagen,recorte,video,activo")
            .eq("activo", true)
            .order("codigo");

        if (error) throw error;
        if (!Array.isArray(data)) throw new Error("No se recibió un catálogo válido.");

        // Preservar el orden y las fotografías embebidas de los productos originales.
        const ordenados = [...data].sort((a, b) => {
            const posA = originalPorCodigo.get(a.codigo)?.posicion ?? 1e9;
            const posB = originalPorCodigo.get(b.codigo)?.posicion ?? 1e9;
            return posA - posB || String(a.codigo).localeCompare(String(b.codigo));
        });
        const nuevos = ordenados.map((r) => {
            const original = originalPorCodigo.get(r.codigo);
            return {
                id: String(r.codigo),
                name: String(r.nombre || ""),
                category: String(r.categoria || ""),
                image: r.imagen || original?.image || "",
                cutout: r.imagen ? "" : (r.recorte || original?.cutout || ""),
                video: r.video || null
            };
        });

        products.splice(0, products.length, ...nuevos);
        productNumbers.clear();
        for (const p of nuevos) {
            const original = originalPorCodigo.get(p.id);
            productNumbers.set(p.id, original ? original.posicion + 1 : productNumbers.size + 226);
        }

        // Descartar únicamente los productos ya no visibles o eliminados del carrito.
        for (const id of Object.keys(cart)) {
            if (!products.some(p => p.id === id)) delete cart[id];
        }
        render();
        update();
        status.textContent = products.length
            ? products.length + " productos disponibles."
            : "Actualmente no hay productos publicados.";
        status.style.fontSize = "13px";
        status.style.color = "#cad3c9";
    } catch (error) {
        console.error("ELEANA: no se pudieron cargar los productos de Supabase", error);
        products.splice(0, products.length);
        for (const id of Object.keys(cart)) delete cart[id];
        productNumbers.clear();
        render();
        update();
        status.textContent = "No fue posible cargar el catálogo. Actualiza la página.";
        status.style.color = "#ffd1d1";
    } finally {
        if (loader) loader.remove();
    }
})();
