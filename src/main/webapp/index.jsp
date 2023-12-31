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
    <link rel="stylesheet" type="text/css" href="css/estilos.css">
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

<div id="carouselExampleCaptions" class="carousel slide carousel-fade" data-bs-ride="false">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="./Img/slide1.png" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>EL PLANTEL QUIERE EL TITULO</h5>
                <p>" LA IDEA DEL EQUIPO ES SUMAR DE A 3 PUNTOS Y LLEGAR BIEN AL FINAL DE LA TEMPORADA . ".</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="./Img/slide2.png" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>SE CIERRAN NUEVOS SPONSORS</h5>
                <p>EL CLUB SIGUE CRECIENDO DE LA MANO DE LOS NUEVOS SPONSORS Y VAMOS POR MAS .</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="./Img/slide3.png" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5>EMOCION Y ORGULLO , OTRO TITULO PARA ELLAS</h5>
                <p>UNA VEZ MAS EL EQUIPO FEMENINO LOGRA SU TITULO A COSTA DE MUCHO ESFUERZO DEDICACION Y PURA PASION POR
                    EL
                    FUTBOL.</p>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="tarjetas">
    <div class="row" style="justify-content: center;">
        <div class="col-sm-3">
            <div class="card">
                <div class="card-body card-img1">
                    <h5 class="card-title"><b>Ingresa a tu Cuenta</b></h5>
                    <p class="card-text">Ingresa a tu cuenta y aprovecha todos los beneficios que hay para vos!
                    </p>
                    <a href="login.jsp" class="btn btn-primary card-button gradient-border-hover">Iniciar Sesion</a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card">
                <div class="card-body card-img2">
                    <h5 class="card-title"><b>Hacete Socio</b></h5>
                    <p class="card-text">Disfruta de todos los beneficios y las instalaciones que te ofrece el club.</p>
                    <a href="registro.jsp" class="btn btn-primary card-button gradient-border-hover">Quiero ser
                        Socio</a>
                </div>
            </div>
        </div>
        <div class="col-sm-3">
            <div class="card">
                <div class="card-body card-img3">
                    <h5 class="card-title"><b>Tienda Bohemia</b></h5>
                    <p class="card-text">Las nuevas camisetas titular y alternativa ya estan a la venta en la tienda
                        bohemia.
                    </p>
                    <a href="tienda.jsp" class="btn btn-primary card-button gradient-border-hover">Ver Tienda</a>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="slider">
    <div class="slide-track">
        <div class="slide">
            <img src="./Img/j1.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j2.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j3.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j4.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j5.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j6.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j7.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j8.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j10.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j11.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j12.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j13.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j14.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j15.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j16.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j17.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j18.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j19.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j20.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j21.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j22.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j23.png" alt="">
        </div>
        <div class="slide">
            <img src="./Img/j24.png" alt="">
        </div>
    </div>
</div>


