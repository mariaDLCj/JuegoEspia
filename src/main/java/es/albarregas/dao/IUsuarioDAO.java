package es.albarregas.dao;

import es.albarregas.beans.Usuario;
import java.util.List;

public interface IUsuarioDAO {

    public List<Usuario> get();

    public Usuario getRandom();

    public Usuario getOne(int id);

}
