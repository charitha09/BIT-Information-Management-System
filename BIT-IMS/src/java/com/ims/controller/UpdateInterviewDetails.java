/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
import com.ims.model.Interview;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
@WebServlet(name = "UpdateInterviewDetails", urlPatterns = {"/UpdateInterviewDetails"})
public class UpdateInterviewDetails extends HttpServlet {

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
            out.println("<title>Servlet UpdateInterviewDetails</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateInterviewDetails at " + request.getContextPath() + "</h1>");
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

        

        String interviewID = request.getParameter("interviewID");
        Date date = Date.valueOf(request.getParameter("updateInterviewDate"));
        String startTime = request.getParameter("updateInterviewStartTime");

        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        Transaction tx = null;
        
        try {
            Interview interview = new Interview();
            tx = session.beginTransaction();
            interview = (Interview) session.get(Interview.class,interviewID);
            interview.setDate(date);
            interview.setStartTime(startTime);
            
            Query query = session.createQuery("FROM Applicant WHERE interviewID = '"+interviewID+"'");//
            List applicantList = query.list();
            
            int startTimeCounter = 0;
            Applicant applicant = new Applicant();
            for (int i = 1; i <= applicantList.size(); i++) {
                //Session session02 = sessionFactry.openSession();
                
                try {
                    
                    System.out.println("\n\n---------->03\n\n");
                    applicant = (Applicant) applicantList.get(i-1);
                    applicant.setInterviewID(interview.getInterviewID());
                    String t = interview.getStartTime().substring(0, 2);
                    int applicantStartHour = Integer.parseInt(t) + startTimeCounter;
                    String applicantStartTime = applicantStartHour + ":" + interview.getStartTime().substring(3);

                    applicant.setInterviewStartTime(applicantStartTime);

                    session.update(applicant);
                    

                    System.out.println("---------->" + applicant.toString());

                    if (i % interview.getApplicantPerHour() == 0) {
                        startTimeCounter++;
                    }

                } catch (Exception ex) {
                    System.out.println("--->" + ex);
                    tx.rollback();
                }
            }
            session.getTransaction().commit();
            response.sendRedirect("user/coordinator/interview_create_edit.jsp");
        }catch (HibernateException e) {
            System.out.println("Exception " + e);
            tx.rollback();
            response.sendRedirect("user/coordinator/interview_create_edit.jsp?msg=error");
        } finally {

            session.close();
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
