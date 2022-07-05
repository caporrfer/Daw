<%-- 
    Document   : indexSesion
    Created on : 25-ene-2022, 18:16:35
    Author     : carlo
--%>

<%@page import="com.entities.usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
usuarios u = (usuarios)request.getAttribute("usu");
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Mountain Tu tienda de Escalada</title>
        <link href="${pageContext.request.contextPath}/style.css" rel="stylesheet" type="text/css"/>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
            <div>
                <H1>
                    <b>
                        Mountain Tu tienda de Escalada
                    </b>
                </H1>
            </div>

        </header>
        <div align="center"><img src="/ProyectoFinal/images/tienda.png" width="550" height="250" alt="tienda"></div>

        <p>
            
            Bienvenido <%
            String nombre = u.getNombre();
            out.print(nombre);
            %>
            has iniciado sesion correctamente.
        </p>
        <div>
        <nav>
            <a href="/ProyectoFinal/articulos/verArticulos">Articulos</a> |
            <a href="/ProyectoFinal/articulos/formularioArticulo">Subir articulo</a> |
            <a href="/ProyectoFinal/articulos/verMisFavoritos">Mis favoritos</a> |
            <a href="/ProyectoFinal/index.html">Cerrar Sesion</a>
        </nav>
        </div>
   
<br><br>
        <footer  style="width:100%; margin-left: 0px;"  >
            <div>
                ©  Copyright: Carlos Porras Fernandez 2021
            </div>
        </footer>
    </body>
</html>
