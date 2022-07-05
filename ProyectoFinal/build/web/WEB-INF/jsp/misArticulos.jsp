<%-- 
    Document   : verArticulos
    Created on : 26-ene-2022, 17:40:49
    Author     : carlo
--%>

<%@page import="java.util.List"%>
<%@page import="com.entities.articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <h2><strong>Articulos</strong></h2>
    </div>
    <div>
         <form action="/ProyectoFinal/articulos/filtro" method="post">
            <ul>
                <br>
                <li>
                    <label>Categoria:</label>
                    <input id = "filtrar_categoria" name="filtrar_categoria">
                </li>
                <br>
                <li>
                    <label>Precio Minimo</label>
                    <input id = "filtrar_preciomin" name="filtrar_preciomin">
                </li>
                <br>
                <li>
                    <label>Precio Maximo</label>
                    <input id = "filtrar_preciomax" name="filtrar_preciomax">
                </li>
                <br>
                <br>
                <div>
                    <input type="submit" value="Filtra" class="myButton">
                </div>
            </ul>
        </form>
        
        <br><br>
            
        <table class="steelBlueCols" border-bottom: 1px solid #ddd; style="border-collapse: collapse; width: 100%;" border="3">
            <tbody>
                <tr>
                    <td style="width: 16.6667%;">Nombre</td>
                    <td style="width: 16.6667%;">Precio</td>
                    <td style="width: 16.6667%;">Propietario</td>
                    <td style="width: 16.6667%;">Mas detalles</td>
                    <td style="width: 16.6667%;">Añadir a favoritos</td>
                    
                </tr>
                <% 
                    List<articulos> lista;
                    lista = (List<articulos>)request.getAttribute("listaArticulos");
                    
                    for (int i = 0; i < lista.size(); i++) {
                            
                        
                String nombre = lista.get(i).getNombre();
                int precio = lista.get(i).getPrecio();
                String nombrePropietario = lista.get(i).getNombrePropietario();
               
                Long idArt = lista.get(i).getId();
                
                %>
                <tr>
                    <td style="width: 16.6667%;"><%out.print(nombre);%></td>
                    <td style="width: 16.6667%;"><%out.print(precio);%></td>
                    <td style="width: 16.6667%;"><%out.print(nombrePropietario);%></td>
                    <%
                    out.println("<td style='width: 16.6667%;'><a href='/ProyectoFinal/articulos/detalles?id=" +idArt+ "'>Mostrar mas detalles</a> </td>");
                    out.println("<td style='width: 16.6667%;'><a href='/ProyectoFinal/articulos/misFavoritos?id=" +idArt+ "'>Añadir a mis articulos</a> </td>");
                    
                    %>
                     
                </tr>
                
                <% }%>
            </tbody>
        </table>
        <p>&nbsp;</p>
        <br><br>
    </div>
    <div><footer style="width: 100%; margin-left: 0px;">
            <div>&copy; Copyright: Carlos Porras Fernandez 2021</div>
        </footer></div>
</html>
