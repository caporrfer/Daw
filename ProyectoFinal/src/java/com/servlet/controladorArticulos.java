/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

import com.entities.articulos;
import com.entities.comentarios;
import com.entities.usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author carlo
 */
@WebServlet(name = "controladorArticulos", urlPatterns = {"/articulos/*"})
public class controladorArticulos extends HttpServlet {

    usuarios Usu;
    Long idUsu;
    String nombreUsu;

    @PersistenceContext(unitName = "ProyectoFinalPU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion;
        accion = request.getPathInfo();
        String vista = null;

        TypedQuery<articulos> query;
        List<articulos> la;

        switch (accion) {
            case "/indexIniciado":
                 this.Usu = controladorUsuarios.objetoUsuario;
                request.setAttribute("usu", Usu);
                
                vista = "/WEB-INF/jsp/indexSesion.jsp";
                break;
            case "/formularioArticulo":
                vista = "/WEB-INF/jsp/formularioArticulo.jsp";
                break;

            case "/verArticulos":

                query = em.createNamedQuery("articulos.getAll", articulos.class);
                la = query.getResultList();

                request.setAttribute("listaArticulos", la);

                vista = "/WEB-INF/jsp/misArticulos.jsp";

                break;
            case "/misFavoritos":

                try {
                Long idArt3 = Long.parseLong(request.getParameter("id"));
                articulos articuloFav = em.find(articulos.class, idArt3);

                this.Usu = controladorUsuarios.objetoUsuario;

                Usu.anadeArticulo(articuloFav);

                request.setAttribute("usu", Usu);
                vista = "/WEB-INF/jsp/favoritos.jsp";
            } catch (Exception e) {
                
                 this.Usu = controladorUsuarios.objetoUsuario;
                request.setAttribute("usu", Usu);
                
                vista = "/WEB-INF/jsp/indexSesion.jsp";
            }
            break;

            case "/verMisFavoritos":
                this.Usu = controladorUsuarios.objetoUsuario;
                request.setAttribute("usu", Usu);
                vista = "/WEB-INF/jsp/favoritos.jsp";
                break;
            case "/persistComentario":
                comentarios c = new comentarios();

                Long idArt2 = Long.parseLong(request.getParameter("id"));

                articulos temp2 = em.find(articulos.class, idArt2);

                this.nombreUsu = controladorUsuarios.nombre_Usuario;

                c.setTexto(request.getParameter("comentario"));
                c.setNombreU(nombreUsu);

                temp2.anadeComentario(c);
                merge(temp2);

                request.setAttribute("articuloTemp", temp2);
                vista = "/WEB-INF/jsp/comentarios.jsp";
                break;
            case "/detalles":
                Long idArt = Long.parseLong(request.getParameter("id"));

                articulos temp = em.find(articulos.class, idArt);

                request.setAttribute("articuloTemp", temp);
                vista = "/WEB-INF/jsp/comentarios.jsp";
                break;

            case "/filtro":
                String where = null;
                boolean bn = false,
                 bn1 = false,
                 bn2 = false;
                String n = request.getParameter("filtrar_categoria");
                String n1 = request.getParameter("filtrar_preciomin");
                String n2 = request.getParameter("filtrar_preciomax");

                if (!"".equals(n)) {
                    where = "WHERE a.categoria LIKE '" + n + "%'";
                    bn = true;
                }
                if (!"".equals(n1)) {
                    if (bn) {
                        where += " AND a.precio > " + n1;
                    } else {
                        where = "WHERE a.precio > " + n1;
                    }
                    bn1 = true;
                }
                if (!"".equals(n2)) {
                    if (bn || bn1) {
                        where += " AND a.precio < " + n2;
                    } else {
                        where = "WHERE a.precio < " + n2;
                    }
                    bn2 = true;
                }

                TypedQuery<articulos> q1 = em.createQuery("SELECT a FROM articulos a " + (where != null ? where : ""), articulos.class);

                List<articulos> la2 = (List<articulos>) q1.getResultList();
                request.setAttribute("listaArticulos", la2);

                vista = "/WEB-INF/jsp/misArticulos.jsp";
                break;

            case "/persistArticulo":

                String categoria,
                 nombre,
                 descripcion,
                 estado;

                int precio,
                 anio;

                categoria = request.getParameter("art_categoria");
                nombre = request.getParameter("art_nombre");
                descripcion = request.getParameter("art_descripcion");
                estado = request.getParameter("art_estado");
                anio = Integer.parseInt(request.getParameter("art_anio"));
                precio = Integer.parseInt(request.getParameter("art_precio"));

                articulos a = new articulos();
                a.setAnio(anio);
                a.setCategoria(categoria);
                a.setDescripcion(descripcion);
                a.setEstado(estado);
                a.setNombre(nombre);
                a.setPrecio(precio);

                this.idUsu = controladorUsuarios.id_Usuario;
                this.nombreUsu = controladorUsuarios.nombre_Usuario;
                this.Usu = controladorUsuarios.objetoUsuario;

                a.setIdUsuario(idUsu);
                a.setNombrePropietario(nombreUsu);
                request.setAttribute("usu",Usu);

                persist(a);
                vista = "/WEB-INF/jsp/indexSesion.jsp";
                break;

            default:
                vista = "index.html";
                break;

        }

        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

    public void merge(Object object) {
        try {
            utx.begin();
            em.merge(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

}
