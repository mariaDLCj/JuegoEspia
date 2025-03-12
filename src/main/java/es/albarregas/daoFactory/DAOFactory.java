package es.albarregas.daoFactory;

import es.albarregas.dao.IUsuarioDAO;

/**
 * Fábrica abstracta que cambia dependiendo de la fuente de datos.
 * @author Maria
 */
public abstract class DAOFactory {

    /**
     * Método abstracto para obtener la implementación del DAO de Usuario.
     * @return Interface de las operaciones a realizar con la tabla de usuarios.
     */
    public abstract IUsuarioDAO getUsuarioDAO();

    /**
     * Método estático que devuelve la fábrica de la base de datos especificada.
     * @param dbType Tipo de base de datos: "MySQL" o "MariaDB"
     * @return Objeto de la fábrica correspondiente.
     */
    public static DAOFactory getDAOFactory(String dbType) {
        DAOFactory daof = null;

        if ("MySQL".equalsIgnoreCase(dbType)) {
            daof = new MySQLDAOFactory();
        } else if ("MariaDB".equalsIgnoreCase(dbType)) {
            daof = new MariaDBFactory(); 
        } else {
            throw new IllegalArgumentException("Base de datos no soportada: " + dbType);
        }

        return daof;
    }
}
