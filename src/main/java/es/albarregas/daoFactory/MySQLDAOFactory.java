
package es.albarregas.daoFactory;
 
import es.albarregas.dao.UsuarioDAO;
import es.albarregas.dao.IUsuarioDAO;


/**
 *
 * @author Maria
 */
public class MySQLDAOFactory extends DAOFactory {

    @Override
    public IUsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO();
    }
}
