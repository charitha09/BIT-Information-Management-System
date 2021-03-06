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

        if (method.equalsIgnoreCase("byID")) {  //search payment details using payment ID
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByID = session1.createQuery("from Payment WHERE paymentID='" + input + "' order by EnteredTimeStamp desc");
                List searchByIDPaymentList = querySearchByID.list();

                if (searchByIDPaymentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Payment</th>\n"
                            + "                                    <th>ID</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Payment Type</th>\n"
                            + "                                    <th>Amount</th>\n"
                            + "                                    <th>Date</th>\n"
                            + "                                    <th>Bank</th>\n"
                            + "                                    <th>Other</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
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
                        } else if (payment.getApplicationNumOrStudentID().contains("_R_")) {
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
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
                //////////////////////////////////////////////////////////////////////////////
            }
        } else if (method.equalsIgnoreCase("byStudentID")) {   //search payment details using Student ID
            /////////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByStudentID = session1.createQuery("from Payment WHERE applicationNumOrStudentID='" + input + "' order by EnteredTimeStamp desc");
                List searchByStudentIDPaymentList = querySearchByStudentID.list();

                if (searchByStudentIDPaymentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Payment</th>\n"
                            + "                                    <th>ID</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Payment Type</th>\n"
                            + "                                    <th>Amount</th>\n"
                            + "                                    <th>Date</th>\n"
                            + "                                    <th>Bank</th>\n"
                            + "                                    <th>Other</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchByStudentIDPaymentList.size(); i++) {
                        Payment payment1 = new Payment();
                        Student student1 = new Student();

                        payment1 = (Payment) searchByStudentIDPaymentList.get(i);

                        if (payment1.getApplicationNumOrStudentID().contains("_R_")) {
                            student1 = (Student) session1.get(Student.class, payment1.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment1.getPaymentID() + "</td>");
                            out.write("<td>" + payment1.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + student1.getFullName() + "<td>");
                            out.write("<td>" + payment1.getPaymentType() + " </td>");
                            out.write("<td>" + payment1.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment1.getPaymentDate() + " </td>");
                            out.write("<td>" + payment1.getExamID() + " </td>");
                            out.write("<td>" + payment1.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        }

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
            }
            /////////////////////////////////////////////////////////////////////////////

        }else if(method.equalsIgnoreCase("byApplicationNumber")){//search payment details using Application Number
            /////////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByApplicationNumber = session1.createQuery("from Payment WHERE applicationNumOrStudentID='" + input + "' order by EnteredTimeStamp desc");
                List searchByApplicationNumberPaymentList = querySearchByApplicationNumber.list();

                if (searchByApplicationNumberPaymentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Payment</th>\n"
                            + "                                    <th>ID</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Payment Type</th>\n"
                            + "                                    <th>Amount</th>\n"
                            + "                                    <th>Date</th>\n"
                            + "                                    <th>Bank</th>\n"
                            + "                                    <th>Other</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchByApplicationNumberPaymentList.size(); i++) {
                        Payment payment2 = new Payment();
                        Applicant applicant2 = new Applicant();

                        payment2 = (Payment) searchByApplicationNumberPaymentList.get(i);

                        if (payment2.getApplicationNumOrStudentID().contains("_A_")) {
                            applicant2 = (Applicant) session1.get(Applicant.class, payment2.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment2.getPaymentID() + "</td>");
                            out.write("<td>" + payment2.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + applicant2.getFullName() + "<td>");
                            out.write("<td>" + payment2.getPaymentType() + " </td>");
                            out.write("<td>" + payment2.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment2.getPaymentDate() + " </td>");
                            out.write("<td>" + payment2.getExamID() + " </td>");
                            out.write("<td>" + payment2.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        }

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
            }
            /////////////////////////////////////////////////////////////////////////////

            
        }else if (method.equalsIgnoreCase("byExamID")) {   //search payment details using Exam ID
            /////////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByExamID = session1.createQuery("from Payment WHERE ExamID='" + input + "' order by EnteredTimeStamp desc");
                List searchByExamIDPaymentList = querySearchByExamID.list();

                if (searchByExamIDPaymentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Payment</th>\n"
                            + "                                    <th>ID</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Payment Type</th>\n"
                            + "                                    <th>Amount</th>\n"
                            + "                                    <th>Date</th>\n"
                            + "                                    <th>Bank</th>\n"
                            + "                                    <th>Other</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchByExamIDPaymentList.size(); i++) {
                        Payment payment3 = new Payment();
                        Student student3 = new Student();

                        payment3 = (Payment) searchByExamIDPaymentList.get(i);

                        if (payment3.getApplicationNumOrStudentID().contains("_R_")) {
                            student3 = (Student) session1.get(Student.class, payment3.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment3.getPaymentID() + "</td>");
                            out.write("<td>" + payment3.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + student3.getFullName() + "<td>");
                            out.write("<td>" + payment3.getPaymentType() + " </td>");
                            out.write("<td>" + payment3.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment3.getPaymentDate() + " </td>");
                            out.write("<td>" + payment3.getExamID() + " </td>");
                            out.write("<td>" + payment3.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        }

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
            }
            /////////////////////////////////////////////////////////////////////////////

        }else if (method.equalsIgnoreCase("bypaymentType")) {  //search payment details using payment Type
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchBypaymentType = session1.createQuery("from Payment WHERE paymentType='" + input + "' order by EnteredTimeStamp desc");
                List searchBypaymentTypePaymentList = querySearchBypaymentType.list();

                if (searchBypaymentTypePaymentList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Payment</th>\n"
                            + "                                    <th>ID</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Payment Type</th>\n"
                            + "                                    <th>Amount</th>\n"
                            + "                                    <th>Date</th>\n"
                            + "                                    <th>Bank</th>\n"
                            + "                                    <th>Other</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchBypaymentTypePaymentList.size(); i++) {
                        Payment payment4 = new Payment();
                        Applicant applicant4 = new Applicant();
                        Student student4 = new Student();

                        payment4 = (Payment) searchBypaymentTypePaymentList.get(i);

                        if (payment4.getApplicationNumOrStudentID().contains("_A_")) {
                            applicant4 = (Applicant) session1.get(Applicant.class, payment4.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment4.getPaymentID() + "</td>");
                            out.write("<td>" + payment4.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + applicant4.getFullName() + "<td>");
                            out.write("<td>" + payment4.getPaymentType() + " </td>");
                            out.write("<td>" + payment4.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment4.getPaymentDate() + " </td>");
                            out.write("<td>" + payment4.getExamID() + " </td>");
                            out.write("<td>" + payment4.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        } else if (payment4.getApplicationNumOrStudentID().contains("_R_")) {
                            student4 = (Student) session1.get(Student.class, payment4.getApplicationNumOrStudentID());
                            out.write("<tr>");
                            out.write("<td>" + payment4.getPaymentID() + "</td>");
                            out.write("<td>" + payment4.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + student4.getFullName() + "<td>");
                            out.write("<td>" + payment4.getPaymentType() + " </td>");
                            out.write("<td>" + payment4.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment4.getPaymentDate() + " </td>");
                            out.write("<td>" + payment4.getExamID() + " </td>");
                            out.write("<td>" + payment4.getPaymentBank() + " </td>");

                            out.write("</tr>");
                        } else {
                            out.write("<tr>");
                            out.write("<td>" + payment4.getPaymentID() + "</td>");
                            out.write("<td>" + payment4.getApplicationNumOrStudentID() + "</td>");
                            out.write("<td>" + "<td>");
                            out.write("<td>" + payment4.getPaymentType() + " </td>");
                            out.write("<td>" + payment4.getPaymentAmmount() + " </td>");
                            out.write("<td>" + payment4.getPaymentDate() + " </td>");
                            out.write("<td>" + payment4.getExamID() + " </td>");
                            out.write("<td>" + payment4.getPaymentBank() + " </td>");
                            out.write("</tr>");

                        }

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
            }
                //////////////////////////////////////////////////////////////////////////////
            }


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
