package es.albarregas.dao;

import es.albarregas.beans.Usuario;
import es.albarregas.persistence.HibernateUtil;
import org.hibernate.Session;
import java.util.List;

public class UsuarioDAO implements IUsuarioDAO {

    @Override
    public Usuario getRandom() {
        Session sesion = null;
        Usuario usuarioAleatorio = null;

        try {
            // Se abre la sesión
            sesion = HibernateUtil.getSessionFactory().openSession();

            // Consulta que obtiene un usuario aleatorio
            usuarioAleatorio = (Usuario) sesion.createQuery("FROM Usuario ORDER BY RAND()").setMaxResults(1).uniqueResult();
        } catch (org.hibernate.JDBCException ex) {
            // Para que muestre el error
            ex.printStackTrace();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
        return usuarioAleatorio;
    }

    @Override
    public List<Usuario> get() {
        Session sesion = null;
        List<Usuario> listaUsuarios = null;

        try {
            //Se abre la sesión
            sesion = HibernateUtil.getSessionFactory().openSession();
            //Se inicia la transacción para asegurarse
            listaUsuarios = sesion.createQuery("from Usuario").list();
        } catch (org.hibernate.JDBCException ex) {
            //Para que muestre el error
            ex.printStackTrace();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
        return listaUsuarios;
    }

    @Override
    public Usuario getOne(int id) {

        Usuario usuario = null;
        Session sesion = null;
        try {
            sesion = HibernateUtil.getSessionFactory().openSession();
            usuario = (Usuario) sesion.get(Usuario.class, id);
        } catch (org.hibernate.JDBCException ex) {
            ex.printStackTrace();
        } finally {
            if (sesion != null) {
                sesion.close();
            }
        }
        return usuario;
    }

}
