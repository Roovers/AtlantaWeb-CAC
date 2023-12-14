package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/cerrarSesion")
public class LogoutServlet extends HttpServlet {

    // METODO QUE MANEJA LAS SOLICITUDES GET PARA CERRAR LA SESION
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // OBTENER LA SESION ACTUAL
        HttpSession session = request.getSession(false);

        if (session != null) {
            // INVALIDAR LA SESION ACTUAL SI EXISTE
            session.invalidate();
        }

        // REDIRIGIR AL USUARIO A LA PAGINA DE INICIO DE SESION
        response.sendRedirect("login.jsp");
    }
}
