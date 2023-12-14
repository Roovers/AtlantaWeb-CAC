package controller;

import DAO.UsuarioDAO;
import DAO.UsuarioDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/darDeBajaUsuario")
public class DarDeBajaUsuarioServlet extends HttpServlet {
    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        // INICIALIZO EL OBJETO USUARIODAO
        usuarioDAO = new UsuarioDAOImpl();
    }

    // IMPLEMENTO EL METODO PARA EL MANEJO DE SOLICITUDES GET
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // OBTENGO LA SESION ACTUAL SI ES QUE EXISTE
        HttpSession session = request.getSession(false);

        if (session != null && session.getAttribute("dni") != null) {
            // OBTENGO EL DNI DEL USUARIO DESDE LA SESION
            String dni = (String) session.getAttribute("dni");

            // LOGICA PARA LA BAJA DEL USUASRIO
            if (eliminarUsuario(dni)) {
                // CIERRO LA SESION DEL USUARIO Y LO REDIRIJO AL JSP CON EL AVISO DE PROCESO EXITOSO
                cerrarSesion(request);
                response.sendRedirect(request.getContextPath() + "/BajaDeCuentaExitosa.jsp");
            } else {
                // REDIRECCION A JSP DE RROR EN CASO QUE EXISTA
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } else {
            // SI NO HAY UNA SESION ACTIVA REDIRIGE A LOGIN
            response.sendRedirect(request.getContextPath() + "/login.jsp");
        }
    }

    // METODO PARA DAR DE BAJA AL USUARIO DE LA DB
    private boolean eliminarUsuario(String dni) {
        // SE LLAMA AL METODO eliminarUsuario DE LA CAPA DAO
        try {
            usuarioDAO.eliminarUsuario(dni);
            return true;
        } catch (RuntimeException e) {
            // ACA SIMPLEMENTE SE MANEJA EXCEPCIONES DE SER NECESARIO
            e.printStackTrace();
            return false;
        }
    }

    // METODO DE CIERRE DE SESION
    private void cerrarSesion(HttpServletRequest request) {
        // OBTENGO LA SESION ACTUAL
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // INVALIDO LA SESION ACTUAL
        }
    }
}
