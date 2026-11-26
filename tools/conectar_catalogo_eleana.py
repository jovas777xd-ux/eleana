#!/usr/bin/env python3
"""Inserta únicamente dos etiquetas de script en el HTML original de ELEANA.

El archivo tiene 17 MB con 225 fotos base64 embebidas. Leer y escribir bytes
preserva el diseño y las imágenes sin convertirlas ni moverlas.
"""
from pathlib import Path

pagina = Path(__file__).resolve().parents[1] / "index.html"
html = pagina.read_bytes()

carga = (
    b'<style id="eleana-supabase-loading">'
    b'#catalogo:not([data-eleana-sync="ready"]) #products{visibility:hidden}'
    b'</style>'
)
scripts = (
    b'<script src="admin/config.js?v=1"></script>'
    b'<script src="catalogo-eleana.js?v=1"></script>'
)

if b"catalogo-eleana.js?v=1" in html:
    print("El catalogo ya esta conectado, sin cambios.")
    raise SystemExit(0)

if html.count(b"</head>") != 1:
    raise SystemExit("ERROR: cabecera HTML inesperada.")
if html.count(b"</script></body></html>") != 1:
    raise SystemExit("ERROR: cierre del script original inesperado.")
if b"const products=[" not in html or b"data:image/" not in html:
    raise SystemExit("ERROR: no se encontro el catalogo original con fotos.")

nuevo = html.replace(b"</head>", carga + b"</head>", 1)
nuevo = nuevo.replace(
    b"</script></body></html>",
    b"</script>" + scripts + b"</body></html>",
    1,
)
assert len(nuevo) - len(html) == len(carga) + len(scripts)
pagina.write_bytes(nuevo)
print(f"ELEANA: HTML original preservado, {len(html)} -> {len(nuevo)} bytes.")
