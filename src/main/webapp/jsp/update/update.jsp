<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update</title>
        <c:import url="/INC/meta.inc"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.bootstrap}"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}"/>
        <script src="${contexto}/JS/script.js" defer></script>
        <link href="https://fonts.googleapis.com/css2?family=Ruda:wght@400;700&display=swap" rel="stylesheet">
    </head>

    <body>
        <!-- Cabecera con el menú de navegación  -->
        <c:import url="/INC/cabecera.jsp"/>
        <div class="container d-flex flex-column  justify-content-center align-items-center">
            <h2 class="shadow-sm sombra-texto text-center mb-4 mt-5">Modifica los datos de una Inscripción</span></h2>
            <p class="lead shadow-sm sombra-texto legibilidad text-center">
                Los datos pueden ser modificados rellenando el formulario con los nuevos datos.
            </p>
            <div class="row justify-content-center formulario-bg">
                <div class="col-lg-8">
                    <form method="post" action="${contexto}/Update">

                        <div class="mb-3">
                            <label class="form-label">ID</label>
                            <input type="number" class="form-control" id="id" name="id" value="${sessionScope.cliente.id}" readonly>
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Nombre</label>
                            <input type="text" name="nombre" value="${sessionScope.cliente.nombre}" id="nombre" class="form-control" >
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Primer apellido</label>
                            <input type="text" name="apellido1" value="${sessionScope.cliente.apellido1}" id="apellido1" class="form-control" >
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Segundo apellido</label>
                            <input type="text" name="apellido2" value="${sessionScope.cliente.apellido2}" id="apellido2" class="form-control" >
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Dirección</label>
                            <input type="text" name="direccion" value="${sessionScope.cliente.direccion}" id="direccion" class="form-control" >
                        </div>

                        <div class="mb-3">
                            <label class="form-label fw-bold">Teléfono</label>
                            <input type="text" name="telefono" value="${sessionScope.cliente.telefono}" id="telefono" class="form-control" >
                        </div>

                        <div class="d-flex justify-content-center gap-2">
                            <input type="submit" class="btn btn-highlight w-100" name="actualizar" value="Confirmar" />
                            <input type="submit" class="btn btn-highlight w-100" value="Cancelar" name="cancelar" />
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
