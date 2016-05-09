
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
 * @author amila
 */
@WebServlet(name = "RegisterApplicant", urlPatterns = {"/RegisterApplicant"})
public class RegisterApplicant extends HttpServlet {

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
            out.println("<title>Servlet RegisterApplicant</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterApplicant at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("perdtl-ful-name");
        String initial = request.getParameter("perdtl-ini-name");
        String lastName = request.getParameter("perdtl-lst-name");
        String title = request.getParameter("perdtl-title");
        String gender = request.getParameter("perdtl-gender");
        String citizenship = request.getParameter("perdtl-citizen");
        String nationality = request.getParameter("perdtl-nation");
        String nicNo = request.getParameter("perdtl-nic");
        Date birthDay = Date.valueOf(request.getParameter("perdtl-dob"));
        String address = request.getParameter("address");
        String country = request.getParameter("country");
        String telephoneNumFix = request.getParameter("tel-fix");
        String telephoneNumMob = request.getParameter("tel-mob");
        String email = request.getParameter("email");
        String fitResult = request.getParameter("fit-res");
        String alSubject01 = request.getParameter("al-sub1-name");
        String Subject01Result = request.getParameter("al-sub1-res");
        String alSubject02 = request.getParameter("al-sub2-name");
        String Subject02Result = request.getParameter("al-sub2-res");
        String alSubject03 = request.getParameter("al-sub3-name");
        String Subject03Result = request.getParameter("al-sub3-res");
        String olMathsResult = request.getParameter("ol-res-maths");
        String olEnglishResult = request.getParameter("ol-res-eng");
        int isEmploy = Integer.parseInt(request.getParameter("emp-dtl-current"));
        String designation = request.getParameter("emp-dtl-discript");
        int isComputerField = Integer.parseInt(request.getParameter("emp-dtl-field"));
        int monthlySalary = Integer.parseInt(request.getParameter("emp-dtl-salary"));

        Applicant applicant = new Applicant();

        applicant.setFullName(fullName);
        applicant.setInitial(initial);
        applicant.setLastName(lastName);
        applicant.setTitle(title);
        applicant.setGender(gender);
        applicant.setCitizenship(citizenship);
        applicant.setNationality(nationality);
        applicant.setNicNo(nicNo);
        applicant.setBirthDay(birthDay);
        applicant.setAddress(address);
        applicant.setCountry(country);
        applicant.setTelephoneNumFix(telephoneNumFix);
        applicant.setTelephoneNumMob(telephoneNumMob);
        applicant.setEmail(email);
        applicant.setFitResult(fitResult);
        applicant.setAlSubject01(alSubject01);
        applicant.setSubject01Result(Subject01Result);
        applicant.setAlSubject02(alSubject02);
        applicant.setSubject02Result(Subject02Result);
        applicant.setAlSubject03(alSubject03);
        applicant.setSubject03Result(Subject03Result);
        applicant.setOlMathsResult(olMathsResult);
        applicant.setOlEnglishResult(olEnglishResult);
        applicant.setIsEmploy(isEmploy);
        applicant.setDesignation(designation);
        applicant.setIsComputerField(isComputerField);
        applicant.setMonthlySalary(monthlySalary);

        System.out.println(applicant.toString());

        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(applicant);
            session.getTransaction().commit();
            response.sendRedirect("index.jsp");
        } catch (HibernateException e) {
            System.out.println("Exception "+e);
            tx.rollback();
        }finally{
            session.close();
        }

        

        

        processRequest(request, response);
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
