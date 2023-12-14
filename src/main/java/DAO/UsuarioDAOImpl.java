package DAO;

import model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioDAOImpl implements UsuarioDAO {
    private Connection conexion;

    // ESTABLEZCO LA CONEXIÓN EN EL CONSTRUCTOR
    public UsuarioDAOImpl() {
        try {
            this.conexion = ConexionDB.obtenerConexion();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // OBTENGO UN USUARIO POR SU (DNI)
    @Override
    public Usuario obtenerUsuario(String dni) {
        try {
            String sql = "SELECT * FROM usuarios WHERE DNI = ?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setString(1, dni);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        // CREO UN OBJETO USUARIO CON LOS DATOS OBTENIDOS DE LA BASE DE DATOS
                        Usuario usuario = new Usuario();
                        usuario.setNombre(resultSet.getString("nombre"));
                        usuario.setApellido(resultSet.getString("apellido"));
                        usuario.setDni(resultSet.getString("DNI"));
                        usuario.setCorreo(resultSet.getString("correo"));
                        usuario.setContrasenia(resultSet.getString("password"));
                        return usuario;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // AQUÍ PUEDO LANZAR UNA EXCEPCIÓN PERSONALIZADA SI LO PREFIERO
            return null;
        }

        // RETORNO NULL SI NO SE ENCUENTRA EL USUARIO
        return null;
    }

    // AGREGO UN NUEVO USUARIO A LA BASE DE DATOS
    @Override
    public void agregarUsuario(Usuario usuario) {
        String query = "INSERT INTO usuarios (nombre, apellido, DNI, correo, password) VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement ps = conexion.prepareStatement(query)) {
            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getDni());
            ps.setString(4, usuario.getCorreo());
            ps.setString(5, usuario.getContrasenia());

            // EJECUTO LA ACTUALIZACIÓN
            ps.executeUpdate();

            System.out.println("USUARIO AGREGADO CON ÉXITO A LA BASE DE DATOS.");
        } catch (SQLException e) {
            throw new RuntimeException("ERROR AL AGREGAR USUARIO A LA BASE DE DATOS", e);
        }
    }

    // OBTENGO UN USUARIO POR SU DNI
    @Override
    public Usuario obtenerUsuarioPorDNI(String dni) {
        String query = "SELECT * FROM usuarios WHERE DNI = ?";
        Usuario usuario = null;
        try (PreparedStatement ps = conexion.prepareStatement(query)) {
            ps.setString(1, dni);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    // CREO UN OBJETO USUARIO CON LOS DATOS OBTENIDOS DE LA BASE DE DATOS
                    usuario = new Usuario();
                    usuario.setNombre(rs.getString("nombre"));
                    usuario.setApellido(rs.getString("apellido"));
                    usuario.setDni(rs.getString("DNI"));
                    usuario.setCorreo(rs.getString("correo"));
                    usuario.setContrasenia(rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("ERROR AL OBTENER USUARIO POR DNI", e);
        }

        return usuario;
    }

    // ACTUALIZO LA INFORMACIÓN DE UN USUARIO EN LA BASE DE DATOS
    @Override
    public boolean actualizarUsuario(Usuario usuario) {
        try {
            String sql = "UPDATE usuarios SET nombre=?, apellido=?, correo=?, password=? WHERE DNI=?";
            try (PreparedStatement statement = conexion.prepareStatement(sql)) {
                statement.setString(1, usuario.getNombre());
                statement.setString(2, usuario.getApellido());
                statement.setString(3, usuario.getCorreo());
                statement.setString(4, usuario.getContrasenia());
                statement.setString(5, usuario.getDni());

                int filasActualizadas = statement.executeUpdate();
                return filasActualizadas > 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ELIMINO UN USUARIO DE LA BASE DE DATOS POR SU DNI
    @Override
    public void eliminarUsuario(String dni) {
        String query = "DELETE FROM usuarios WHERE DNI = ?";

        try (PreparedStatement ps = conexion.prepareStatement(query)) {
            ps.setString(1, dni);

            // EJECUTO LA ELIMINACIÓN
            ps.executeUpdate();

            System.out.println("USUARIO ELIMINADO CON ÉXITO DE LA BASE DE DATOS.");
        } catch (SQLException e) {
            throw new RuntimeException("ERROR AL ELIMINAR USUARIO DE LA BASE DE DATOS", e);
        }
    }
}
