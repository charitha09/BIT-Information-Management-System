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
 * @author Amila Sankha
 */
@WebServlet(name = "AddUserController", urlPatterns = {"/AddUserController"})
public class AddUserController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddUserController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddUserController at " + request.getContextPath() + "</h1>");
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

        String name = request.getParameter("cr_usr_name");
        String email = request.getParameter("cr_usr_email");
        String userLevel = request.getParameter("cr_usr_role");
        String password = request.getParameter("cr_usr_loginPasswd");

        // error feedback message
        String error = "";
        if (name.equals("") || email.equals("") || userLevel.equals("") || password.equals("")) {
            error += "Empty Fields!";
            // fields are empty
        } else if (!email.contains(".") || !email.contains("@")) {
            error += "invalid email!";
        } else if (!checkEmailInDb(email)) {
            error += "email is exist";
        } else {
            User u = new User();
            u.setName(name);
            u.setEmail(email);
            u.setUserLevel(userLevel);
            u.setPassword(password);

            SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                session.save(u);
                session.getTransaction().commit();
                response.sendRedirect("user/admin/user_create_edit.jsp");

            } catch (HibernateException e) {
                System.out.println("Exception " + e);
                tx.rollback();
                response.sendRedirect("user/admin/user_create_edit.jsp?msg=error");
            } finally {
                session.close();
            }

        }
        
        if(error !=""){
            response.sendRedirect("user/admin/user_create_edit.jsp?msg=" + error);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    boolean checkEmailInDb(String email) {
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        session.beginTransaction();
        try {
            Query query = session.createQuery("SELECT userId FROM User WHERE email= '" + email + "'");
            List userIDS = query.list();
            session.getTransaction().commit();

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
