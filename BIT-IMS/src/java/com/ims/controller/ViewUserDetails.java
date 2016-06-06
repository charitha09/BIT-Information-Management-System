/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Hp
 */
@WebServlet(name = "ViewUserDetails", urlPatterns = {"/ViewUserDetails"})
public class ViewUserDetails extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ViewUserDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewUserDetails at " + request.getContextPath() +"<br>"+ request.getParameter("userID") + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        String userId = request.getParameter("userID");
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session s = sessionFactry.openSession();
        Query query = s.createQuery("FROM User where userId='"+userId+"'");
        List userList = query.list();
        User u = new User();
        u = (User) userList.get(0);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<h1>"+u.getName()+ "</h1><br><br>");
            out.println("<h1>"+u.getEmail()+ "</h1><br><br>");
            out.println("<h1>"+u.getUserLevel()+ "</h1><br><br>");
            
            out.println("<form method=\"POST\" action=\"../../UpdateUser\">\n" +
"                <input type=\"text\" id=\"uIdUpdate\" name=\"uIdUpdate\" value="+u.getUserId()+"><br><br>\n" +
"                <input type=\"text\" id=\"uNameUpdate\" name=\"uNameUpdate\" value="+u.getName()+"><br><br>\n" +
"                <input type=\"text\" id=\"uEmailUpdate\" name=\"uEmailUpdate\" value="+u.getEmail()+"><br><br>\n" +
"                <input type=\"text\" id=\"uLevelUpdate\" name=\"uLevelUpdate\" value="+u.getUserLevel()+"><br><br>\n" +
"                <input type=\"submit\" value=\"submit\">\n" +
"                <input type=\"button\" value=\"close\"><br><br>\n" +
"            </form>");
        }
        //u=null;
        s.close();
        
       // processRequest(request, response);
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

}
