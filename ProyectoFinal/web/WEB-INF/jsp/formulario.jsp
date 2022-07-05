<%-- 
    Document   : formulario
    Created on : 25-ene-2022, 17:17:01
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
            <a href="index.html">Volver</a>
        </nav>
        <section>
            <h2>Formulario</h2>
        </section>
        <form action="/ProyectoFinal/usuarios/persistUsuario" method="post">
            <ul>
                <br><br>
                <li>
                    <label>Correo electrónico:</label>
                    <input id = "user_mail" name="user_mail" required="required" type="email">
                </li>
                <br>
                <li>
                    <label>Password</label>
                    <input id = "user_pass" name="user_pass" type="password" required="required">
                </li>
                <br>
                <li>
                    <label>Repetir Contraseña</label>
                <input id = "user_pass2" name="user_pass2" type="password" required="required" onchange="validarContrasena();"> <spam id="spam"></spam>
                </li>
                <br>
                <li>
                    <label>Nombre</label>
                    <input id="nombre" name="nombre" required="required">
                </li>
                <br>
                <li>
                    <label>Direccion</label>
                    <input id="user_direccion" name="user_direccion">
                </li>
                <br>
                <li>
                    <label>Codigo Postal</label>
                    <input id="user_cp" name="user_cp" required="required" type="number">
                </li>
                <br>
                <li>
                    <label>Facebook</label>
                    <input id="facebook" name="facebook" type="url">
                </li> 
                <br>
                <li>
                    <label>Twitter</label>
                    <input id="twitter" name="twitter" type="url">
                </li>  
                <br>
                <li>
                    <label>Telefono de contacto</label>
                    <input id="tlf" name="tlf" required="required" type="number">
                </li>    
                <br>

                <div>
                    <input type="submit" value="Registrar" class="myButton">
                </div>

                </li> 

            </ul>
        </form>

        <footer  style="width:100%; margin-left: 0px;"  >
            <div><br><br>
                ©  Copyright: Carlos Porras Fernandez 2021
            </div>
        </footer>
        <script src="${pageContext.request.contextPath}/funciones.js" type="text/javascript"></script>
    </body>
</html>
