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
        <script src="${contexto}/JS/fecha.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Sixtyfour&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
        <script src="${contexto}/JS/autodestruir.js" defer></script>
        <script src="${contexto}/JS/scriptAudioAmbiente.js" defer></script>
        <meta http-equiv="refresh" content="5; url=${contexto}/FrontController">
    </head>

    <body>
        <!-- Cabecera con el menú de navegación  -->
        <div class="container d-flex flex-column  justify-content-center align-items-center mt-6">
            <div class="d-flex m5-5"> <img src="${contexto}/IMG/IconoEsquina.png" alt="alt" class="imgPeq"/> 
                <h2 class="shadow-sm sombra-texto text-center mb-3 mt-5 titulos tamanioLetras">ESPÍA DETECTADO</h2>
                <img src="${contexto}/IMG/IconoEsquina.png" alt="alt"  class="imgPeq"/></div>
            <h4 class="shadow-sm sombra-texto text-center mb-3 mt-5 titulos 
                tamanioLetras">Erradicanción Inminente</h4>
            <h5 class="shadow-sm sombra-texto text-center mb-4 mt-5 grandesLetras">Autodestrucción en :<span id="autodestruir">4</span></h5>
        </div>
    </body>
</html>
