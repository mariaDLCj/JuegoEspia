package es.albarregas.controllers;

import es.albarregas.beans.Usuario;
import es.albarregas.daoFactory.DAOFactory;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import es.albarregas.dao.IUsuarioDAO;
import es.albarregas.models.Utilidades;

/**
 *
 * @author Maria
 */
@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
        // Este método es llamado cuando el servlet es inicializado
        System.out.println("Se ha inicializado el servlet");
    }

    @Override
    public void destroy() {
        // Este método es llamado cuando el servlet se va a destruir
        System.out.println("Se ha destruido el servlet ");
    }

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
        DAOFactory daof = DAOFactory.getDAOFactory("MySQL");
        IUsuarioDAO pdao = daof.getUsuarioDAO();
        Usuario usuario = pdao.getRandom();
        String frase = usuario.getFrase();
        String fraseCifrada = Utilidades.devolverCifradoCesar(frase);

// Usuario y la frase cifrada en la sesión
        request.getSession().setAttribute("usuario", usuario);
        request.getSession().setAttribute("fraseCifrada", fraseCifrada);
// Redirigimos el flujo a inicioSesion.jsp
        String url = "/jsp/inicioSesion.jsp";
        request.getRequestDispatcher(url).forward(request, response);
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
        DAOFactory daof = DAOFactory.getDAOFactory("MySQL");
        IUsuarioDAO pdao = daof.getUsuarioDAO();
        Usuario usuario = pdao.getRandom();
        String frase = usuario.getFrase();
        String fraseCifrada = Utilidades.devolverCifradoCesar(frase);

// Usuario y la frase cifrada en la sesión
        request.getSession().setAttribute("usuario", usuario);
        request.getSession().setAttribute("fraseCifrada", fraseCifrada);
// Redirigimos el flujo a inicioSesion.jsp
        String url = "/jsp/inicioSesion.jsp";
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
