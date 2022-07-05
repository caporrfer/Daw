<%-- 
    Document   : verArticulos
    Created on : 26-ene-2022, 17:40:49
    Author     : carlo
--%>

<%@page import="java.util.List"%>
<%@page import="com.entities.articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    articulos tempArt = (articulos) request.getAttribute("articuloTemp");
%>
<!DOCTYPE html>
<html>
    <head>
        <link href="${pageContext.request.contextPath}/style.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <div><header>
            <div align="center">
                <h1><strong> Mountain Tu tienda de Escalada </strong></h1>
            </div>
        </header></div>
    <div>
        <div align="center"><img src="/ProyectoFinal/images/tienda.png" alt="tienda" width="550" height="250" /></div>
    </div>
    <div>
        <p><strong>Mountain</strong>, la tienda online de escalada m&aacute;s completa: m&aacute;s de 40.000 productos en cat&aacute;logo. Env&iacute;os gratis a partir de 100&euro; y hasta 100 d&iacute;as para devoluciones. Precios especiales.</p>
    </div>
    <div>
        <nav>
            <a href="/ProyectoFinal/articulos/indexIniciado">Inicio</a> | 
            <a href="/ProyectoFinal/articulos/formularioArticulo">Subir articulo</a> | 
            <a href="/ProyectoFinal/articulos/verMisFavoritos">Mis favoritos</a> |
        </nav>
    </div>
    <div>
        <h2><strong>Detalles acerca del articulo <%out.print(tempArt.getNombre());%></strong></h2><br>
        <div><label>Precio: <%out.print(tempArt.getPrecio());%></label></div><br>

        <div><label>Año de adquisicion: <%out.print(tempArt.getAnio());%></label></div><br>
        <div><label>Categoria: <%out.print(tempArt.getCategoria());%></label></div><br>
        <div><label>Estado: <%out.print(tempArt.getEstado());%></label></div><br>
        <div><label>Propietario: <%out.print(tempArt.getNombrePropietario());%></label></div><br>
        <div><label>Descripcion: <%out.print(tempArt.getDescripcion());%></label></div><br>
    </div>
    <br>
    <div>
    <h2><strong>Comentarios acerca del articulo <%out.print(tempArt.getNombre());%></strong></h2>
        
    <%
    for (int i = 0; i < tempArt.getComentarios().size(); i++) {
          %>
          
          <div>
          <label> <%out.println(tempArt.getComentarios().get(i).getTexto());%> </label><br><br>
          <div>
              <label>Comentario de <%out.print(tempArt.getComentarios().get(i).getNombreU());%></label><br><br>
          </div>
          </div>
        <%}%>
    
    
    
        
    </div>
    
    
    
    <div><br><br><br><br><br><br>
        <form action="/ProyectoFinal/articulos/persistComentario?id=<%out.print(tempArt.getId());%>" method="post">
            <div><label>Introduzca aqui su comentario</label></div><br>
        <textarea id="comentario" name="comentario"></textarea>
        <div>
            <input type="submit" value="Subir Comentario" class="myButton">
        </div>
        </form>

</div>
<div><footer style="width: 100%; margin-left: 0px;"><br><br>
        <div>&copy; Copyright: Carlos Porras Fernandez 2021</div>
    </footer></div>
</html>