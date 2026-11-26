-- ELEANA · importar 225 productos originales sin copiar 16 MB de fotos.
-- Las 225 imágenes originales continúan incrustadas en el HTML de GitHub.
-- El catálogo cruza imágenes por código; los registros nuevos usan Storage.
-- Ejecutar DESPUÉS de 01_configurar_supabase.sql, exclusivamente en ELEANA.

insert into public.productos
  (codigo,nombre,categoria,recorte,video,activo)
select
  item.codigo, item.nombre, item.categoria, item.recorte, item.video, true
from jsonb_to_recordset($eleana$
[
  {
    "codigo": "eleana-abanikito",
    "nombre": "Abanikito",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(116.863cqw,161.847cqh);--cut-translate:-52.869% -50.237%;--cut-polygon:polygon(13.934% 40.284%,25.41% 36.493%,63.115% 34.597%,91.803% 39.336%,75.41% 62.559%,31.967% 65.877%)",
    "video": null
  },
  {
    "codigo": "eleana-abaniko",
    "nombre": "Abaniko",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(91.752cqw,140.551cqh);--cut-translate:-49.59% -56.398%;--cut-polygon:polygon(0% 40.284%,24.59% 38.389%,75.41% 39.336%,99.18% 41.706%,76.23% 59.716%,66.393% 72.986%,22.951% 74.408%,12.295% 59.716%)",
    "video": null
  },
  {
    "codigo": "foto-abejitas",
    "nombre": "Abejitas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-abejorro",
    "nombre": "Abejorro",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-abejorromixi",
    "nombre": "Abejorro mixi",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-abejorromixivampirito",
    "nombre": "Abejorromixi vampirito",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-adrenocromo",
    "nombre": "Adrenocromo",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-arana",
    "nombre": "Araña",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-aranas3pz",
    "nombre": "Arañas · 3 piezas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(122cqw,65.133cqh);--cut-translate:-58.607% -53.555%;--cut-polygon:polygon(26.23% 15.166%,72.131% 14.692%,76.23% 32.701%,82.787% 46.919%,86.066% 66.825%,95.902% 90.047%,81.967% 92.417%,21.311% 91.469%,22.951% 73.934%,22.951% 52.133%)",
    "video": null
  },
  {
    "codigo": "foto-avisponbolsa",
    "nombre": "Avisponbolsa",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-huichol",
    "nombre": "Batería Huichol · 36 disparos",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(108.843cqw,124.208cqh);--cut-translate:-45.902% -45.972%;--cut-polygon:polygon(4.918% 26.066%,26.23% 25.592%,86.066% 25.592%,87.705% 54.028%,68.033% 66.351%,31.148% 66.351%,4.098% 63.033%)",
    "video": null
  },
  {
    "codigo": "foto-batman",
    "nombre": "Batman",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-basuka3pulgadas",
    "nombre": "Bazuca de 3 pulgadas · amarilla",
    "categoria": "Productos",
    "recorte": "--cut-width:min(152.082cqw,63.583cqh);--cut-translate:-46.311% -51.659%;--cut-polygon:polygon(32.787% 13.744%,45.082% 11.848%,60.656% 13.744%,64.754% 16.114%,63.934% 31.28%,65.574% 54.976%,70.492% 66.351%,76.23% 73.46%,75.41% 85.782%,67.213% 91.469%,51.639% 87.678%,42.623% 81.991%,22.951% 81.043%,16.393% 72.986%,22.131% 62.559%,27.049% 46.445%)",
    "video": null
  },
  {
    "codigo": "eleana-bazuca3pulgadas",
    "nombre": "Bazuca de 3 pulgadas · azul",
    "categoria": "Productos",
    "recorte": "--cut-width:min(152.082cqw,64.739cqh);--cut-translate:-50.41% -51.896%;--cut-polygon:polygon(40.164% 12.796%,62.295% 12.796%,65.574% 28.91%,68.852% 51.659%,74.59% 65.877%,80.328% 78.199%,71.311% 89.573%,54.098% 90.995%,42.623% 83.886%,27.869% 84.834%,20.492% 77.725%,25.41% 65.877%,33.607% 55.45%)",
    "video": null
  },
  {
    "codigo": "eleana-bazucadoble",
    "nombre": "Bazuca doble de 3 pulgadas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(156.366cqw,59.675cqh);--cut-translate:-41.393% -54.739%;--cut-polygon:polygon(23.77% 13.744%,51.639% 12.322%,61.475% 14.692%,62.295% 45.498%,67.213% 54.976%,70.492% 71.09%,65.574% 88.152%,56.557% 97.156%,45.902% 96.209%,38.525% 86.256%,19.672% 84.36%,13.115% 74.882%,12.295% 60.19%,21.311% 45.972%)",
    "video": null
  },
  {
    "codigo": "eleana-bazucatriple3pulgadas",
    "nombre": "Bazuca triple de 4 pulgadas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(133.759cqw,51.109cqh);--cut-translate:-55.328% -50%;--cut-polygon:polygon(40.984% 0.474%,64.754% 0.474%,67.213% 12.322%,70.492% 36.493%,76.23% 52.607%,81.967% 63.033%,89.344% 75.829%,81.967% 87.678%,69.672% 90.047%,63.115% 98.104%,45.082% 99.526%,36.885% 89.1%,28.689% 87.204%,21.311% 80.095%,22.131% 68.72%,24.59% 51.185%,32.787% 40.284%,35.246% 15.64%)",
    "video": null
  },
  {
    "codigo": "eleana-bigkiller",
    "nombre": "Big Killer",
    "categoria": "Productos",
    "recorte": "--cut-width:min(93.294cqw,127.165cqh);--cut-translate:-49.59% -50.711%;--cut-polygon:polygon(6.557% 30.806%,87.705% 30.806%,98.361% 36.493%,98.361% 68.72%,0.82% 70.616%,0.82% 44.55%)",
    "video": null
  },
  {
    "codigo": "foto-billetes",
    "nombre": "Billetes",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-bobesponja",
    "nombre": "Bob Esponja",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-boladeluzchavo",
    "nombre": "Bola de luzchavo",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-bolabarbie",
    "nombre": "Bolabarbie",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-bolasdehumo",
    "nombre": "Bolas de humo",
    "categoria": "Productos",
    "recorte": "--cut-width:min(92.517cqw,217.997cqh);--cut-translate:-50% -51.896%;--cut-polygon:polygon(4.098% 41.232%,92.623% 40.284%,99.18% 47.867%,99.18% 60.664%,1.639% 63.507%,0.82% 49.289%)",
    "video": null
  },
  {
    "codigo": "foto-bombon",
    "nombre": "Bombon",
    "categoria": "Productos",
    "recorte": "--cut-width:min(105.733cqw,106.819cqh);--cut-translate:-52.869% -53.555%;--cut-polygon:polygon(13.115% 39.81%,36.066% 36.019%,54.918% 36.967%,56.557% 33.649%,87.705% 29.858%,95.902% 39.336%,95.902% 72.512%,84.426% 77.251%,51.639% 74.408%,22.131% 74.408%,9.836% 67.773%)",
    "video": null
  },
  {
    "codigo": "eleana-bomobn",
    "nombre": "Cañón bombita",
    "categoria": "Productos",
    "recorte": "--cut-width:min(102.796cqw,144.35cqh);--cut-translate:-54.918% -52.607%;--cut-polygon:polygon(10.656% 40.758%,50.82% 37.915%,53.279% 38.389%,61.475% 35.071%,92.623% 35.545%,99.18% 64.929%,88.525% 70.142%,11.475% 68.246%)",
    "video": null
  },
  {
    "codigo": "eleana-botamisil",
    "nombre": "Bota misil",
    "categoria": "Productos",
    "recorte": "--cut-width:min(126.159cqw,101.732cqh);--cut-translate:-48.361% -53.318%;--cut-polygon:polygon(18.852% 28.436%,76.23% 28.436%,84.426% 31.28%,81.148% 66.825%,76.23% 73.46%,61.475% 78.199%,36.885% 78.199%,18.033% 72.986%,13.934% 64.455%,12.295% 30.806%)",
    "video": null
  },
  {
    "codigo": "foto-brainroots",
    "nombre": "Brainroots",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-buscapie",
    "nombre": "Buscapie",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cajitasilbato",
    "nombre": "Cajitasilbato",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cakeamazonas100tiros",
    "nombre": "Cake amazonas · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=IhOmuaZ56nU"
  },
  {
    "codigo": "foto-cakearmonia19tiros",
    "nombre": "Cake armonia · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=3M7VSc-q1iQ"
  },
  {
    "codigo": "foto-cakeazteca36tiros",
    "nombre": "Cake azteca · 36 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=1dHbEX_quHM"
  },
  {
    "codigo": "foto-cakebigbang49tiros",
    "nombre": "Cake Big Bang · 49 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=u_8-cg9bOEA"
  },
  {
    "codigo": "foto-cakebolero25tiros",
    "nombre": "Cake bolero · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=KJtcD06KEGg"
  },
  {
    "codigo": "foto-cakeborabora16tiros",
    "nombre": "Cake Bora Bora · 16 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=04QRXpPrZS8"
  },
  {
    "codigo": "foto-cakebrasil19tiros",
    "nombre": "Cake brasil · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=aJcS4p7_aDc"
  },
  {
    "codigo": "foto-cakebrillante100tiros",
    "nombre": "Cake brillante · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=LKNug7uwHHE"
  },
  {
    "codigo": "foto-cakecelebracion100tiros",
    "nombre": "Cake celebracion · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=eEkPbq-5eQk"
  },
  {
    "codigo": "foto-cakeconfetideluces16tiros",
    "nombre": "Cake Confeti de luces · 16 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=TE4H0nbVFxI"
  },
  {
    "codigo": "foto-cakecosmopolitan30tiros",
    "nombre": "Cake cosmopolitan · 30 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=uAqS7hxkatI"
  },
  {
    "codigo": "foto-cakeespana19tiros",
    "nombre": "Cake españa · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=TW5IPzMKt-w"
  },
  {
    "codigo": "foto-cakeespectacular100tiros",
    "nombre": "Cake espectacular · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=qUvYZPf3BC4"
  },
  {
    "codigo": "foto-cakeestelar100tiros",
    "nombre": "Cake estelar · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=VoA-tE388fY"
  },
  {
    "codigo": "foto-cakefantasia19tiros",
    "nombre": "Cake fantasia · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=b7qhWajox5w"
  },
  {
    "codigo": "foto-cakefelicidad",
    "nombre": "Cake felicidad",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=98_RVTnO33Q"
  },
  {
    "codigo": "foto-cakeferia47tiros",
    "nombre": "Cake feria · 47 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=kksUadxpxNk"
  },
  {
    "codigo": "foto-cakefestival100tiros",
    "nombre": "Cake festival · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=vwEx4qZJl7Q"
  },
  {
    "codigo": "foto-cakefiesta100tiros",
    "nombre": "Cake fiesta · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=FzL1NxlCKmk"
  },
  {
    "codigo": "foto-cakefiestahawaiana30tiros",
    "nombre": "Cake Fiesta hawaiana · 30 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=DUTR-sjzATs"
  },
  {
    "codigo": "foto-cakefiestalatina42tiros",
    "nombre": "Cake Fiesta latina · 42 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=EOlkz6Tq23Y"
  },
  {
    "codigo": "foto-cakefortuna19tiros",
    "nombre": "Cake fortuna · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=J8PDyylAMvQ"
  },
  {
    "codigo": "foto-cakehappy100tiros",
    "nombre": "Cake happy · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=msn5_KSSr1Q"
  },
  {
    "codigo": "foto-cakehawai46tiros",
    "nombre": "Cake hawai · 46 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=XirgY64TgEU"
  },
  {
    "codigo": "foto-cakejackspot25tiros",
    "nombre": "Cake Jackpot · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=LiMVnHBJHSg"
  },
  {
    "codigo": "foto-cakejapon19tiros",
    "nombre": "Cake japon · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=i0oFTsZYLLU"
  },
  {
    "codigo": "foto-cakelasvegas25tiros",
    "nombre": "Cake Las Vegas · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=nz75VffQmS8"
  },
  {
    "codigo": "foto-cakemaya36tiros",
    "nombre": "Cake maya · 36 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=FZVmBpt-Yrg"
  },
  {
    "codigo": "foto-cakemedianoche",
    "nombre": "Cake medianoche",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=SA0IJC66yrY"
  },
  {
    "codigo": "foto-cakemexicopower",
    "nombre": "Cake México Power",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=2dgCUycydQU"
  },
  {
    "codigo": "foto-cakenochedefiesta100tiros",
    "nombre": "Cake Noche de fiesta · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=8qR9YWemixE"
  },
  {
    "codigo": "foto-cakenochemagica",
    "nombre": "Cake Noche mágica",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=XmKzfeHuECo&t=3s"
  },
  {
    "codigo": "foto-cakeolmeca36tiros",
    "nombre": "Cake olmeca · 36 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=fCk0i9w4gt4"
  },
  {
    "codigo": "foto-cakeparaiso100tiros",
    "nombre": "Cake paraiso · 100 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=7-6huSf7sBs&t=6s"
  },
  {
    "codigo": "foto-cakepoker25tiros",
    "nombre": "Cake poker · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=r9e4hhrOpa0"
  },
  {
    "codigo": "foto-cakeranchera16tiros",
    "nombre": "Cake ranchera · 16 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=S17a-4VrvKg"
  },
  {
    "codigo": "foto-cakeremolinosmulticolor16tiros",
    "nombre": "Cake remolinosmulticolor · 16 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=TdjXD4PPWmA"
  },
  {
    "codigo": "foto-cakeruleta25tiros",
    "nombre": "Cake ruleta · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=Yy13rNVxl4U"
  },
  {
    "codigo": "foto-cakerumba25tiros",
    "nombre": "Cake rumba · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=J4RzSiL1u3c"
  },
  {
    "codigo": "foto-cakesalsa25tiros",
    "nombre": "Cake salsa · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=_VA8JU4oEB8"
  },
  {
    "codigo": "foto-cakesamba25tiros",
    "nombre": "Cake samba · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=DAagyyuGJk8"
  },
  {
    "codigo": "foto-cakeshowbravo200tiros",
    "nombre": "Cake Show Bravo · 200 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=F30vlsk6qQw"
  },
  {
    "codigo": "foto-cakeshowberbena314tiros",
    "nombre": "Cake Show Verbena · 314 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=bVkgXsYoW4w"
  },
  {
    "codigo": "foto-cakesolado16tiros",
    "nombre": "Cake Soldado · 16 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=MEjYyMd2Fq8"
  },
  {
    "codigo": "foto-cakesonrisas19tiros",
    "nombre": "Cake sonrisas · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=AtdyP4UHBbI"
  },
  {
    "codigo": "foto-cakestrom49tiros",
    "nombre": "Cake Storm · 49 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=bSm16hLthRc"
  },
  {
    "codigo": "foto-cakesupershow120tiros",
    "nombre": "Cake Súper Show · 120 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=H1ItPv8O3kk"
  },
  {
    "codigo": "foto-caketequila16tiros",
    "nombre": "Cake tequila · 16 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=m2-xn6BkKbI"
  },
  {
    "codigo": "foto-caketornado49tiros",
    "nombre": "Cake tornado · 49 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=0PVRcPXD850"
  },
  {
    "codigo": "foto-caketortatropical",
    "nombre": "Cake Torta tropical",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=Ew_pUgC43X4"
  },
  {
    "codigo": "foto-cakeusa19tiros",
    "nombre": "Cake usa · 19 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=F6X6bKGq7TE"
  },
  {
    "codigo": "foto-camelia",
    "nombre": "Camelia",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cameliasminions",
    "nombre": "Cameliasminions",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-canonbebe",
    "nombre": "Cañón bebé",
    "categoria": "Productos",
    "recorte": "--cut-width:min(107.786cqw,91.298cqh);--cut-translate:-54.508% -50.474%;--cut-polygon:polygon(16.393% 26.54%,26.23% 24.171%,58.197% 22.749%,70.492% 25.592%,82.787% 33.649%,90.984% 52.607%,96.721% 72.512%,84.426% 76.303%,23.77% 78.199%,13.934% 72.512%,12.295% 48.815%)",
    "video": null
  },
  {
    "codigo": "eleana-canonbombita",
    "nombre": "Cañón mediano",
    "categoria": "Productos",
    "recorte": "--cut-width:min(94.889cqw,81.541cqh);--cut-translate:-50.41% -47.156%;--cut-polygon:polygon(14.754% 18.483%,44.262% 18.009%,77.869% 16.114%,96.721% 16.114%,98.361% 72.512%,84.426% 78.199%,6.557% 76.777%,2.459% 73.46%,3.279% 53.081%)",
    "video": null
  },
  {
    "codigo": "eleana-canonnino",
    "nombre": "Cañón niño",
    "categoria": "Productos",
    "recorte": "--cut-width:min(91.752cqw,66.762cqh);--cut-translate:-49.59% -47.393%;--cut-polygon:polygon(15.574% 16.114%,47.541% 15.166%,77.049% 9.479%,88.525% 10.9%,98.361% 18.483%,99.18% 85.308%,48.361% 84.36%,14.754% 84.834%,6.557% 77.725%,9.016% 47.393%,0% 24.171%)",
    "video": null
  },
  {
    "codigo": "eleana-caracatua",
    "nombre": "Caracatúa",
    "categoria": "Productos",
    "recorte": "--cut-width:min(300.054cqw,52.881cqh);--cut-translate:-47.951% -52.133%;--cut-polygon:polygon(33.607% 8.531%,38.525% 5.687%,42.623% 7.109%,47.541% 4.265%,50.82% 7.109%,58.197% 5.213%,63.115% 8.531%,61.475% 21.327%,57.377% 29.858%,55.738% 98.578%,45.902% 99.526%,42.623% 100%,38.525% 29.384%,32.787% 21.327%)",
    "video": null
  },
  {
    "codigo": "foto-caramelito",
    "nombre": "Caramelito",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-caramelogrande",
    "nombre": "Caramelo grande",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-caramelojumbo",
    "nombre": "Caramelo jumbo",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-caramelomediano",
    "nombre": "Caramelo mediano",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-catarinas",
    "nombre": "Catarinas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-cerillo",
    "nombre": "Cerillo",
    "categoria": "Productos",
    "recorte": "--cut-width:min(94.889cqw,83.452cqh);--cut-translate:-49.59% -50.237%;--cut-polygon:polygon(21.311% 21.801%,60.656% 19.905%,74.59% 21.801%,78.689% 33.175%,81.967% 46.445%,90.164% 59.716%,97.541% 72.512%,94.262% 79.147%,48.361% 80.569%,7.377% 79.147%,1.639% 72.986%,8.197% 56.872%,11.475% 36.967%)",
    "video": null
  },
  {
    "codigo": "foto-cervesitas",
    "nombre": "Cervesitas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-charrovolador",
    "nombre": "Charrovolador",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-chisperos",
    "nombre": "Chisperos",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-chupacabras",
    "nombre": "Chupacabras",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cigarros",
    "nombre": "Cigarros",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cigarrospallmall",
    "nombre": "Cigarrospallmall",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cometa",
    "nombre": "Cometa",
    "categoria": "Productos",
    "recorte": "--cut-width:min(122cqw,203.373cqh);--cut-translate:-56.967% -46.919%;--cut-polygon:polygon(23.77% 22.275%,82.787% 8.531%,88.525% 7.583%,91.803% 24.645%,94.262% 81.517%,90.164% 86.256%,23.77% 85.782%,20.492% 79.621%,19.672% 31.754%)",
    "video": null
  },
  {
    "codigo": "foto-cometaespecial",
    "nombre": "Cometa especial",
    "categoria": "Productos",
    "recorte": "--cut-width:min(116.863cqw,177.684cqh);--cut-translate:-60.246% -46.919%;--cut-polygon:polygon(23.77% 19.905%,91.803% 1.896%,95.902% 6.635%,99.18% 80.569%,97.541% 91.943%,29.508% 85.308%,22.131% 81.043%,21.311% 37.915%)",
    "video": null
  },
  {
    "codigo": "foto-cometaespecialmorado",
    "nombre": "Cometaespecialmorado",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cometin",
    "nombre": "Cometin",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-cometon",
    "nombre": "Cometon",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-crackerboom",
    "nombre": "Crackerboom",
    "categoria": "Productos",
    "recorte": "--cut-width:min(96.539cqw,175.113cqh);--cut-translate:-48.77% -49.526%;--cut-polygon:polygon(3.279% 35.545%,95.902% 35.071%,95.082% 61.611%,1.639% 63.981%)",
    "video": null
  },
  {
    "codigo": "eleana-crisantemo4tiros",
    "nombre": "Crisantemo de 4 tiros",
    "categoria": "Productos",
    "recorte": "--cut-width:min(135.39cqw,70.741cqh);--cut-translate:-56.557% -48.104%;--cut-polygon:polygon(22.951% 13.27%,89.344% 12.322%,90.164% 82.938%,23.77% 83.886%)",
    "video": null
  },
  {
    "codigo": "eleana-crisantemogrande",
    "nombre": "Crisantemo grande",
    "categoria": "Productos",
    "recorte": "--cut-width:min(168.212cqw,66.347cqh);--cut-translate:-50% -50.474%;--cut-polygon:polygon(31.967% 13.27%,76.23% 12.322%,77.049% 81.043%,72.951% 88.626%,22.951% 88.626%,27.869% 76.303%)",
    "video": null
  },
  {
    "codigo": "foto-cueteblanco",
    "nombre": "Cuete blanco",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-cueteblancomediano",
    "nombre": "Cuete blanco mediano",
    "categoria": "Productos",
    "recorte": "--cut-width:min(100.927cqw,76.848cqh);--cut-translate:-50.82% -46.682%;--cut-polygon:polygon(6.557% 13.744%,95.082% 13.744%,95.902% 19.431%,90.164% 76.777%,84.426% 79.621%,5.738% 78.673%)",
    "video": null
  },
  {
    "codigo": "eleana-cuetonbombita",
    "nombre": "Cuetón bombita",
    "categoria": "Productos",
    "recorte": "--cut-width:min(292.158cqw,52.881cqh);--cut-translate:-45.902% -51.659%;--cut-polygon:polygon(30.328% 7.583%,40.164% 3.791%,51.639% 3.791%,60.656% 10.427%,59.016% 20.379%,56.557% 30.806%,51.639% 34.597%,61.475% 99.526%,50% 99.526%,44.262% 35.545%,37.705% 28.91%)",
    "video": null
  },
  {
    "codigo": "eleana-cuetonbombitaesfera",
    "nombre": "Cuetón bombita esfera",
    "categoria": "Productos",
    "recorte": "--cut-width:min(226.571cqw,54.779cqh);--cut-translate:-51.23% -53.318%;--cut-polygon:polygon(31.967% 9.479%,41.803% 7.109%,53.279% 7.109%,63.115% 9.479%,67.213% 17.062%,61.475% 25.118%,56.557% 28.436%,71.311% 99.526%,60.656% 99.526%,46.721% 34.123%,40.984% 25.118%,31.148% 20.379%)",
    "video": null
  },
  {
    "codigo": "eleana-cuetonchupacabras",
    "nombre": "Cuetón chupacabras",
    "categoria": "Productos",
    "recorte": "--cut-width:min(198.25cqw,62.104cqh);--cut-translate:-46.721% -44.076%;--cut-polygon:polygon(42.623% 3.318%,48.361% 4.265%,48.361% 36.493%,50% 57.82%,62.295% 62.085%,68.033% 66.825%,69.672% 79.621%,58.197% 84.834%,36.066% 83.886%,23.77% 78.673%,24.59% 65.403%,37.705% 58.768%)",
    "video": null
  },
  {
    "codigo": "eleana-cuetondecracker",
    "nombre": "Cuetón de cracker",
    "categoria": "Productos",
    "recorte": "--cut-width:min(300.054cqw,53.678cqh);--cut-translate:-48.77% -52.37%;--cut-polygon:polygon(33.607% 9.479%,42.623% 8.531%,46.721% 5.213%,52.459% 5.213%,57.377% 8.057%,63.115% 8.057%,63.934% 27.488%,60.656% 32.701%,63.115% 99.526%,50% 99.526%,45.082% 54.976%,40.984% 29.858%,35.246% 27.014%)",
    "video": null
  },
  {
    "codigo": "foto-dollar",
    "nombre": "Dollar",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-duvalin",
    "nombre": "Duvalin",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-elcahvocracker",
    "nombre": "El Chavo cracker",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-escupidor",
    "nombre": "Escupidor",
    "categoria": "Productos",
    "recorte": "--cut-width:min(336.424cqw,72.666cqh);--cut-translate:-47.951% -50.474%;--cut-polygon:polygon(39.344% 19.905%,45.082% 15.64%,52.459% 16.114%,57.377% 19.905%,61.475% 29.858%,61.475% 83.886%,54.918% 85.308%,35.246% 85.308%,34.426% 34.123%)",
    "video": null
  },
  {
    "codigo": "eleana-escupidordecaja",
    "nombre": "Escupidor de caja · 6 tiros",
    "categoria": "Productos",
    "recorte": "--cut-width:min(156.366cqw,70.741cqh);--cut-translate:-49.59% -54.265%;--cut-polygon:polygon(25.41% 18.483%,73.77% 18.957%,78.689% 89.573%,20.492% 90.047%)",
    "video": null
  },
  {
    "codigo": "foto-escupidordecracker",
    "nombre": "Escupidor de cracker",
    "categoria": "Productos",
    "recorte": "--cut-width:min(370.067cqw,66.347cqh);--cut-translate:-46.721% -51.896%;--cut-polygon:polygon(40.984% 17.536%,45.902% 14.218%,49.18% 15.166%,52.459% 13.744%,58.197% 18.957%,59.016% 23.697%,59.016% 88.626%,50.82% 90.047%,34.426% 89.1%,35.246% 72.038%)",
    "video": null
  },
  {
    "codigo": "foto-escupidordediamantina",
    "nombre": "Escupidor de diamantina",
    "categoria": "Productos",
    "recorte": "--cut-width:min(336.424cqw,59.016cqh);--cut-translate:-52.049% -49.052%;--cut-polygon:polygon(45.082% 9.005%,46.721% 6.635%,50% 8.057%,51.639% 6.161%,57.377% 6.635%,60.656% 9.953%,63.115% 9.005%,64.754% 15.166%,65.574% 48.341%,64.754% 88.626%,60.656% 91.943%,38.525% 90.521%,38.525% 75.829%,41.803% 18.009%)",
    "video": null
  },
  {
    "codigo": "foto-escupidorspiderman",
    "nombre": "Escupidor spiderman",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-pokebolacapibara",
    "nombre": "Esferas luminosas Capibara",
    "categoria": "Productos",
    "recorte": "--cut-width:min(130.612cqw,60.35cqh);--cut-translate:-49.59% -52.844%;--cut-polygon:polygon(20.492% 14.218%,32.787% 11.374%,73.77% 10.9%,76.23% 31.754%,64.754% 32.701%,74.59% 40.758%,83.607% 60.19%,84.426% 88.152%,78.689% 91.943%,16.393% 94.787%,14.754% 90.521%,16.393% 62.559%,17.213% 42.654%,24.59% 33.649%,17.213% 31.28%)",
    "video": null
  },
  {
    "codigo": "eleana-pokebolahulk",
    "nombre": "Esferas luminosas Hulk",
    "categoria": "Productos",
    "recorte": "--cut-width:min(127.609cqw,75.758cqh);--cut-translate:-47.131% -55.213%;--cut-polygon:polygon(22.951% 21.801%,69.672% 21.801%,72.131% 31.28%,68.852% 35.545%,76.23% 43.602%,77.869% 66.351%,82.787% 86.73%,76.23% 88.626%,15.574% 88.626%,11.475% 86.73%,17.213% 82.464%,15.574% 69.668%,18.033% 46.919%,21.311% 36.019%,22.951% 33.649%)",
    "video": null
  },
  {
    "codigo": "eleana-pokebolaintensamente",
    "nombre": "Esferas luminosas Intensamente",
    "categoria": "Productos",
    "recorte": "--cut-width:min(138.775cqw,71.69cqh);--cut-translate:-48.361% -49.526%;--cut-polygon:polygon(27.049% 14.218%,72.951% 14.218%,72.951% 31.754%,63.115% 32.701%,68.033% 38.863%,76.23% 46.445%,81.148% 79.621%,78.689% 82.938%,17.213% 84.834%,15.574% 81.517%,20.492% 76.303%,20.492% 57.82%,23.77% 45.972%,31.967% 33.175%,23.77% 31.754%)",
    "video": null
  },
  {
    "codigo": "eleana-pokebolademonhunters",
    "nombre": "Esferas luminosas KPop Demon Hunters",
    "categoria": "Productos",
    "recorte": "--cut-width:min(118.106cqw,63.206cqh);--cut-translate:-46.721% -51.422%;--cut-polygon:polygon(23.77% 11.374%,73.77% 11.848%,75.41% 31.754%,72.951% 34.597%,80.328% 44.55%,85.246% 75.355%,84.426% 90.047%,77.869% 91.469%,8.197% 89.573%,11.475% 84.834%,13.115% 70.616%,18.852% 51.185%,22.131% 37.441%,25.41% 33.649%,21.311% 31.754%)",
    "video": null
  },
  {
    "codigo": "eleana-pokebolaminiom",
    "nombre": "Esferas luminosas Minions",
    "categoria": "Productos",
    "recorte": "--cut-width:min(148.027cqw,80.315cqh);--cut-translate:-51.23% -53.318%;--cut-polygon:polygon(26.23% 21.801%,68.852% 21.801%,71.311% 24.171%,70.492% 35.545%,66.393% 36.493%,76.23% 44.076%,81.148% 58.768%,81.967% 79.147%,76.23% 82.464%,21.311% 84.834%,20.492% 81.991%,21.311% 70.616%,22.131% 56.398%,25.41% 43.602%,31.148% 36.019%,25.41% 35.071%)",
    "video": null
  },
  {
    "codigo": "eleana-pokebolasupermario",
    "nombre": "Esferas luminosas Super Mario",
    "categoria": "Productos",
    "recorte": "--cut-width:min(152.082cqw,80.923cqh);--cut-translate:-45.492% -54.502%;--cut-polygon:polygon(24.59% 23.697%,67.213% 23.223%,70.492% 36.493%,62.295% 38.863%,70.492% 48.815%,73.77% 59.716%,75.41% 83.412%,72.131% 85.782%,16.393% 85.782%,15.574% 82.464%,19.672% 77.251%,18.852% 61.137%,21.311% 45.498%,27.869% 38.389%,24.59% 37.441%)",
    "video": null
  },
  {
    "codigo": "foto-espantasuegras",
    "nombre": "Espantasuegras",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-europa30tiros",
    "nombre": "Europa · 30 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=CQEi4P_rKkQ"
  },
  {
    "codigo": "eleana-festivaldekakes",
    "nombre": "Festival de Kakes",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(133.759cqw,66.762cqh);--cut-translate:-51.23% -46.919%;--cut-polygon:polygon(17.213% 15.166%,42.623% 9.479%,53.279% 9.005%,63.115% 11.848%,85.246% 16.588%,85.246% 71.564%,77.049% 75.829%,62.295% 80.569%,52.459% 84.834%,39.344% 83.886%,27.869% 77.725%,22.951% 63.507%)",
    "video": null
  },
  {
    "codigo": "foto-fiestaregia42tiros",
    "nombre": "Fiesta regia · 42 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=PVzqEAzpwk0"
  },
  {
    "codigo": "foto-flash",
    "nombre": "Flash",
    "categoria": "Productos",
    "recorte": "--cut-width:min(97.386cqw,125.669cqh);--cut-translate:-48.361% -52.37%;--cut-polygon:polygon(6.557% 32.701%,86.066% 32.227%,95.082% 67.299%,90.984% 70.616%,1.639% 72.512%)",
    "video": null
  },
  {
    "codigo": "eleana-flashdeestrobo",
    "nombre": "Flash de estrobo",
    "categoria": "Productos",
    "recorte": "--cut-width:min(97.386cqw,157.086cqh);--cut-translate:-50.82% -51.185%;--cut-polygon:polygon(8.197% 35.071%,92.623% 35.071%,97.541% 64.929%,90.164% 67.299%,4.098% 67.299%)",
    "video": null
  },
  {
    "codigo": "eleana-flordeloto",
    "nombre": "Flor de loto",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(91.752cqw,154.81cqh);--cut-translate:-49.59% -55.687%;--cut-polygon:polygon(0% 40.758%,28.689% 39.336%,68.852% 39.336%,99.18% 40.758%,99.18% 46.445%,83.607% 68.72%,20.492% 72.038%,0.82% 55.924%)",
    "video": null
  },
  {
    "codigo": "foto-florerodecolor",
    "nombre": "Florerodecolor",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-frozen",
    "nombre": "Frozen",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-galaxia",
    "nombre": "Galaxia · 35 disparos",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(93.294cqw,169.554cqh);--cut-translate:-51.23% -56.161%;--cut-polygon:polygon(2.459% 47.393%,15.574% 43.602%,39.344% 41.232%,70.492% 41.232%,100% 43.602%,100% 48.815%,85.246% 64.455%,79.508% 69.668%,26.23% 71.09%,18.033% 64.455%)",
    "video": null
  },
  {
    "codigo": "foto-gallinitas",
    "nombre": "Gallinitas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-garapinados",
    "nombre": "Garapiñados",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-gransuffi",
    "nombre": "Gran Suffi",
    "categoria": "Productos",
    "recorte": "--cut-width:min(179.065cqw,70.275cqh);--cut-translate:-54.918% -40.758%;--cut-polygon:polygon(40.984% 6.635%,68.852% 4.739%,72.131% 7.109%,72.951% 20.379%,75.41% 27.962%,80.328% 34.597%,77.049% 65.403%,72.131% 72.986%,60.656% 76.777%,41.803% 75.829%,29.508% 72.512%,29.508% 34.123%,37.705% 24.645%)",
    "video": null
  },
  {
    "codigo": "foto-gritito",
    "nombre": "Gritito",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-hormiguero",
    "nombre": "Hormiguero",
    "categoria": "Productos",
    "recorte": "--cut-width:min(100.927cqw,97.108cqh);--cut-translate:-52.459% -54.502%;--cut-polygon:polygon(15.574% 29.384%,88.525% 28.436%,95.082% 38.389%,97.541% 71.564%,90.164% 78.199%,16.393% 80.569%,7.377% 76.303%,9.836% 63.033%)",
    "video": null
  },
  {
    "codigo": "foto-huevodepato",
    "nombre": "Huevodepato",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-icee",
    "nombre": "ICEE",
    "categoria": "Productos",
    "recorte": "--cut-width:min(105.733cqw,116.107cqh);--cut-translate:-47.131% -50.711%;--cut-polygon:polygon(9.016% 30.806%,82.787% 28.91%,89.344% 35.071%,90.164% 70.616%,5.738% 72.512%,4.098% 70.142%)",
    "video": null
  },
  {
    "codigo": "eleana-imperial",
    "nombre": "Imperial",
    "categoria": "Productos",
    "recorte": "--cut-width:min(154.194cqw,68.915cqh);--cut-translate:-50% -52.37%;--cut-polygon:polygon(20.492% 16.588%,39.344% 15.64%,48.361% 17.536%,67.213% 15.64%,79.508% 17.536%,79.508% 78.199%,74.59% 87.204%,59.016% 88.626%,50.82% 87.678%,40.984% 89.1%,23.77% 88.626%,20.492% 83.886%)",
    "video": null
  },
  {
    "codigo": "eleana-kake",
    "nombre": "Kake",
    "categoria": "Baterías",
    "recorte": "--cut-width:min(112.141cqw,96.233cqh);--cut-translate:-51.23% -55.213%;--cut-polygon:polygon(10.656% 28.91%,39.344% 28.91%,91.803% 30.332%,90.984% 61.611%,86.066% 74.882%,72.951% 80.569%,52.459% 81.517%,12.295% 75.355%)",
    "video": null
  },
  {
    "codigo": "foto-llorona",
    "nombre": "Llorona",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-luciernagas",
    "nombre": "Luciernagas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-luciernagasespeciales",
    "nombre": "Luciernagasespeciales",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-luzdebengalamediometro",
    "nombre": "Luz de bengala de medio metro",
    "categoria": "Productos",
    "recorte": "--cut-width:min(358.129cqw,57.429cqh);--cut-translate:-52.049% -49.289%;--cut-polygon:polygon(40.984% 5.687%,59.016% 5.213%,64.754% 93.365%,39.344% 93.365%)",
    "video": null
  },
  {
    "codigo": "eleana-m-ms",
    "nombre": "M&M’s",
    "categoria": "Productos",
    "recorte": "--cut-width:min(109.921cqw,124.208cqh);--cut-translate:-44.672% -49.763%;--cut-polygon:polygon(11.475% 30.806%,81.967% 29.384%,86.066% 31.28%,86.066% 69.194%,82.787% 70.142%,4.098% 69.668%,3.279% 67.773%)",
    "video": null
  },
  {
    "codigo": "foto-mamut",
    "nombre": "Mamut",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-maruchan",
    "nombre": "Maruchan",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-mazapancrackerconcolor",
    "nombre": "Mazapancrackerconcolor",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-medusas",
    "nombre": "Medusas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-megahulk",
    "nombre": "Mega Hulk",
    "categoria": "Productos",
    "recorte": "--cut-width:min(93.294cqw,184.17cqh);--cut-translate:-49.59% -51.185%;--cut-polygon:polygon(4.918% 37.915%,91.803% 37.441%,98.361% 58.294%,89.344% 64.929%,6.557% 64.929%,0.82% 61.137%)",
    "video": null
  },
  {
    "codigo": "eleana-mexicanoespecial",
    "nombre": "Mexicano espacial",
    "categoria": "Productos",
    "recorte": "--cut-width:min(191.414cqw,85.455cqh);--cut-translate:-54.098% -53.318%;--cut-polygon:polygon(31.148% 24.645%,72.951% 23.697%,77.869% 81.043%,73.77% 82.938%,31.148% 82.464%,30.328% 79.621%)",
    "video": null
  },
  {
    "codigo": "foto-minadecracker",
    "nombre": "Minade cracker",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-minikakes",
    "nombre": "Mini Kakes",
    "categoria": "Productos",
    "recorte": "--cut-width:min(258.186cqw,65.133cqh);--cut-translate:-50.41% -50.711%;--cut-polygon:polygon(43.443% 11.848%,59.836% 11.848%,63.115% 13.744%,62.295% 58.768%,68.033% 62.085%,67.213% 82.938%,60.656% 89.1%,40.984% 89.573%,32.787% 86.256%,33.607% 62.085%,40.164% 58.768%)",
    "video": null
  },
  {
    "codigo": "foto-minions",
    "nombre": "Minions",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-miniovnimixi",
    "nombre": "Miniovni mixi",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-misil",
    "nombre": "Misil",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-misilextragrande",
    "nombre": "Misil extra grande",
    "categoria": "Productos",
    "recorte": "--cut-width:min(99.125cqw,66.347cqh);--cut-translate:-52.459% -51.422%;--cut-polygon:polygon(13.115% 13.27%,84.426% 15.166%,84.426% 20.853%,98.361% 86.256%,97.541% 89.573%,6.557% 89.573%)",
    "video": null
  },
  {
    "codigo": "eleana-misilgrande",
    "nombre": "Misil grande · 27 piezas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(102.796cqw,66.347cqh);--cut-translate:-49.18% -48.578%;--cut-polygon:polygon(9.016% 10.427%,18.852% 10.427%,83.607% 15.64%,93.443% 78.673%,19.672% 86.73%,10.656% 81.043%,4.918% 36.493%)",
    "video": null
  },
  {
    "codigo": "eleana-misilgrandemediano",
    "nombre": "Misil grande mediano · 25 piezas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(92.517cqw,69.816cqh);--cut-translate:-50% -55.687%;--cut-polygon:polygon(9.016% 19.431%,76.23% 20.379%,99.18% 87.204%,98.361% 90.047%,0.82% 91.943%)",
    "video": null
  },
  {
    "codigo": "foto-misiles25shots",
    "nombre": "Misiles Súper Cracker · 25 tiros",
    "categoria": "Baterías",
    "recorte": null,
    "video": "https://www.youtube.com/watch?v=zYHzDHR-Jts"
  },
  {
    "codigo": "foto-mosaico",
    "nombre": "Mosaico",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-ollagrande",
    "nombre": "Olla grande",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-ollamediana",
    "nombre": "Olla mediana",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-ollitas",
    "nombre": "Ollitas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-orugas",
    "nombre": "Orugas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-ovnimixi",
    "nombre": "Ovni mixi",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-paletaspider",
    "nombre": "Paletaspider",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-paletastitch",
    "nombre": "Paletastitch",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-paloma50pz",
    "nombre": "Paloma · 50 piezas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(93.294cqw,72.666cqh);--cut-translate:-49.59% -55.213%;--cut-polygon:polygon(4.918% 84.36%,9.016% 70.142%,16.393% 51.185%,26.23% 36.019%,44.262% 23.223%,62.295% 20.379%,71.311% 24.171%,87.705% 34.597%,91.803% 43.602%,98.361% 76.303%,96.721% 83.886%,14.754% 90.047%,0.82% 89.573%)",
    "video": null
  },
  {
    "codigo": "eleana-palomaacomodada",
    "nombre": "Paloma acomodada",
    "categoria": "Productos",
    "recorte": "--cut-width:min(93.294cqw,82.168cqh);--cut-translate:-49.59% -45.498%;--cut-polygon:polygon(12.295% 20.853%,27.869% 18.957%,32.787% 15.166%,40.984% 14.692%,65.574% 15.166%,81.967% 21.327%,86.885% 32.227%,90.984% 46.919%,98.361% 69.668%,98.361% 72.512%,4.098% 76.303%,0.82% 73.46%)",
    "video": null
  },
  {
    "codigo": "eleana-palomagrande",
    "nombre": "Paloma grande",
    "categoria": "Productos",
    "recorte": "--cut-width:min(94.889cqw,112.441cqh);--cut-translate:-51.23% -53.318%;--cut-polygon:polygon(9.836% 31.28%,88.525% 31.28%,94.262% 30.806%,99.18% 45.498%,99.18% 72.038%,9.836% 75.829%,3.279% 73.46%)",
    "video": null
  },
  {
    "codigo": "foto-palomamediana",
    "nombre": "Paloma mediana",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-palomanina",
    "nombre": "Paloma niña",
    "categoria": "Productos",
    "recorte": "--cut-width:min(93.294cqw,75.758cqh);--cut-translate:-50.41% -45.261%;--cut-polygon:polygon(12.295% 20.379%,13.115% 13.744%,18.033% 11.848%,22.951% 19.431%,37.705% 19.905%,49.18% 18.009%,80.328% 18.957%,82.787% 17.062%,86.885% 22.275%,90.984% 47.393%,95.902% 71.09%,99.18% 77.725%,92.623% 78.199%,1.639% 78.673%,1.639% 74.882%,8.197% 67.299%)",
    "video": null
  },
  {
    "codigo": "eleana-palomapintadita",
    "nombre": "Paloma pintadita",
    "categoria": "Productos",
    "recorte": "--cut-width:min(95.707cqw,82.805cqh);--cut-translate:-50% -55.213%;--cut-polygon:polygon(4.918% 24.645%,37.705% 25.118%,85.246% 27.962%,86.066% 30.332%,81.967% 37.915%,90.984% 54.502%,97.541% 78.673%,86.066% 85.308%,4.918% 85.782%,2.459% 77.251%,9.016% 62.559%,9.836% 43.602%)",
    "video": null
  },
  {
    "codigo": "foto-palomadeluz",
    "nombre": "Palomadeluz",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-patitos",
    "nombre": "Patitos",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-pato",
    "nombre": "Pato",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-peppapig",
    "nombre": "Peppa Pig",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-playdoh",
    "nombre": "Play-Doh",
    "categoria": "Productos",
    "recorte": "--cut-width:min(96.539cqw,117.383cqh);--cut-translate:-50.41% -47.63%;--cut-polygon:polygon(10.656% 26.54%,86.885% 26.066%,92.623% 27.014%,97.541% 66.825%,91.803% 69.194%,8.197% 69.194%,3.279% 67.773%)",
    "video": null
  },
  {
    "codigo": "eleana-pokebolas",
    "nombre": "Pokebolas",
    "categoria": "Productos",
    "recorte": "--cut-width:min(148.027cqw,76.299cqh);--cut-translate:-56.148% -51.659%;--cut-polygon:polygon(33.607% 18.483%,77.049% 19.431%,77.049% 34.123%,72.131% 34.597%,79.508% 43.602%,83.607% 59.716%,83.607% 78.199%,86.885% 81.991%,83.607% 83.886%,27.049% 84.834%,25.41% 82.938%,28.689% 79.621%,27.049% 63.981%,28.689% 45.498%,37.705% 35.545%,29.508% 34.123%)",
    "video": null
  },
  {
    "codigo": "foto-pulgas",
    "nombre": "Pulgas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-pulgasdecracker",
    "nombre": "Pulgasde cracker",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-r15",
    "nombre": "R 15",
    "categoria": "Productos",
    "recorte": "--cut-width:min(103.757cqw,80.923cqh);--cut-translate:-50.41% -52.133%;--cut-polygon:polygon(18.852% 21.801%,72.131% 20.853%,77.869% 23.223%,85.246% 28.436%,93.443% 47.393%,94.262% 80.569%,90.984% 83.412%,9.016% 82.938%,6.557% 80.095%,9.836% 48.341%,14.754% 32.227%)",
    "video": null
  },
  {
    "codigo": "eleana-rehilete",
    "nombre": "Rehilete",
    "categoria": "Productos",
    "recorte": "--cut-width:min(111.02cqw,97.108cqh);--cut-translate:-48.361% -51.659%;--cut-polygon:polygon(17.213% 28.436%,44.262% 28.436%,71.311% 25.592%,74.59% 29.384%,77.049% 35.545%,87.705% 43.602%,89.344% 62.085%,85.246% 72.038%,80.328% 76.777%,16.393% 77.725%,9.016% 73.46%,7.377% 60.19%,8.197% 46.445%,14.754% 36.493%)",
    "video": null
  },
  {
    "codigo": "foto-revelaciondesexo",
    "nombre": "Revelación de sexo",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-revelacionpirostar",
    "nombre": "Revelación Pirostar",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-rifas",
    "nombre": "Rifas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-rockstar",
    "nombre": "Rockstar",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-rosadelluz",
    "nombre": "Rosa de luz",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-rosadecracker",
    "nombre": "Rosade cracker",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-sabritas",
    "nombre": "Sabritas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-silbato",
    "nombre": "Silbato",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-silbatoloco",
    "nombre": "Silbatoloco",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-silbatotoroloco",
    "nombre": "Silbatotoroloco",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-sorullo",
    "nombre": "Sorullo",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-supermisil",
    "nombre": "Súper misil",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-supersonaja",
    "nombre": "Supersonaja",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-tamalitos",
    "nombre": "Tamalitos",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-tanquedeguerra",
    "nombre": "Tanquedeguerra",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-tarolitosdeluz",
    "nombre": "Tarolitosdeluz",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-torito",
    "nombre": "Torito",
    "categoria": "Productos",
    "recorte": "--cut-width:min(109.921cqw,121.385cqh);--cut-translate:-43.033% -49.289%;--cut-polygon:polygon(13.934% 28.91%,64.754% 28.436%,78.689% 34.597%,84.426% 46.445%,84.426% 59.716%,70.492% 70.142%,19.672% 70.142%,1.639% 58.294%,1.639% 48.815%,7.377% 34.597%)",
    "video": null
  },
  {
    "codigo": "foto-tormentaluminosa",
    "nombre": "Tormentaluminosa",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-tortuguitas",
    "nombre": "Tortuguitas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-trabucodecharola",
    "nombre": "Trabuco de charola",
    "categoria": "Productos",
    "recorte": "--cut-width:min(104.736cqw,90.524cqh);--cut-translate:-51.639% -55.924%;--cut-polygon:polygon(17.213% 29.858%,76.23% 27.962%,82.787% 30.332%,90.984% 57.82%,95.082% 78.673%,89.344% 81.043%,14.754% 83.886%,8.197% 82.464%,9.016% 71.09%,13.115% 35.071%)",
    "video": null
  },
  {
    "codigo": "foto-trabucoespecial",
    "nombre": "Trabuco especial",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-trabucogrande",
    "nombre": "Trabuco grande",
    "categoria": "Productos",
    "recorte": "--cut-width:min(231.292cqw,167.96cqh);--cut-translate:-50% -51.896%;--cut-polygon:polygon(30.328% 4.265%,42.623% 6.161%,62.295% 9.953%,66.393% 13.27%,67.213% 35.071%,69.672% 56.872%,68.852% 81.991%,67.213% 91.469%,38.525% 99.052%,32.787% 99.526%,31.148% 54.976%)",
    "video": null
  },
  {
    "codigo": "foto-trabucomixi",
    "nombre": "Trabuco mixi",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-trompito",
    "nombre": "Trompito",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-vara-chiflador",
    "nombre": "Vara chiflador",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-vara-pajarera",
    "nombre": "Vara pajarera",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-varaurba",
    "nombre": "Vara Urba",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-velitaspersonalizadas",
    "nombre": "Velitas personalizadas",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "foto-volcan-de-diamantina",
    "nombre": "Volcan de diamantina",
    "categoria": "Productos",
    "recorte": null,
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-amarillo",
    "nombre": "Tubo de humo amarillo",
    "categoria": "Productos",
    "recorte": "--cut-width:min(358.033cqw,73.720cqh);--cut-translate:-49.708% -45.781%;--cut-polygon:polygon(50.500% 0.000%,51.833% 0.000%,51.917% 1.188%,52.917% 1.500%,52.417% 2.750%,52.333% 9.375%,54.917% 9.750%,57.750% 10.563%,59.583% 12.000%,60.583% 13.750%,60.917% 16.000%,60.833% 37.250%,61.250% 57.563%,62.250% 83.125%,62.417% 88.188%,61.333% 89.813%,58.667% 90.813%,55.667% 91.250%,50.833% 91.563%,43.917% 91.500%,39.250% 91.000%,37.167% 90.063%,37.000% 88.625%,37.833% 68.125%,39.250% 43.188%,40.750% 16.250%,41.500% 13.188%,43.167% 11.438%,45.667% 10.188%,49.000% 9.563%,49.083% 1.688%,49.750% 1.313%,50.583% 1.250%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-azul",
    "nombre": "Tubo de humo azul",
    "categoria": "Productos",
    "recorte": "--cut-width:min(347.771cqw,73.720cqh);--cut-translate:-47.583% -45.781%;--cut-polygon:polygon(46.167% 0.000%,48.000% 0.000%,47.667% 6.938%,49.750% 6.500%,52.500% 7.188%,55.000% 8.375%,57.250% 10.250%,58.667% 12.375%,58.917% 24.688%,59.333% 50.688%,60.000% 70.313%,60.667% 87.500%,60.417% 89.125%,58.667% 90.188%,55.250% 91.063%,50.750% 91.563%,45.667% 91.563%,40.667% 91.250%,37.167% 90.750%,35.583% 89.688%,34.500% 88.625%,34.750% 84.125%,35.917% 59.813%,37.000% 37.250%,38.250% 13.313%,39.250% 10.750%,40.667% 9.313%,42.917% 8.250%,44.917% 7.375%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-blanco",
    "nombre": "Tubo de humo blanco",
    "categoria": "Productos",
    "recorte": "--cut-width:min(412.075cqw,79.882cqh);--cut-translate:-49.458% -47.750%;--cut-polygon:polygon(49.083% 5.688%,50.083% 5.500%,50.500% 6.125%,50.083% 9.063%,49.500% 15.063%,51.167% 14.063%,52.000% 14.875%,54.333% 15.563%,56.167% 17.250%,56.917% 19.188%,57.333% 27.000%,58.583% 54.250%,59.750% 73.688%,60.333% 85.500%,60.500% 87.688%,59.833% 88.750%,57.667% 89.375%,53.750% 90.000%,47.500% 90.000%,42.417% 89.688%,39.750% 89.188%,38.750% 88.438%,38.417% 87.438%,39.250% 58.500%,39.917% 33.188%,40.333% 20.188%,41.167% 18.375%,43.083% 16.938%,45.750% 15.938%,46.250% 15.125%,47.583% 10.375%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-morado",
    "nombre": "Tubo de humo morado",
    "categoria": "Productos",
    "recorte": "--cut-width:min(366.443cqw,73.770cqh);--cut-translate:-46.750% -45.750%;--cut-polygon:polygon(50.833% 0.000%,52.750% 0.000%,52.250% 3.125%,52.750% 3.813%,51.333% 11.938%,53.250% 12.438%,54.917% 13.313%,56.417% 14.938%,57.000% 16.688%,57.333% 30.375%,57.833% 51.500%,58.583% 71.063%,59.167% 87.313%,59.000% 89.375%,57.417% 90.375%,54.083% 91.125%,49.667% 91.438%,42.750% 91.500%,38.833% 91.000%,35.583% 90.500%,34.333% 89.688%,34.917% 73.188%,36.250% 45.250%,37.583% 20.250%,38.000% 15.938%,38.750% 14.250%,40.333% 13.000%,42.833% 12.188%,45.667% 11.750%,48.167% 11.625%,49.750% 3.625%,50.333% 3.250%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-naranja",
    "nombre": "Tubo de humo naranja",
    "categoria": "Productos",
    "recorte": "--cut-width:min(364.000cqw,69.409cqh);--cut-translate:-49.917% -48.625%;--cut-polygon:polygon(39.250% 0.000%,41.000% 0.000%,41.833% 1.500%,43.083% 1.938%,47.833% 11.125%,50.000% 11.000%,51.583% 11.750%,54.000% 12.188%,56.750% 13.250%,58.250% 14.875%,59.000% 16.375%,59.250% 25.563%,60.083% 46.750%,61.250% 74.063%,62.333% 92.875%,62.417% 93.875%,61.333% 95.250%,58.500% 96.250%,54.667% 96.938%,48.750% 97.250%,43.417% 97.125%,38.750% 96.188%,37.500% 95.250%,37.417% 94.750%,38.750% 93.688%,37.500% 92.563%,37.583% 78.125%,38.333% 49.813%,39.083% 16.000%,40.000% 13.938%,42.333% 12.563%,44.500% 11.750%,40.917% 3.063%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-rojo",
    "nombre": "Tubo de humo rojo",
    "categoria": "Productos",
    "recorte": "--cut-width:min(375.258cqw,79.646cqh);--cut-translate:-44.875% -46.688%;--cut-polygon:polygon(43.833% 4.938%,44.500% 4.438%,45.417% 4.500%,45.833% 5.188%,46.250% 4.313%,46.667% 5.188%,46.667% 6.625%,46.333% 7.625%,46.917% 11.250%,50.083% 11.500%,52.583% 12.188%,54.667% 13.563%,55.833% 15.125%,56.250% 25.625%,56.333% 50.438%,56.500% 70.000%,56.750% 84.375%,57.000% 85.500%,56.417% 87.063%,55.583% 87.875%,52.333% 88.500%,47.417% 89.000%,43.000% 89.063%,38.333% 88.375%,34.917% 87.625%,33.500% 86.875%,32.750% 85.688%,33.333% 79.625%,34.583% 59.875%,36.000% 39.875%,37.417% 21.125%,37.917% 15.688%,38.667% 13.875%,40.250% 12.813%,42.167% 11.938%,43.750% 11.313%,43.417% 7.250%,43.417% 5.813%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-verde",
    "nombre": "Tubo de humo verde",
    "categoria": "Productos",
    "recorte": "--cut-width:min(353.398cqw,74.329cqh);--cut-translate:-49.042% -47.344%;--cut-polygon:polygon(58.167% 1.938%,59.250% 2.063%,58.833% 3.125%,57.500% 5.125%,58.000% 5.688%,57.333% 7.063%,55.083% 11.875%,57.167% 12.438%,58.833% 13.688%,59.500% 15.313%,59.833% 26.250%,60.167% 45.250%,60.833% 55.688%,61.417% 75.063%,61.917% 89.250%,61.750% 90.188%,60.417% 91.063%,58.000% 91.875%,54.333% 92.438%,49.000% 92.750%,43.833% 92.563%,40.000% 92.188%,37.500% 91.625%,36.333% 90.750%,36.167% 89.375%,37.083% 71.500%,38.583% 45.375%,40.083% 23.000%,40.750% 14.438%,42.000% 12.938%,44.000% 12.063%,46.583% 11.625%,49.667% 11.063%,51.500% 11.125%,54.250% 6.188%,55.417% 4.750%,56.333% 4.750%,57.167% 2.938%)",
    "video": null
  },
  {
    "codigo": "eleana-tubo-de-humo-rosa",
    "nombre": "Tubo de humo rosa",
    "categoria": "Productos",
    "recorte": "--cut-width:min(380.488cqw,82.192cqh);--cut-translate:-52.042% -44.313%;--cut-polygon:polygon(58.083% 3.688%,58.917% 3.250%,59.583% 3.688%,59.500% 4.625%,58.083% 7.563%,55.917% 13.500%,57.917% 14.313%,59.083% 15.750%,59.667% 17.625%,60.250% 34.063%,60.917% 45.438%,62.083% 54.188%,62.583% 69.688%,63.750% 82.125%,64.000% 84.375%,62.667% 84.750%,59.167% 85.188%,54.417% 85.375%,48.250% 85.375%,43.000% 85.063%,40.833% 84.688%,40.083% 83.938%,40.500% 73.750%,41.417% 49.625%,42.083% 19.500%,42.333% 16.313%,43.333% 14.875%,45.167% 13.688%,48.083% 13.000%,50.917% 12.563%,53.333% 12.750%,55.167% 7.625%,56.083% 7.125%)",
    "video": null
  }
]
$eleana$::jsonb) as item(
  codigo text, nombre text, categoria text, recorte text, video text
)
on conflict (codigo) do nothing;

select
 count(*) as total,
 count(*) filter (where activo) as visibles,
 count(*) filter (where categoria = 'Baterías') as baterias,
 count(*) filter (where categoria = 'Productos') as productos
from public.productos;
