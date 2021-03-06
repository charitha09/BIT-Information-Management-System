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
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Hp
 */
@WebServlet(name = "UpdateUser", urlPatterns = {"/UpdateUser"})
public class UpdateUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateUser at " + request.getContextPath() + "</h1>");
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
        String uId = request.getParameter("uIdUpdate");
        String name = request.getParameter("uNameUpdate");
        String email = request.getParameter("uEmailUpdate");
        String userLevel = request.getParameter("uLevelUpdate");

        System.out.println(uId + " " + name + " " + email + " " + userLevel);

        if (checkEmailInDb(uId, email)) {
            SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                User u = new User();
                u = (User) session.get(User.class, uId);
                u.setName(name);
                u.setEmail(email);
                u.setUserLevel(userLevel);
                session.update(u);
                session.getTransaction().commit();
                response.sendRedirect("user/admin/user_create_edit.jsp");

            } catch (HibernateException e) {
                System.out.println("Exception " + e);
                tx.rollback();
            } finally {
                session.close();
            }
        } else {
            response.sendRedirect("user/admin/user_create_edit.jsp?err=emailErr");

        }

        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    boolean checkEmailInDb(String uId, String email) {
        
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        User u = new User();
        u = (User) session.get(User.class, uId);
        if (u.getEmail().equals(email)) {

            return true;

        } else {

            try {
                Query query = session.createQuery("SELECT userId FROM User WHERE email= '" + email + "'");
                List userIDS = query.list();

                if (userIDS.size() == 0) {
                    return true;
                }
            } catch (Exception e) {
                System.out.println("exeption in checkEmailInDb()");
            } finally {
                session.close();
            }
            return false;
        }
    }
}
