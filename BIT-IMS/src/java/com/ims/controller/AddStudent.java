/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
import com.ims.model.Student;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Hp
 */
@WebServlet(name = "AddStudent", urlPatterns = {"/AddStudent"})
public class AddStudent extends HttpServlet {

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
            out.println("<title>Servlet AddStudent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddStudent at " + request.getContextPath() + "</h1>");
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

        String applicationNum = request.getParameter("addStudentApplicationNum");
        String year = request.getParameter("addStudentAcademicYear");

        if (applicationNum.equals("") || year.equals("")) {
            response.sendRedirect("user/coordinator/student.jsp?msg=error");
        } else {
            Applicant applicant = new Applicant();
            Student student = new Student();

            SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            Transaction tx1 = null;

            try {
                tx1 = session.beginTransaction();
                applicant = (Applicant) session.get(Applicant.class, applicationNum);
                student.setApplicationNum(applicant.getApplicationNum());
                student.setFullName(applicant.getFullName());
                student.setInitial(applicant.getInitial());
                student.setLastName(applicant.getLastName());
                student.setTitle(applicant.getTitle());
                student.setGender(applicant.getGender());
                student.setCitizenship(applicant.getCitizenship());
                student.setNationality(applicant.getNationality());
                student.setNicNo(applicant.getNicNo());
                student.setBirthDay(applicant.getBirthDay());
                student.setAddress(applicant.getAddress());
                student.setCountry(applicant.getCountry());
                student.setTelephoneNum(applicant.getTelephoneNumFix());
                student.setEmail(applicant.getEmail());
                student.setAlSubject01(applicant.getAlSubject01());
                student.setSubject01Result(applicant.getSubject01Result());
                student.setAlSubject02(applicant.getAlSubject02());
                student.setSubject02Result(applicant.getSubject02Result());
                student.setAlSubject03(applicant.getAlSubject03());
                student.setSubject03Result(applicant.getSubject03Result());
                student.setOlMathsResult(applicant.getOlMathsResult());
                student.setOlEnglishResult(applicant.getOlEnglishResult());
                student.setIsEmploy(applicant.getIsEmploy());
                student.setDesignation(applicant.getDesignation());
                student.setIsComputerField(applicant.getIsComputerField());
                student.setMonthlySalary(applicant.getMonthlySalary());
                student.setPassword(applicant.getNicNo()); //set nic num as the password
                student.setCurrentYear(year);
                //student.setCurrentAcademicYear("");
                applicant.setIsRegisteredAsStudent(1);
                session.save(student);
                session.update(applicant);
                
                tx1.commit();
                response.sendRedirect("user/coordinator/student.jsp?");

            } catch (Exception e) {
                tx1.rollback();
                System.out.println("exception --->" +e);
                response.sendRedirect("user/coordinator/student.jsp?msg=error");
            }finally{
                session.close();
            }
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
