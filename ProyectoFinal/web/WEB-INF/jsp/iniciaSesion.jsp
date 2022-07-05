<%-- 
    Document   : iniciaSesion
    Created on : 25-ene-2022, 17:56:20
    Author     : carlo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <title>Mountain Tu tienda de Escalada</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${pageContext.request.contextPath}/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <header>
            <div align="center">
                <H1>
                    <b>
                        Mountain Tu tienda de Escalada
                    </b>
                </H1>
            </div>

        </header>
        <div align="center"><img src="/ProyectoFinal/images/tienda.png" width="550" height="250" alt="tienda"></div>

        <p>
            <b>Mountain</b>, la tienda online de escalada más completa: más de 40.000 productos en catálogo. Envíos gratis a partir de 100€ y hasta 100 días para devoluciones. Precios especiales.
        </p>

        <nav>
            <a href="${pageContext.request.contextPath}/index.html">Volver</a>
        </nav>
        <section>
            <h2>Inicia sesion</h2>
        </section>
        <form action="/ProyectoFinal/usuarios/iniciarSesion" method="post">
            <ul>
                <br>
                <li>
                    <label>Correo electrónico:</label>
                    <input id = "user_mail" name="user_mail">
                </li>
                <br>
                <li>
                    <label>Password</label>
                    <input id = "user_pass" name="user_pass" type="password">
                </li>
                <br>
                <div>
                    <input type="submit" value="Inicia Sesion" class="myButton">
                </div>

                </li> 

            </ul>
            <br><br>
        </form>

        <footer  style="width:100%; margin-left: 0px;"  >
            <div>
                ©  Copyright: Carlos Porras Fernandez 2021
            </div>
        </footer>
    </body>
</html>
