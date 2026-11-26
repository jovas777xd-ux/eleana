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

## Particularidad técnica de las fotografías
El HTML incorpora ~16,7 MB de fotografías en data URIs. Para evitar duplicarlas, la base Supabase conserva solamente los metadatos; la aplicación enlaza los códigos originales con sus imágenes embebidas. Las fotos nuevas se suben al bucket `productos`.

El panel de administración preparado puede leer las fotografías originales mediante el HTML público (es una operación adicional de ~17 MB y conviene optimizarla en el futuro).

### Bloqueo antes del despliegue
GitHub no aceptó la actualización directa del `index.html` de 17 MB con la herramienta de edición. El archivo original **no se modificó**, ni siquiera en esta rama. `catalogo-supabase.js` ya está preparado pero todavía no se carga desde `index.html`.

Para terminar la integración puede ser necesario dividir las fotos en archivos estáticos individuales y reducir el HTML, o actualizar ese archivo grande por otra vía con capacidad de transferencia suficiente. No publicar el panel como terminado hasta resolver esto.

## Seguridad
Los productos visibles son los únicos que debe devolver la API pública. Las operaciones de escritura requieren RLS y la cuenta autorizada. El panel está preparado para no conservar la sesión al recargar, como el panel de ALEXVAL.

**No copiar claves, datos ni cuentas de ELO o ALEXVAL a este proyecto.**
