/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlet;

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
@WebServlet(name = "controladorUsuarios", urlPatterns = {"/usuarios/*"})
public class controladorUsuarios extends HttpServlet {

    static Long id_Usuario;
    static String nombre_Usuario;
    static usuarios objetoUsuario;


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
        String vista;

        TypedQuery<usuarios> query;
        List<usuarios> lu;

        switch (accion) {
            case "/formularioRegistro":
                vista = "/WEB-INF/jsp/formulario.jsp";
                break;
            case "/iniciaSesion":
                vista = "/WEB-INF/jsp/iniciaSesion.jsp";
                break;
            case "/iniciarSesion":
                
                try {
                String correoUsuario, contra;

                correoUsuario = request.getParameter("user_mail");
                contra = request.getParameter("user_pass");

                query = em.createNamedQuery("usuarios.findByCorreo", usuarios.class);
                query.setParameter("correo", correoUsuario);
                lu = query.getResultList();

                if (lu.get(0).getClave().equals(contra)) {
                    request.setAttribute("usu", lu.get(0));
                    objetoUsuario = lu.get(0);
                    id_Usuario = lu.get(0).getId();
                    nombre_Usuario = lu.get(0).getNombre();
                    vista = "/WEB-INF/jsp/indexSesion.jsp";
                } else {
                    vista = "/index.html";
                }
            } catch (Exception e) {
                vista = "/index.html";
            }
            break;
            case "/persistUsuario":

                String correo,
                 clave,
                 nombre,
                 direccion,
                 facebook,
                 twitter;
                Long tlf;
                int cp;

                correo = request.getParameter("user_mail");
                clave = request.getParameter("user_pass");
                nombre = request.getParameter("nombre");
                direccion = request.getParameter("user_direccion");
                cp = Integer.parseInt(request.getParameter("user_cp"));
                facebook = request.getParameter("facebook");
                twitter = request.getParameter("twitter");
                tlf = Long.parseLong(request.getParameter("tlf"));

                usuarios u = new usuarios();
                u.setClave(clave);
                u.setCorreo(correo);
                u.setCp(cp);
                u.setDireccion(direccion);
                u.setFacebook(facebook);
                u.setNombre(nombre);
                u.setTlf(tlf);
                u.setTwitter(twitter);

                persist(u);
                vista = "index.html";
                break;
            default:
                vista = "/index.html";
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

    public Long getUsuarioId() {
        return this.id_Usuario;
    }

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

}
