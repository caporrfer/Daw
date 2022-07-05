<%-- 
    Document   : favoritos
    Created on : 26-ene-2022, 18:22:40
    Author     : carlo
--%>


<%@page import="com.entities.usuarios"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.articulos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
usuarios aux = (usuarios)request.getAttribute("usu");
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
            <a href="/ProyectoFinal/articulos/verArticulos">Articulos</a> |
        </nav>
    </div>
    <div>
        <h2><strong>Articulos Favoritos</strong></h2>
        <br><br>
    </div>
    <div>
        <table class="steelBlueCols" border-bottom: 1px solid #ddd; style="border-collapse: collapse; width: 100%;" border="1">
            <tbody>
                <tr>
                    <td style="width: 16.6667%;">Nombre</td>
                    <td style="width: 16.6667%;">Precio</td>
                    <td style="width: 16.6667%;">Propietario</td>
                    <td style="width: 16.6667%;">Mas detalles</td>
                    
                    
                </tr>
                <% 
                    List<articulos> lista;
                    lista = aux.getArticulosFav();
                    
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
                    <%out.println("<td style='width: 16.6667%;'><a href='/ProyectoFinal/articulos/detalles?id=" +idArt+ "'>Mostrar mas detalles</a> </td>");
                    %>
                    
                     
                </tr>
                
                <% }%>
            </tbody>
        </table>
        <p>&nbsp;</p>
    </div>
            <div><footer style="width: 100%; margin-left: 0px;"><br><br>
            <div>&copy; Copyright: Carlos Porras Fernandez 2021</div>
        </footer></div>
</html>
