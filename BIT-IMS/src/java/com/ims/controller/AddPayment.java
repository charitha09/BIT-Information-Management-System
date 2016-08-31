/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
import com.ims.model.Payment;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Hp
 */
@WebServlet(name = "AddPayment", urlPatterns = {"/AddPayment"})
public class AddPayment extends HttpServlet {

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
            out.println("<title>Servlet AddPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddPayment at " + request.getContextPath() + "</h1>");
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
        String err = " ";

        String applicationNumOrStudentID = request.getParameter("paymentApplicationNumOrStudentID");
        String paymentAmmount = request.getParameter("paymentAmount");
        String paymentType = request.getParameter("paymentType");
        String paymentBank = request.getParameter("paymentBank");
        String examID = request.getParameter("examID");
        Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));

        HttpSession httpSession = request.getSession(true);
        String auther = (String) httpSession.getAttribute("id");

        Payment payment = new Payment();
        payment.setApplicationNumOrStudentID(applicationNumOrStudentID);
        payment.setPaymentAmmount(paymentAmmount);
        payment.setPaymentType(paymentType);
        payment.setPaymentBank(paymentBank);
        payment.setExamID(examID);
        payment.setPaymentDate(paymentDate);
        payment.setAuthor(auther);

        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(payment);
            if (paymentType.equalsIgnoreCase("Application_Payment")) {
                Applicant applicant = new Applicant();
                    applicant = (Applicant) session.get(Applicant.class, applicationNumOrStudentID);
                    applicant.setDoPayment(1);
                    session.update(applicant);
                

            }
            session.getTransaction().commit();
            response.sendRedirect("user/coordinator/coordinate.jsp");
        } catch (HibernateException hex) {
            System.out.println("--->" + hex);
            tx.rollback();
            response.sendRedirect("user/coordinator/coordinate.jsp?msg=error");
        } catch (Exception e) {
            System.out.println("--->" + e);
            tx.rollback();
            response.sendRedirect("user/coordinator/coordinate.jsp?msg=error");
        } finally {
            session.close();
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
