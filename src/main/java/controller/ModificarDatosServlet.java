package controller;

import DAO.UsuarioDAOImpl;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;

import java.io.IOException;

@WebServlet("/modificarMisDatos")
public class ModificarDatosServlet extends HttpServlet {

    private UsuarioDAOImpl usuarioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // INICIALIZO EL OBJETO DE ACCESO A DATOS (DAO) AL INICIO DEL SERVLET
        usuarioDAO = new UsuarioDAOImpl();
    }

    // MANEJO LAS SOLICITUDES GET PARA OBTENER Y MOSTRAR MIS DATOS ACTUALES
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // OBTENGO MIS DATOS ACTUALES Y LOS PASO AL FORMULARIO
        HttpSession session = request.getSession();
        String dni = (String) session.getAttribute("dni");
        Usuario usuario = usuarioDAO.obtenerUsuarioPorDNI(dni);

        // ALMACENO MI OBJETO USUARIO EN LA SESIÓN PARA MOSTRAR LOS DATOS ACTUALES EN EL FORMULARIO
        session.setAttribute("usuarioModificar", usuario);

        // REDIRIJO A LA PÁGINA DE MODIFICACIÓN
        RequestDispatcher dispatcher = request.getRequestDispatcher("modificarMisDatos.jsp");
        dispatcher.forward(request, response);
    }

    // MANEJO LAS SOLICITUDES POST PARA ACTUALIZAR MIS DATOS
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // OBTENGO LOS DATOS ENVIADOS POR EL FORMULARIO
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String contrasenia = request.getParameter("password"); // PUEDO NECESITAR MÁS SEGURIDAD AQUÍ

            // OBTENGO MI OBJETO USUARIO ACTUAL DE LA SESIÓN
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuarioModificar");

            // ACTUALIZO MIS DATOS
            usuario.setNombre(nombre);
            usuario.setApellido(apellido);
            usuario.setCorreo(correo);
            usuario.setContrasenia(contrasenia);

            // ACTUALIZO MI INFORMACIÓN EN LA BASE DE DATOS
            boolean actualizado = usuarioDAO.actualizarUsuario(usuario);

            if (actualizado) {
                // ESTABLEZCO UN MENSAJE DE ÉXITO
                System.out.println("MIS DATOS ACTUALIZADOS CON ÉXITO.");
                request.setAttribute("successMessage", "MIS DATOS ACTUALIZADOS CON ÉXITO");

                // CIERRO MI SESIÓN
                session.invalidate();

                // REDIRIJO A LA PÁGINA DE INICIO DE SESIÓN
                response.sendRedirect(request.getContextPath() + "/modificacionExitosa.jsp");
            } else {
                // ESTABLEZCO UN MENSAJE DE ERROR Y REDIRIJO A LA PÁGINA DE MODIFICACIÓN
                System.out.println("ERROR AL ACTUALIZAR MIS DATOS. REDIRIGIENDO A MODIFICARMISDATOS.JSP");
                request.setAttribute("errorMessage", "ERROR AL ACTUALIZAR MIS DATOS");
                request.getRequestDispatcher("/modificarMisDatos.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // ESTABLEZCO UN MENSAJE DE ERROR Y REDIRIJO A LA PÁGINA DE MODIFICACIÓN
            request.setAttribute("errorMessage", "ERROR AL PROCESAR LA SOLICITUD");
            request.getRequestDispatcher("/modificarDatos.jsp").forward(request, response);
        }
    }
}
