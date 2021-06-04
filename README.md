Requerimientos
1. Crear el método request que reciba una url y el api_key y devuelva el hash con los resultados.
Concatenar la API Key en la siguiente url https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/
photos?sol=10.

2. Crear un método llamado buid_web_page que reciba el hash de respuesta con todos los datos
y construya una página web. Se evaluará la página creada y tiene que tener este formato:
Se revisará la estructura del documento generado.

" <html>
<head>
</head>
<body>
  <ul>
    <li><img src='.../398380645PRCLF0030000CCAM04010L1.PNG'></li>
    <li><img src='.../398381687EDR_F0030000CCAM05010M_.JPG'></li>
  </ul>
</body>
</html>