<div class="video-container">
    <video autoplay muted loop id="video-bg">
        <source src="./Img/video.mp4" type="video/mp4">

    </video>
    <div class="content">

        <div class="general">
            <div class="central">
                <div class="tablas">
                    <h2 class="text-white">TABLA DE POSICIONES</h2>
                    <table class="table">
                        <tr class="destacado">
                            <td>Escudo</td>
                            <td>Nombre</td>
                            <td>PG</td>
                            <td>PP</td>
                            <td>PE</td>
                            <td>GF</td>
                            <td>GC</td>
                            <td>POS</td>
                            <td>PTS</td>
                        </tr>

                        <tr>
                            <td>
                                <img height="30" width="70" src="./Img/logo.png" alt=""/>
                            </td>
                            <td>Atlanta</td>
                            <td>20</td>
                            <td>7</td>
                            <td>3</td>
                            <td>58</td>
                            <td>25</td>
                            <td>1</td>
                            <td>69</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_40t5qm271m6s8i8r6hdlqdzv5.png"
                                        alt="">
                            </td>
                            <td>Estudiantes De Rio Cuarto</td>
                            <td>15</td>
                            <td>6</td>
                            <td>6</td>
                            <td>48</td>
                            <td>29</td>
                            <td>2</td>
                            <td>51</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_39yl9nw2nhhulyjssa497c758.png"
                                        alt=""/>
                            </td>
                            <td>San Martin Tucuman</td>
                            <td>15</td>
                            <td>10</td>
                            <td>5</td>
                            <td>42</td>
                            <td>33</td>
                            <td>3</td>
                            <td>50</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_2lhnnnznvg2eqxnsxjw5zk9m7.png"
                                        alt="">
                            </td>
                            <td>Estudiantes De Caceros</td>
                            <td>11</td>
                            <td>9</td>
                            <td>7</td>
                            <td>36</td>
                            <td>28</td>
                            <td>4</td>
                            <td>40</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_9vph9w7uflam4cks28dfp98h4.png"
                                        alt="">
                            </td>
                            <td>Gimnasia Mendoza</td>
                            <td>11</td>
                            <td>2</td>
                            <td>3</td>
                            <td>36</td>
                            <td>18</td>
                            <td>5</td>
                            <td>36</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_3xz3k7mpw3ttsnb0odu0kfepx.png"
                                        alt="">
                            </td>
                            <td>All Boys</td>
                            <td>10</td>
                            <td>2</td>
                            <td>5</td>
                            <td>31</td>
                            <td>22</td>
                            <td>6</td>
                            <td>35</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_693gcfr20m03571ihcw6vy2i1.png"
                                        alt="">
                            </td>
                            <td>Chaco For Ever</td>
                            <td>9</td>
                            <td>7</td>
                            <td>6</td>
                            <td>29</td>
                            <td>28</td>
                            <td>7</td>
                            <td>33</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_8inprqnxjps9ckiamn3cfoo8v.png"
                                        alt="">
                            </td>
                            <td>Independiente Rivadavia</td>
                            <td>8</td>
                            <td>7</td>
                            <td>6</td>
                            <td>35</td>
                            <td>28</td>
                            <td>8</td>
                            <td>30</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_6jrn904p94yfyn6s5b6ij0jw8.png"
                                        alt="">
                            </td>
                            <td>Defensores De Belgrano</td>
                            <td>8</td>
                            <td>8</td>
                            <td>6</td>
                            <td>34</td>
                            <td>30</td>
                            <td>9</td>
                            <td>30</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_bppyw6lsfd4nwshsk2oprxlmy.png"
                                        alt="">
                            </td>
                            <td>Almagro</td>
                            <td>8</td>
                            <td>14</td>
                            <td>6</td>
                            <td>27</td>
                            <td>38</td>
                            <td>10</td>
                            <td>30</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_c4f6hp1oyal1ispkv638ipumk.png"
                                        alt="">
                            </td>
                            <td>San Martin San Juan</td>
                            <td>7</td>
                            <td>16</td>
                            <td>5</td>
                            <td>22</td>
                            <td>48</td>
                            <td>11</td>
                            <td>26</td>
                        </tr>

                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_7gcwwr8m5docs6jqrn2stilie.png"
                                        alt="">
                            </td>
                            <td>Deportivo Riestra</td>
                            <td>6</td>
                            <td>17</td>
                            <td>5</td>
                            <td>21</td>
                            <td>43</td>
                            <td>12</td>
                            <td>23</td>
                        </tr>
                        <tr>
                            <td>
                                <img
                                        src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_7gcwwr8m5docs6jqrn2stilie.png"
                                        alt="">
                            </td>
                            <td>Deportivo Riestra</td>
                            <td>6</td>
                            <td>17</td>
                            <td>5</td>
                            <td>21</td>
                            <td>43</td>
                            <td>12</td>
                            <td>23</td>
                        </tr>

                    </table>
                </div>
            </div>

            <div class="central">
                <div class="container-hs">

                    <h2 id="headline">PRÓXIMO PARTIDO</h2>
                    <div class="countdown">
                        <div>
                            <span>DIAS</span>
                            <span id="days">1</span>
                        </div>
                        <div>
                            <span>HS</span>
                            <span id="hours">05</span>
                        </div>
                        <div>
                            <span>MIN</span>
                            <span id="minutes">43</span>
                        </div>
                        <div>
                            <span>SEG</span>
                            <span id="seconds">28</span>
                        </div>
                    </div>
                    <div class="row next-match">
                        <div class="col-lg-5 col-md-6 col-sm-12 team">
                            <img src="./Img/prox.png" alt="logo de Club Atlético Atlanta">
                            <p class="mb-0">ATLANTA<i class="fa-solid fa-house"></i></p>
                        </div>
                        <div class="col-lg-2 col-md-2 col-12 text-center vs">VS</div>
                        <div class="col-lg-5 col-md-4 col-12 team">
                            <img src="./Img/chaca(1).png" alt="logo de Chacarita Juniors">
                            <p class="mb-0">CHACARITA JRS<i class="fa-solid fa-bus"></i></p>
                        </div>
                    </div>
                </div>


                <div class="tablas">
                    <h2 class="text-white">PRÓXIMOS PARTIDOS</h2>
                    <table class="table">
                        <tr class="destacado">
                            <td>Equipo Local</td>
                            <td>VS</td>
                            <td>Equipo Visitante</td>
                            <td>Fecha</td>
                        </tr>
                        <tr>
                            <td><img
                                    src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_39yl9nw2nhhulyjssa497c758.png"
                                    alt=""/></td>
                            <td>VS</td>
                            <td><img height="30" width="70" src="./Img/logo.png" alt=""/></td>
                            <td>01/10/2023</td>
                        </tr>
                        <tr>
                            <td><img height="30" width="70" src="./Img/logo.png" alt=""/></td>
                            <td>VS</td>
                            <td><img
                                    src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_7gcwwr8m5docs6jqrn2stilie.png"
                                    alt=""></td>
                            <td>08/10/2023</td>
                        </tr>
                        <tr>
                            <td><img height="30" width="70" src="./Img/logo.png" alt=""/></td>
                            <td>VS</td>
                            <td><img
                                    src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_40t5qm271m6s8i8r6hdlqdzv5.png"
                                    alt=""></td>
                            <td>15/10/2023</td>
                        </tr>
                        <tr>
                            <td><img
                                    src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_3xz3k7mpw3ttsnb0odu0kfepx.png"
                                    alt=""></td>
                            <td>VS</td>
                            <td><img height="30" width="70" src="./Img/logo.png" alt=""/></td>
                            <td>22/10/2023</td>
                        </tr>
                        <tr>
                            <td><img height="30" width="70" src="./Img/logo.png" alt=""/></td>
                            <td>VS</td>
                            <td><img height="25" width="25"
                                     src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_2zjoq67ogz8lmaoesxkubxhp6.png"
                                     alt=""/></td>
                            <td>29/10/2023</td>
                        </tr>
                        <tr>
                            <td><img
                                    src="https://secure.cache.images.core.optasports.com/soccer/teams/30x30/uuid_bppyw6lsfd4nwshsk2oprxlmy.png"
                                    alt=""></td>
                            <td>VS</td>
                            <td><img height="30" width="70" src="./Img/logo.png" alt=""/></td>
                            <td>02/10/2023</td>
                        </tr>
                    </table>
                </div>

            </div>
        </div>
        <div class="slider2">
            <div class="slide-track">
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
                <div class="slide">
                    <img src="./Img/banner marcas.png" class="sponsors-img" alt="">
                </div>
            </div>
        </div>
    </div>
    <footer class="container-fluid bg-dark py-4">
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
                <hr>
            </div>
            <p class="copyright" style="text-align: center; font-size: 12px;">Todos los derechos reservados © Juan Cruz
                Roovers 2023</p>
    </footer>
