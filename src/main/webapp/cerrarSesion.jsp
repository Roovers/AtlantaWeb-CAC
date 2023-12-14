<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="jakarta.servlet.ServletException" %>

<%
    // Obtengo la sesión actual
    HttpSession currentSession = request.getSession(false);

    // Invalido la sesión si existe
    if (currentSession != null) {
        currentSession.invalidate();
    }

    // Redirijo a la página de inicio
    response.sendRedirect("index.jsp");
%>



