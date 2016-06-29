/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

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
        
        String applicationNum = request.getParameter("paymentApplicationNum");
        String paymentAmmount = request.getParameter("paymentAmount");
        String paymentBank = request.getParameter("paymentBank");
        Date paymentDate = Date.valueOf(request.getParameter("paymentDate"));
        
        Payment payment = new Payment();
        payment.setApplicationNum(applicationNum);
        payment.setPaymentAmmount(paymentAmmount);
        payment.setPaymentBank(paymentBank);
        payment.setPaymentDate(paymentDate);
        
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        Transaction tx = null;
        
          try {
            tx = session.beginTransaction();
            session.save(payment);
            session.getTransaction().commit();
            response.sendRedirect("user/coordinator/payment.jsp");
          }catch(HibernateException hex) {
                    System.out.println("--->" + hex);
                    tx.rollback();
                    response.sendRedirect("user/coordinator/payment.jsp?msg=error");
                } catch (Exception e) {
                    System.out.println("--->" + e);
                    tx.rollback();
                    response.sendRedirect("user/coordinator/payment.jsp?msg=error");
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
