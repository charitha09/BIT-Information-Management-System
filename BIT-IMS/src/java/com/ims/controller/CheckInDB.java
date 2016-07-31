/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

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
@WebServlet(name = "CheckInDB", urlPatterns = {"/CheckInDB"})
public class CheckInDB extends HttpServlet {

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
            out.println("<title>Servlet CheckInDB</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckInDB at " + request.getContextPath() + "</h1>");
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
        String table = request.getParameter("table");
        String value = request.getParameter("value");
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        
        if (table.equalsIgnoreCase("Applicant")) {
            try (PrintWriter out = response.getWriter()) {

                Session session = sessionFactry.openSession();
                session.beginTransaction();
                try {
                    Query query = session.createQuery("SELECT applicationNum FROM Applicant WHERE applicationNum= '" + value + "'");
                    List userIDS = query.list();
                    session.getTransaction().commit();

                    if (userIDS.size() == 0) {
                        out.write(value + " --> Not in DB");
                    } else {
                        out.write("Ok");
                    }
                } catch (Exception e) {
                    System.out.println("exeption in checkEmailInDb()");
                } finally {
                    session.close();
                }

            }
        }else  if (table.equalsIgnoreCase("Student")) {
            try (PrintWriter out = response.getWriter()) {

                Session session = sessionFactry.openSession();
                session.beginTransaction();
                try {
                    Query query = session.createQuery("SELECT studentId FROM Student WHERE studentId= '" + value + "'");
                    List userIDS = query.list();
                    session.getTransaction().commit();

                    if (userIDS.size() == 0) {
                        out.write(value + " --> Not in DB");
                    } else {
                        out.write("Ok");
                    }
                } catch (Exception e) {
                    System.out.println("exeption in checkEmailInDb()");
                } finally {
                    session.close();
                }

            }
        }
        
        
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
