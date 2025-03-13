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
        <div class="container d-flex flex-column  justify-content-center align-items-center mt-5">
            <img src="${applicationScope.contexto}/IMG/IconoEsquina.png" alt="" class="align-self-end imgEsquina"/>

            <h2 class="shadow-sm sombra-texto text-center mb-3 mt-5 titulos 
                tamanioLetras">Introduzca código secreto</span></h2>

            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <form method="post" action="${contexto}/GestionController" class="mb-5">

                        <div class="mb-5">
                            <label class="form-label">Destinatario</label>
                            <input type="text" name="destinatario" value="" id="destinatario" class="form-control tamanioLetras anchoInput">
                        </div>

                        <div class="mb-5">
                            <label class="form-label">Mensaje</label>
                            <input type="text" name="mensaje" value="" id="mensaje" class="form-control tamanioLetras anchoInput">
                        </div>

                        <div class="d-flex justify-content-center gap-2 mb-5">
                            <input type="submit" class="btn btn-highlight w-100" name="enviar" value="Enviar" />
                            <input type="submit" class="btn btn-highlight w-100" value="Cancelar" name="cancelar" />
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
