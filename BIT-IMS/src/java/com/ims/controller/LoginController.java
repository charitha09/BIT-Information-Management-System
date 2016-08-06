/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Student;
import com.ims.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Amila Sankha
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginController at " + request.getContextPath() + "</h1>");
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

        String userName = request.getParameter("userName");
        String password = request.getParameter("pwd");

        System.out.println(userName + " " + password);

        // error feedback message
        String error = "";
        if (userName.equals("") || password.equals("")) {
            // fields are empty
            error += "Empty Fields!";
        } else {
            // checks for a valid user

            System.out.println("servlet " + userName + " " + password);
            String id = validateLogin(userName, password);
            SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            session.beginTransaction();
            try {
                if (id.startsWith("U")) {
                    User user = new User();
                    user = (User) session.get(User.class, id);
                    session.getTransaction().commit();

                    if (user != null) {
                        // get session from the request
                        HttpSession httpSession = request.getSession(true);
                        // set session attributes
                        httpSession.setAttribute("email", user.getEmail());
                        //httpSession.setAttribute("uname", user.getUserName());
                        httpSession.setAttribute("userLevel", user.getUserLevel());
                        httpSession.setAttribute("id", user.getUserId());
                    } else {
                        error += "invalid email or password!";
                    }
                } else if (id.contains("R")) {
                    Student student = new Student();
                    student = (Student) session.get(Student.class, id);
                    session.getTransaction().commit();
                    if (student != null) {
                        // get session from the request
                        HttpSession httpSession = request.getSession(true);
                        // set session attributes
                        httpSession.setAttribute("email", student.getEmail());
                        httpSession.setAttribute("fullName", student.getFullName());
                        httpSession.setAttribute("userLevel", "Student");
                        httpSession.setAttribute("id", student.getRegistrationNum());
                    } else {
                        error += "invalid email or password!";
                    }
                } else if (id == "") {
                    error += "invalid username password";
                }
            } catch (Exception e) {

            } finally {
                session.close();
            }
        }
        if (error.isEmpty()) {

                // a valid user found no error in log in details
            // gets the user type
            String userLevel = (String) request.getSession().getAttribute("userLevel");
            // user is redirected to the appropriate home page
            if (userLevel.equalsIgnoreCase("admin")) {
                response.sendRedirect("user/admin");
            }else if(userLevel.equalsIgnoreCase("Student")){
                response.sendRedirect("user/student");
            }else if (userLevel.equalsIgnoreCase("coordinator")) {
             response.sendRedirect("user/coordinator");
             } 
            /*else if (userLevel.equalsIgnoreCase("academic")) {
             response.sendRedirect("academic/academic-home.jsp");
             } else if (userLevel.equalsIgnoreCase("auditor")) {
             response.sendRedirect("auditor/auditor-home.jsp");
             }*/
        } else {
            // if errors found redirected back to the log in page 
            response.sendRedirect("index.jsp?msg=" + error);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    //Check username passwords match 
    public String validateLogin(String username, String password) {
        String userId = "";

        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        session.beginTransaction();

        try {
            //check user table
            Query query = session.createQuery("SELECT userId FROM User WHERE email= '" + username + "' AND password='" + password + "'AND state=1");
            List userIDS = query.list();

            if (userIDS.size() == 0) {
                //check student table
                Query query2 = session.createQuery("SELECT registrationNum FROM Student WHERE registrationNum= '" + username + "' AND password='" + password + "'AND state=1");
                List studentIDS = query2.list();
                if (studentIDS.size() == 1) {
                    userId = studentIDS.get(0).toString();
                }

            } else if (userIDS.size() == 1) {
                userId = userIDS.get(0).toString();
            }

            System.out.println(userId);
            session.getTransaction().commit();
        } catch (Exception e) {

        } finally {
            session.close();
        }
        return userId;
    }
}
