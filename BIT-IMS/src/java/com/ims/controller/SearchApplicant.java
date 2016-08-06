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
@WebServlet(name = "SearchApplicant", urlPatterns = {"/SearchApplicant"})
public class SearchApplicant extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchApplicant</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchApplicant at " + request.getContextPath() + "</h1>");
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

        
        if (method.equalsIgnoreCase("byApplicationNum")) {  //search Applicant details using application num
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByapplicationNum = session1.createQuery("from Applicant WHERE applicationNum='" + input + "'");
                List searchapplicationNumApplicantList = querySearchByapplicationNum.list();

                if (searchapplicationNumApplicantList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Application Number</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Nic</th>\n"
                            + "                                    <th>Address</th>\n"
                            + "                                    <th>Email</th>\n"
                            + "                                    <th>contact Num</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchapplicationNumApplicantList.size(); i++) {

                        Applicant applicant = new Applicant();

                        applicant = (Applicant) searchapplicationNumApplicantList.get(i);
                        
                        out.write("<tr>");
                        out.write("<td>" + applicant.getApplicationNum() + "</td>");
                        out.write("<td>" + applicant.getFullName() + "</td>");
                        out.write("<td>" + applicant.getNicNo() + " </td>");
                        out.write("<td>" + applicant.getAddress() + " </td>");
                        out.write("<td>" + applicant.getEmail()+ " </td>");
                        out.write("<td>" + applicant.getTelephoneNumFix()+ " </td>");
                        

                        out.write("</tr>");

                    }
                    out.write(" </tbody>\n"
                            + "                        </table>");
                }

                session1.getTransaction().commit();
                session1.close();
                //////////////////////////////////////////////////////////////////////////////
            }
        }else if (method.equalsIgnoreCase("byNICNum")) {  //search Applicant details using NIC num
            ///////////////////////////////////////////////////////////////////////////
            try (PrintWriter out = response.getWriter()) {
                

                Session session1 = sessionFactry.openSession();
                session1.beginTransaction();
                Query querySearchByapplicationNum = session1.createQuery("from Applicant WHERE nicNo='" + input + "'order by applicationNum");
                List searchapplicationNumApplicantList = querySearchByapplicationNum.list();

                if (searchapplicationNumApplicantList.size() == 0) {
                    out.write("Id is not in DB");

                } else {
                    out.write("<table class=\"table\">\n"
                            + "                            <thead>\n"
                            + "                                <tr>\n"
                            + "                                    <th>Application Number</th>\n"
                            + "                                    <th>Name</th>\n"
                            + "                                    <th>Nic</th>\n"
                            + "                                    <th>Address</th>\n"
                            + "                                    <th>Email</th>\n"
                            + "                                    <th>contact Num</th>\n"
                            + "                                </tr>\n"
                            + "                            </thead>\n"
                            + "                            <tbody>");
                    for (int i = 0; i < searchapplicationNumApplicantList.size(); i++) {

                        Applicant applicant = new Applicant();

                        applicant = (Applicant) searchapplicationNumApplicantList.get(i);
                        
                        out.write("<tr>");
                        out.write("<td>" + applicant.getApplicationNum() + "</td>");
                        out.write("<td>" + applicant.getFullName() + "</td>");
                        out.write("<td>" + applicant.getNicNo() + " </td>");
                        out.write("<td>" + applicant.getAddress() + " </td>");
                        out.write("<td>" + applicant.getEmail()+ " </td>");
                        out.write("<td>" + applicant.getTelephoneNumFix()+ " </td>");
                        

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
