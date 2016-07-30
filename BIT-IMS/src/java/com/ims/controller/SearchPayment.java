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
@WebServlet(name = "SearchPayment", urlPatterns = {"/SearchPayment"})
public class SearchPayment extends HttpServlet {

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
            out.println("<title>Servlet SearchPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchPayment at " + request.getContextPath() + "</h1>");
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
        String method = request.getParameter("method");
        String input = request.getParameter("input");
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();

        if (method.equalsIgnoreCase("byID")) {
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByID = session1.createQuery("from Payment WHERE paymentID='" + input + "' order by EnteredTimeStamp desc");
                List searchByIDPaymentList = querySearchByID.list();

                if (searchByIDPaymentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n" +
"                            <thead>\n" +
"                                <tr>\n" +
"                                    <th>Payment</th>\n" +
"                                    <th>ID</th>\n" +
"                                    <th>Name</th>\n" +
"                                    <th>Payment Type</th>\n" +
"                                    <th>Amount</th>\n" +
"                                    <th>Date</th>\n" +
"                                    <th>Bank</th>\n" +
"                                    <th>Other</th>\n" +
"                                </tr>\n" +
"                            </thead>\n" +
"                            <tbody>");
                    for (int i = 0; i < searchByIDPaymentList.size(); i++) {
                        Payment payment = new Payment();
                        Applicant applicant = new Applicant();
                        Student student = new Student();

                        payment = (Payment) searchByIDPaymentList.get(i);

                        if (payment.getApplicationNumOrStudentID().contains("_A_")) {
                            applicant = (Applicant) session1.get(Applicant.class, payment.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment.getPaymentID() + "</td>");
                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + applicant.getFullName() + "<td>");
                            out.write("<td>" + payment.getPaymentType() + " </td>");
                            out.write("<td>" + payment.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment.getPaymentDate() + " </td>");
                            out.write("<td>" + payment.getExamID() + " </td>");
                            out.write("<td>" + payment.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        } else if (payment.getApplicationNumOrStudentID().contains("_S_")) {
                            student = (Student) session1.get(Student.class, payment.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment.getPaymentID() + "</td>");
                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + student.getFullName() + "<td>");
                            out.write("<td>" + payment.getPaymentType() + " </td>");
                            out.write("<td>" + payment.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment.getPaymentDate() + " </td>");
                            out.write("<td>" + payment.getExamID() + " </td>");
                            out.write("<td>" + payment.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        } else {
                            out.write("<tr>");
                            out.write("<td>" + payment.getPaymentID() + "</td>");
                            out.write("<td>" + payment.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + "<td>");
                            out.write("<td>" + payment.getPaymentType() + " </td>");
                            out.write("<td>" + payment.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment.getPaymentDate() + " </td>");
                            out.write("<td>" + payment.getExamID() + " </td>");
                            out.write("<td>" + payment.getPaymentBank() + " </td>");
                            out.write("</tr>");

                        }

                    }
                    out.write(" </tbody>\n" +
"                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
                //////////////////////////////////////////////////////////////////////////////
            }
        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            out.println("<h1>" + method + "..." + input + "</h1><br><br>");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
