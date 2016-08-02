/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
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
 * @author Hp
 */
@WebServlet(name = "ViewInterviewUnallocatedApplicant", urlPatterns = {"/ViewInterviewUnallocatedApplicant"})
public class ViewInterviewUnallocatedApplicant extends HttpServlet {

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
            out.println("<title>Servlet ViewInterviewUnallocatedApplicant</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ViewInterviewUnallocatedApplicant at " + request.getContextPath() + "</h1>");
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
                SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session s = sessionFactry.openSession();
        Query queryinterviewUnallocatedList = s.createQuery("FROM Applicant WHERE interviewID=NULL");
        List interviewUnallocatedList = queryinterviewUnallocatedList.list();
        
try (PrintWriter out = response.getWriter()) {
    
    out.println("<div class=\"col-sm-8\">\n" +
"                                        <h5 class=\"topic col-sm-8\">\n" +
"                                            Unallocated Applicant Count  \n" +
"                                        </h5>\n" +
"                                        <h5 class=\"topic col-sm-4\">\n" +
                                           interviewUnallocatedList.size()                                +
"                                        </h5>\n" +
"                                    </div>");
    
    
    out.println("<table class=\"table\" style=\"width: 500px\">\n" +
"                                    <thead>\n" +
"                                        <tr>\n" +
"                                            <th>Applicant ID</th>\n" +
"                                            <th>Full name</th>\n" +
"                                            <th>Email</th>"
                                            + "<th>Do payment</th>\n" +
            
"                                            \n" +
"                                        </tr>\n" +
"                                    </thead>");
                out.println("<tbody>");
        for (int i = 0; i < interviewUnallocatedList.size(); i++) {
            Applicant applicant = new Applicant();
            applicant = (Applicant) interviewUnallocatedList.get(i);
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>"+applicant.getApplicationNum());
            

                out.println("<tr>\n"
                        + "<td>"+applicant.getApplicationNum()+"</td>\n"
                        + "<td>"+applicant.getFullName()+"</td>\n"
                        + "<td>"+applicant.getEmail()+"</td>\n"
                        + "<td>"+applicant.getDoPayment()+"</td>\n"
                        + "</tr>");

                }
        out.println("</tbody></table>");
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
