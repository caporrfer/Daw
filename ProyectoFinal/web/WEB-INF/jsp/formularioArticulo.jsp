<%-- 
    Document   : formularioArticulo
    Created on : 25-ene-2022, 20:02:23
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
            <a href="/ProyectoFinal/articulos/indexIniciado">Inicio</a> | 
            <a href="/ProyectoFinal/articulos/verArticulos">Articulos</a> |
            <a href="/ProyectoFinal/articulos/verMisFavoritos">Mis favoritos</a> |
        </nav>
        <section>
            <h2>Formulario</h2>
        </section>
        <form action="/ProyectoFinal/articulos/persistArticulo" method="post">
            <ul>
                <br>
                <li>
                    <label>Categoria:</label>
                    <input id = "art_categoria" name="art_categoria">
                </li>
                <br>
                <li>
                    <label>Nombre del articulo</label>
                    <input id = "art_nombre" name="art_nombre">
                </li>
                <br>
                <li>
                    <label>Descripcion</label>
                    <input id="art_descripcion" name="art_descripcion">
                </li>
                <br>
                <li>
                    <label>Estado</label>
                    <select id="art_estado" name="art_estado">
                        <option>Nuevo
                        <option>Seminuevo
                        <option>Viejo
                    </select>
                </li>
                <br>
                <li>
                    <label>Año de Adquisicion</label>
                    <input id="art_anio" name="art_anio" type="number">
                </li>
                <br>
                <li>
                    <label>Precio</label>
                    <input id="art_precio" name="art_precio" type="number">
                </li> 
                <br>

                <div>
                    <label>Imagen</label>
                    <input id="upload" type="file" onChange="handleImageUpload()" />

                </div>

                <br><br>
                <div>
                    <input class="myButton" type="submit" value="Subir Articulo">
                </div>

                </li> 

            </ul>
        </form>

<br><br>
        <footer  style="width:100%; margin-left: 0px;"  >
            <div>
                ©  Copyright: Carlos Porras Fernandez 2021
            </div>
        </footer>
    </body>
</html>
