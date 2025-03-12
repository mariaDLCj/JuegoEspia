package es.albarregas.controllers;

import es.albarregas.beans.Usuario;
import es.albarregas.models.Utilidades;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mde
 */
@WebServlet(name = "GestionController", urlPatterns = {"/GestionController"})
public class GestionController extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "/jsp/falloSesion.jsp";
        if (request.getParameter("confirmar") != null) {
            String codigoUsuario = request.getParameter("password");
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            if (codigoUsuario.equalsIgnoreCase(usuario.getPassword()) ) {
                url = "/jsp/aciertoSesion.jsp";
            }
        }

        if (request.getParameter("enviar") != null) {
            String emailDestino = request.getParameter("destinatario");
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
            String emailOrigen = usuario.getEmail();
            String mensajeFormulario = request.getParameter("mensaje");
            String contrasenia = usuario.getPassword();
            Utilidades.enviarMensaje(emailOrigen, contrasenia, emailDestino, mensajeFormulario);

            url = "/index.jsp";
        }

// Redirigir siempre al índice después de procesar
        request.getRequestDispatcher(url).forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
