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
        <script src="${contexto}/JS/scriptSonidoTecla.js" defer></script>
        <script src="${contexto}/JS/scriptAudioAmbiente.js" defer></script>
    </head>

    <body>
        <style>

            .contador-intentos {
                font-size: 20px;
                text-align: center;
                margin-bottom: 15px;
                color: ${sessionScope.intentos == 1 ? 'red' : '#33FF33'};
                /* Rojo si queda solo 1 intento */
                border:1px solid #7FFC51;
                font-size: 50px;
                width: 120px;
                display:flex;
                justify-content: center;
                align-items: center;
            }

            .img-enana{
                margin:8px 8px;
                height: 45px;
            }

            .inicio{
                margin-top:70px;
                margin-bottom:-100px;
            }

            /*   .margen-arriba {
              margin-top:-200px;
          }*/
        </style> 

        <!-- Cabecera con el menú de navegación  -->
        <div class="container d-flex flex-column margen-arriba justify-content-center align-items-center">

            <div class="inicio align-self-start">
                <p>Intentos restantes:</p> 
                <div class="contador-intentos">
                    <img src="${applicationScope.contexto}/IMG/IconoEsquina.png" alt="" class="img-enana"/>
                    <c:set var="intentos" value="${sessionScope.intentos != null ? sessionScope.intentos : 3}" />  
                    <span class="me-1">${intentos}</span>          
                </div>   
            </div>
            <h2 class="shadow-sm sombra-texto text-center mb-5 mt-5 titulos 
                tamanioLetras">Introduzca código secreto</span></h2>

            <h5 class="display-6 lead shadow-sm sombra-texto legibilidad text-center titulos parpadeoEfecto">
                ${sessionScope.fraseCifrada}
            </h5>


            <div class="row justify-content-center">
                <div class="col-lg-12">
                    <form method="post" action="${contexto}/GestionController">

                        <div class="mb-5">
                            <label class="form-label">Usuario</label>
                            <input type="text" name="nombre" value="${sessionScope.usuario.nombre}" id="nombre" class="form-control anchoInput tamanioLetras" readonly>
                        </div>

                        <div class="mb-5">
                            <label class="form-label">Código</label>
                            <input type="text" name="codigo" value="" id="codigo" class="form-control anchoInput tamanioLetras">
                        </div>

                        <div class="d-flex justify-content-center gap-2 mb-4">
                            <input type="submit" class="btn btn-highlight w-100 tamanioLetras" name="confirmar" value="Confirmar" />
                            <input type="submit" class="btn btn-highlight w-100 tamanioLetras" value="Pista" name="pista" />
                            <input type="submit" class="btn btn-highlight w-100 tamanioLetras" value="Cancelar" name="cancelar" />
                        </div>
                    </form>
                </div>
            </div>
            <audio id="audio" muted loop>
                <source src="${applicationScope.contexto}/AUDIO/AmbienceAudioLoop.mp3" type="audio/mp3">
            </audio>

        </div>
    </body>

</html>



