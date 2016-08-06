/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
import com.ims.model.Payment;
import com.ims.model.Student;
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
 * @author Amila Sankha
 */
@WebServlet(name = "SearchStudent", urlPatterns = {"/SearchStudent"})
public class SearchStudent extends HttpServlet {

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
            out.println("<title>Servlet SearchStudent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchStudent at " + request.getContextPath() + "</h1>");
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

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String method = request.getParameter("method");
        String input = request.getParameter("input");
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();

        if (method.equalsIgnoreCase("byregistrationNum")) {  //search Student details using Registration Num
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByRegistrationNum = session1.createQuery("from Student WHERE registrationNum='" + input + "'");
                List searchRegistrationNumStudentList = querySearchByRegistrationNum.list();

                if (searchRegistrationNumStudentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Registration Number</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Year</th>\n"
                            + "                                    <th>Nic</th>\n"
                            + "                                    <th>Address</th>\n"
                            + "                                    <th>Email</th>\n"
                            + "                                    <th>contact Num</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchRegistrationNumStudentList.size(); i++) {

                        Student student = new Student();

                        student = (Student) searchRegistrationNumStudentList.get(i);
                        
                        out.write("<tr>");
                        out.write("<td>" + student.getRegistrationNum() + "</td>");
                        out.write("<td>" + student.getFullName() + "</td>");
                        out.write("<td>" + student.getCurrentYear() + "<td>");
                        out.write("<td>" + student.getNicNo() + " </td>");
                        out.write("<td>" + student.getAddress() + " </td>");
                        out.write("<td>" + student.getEmail()+ " </td>");
                        out.write("<td>" + student.getTelephoneNum()+ " </td>");
                        

                        out.write("</tr>");

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
                //////////////////////////////////////////////////////////////////////////////
            }
        }else if (method.equalsIgnoreCase("byYear")) {  //search Student details according to year
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByRegistrationNum = session1.createQuery("from Student WHERE currentYear='" + input + "'order by registrationNum");
                List searchRegistrationNumStudentList = querySearchByRegistrationNum.list();

                if (searchRegistrationNumStudentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Registration Number</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Year</th>\n"
                            + "                                    <th>Nic</th>\n"
                            + "                                    <th>Address</th>\n"
                            + "                                    <th>Email</th>\n"
                            + "                                    <th>contact Num</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchRegistrationNumStudentList.size(); i++) {

                        Student student = new Student();

                        student = (Student) searchRegistrationNumStudentList.get(i);
                        
                        out.write("<tr>");
                        out.write("<td>" + student.getRegistrationNum() + "</td>");
                        out.write("<td>" + student.getFullName() + "</td>");
                        out.write("<td>" + student.getCurrentYear() + "<td>");
                        out.write("<td>" + student.getNicNo() + " </td>");
                        out.write("<td>" + student.getAddress() + " </td>");
                        out.write("<td>" + student.getEmail()+ " </td>");
                        out.write("<td>" + student.getTelephoneNum()+ " </td>");
                        

                        out.write("</tr>");

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
                //////////////////////////////////////////////////////////////////////////////
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
