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

@WebServlet("/verMisDatos")
public class verMisDatosServlet extends HttpServlet {
    private UsuarioDAOImpl usuarioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // INICIALIZO EL OBJETO DE ACCESO A DATOS (DAO) AL INICIO DEL SERVLET
        usuarioDAO = new UsuarioDAOImpl();
    }

    // MANEJO LAS SOLICITUDES GET PARA VER Y MOSTRAR MIS DATOS
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // VERIFICO SI EL USUARIO ESTÁ AUTENTICADO
        HttpSession session = request.getSession();
        if (session.getAttribute("dni") != null) {
            // EL USUARIO ESTÁ AUTENTICADO, OBTENGO EL OBJETO USUARIO DE LA BASE DE DATOS
            String dni = (String) session.getAttribute("dni");
            Usuario usuario = usuarioDAO.obtenerUsuarioPorDNI(dni);

            // ALMACENO EL OBJETO USUARIO EN LA SESIÓN
            session.setAttribute("usuario", usuario);

            // REDIRIJO A LA PÁGINA CORRESPONDIENTE
            RequestDispatcher dispatcher = request.getRequestDispatcher("verMisDatos.jsp");
            dispatcher.forward(request, response);
        } else {
            // EL USUARIO NO ESTÁ AUTENTICADO, REDIRIJO A LA PÁGINA DE INICIO DE SESIÓN
            response.sendRedirect("login.jsp");
        }
    }
}
