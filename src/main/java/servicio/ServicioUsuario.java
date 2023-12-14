package servicio;

import DAO.UsuarioDAO;
import DAO.UsuarioDAOImpl;
import model.Usuario;

public class ServicioUsuario {
    private UsuarioDAO usuarioDAO;

    public ServicioUsuario() {
        this.usuarioDAO = new UsuarioDAOImpl();
    }

    // MÉTODO PARA REGISTRAR UN NUEVO USUARIO
    public void registrarUsuario(Usuario usuario) {
        // LÓGICA DE VALIDACIÓN AGREGADA SEGÚN SEA NECESARIO
        usuarioDAO.agregarUsuario(usuario);
    }

    // MÉTODO PARA OBTENER UN USUARIO POR SU DNI
    public Usuario obtenerUsuarioPorDNI(String dni) {
        // LÓGICA ADICIONAL AGREGADA SEGÚN SEA NECESARIO
        return usuarioDAO.obtenerUsuarioPorDNI(dni);
    }

    // MÉTODO PARA ACTUALIZAR LA INFORMACIÓN DE UN USUARIO
    public void actualizarUsuario(Usuario usuario) {
        // LÓGICA DE VALIDACIÓN O TRANSFORMACIÓN AGREGADA SEGÚN SEA NECESARIO
        usuarioDAO.actualizarUsuario(usuario);
    }

    // MÉTODO PARA ELIMINAR UN USUARIO
    public void eliminarUsuario(String dni) {
        // LÓGICA ADICIONAL AGREGADA SEGÚN SEA NECESARIO
        usuarioDAO.eliminarUsuario(dni);
    }

    // MÉTODO PARA INICIAR SESIÓN
    public boolean iniciarSesion(String dni, String contrasenia) {
        // OBTENER EL USUARIO POR DNI
        Usuario usuario = usuarioDAO.obtenerUsuarioPorDNI(dni);

        // VERIFICAR SI EL USUARIO EXISTE Y LA CONTRASEÑA COINCIDE
        return usuario != null && usuario.getContrasenia().equals(contrasenia);
    }

    // MÉTODO PARA VERIFICAR SI UN DNI YA ESTÁ REGISTRADO
    public boolean verificarDniExistente(String dni) {
        // LÓGICA PARA VERIFICAR SI EL DNI YA EXISTE
        Usuario usuarioExistente = usuarioDAO.obtenerUsuarioPorDNI(dni);
        return usuarioExistente != null;
    }
}
