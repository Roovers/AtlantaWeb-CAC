package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Usuario;
import servicio.ServicioUsuario;

import java.io.IOException;

@WebServlet("/registro")
public class RegistroServlet extends HttpServlet {
    private ServicioUsuario servicioUsuario;

    @Override
    public void init() throws ServletException {
        // INICIALIZO EL SERVICIO EN EL MÉTODO INIT
        servicioUsuario = new ServicioUsuario();
    }

    // MANEJO LAS SOLICITUDES POST PARA PROCESAR EL FORMULARIO DE REGISTRO
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // OBTENGO PARÁMETROS DEL FORMULARIO
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String dni = request.getParameter("dni");
            String correo = request.getParameter("correo");
            String password = request.getParameter("password");

            // REALIZO LA VALIDACIÓN DE LOS DATOS
            if (nombre == null || nombre.isEmpty() ||
                    apellido == null || apellido.isEmpty() ||
                    dni == null || dni.isEmpty() ||
                    correo == null || correo.isEmpty() ||
                    password == null || password.isEmpty()) {
                // DATOS INCOMPLETOS, REDIRIJO A LA PÁGINA DE ERROR
                response.sendRedirect("registroErroneo.jsp");
                return;
            }

            // VERIFICO SI EL DNI YA ESTÁ REGISTRADO
            if (servicioUsuario.verificarDniExistente(dni)) {
                // DNI YA REGISTRADO, REDIRIJO A LA PÁGINA DE ERROR
                response.sendRedirect("registroErroneo.jsp");
                return;
            }

            // CREO UN OBJETO USUARIO
            Usuario usuario = new Usuario(nombre, apellido, dni, correo, password);

            // REGISTRO AL USUARIO UTILIZANDO EL SERVICIO
            servicioUsuario.registrarUsuario(usuario);

            // CREO UNA SESIÓN Y AGREGO ATRIBUTOS
            HttpSession session = request.getSession(true);
            session.setAttribute("dni", dni);
            session.setAttribute("nombreUsuario", nombre);
            session.setAttribute("apellidoUsuario", apellido);

            // CREO Y CONFIGURO LA COOKIE DE SESIÓN
            Cookie userCookie = new Cookie("usuario", dni);
            userCookie.setMaxAge(60 * 60 * 24 * 30); // COOKIE VÁLIDA POR 30 DÍAS
            response.addCookie(userCookie);

            // REDIRIJO A UNA PÁGINA DE ÉXITO (PUEDES CAMBIAR ESTO SEGÚN TUS NECESIDADES)
            response.sendRedirect("registroExitoso.jsp");
        } catch (Exception e) {
            // MANEJO DE ERRORES: REDIRIJO A UNA PÁGINA DE ERROR
            response.sendRedirect("registroErroneo.jsp");
        }
    }
}
