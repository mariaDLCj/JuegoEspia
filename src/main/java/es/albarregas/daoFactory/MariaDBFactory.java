package es.albarregas.daoFactory;

import es.albarregas.dao.IUsuarioDAO;
import es.albarregas.dao.UsuarioDAO;

/**
 *
 * @author mde
 */
public class MariaDBFactory extends DAOFactory{

    @Override
    public IUsuarioDAO getUsuarioDAO() {
        return new UsuarioDAO();
    }
}
