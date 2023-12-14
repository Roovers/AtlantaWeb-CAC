<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>INICIO</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
          integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" type="text/css" href="css/registro-erroneo.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<body>

<div class="header">
    <nav class="navbar navbar-expand-lg navbar-secondary">
        <div class="container-fluid">
            <a class="navbar-brand text-black" href="#"><img src="./Img/logo.png" alt="Logo de el club atlanta"
                                                             width="150px" height="70px"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="index.jsp">INICIO</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="noticias.jsp">NOTICIAS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="entradas.jsp">ENTRADAS</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="institucional.jsp">INSTITUCIONAL</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <%-- Verificar si hay una sesión activa --%>
                    <% if (session.getAttribute("dni") != null) { %>
                    <li class="nav-item">
                            <span class="nav-link" style="
                                    font-family: 'Quicksand', sans-serif;
                                    display: block;
                                    letter-spacing: 5px;
                                    font-size: 0.8em;
                                    text-decoration: none;
                                    padding: 10px 20px;
                                    color: rgb(255,187,0);
                                    ">Usuario :
                                <%= session.getAttribute("nombreUsuario") %> <%= session.getAttribute("apellidoUsuario") %>
                            </span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-item" style="
                                    font-family: 'Quicksand', sans-serif;
                                    display: block;
                                    letter-spacing: 5px;
                                    font-size: 0.8em;
                                    text-decoration: none;
                                    padding: 10px 20px;
                                    color: rgb(255,187,0);
                                    " href="cerrarSesion.jsp">Cerrar Sesión</a>
                    </li>
                    <% } else { %>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="login.jsp">Iniciar Sesión</a>
                    </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
</div>


<div class="container" id="error">
    <h1>UPS! VERIFICA BIEN TUS DATOS</h1>

    <div class="form-links">
        <a href="index.jsp">
            <i class="fas fa-home"></i> Página Principal
        </a>
        <a href="login.jsp">
            <i class="fas fa-sign-in-alt"></i> Iniciar Sesión
        </a>
    </div>
</div>


<footer class="container-fluid bg-dark py-4 fixed-bottom">
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h4>Información de Contacto</h4>
                <p>Humboldt 540 - Ciudad de Buenos Aires - Pcia de Bs As.</p>
                <p>Tel.(54-11)4856-5999.</p>
                <p>Sede Social "Ezequiel Kristal."</p>
            </div>

            <div class="col-md-4">
                <iframe class="map-frame" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3284.
        4060446348776!2d-58.44908378433159!3d-34.593892580462!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.
        1!3m3!1m2!1s0x4aaa2050037d7f%3A0xe875c1520516320d!2sClub%20Atl%C3%A9tico%20Atlanta!5e0!3m2!1ses-
        419!2sar!4v1663208888576!5m2!1ses-419!2sar" width="350" height="250" style="border:0;" allowfullscreen=""
                        loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>

            <div class="col-md-4" style="text-align: center;">
                <a href="#" class="social-icon social-icon-hover"><i class="fab fa-facebook-f fa-3x"></i></a>
                <a href="#" class="social-icon social-icon-hover"><i class="fab fa-twitter fa-3x"></i></a>
                <a href="#" class="social-icon social-icon-hover"><i class="fab fa-instagram fa-3x"></i></a>
                <a href="#" class="social-icon social-icon-hover"><i class="fab fa-tiktok fa-3x"></i></a>
                <hr style="margin-bottom: 5px;">
                <div style="text-align: center;">
                    <img src="./Img/iso-star.png" width="90px" height="90px" alt="">
                </div>
            </div>
        </div>

        <p class="copyright" style="text-align: center; font-size: 12px;">Todos los derechos reservados © Juan Cruz
            Roovers 2023</p>
    </div>
</footer>


<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>

