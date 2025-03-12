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
        <div class="container d-flex flex-column  justify-content-center align-items-center mt-5">
            <h2 class="shadow-sm sombra-texto text-center mb-3 mt-5 titulos 
                tamanioLetras">Introduzca código secreto</span></h2>

            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <form method="post" action="${contexto}/GestionController">

                        <h4 class="display-2 lead shadow-sm sombra-texto legibilidad text-center titulos parpadeoEfecto grandesLetras">
                            ${sessionScope.fraseCifrada}
                        </h4>

                        <div class="mb-5">
                            <label class="form-label">Usuario</label>
                            <input type="text" name="nombre" value="${sessionScope.usuario.nombre}" id="nombre" class="form-control tamanioLetras" readonly>
                        </div>

                        <div class="mb-5">
                            <label class="form-label">Código</label>
                            <input type="text" name="codigo" value="${sessionScope.usuario.codigo}" id="codigo" class="form-control tamanioLetras">
                        </div>

                        <div class="d-flex justify-content-center gap-2 mb-4">
                            <input type="submit" class="btn btn-highlight w-100 tamanioLetras" name="confirmar" value="Confirmar" />
                            <input type="submit" class="btn btn-highlight w-100 tamanioLetras" value="Cancelar" name="cancelar" />
                        </div>

                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