</div>

<script>(function () {
    const second = 1000,
        minute = second * 60,
        hour = minute * 60,
        day = hour * 24;


    let today = new Date(),
        dd = String(today.getDate()).padStart(2, "0"),
        mm = String(today.getMonth() + 1).padStart(2, "0"),
        yyyy = today.getFullYear(),
        nextYear = yyyy + 1,
        dayMonth = "09/30/",
        birthday = dayMonth + yyyy;

    today = mm + "/" + dd + "/" + yyyy;
    if (today > birthday) {
        birthday = dayMonth + nextYear;
    }
    const countDown = new Date(birthday).getTime(),
        x = setInterval(function () {

            const now = new Date().getTime(),
                distance = countDown - now;

            document.getElementById("days").innerText = Math.floor(distance / (day)),
                document.getElementById("hours").innerText = Math.floor((distance % (day)) / (hour)),
                document.getElementById("minutes").innerText = Math.floor((distance % (hour)) / (minute)),
                document.getElementById("seconds").innerText = Math.floor((distance % (minute)) / second);

            //do something later when date is reached
            if (distance < 0) {
                document.getElementById("headline").innerText = "It's my birthday!";
                document.getElementById("countdown").style.display = "none";
                document.getElementById("content").style.display = "block";
                clearInterval(x);
            }
            //seconds
        }, 0)
}());</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>

</html>