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
@WebServlet(name = "PasswordReset", urlPatterns = {"/PasswordReset"})
public class PasswordReset extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("Reset Password successfully");

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
            u.setPassword(u.getEmail());
            session.update(u);
            session.getTransaction().commit();
            try (PrintWriter out = response.getWriter()) {
                out.println("Reset Password successfully");

            }

        } catch (HibernateException e) {
            System.out.println("Exception " + e);
            try (PrintWriter out = response.getWriter()) {
                out.println("Reset Password Error");

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
