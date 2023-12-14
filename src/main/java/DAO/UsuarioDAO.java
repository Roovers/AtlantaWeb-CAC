package DAO;

import model.Usuario;

public interface UsuarioDAO {
    // OBTENGO UN USUARIO POR SU IDENTIFICACIÓN (DNI)
    Usuario obtenerUsuario(String dni);

    // AGREGO UN NUEVO USUARIO A LA BASE DE DATOS
    void agregarUsuario(Usuario usuario);

    // OBTENGO UN USUARIO POR SU DNI
    Usuario obtenerUsuarioPorDNI(String dni);

    // ACTUALIZO LA INFORMACIÓN DE UN USUARIO EN LA BASE DE DATOS
    boolean actualizarUsuario(Usuario usuario);

    // ELIMINO UN USUARIO DE LA BASE DE DATOS POR SU DNI
    void eliminarUsuario(String dni);
}
