<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create</title>
        <c:import url="/INC/meta.inc"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.bootstrap}"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}"/>
        <script src="${contexto}/JS/script.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Ruda:wght@400;700&display=swap" rel="stylesheet">

    </head>

    <body>
        <!-- Cabecera con el menú de navegación  -->
        <c:import url="/INC/cabecera.jsp"/>
        <section class="py-5">
            <div class="container d-flex flex-column  justify-content-center align-items-center">
                <h2 class="display-4 shadow-sm sombra-texto text-center">¡Inscríbete al <span class="bold">"Obon no Yoru"!</span></h2>
                <p class="lead shadow-sm sombra-texto legibilidad text-center">
                    La incripción es gratuita, simplemente rellena el formulario con tus datos para poder asistir.
                </p>
                <div class="row justify-content-center formulario-bg">
                    <div class="col-lg-8">
                        <form action="${applicationScope.contexto}/Create" method="post">

                            <div class="mb-3">
                                <label class="form-label">*Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresa tu nombre completo">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">*Primer Apellido</label>
                                <input type="text" class="form-control" id="apellido1" name="apellido1" placeholder="Ingresa tu primer apellido">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Segundo Apellido (Opcional) </label>
                                <input type="text" class="form-control" id="apellido2" name="apellido2" placeholder="Ingresa tu segundo apellido">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">*Dirección</label>
                                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Ingresa tu direccion">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">*Teléfono</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Ingresa tu telefono">
                            </div>

                            <p class="p text-white">${requestScope.smsOcupado}</p>
                            <p class="p text-white">${requestScope.smsVacio}</p>
                            <p class="p text-white" id="errorJs"></p>

                            <div class="d-flex justify-content-center gap-2">
                                <input type="submit" class="btn btn-highlight w-100" name="registrarse" value="Registrarse" id="botonValidar" />
                                <input type="submit" class="btn btn-highlight w-100" value="Cancelar" name="cancelar" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
