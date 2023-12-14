package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Usuario;
import servicio.ServicioUsuario;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private ServicioUsuario servicioUsuario;

    @Override
    public void init() throws ServletException {
        servicioUsuario = new ServicioUsuario();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String dni = request.getParameter("dni");
            String password = request.getParameter("password");

            if (dni == null || dni.isEmpty() || password == null || password.isEmpty()) {
                response.sendRedirect("login_error.jsp?error=empty");
                return;
            }

            boolean autenticado = servicioUsuario.iniciarSesion(dni, password);

            if (autenticado) {
                // CREO UNA COOKIE CON EL DNI DEL USUARIO
                Cookie dniCookie = new Cookie("dni", dni);
                // LE DOY TIEMPO DE VIDA A LA COOKIE (EN ESTE CASO, 1 DIA)
                dniCookie.setMaxAge(24 * 60 * 60);
                // AGREGO LA COOKIE A LA RESPONSE
                response.addCookie(dniCookie);

                HttpSession session = request.getSession(true);
                session.setAttribute("dni", dni);

                Usuario usuario = servicioUsuario.obtenerUsuarioPorDNI(dni);
                session.setAttribute("nombreUsuario", usuario.getNombre());
                session.setAttribute("apellidoUsuario", usuario.getApellido());

                response.sendRedirect("plantillaUsuario.jsp");
            } else {
                response.sendRedirect("login_error.jsp?error=invalid");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login_error.jsp?error=exception");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // VERIFICO LA COOKIE DE INICIO
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("dni")) {
                    // SI EL USUARIO ESTA AUTENTICADO LO REDIRIJO AL JSP
                    response.sendRedirect("plantillaUsuario.jsp");
                    return;
                }
            }
        }

        // SI NO VALIDA COOKIE LO REDIRIJO AL LOGIN
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}