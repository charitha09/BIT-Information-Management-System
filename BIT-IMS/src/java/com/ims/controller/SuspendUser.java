/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Hp
 */
@WebServlet(name = "SuspendUser", urlPatterns = {"/SuspendUser"})
public class SuspendUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SuspendUser</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SuspendUser at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String userId = request.getParameter("userID");
         
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            User u = new User();
            u = (User) session.get(User.class, userId);
            u.setState(0);
            session.update(u);
            session.getTransaction().commit();
            try (PrintWriter out = response.getWriter()) {
                out.println("Susspend user successfully");

            }

        } catch (HibernateException e) {
            System.out.println("Exception " + e);
            try (PrintWriter out = response.getWriter()) {
                out.println("Error in susspend user");

            }

            tx.rollback();
        } finally {
            session.close();
            //response.sendRedirect("usr/admin/user_create_edit.jsp?msg=err");
        }

       
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
