package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    // CONFIGURO LOS VALORES SEGÚN MI BASE DE DATOS
    private static final String URL = "jdbc:mysql://localhost:3306/atlanta";
    private static final String USUARIO = "root";
    private static final String CONTRASENIA = "";

    static {
        // CARGO EL DRIVER JDBC. ASEGÚRATE DE TENER LA BIBLIOTECA DEL DRIVER EN MI PROYECTO.
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("Error al cargar el driver JDBC", e);
        }
    }

    // OBTENGO UNA CONEXIÓN A LA BASE DE DATOS
    public static Connection obtenerConexion() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, CONTRASENIA);
    }

    // CIERRO LA CONEXIÓN A LA BASE DE DATOS
    public static void cerrarConexion(Connection conexion) {
        if (conexion != null) {
            try {
                conexion.close();
            } catch (SQLException e) {
                e.printStackTrace(); // MANEJO DE EXCEPCIONES SEGÚN MIS NECESIDADES
            }
        }
    }
}
