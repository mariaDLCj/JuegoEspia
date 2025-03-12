<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enigma</title>
        <c:import url="/INC/meta.inc"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.bootstrap}"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}"/>
        <link href="https://fonts.googleapis.com/css2?family=Ruda:wght@400;700&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Sixtyfour&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">

    </head>

    <body>
        <!-- Cabecera con el menú de navegación  -->
        <div class="container d-flex flex-column  justify-content-center align-items-center">
            <h2 class="shadow-sm sombra-texto text-center mb-4 mt-5">Intento Fallido</span></h2>
            <h5 class="shadow-sm sombra-texto text-center mb-4 mt-5">Autodestrucción en :<span id="autodestruir"></span></h5>
        </div>
    </body>
</html>
