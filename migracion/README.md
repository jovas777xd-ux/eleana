# Pirotecnia Eleana — preparación del panel administrativo

**Estado: BORRADOR. NO FUSIONAR a main todavía.** El catálogo público actual sigue funcionando sin cambios.

## Auditoría inicial
- Repositorio: https://github.com/jovas777xd-ux/eleana
- HTML original: un solo archivo `index.html` de unos 17 MB.
- Productos originales: **225** con códigos únicos.
- Categorías: **61 «Baterías» y 164 «Productos»**.
- Todos aparecen **«Precio a cotizar»**, no hay precios numéricos.
- Las **225 fotos están incrustadas como data:image;base64** dentro del HTML, no en archivos sueltos.
- Se conservará el diseño existente y las cotizaciones por WhatsApp.

## Orden de configuración
1. Crear proyecto Supabase completamente nuevo, separado de ELO y ALEXVAL.
2. Ejecutar `migracion/01_configurar_supabase.sql` en SQL Editor.
3. Ejecutar `migracion/02_importar_225_productos.sql`. Verificar **225 total, 225 visibles, 61 Baterías y 164 Productos**.
4. Crear administradora en Supabase Authentication > Users y asignar su UID a `public.administradores` mediante SQL Editor. No guardar contraseñas en GitHub.
5. En esta rama, configurar `admin/config.js` con la Project URL sin `/rest/v1/` y la clave **publishable** (datos públicos; nunca sb_secret o service_role).
6. Integrar `catalogo-supabase.js` en `index.html` antes de publicar.
7. Probar catálogo completo, fotografías, búsqueda, carrito y WhatsApp. Probar CRUD del panel con producto de prueba y una cuenta no administradora.
8. Solo después de todas las comprobaciones, fusionar cambios a `main`.

## Particularidad técnica de las fotografías — RESUELTA
Las 225 imágenes originales se extrajeron cuidadosamente a `imagenes/<codigo>.<jpg/webp>`. La nueva versión del `index.html` en esta rama quedó en aproximadamente **564 KB** en vez de ~17 MB, conservando las imágenes y el diseño. **La rama `main` no fue modificada** y conserva el archivo original hasta la publicación.

La base Supabase almacena solo metadatos; para registros originales el catálogo usa las imágenes estáticas por código. Las imágenes nuevas se almacenarán en Supabase Storage y el panel admite ambos tipos. `catalogo-supabase.js` ya está enlazado desde la página preparada en esta rama.

**Importante:** aunque el código está conectado y pasa verificaciones estáticas, **NO fusionar esta rama todavía**. Primero crear y verificar el proyecto Supabase exclusivo de ELEANA, importar los 225 productos, configurar cuenta de administración y probar en un navegador. La versión pública en `main` permanece intacta mientras tanto.

## Seguridad
Los productos visibles son los únicos que debe devolver la API pública. Las operaciones de escritura requieren RLS y la cuenta autorizada. El panel está preparado para no conservar la sesión al recargar, como el panel de ALEXVAL.

**No copiar claves, datos ni cuentas de ELO o ALEXVAL a este proyecto.**
