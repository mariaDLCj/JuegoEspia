<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <c:import url="/INC/meta.inc"/>
        <c:set var="contexto" value="${pageContext.request.contextPath}" scope="application"/>
        <c:url var="estilo" value="/CSS/styles.css" scope="application"/>
        <c:url var="bootstrap" value="/CSS/bootstrap.css" scope="application"/>
        <title>Enigma</title>
        <link rel="stylesheet" type="text/css" href="${applicationScope.bootstrap}"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}"/>
        <link href="https://fonts.googleapis.com/css2?family=Sixtyfour&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=VT323&display=swap" rel="stylesheet">
        <meta http-equiv="refresh" content="1; url=${contexto}/FrontController">
    </head>

    <body>

        <!-- Sección de carga que inicialmente está oculta -->
        <section class="justify-content-space-around align-items-center d-flex" id="carga">
            <div class="mt-5 container d-flex justify-content-center align-items-center flex-column">
                <img src="IMG/IconoGeneral.png" alt="alt" class="mt-5 parpadeoEfecto"/>
                <h3 class="shadow-sm sombra-texto text-center highlight mt-4 titulos parpadeoEfecto">Cargando...</h3>

                <audio id="audio" muted loop>
                    <source src="AUDIO/AmbienceAudioInicio.mp3" type="audio/mp3">
                </audio>
            </div>
        </section>

        <c:import url="/INC/pie.jsp"/>
    </body>
</html>
