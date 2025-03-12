<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete</title>
        <c:import url="/INC/meta.inc"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.bootstrap}"/>
        <link rel="stylesheet" type="text/css" href="${applicationScope.estilo}"/>
        <link href="https://fonts.googleapis.com/css2?family=Ruda:wght@400;700&display=swap" rel="stylesheet">
    </head>

    <body>
        <!-- Cabecera con el menú de navegación  -->
        <c:import url="/INC/cabecera.jsp"/>
        <h2 class="shadow-sm sombra-texto text-center mb-4 mt-5">Elija el cliente a eliminar</span></h2>
    <p class="lead shadow-sm sombra-texto legibilidad text-center">
        Seleccione el cliente para proceder con la cancelación.
    </p>
    <div class="container mt-5">
        <form action="${applicationScope.contexto}/Delete" method="post">

            <table class="table table-bordered table-striped custom-table">
                <thead class="table-dark">
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Primer Apellido</th>
                        <th>Segundo Apellido</th>
                        <th>Dirección</th>
                        <th>Teléfono</th>
                        <th>Seleccionado</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="cliente" items="${requestScope.lista}" varStatus="i">
                        <!-- Más información sobre el foreach 
                        https://stackoverflow.com/questions/2017753/jstl-iterate-list-but-treat-first-element-differently
                        -->
                        <tr>
                            <td>${cliente.id}</td>
                            <td>${cliente.nombre}</td>
                            <td>${cliente.apellido1}</td>
                            <td>${cliente.apellido2}</td>
                            <td>${cliente.direccion}</td>
                            <td>${cliente.telefono}</td>
                            <td><input type="radio" name="idCliente" value="${cliente.id}" class="form-check-input"  
                                       <c:if test="${i.first}">checked</c:if> /></td>
                            </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="d-flex justify-content-center gap-2">
                <input type="submit" name="eliminar" value="Eliminar" class="btn btn-danger">
                <input type="submit" name="cancelar" value="Cancelar" class="btn btn-danger">
            </div>
        </form>
    </div>
</body>
</html>
