package es.albarregas.controllers;

import es.albarregas.beans.Usuario;
import es.albarregas.models.Utilidades;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author mde
 */
@WebServlet(name = "GestionController", urlPatterns = {"/GestionController"})
public class GestionController extends HttpServlet {

    private static final int MAX_INTENTOS = 3;
    private static int contador = 0;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/jsp/inicioSesion.jsp";

        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");
        Integer intentosRestantes = (Integer) sesion.getAttribute("intentos");

        if (intentosRestantes == null) {
            intentosRestantes = MAX_INTENTOS;
        }

        if (request.getParameter("confirmar") != null) {
            String codigoUsuario = request.getParameter("codigo");

            if (usuario != null && codigoUsuario.equalsIgnoreCase(usuario.getCodigo())) {
                url = "/jsp/aciertoSesion.jsp";
                sesion.setAttribute("intentos", MAX_INTENTOS);
            } else {
                intentosRestantes--;

                if (intentosRestantes <= 0) {
                    sesion.invalidate();
                    url = "/jsp/falloSesion.jsp";
                } else {
                    sesion.setAttribute("intentos", intentosRestantes);
                }
            }
        }

        HttpSession session = request.getSession();
        String fraseCifrada = (String) session.getAttribute("fraseCifrada");

        if (request.getParameter("pista") != null && contador < 5) {
            String fraseOriginal = usuario.getFrase();
            String nuevaFrase = Utilidades.reemplazarPalabraConOriginal(fraseCifrada, fraseOriginal);

            session.setAttribute("fraseCifrada", nuevaFrase);

            contador++;
        } else if (contador >= 5) {
            sesion.invalidate();
            url = "/jsp/falloSesion.jsp";
            contador = 0;
        }

        if (request.getParameter("enviar") != null) {
            String emailDestino = request.getParameter("destinatario");
            String mensajeFormulario = request.getParameter("mensaje");

            if (usuario != null) {
                Utilidades.enviarMensaje("pruebaappjuego@gmail.com", "nhxfcstmqnrvjhxo", emailDestino, mensajeFormulario);
            }

            url = "/index.jsp";
        }

        request.getRequestDispatcher(url).forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar intentos limitados de autenticación sin reiniciar la frase";
    }
}
