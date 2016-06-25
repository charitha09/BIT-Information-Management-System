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
 * @author Amila Sankha
 */
@WebServlet(name = "ViewInterviewAllocatedApplicant", urlPatterns = {"/ViewInterviewAllocatedApplicant"})
public class ViewInterviewAllocatedApplicant extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String interviewID = request.getParameter("interviewID");
        System.out.println(interviewID);

        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session s = sessionFactry.openSession();
        Query queryinterviewAllocatedList = s.createQuery("FROM Applicant WHERE interviewID='"+interviewID+"'");
        List interviewAllocatedList = queryinterviewAllocatedList.list();
try (PrintWriter out = response.getWriter()) {
    out.println("<table class=\"table\" style=\"width: 500px\">\n" +
"                                    <thead>\n" +
"                                        <tr>\n" +
"                                            <th>Applicant ID</th>\n" +
"                                            <th>Full name</th>\n" +
"                                            <th>Email</th>\n" +
"                                            \n" +
"                                        </tr>\n" +
"                                    </thead>");
                out.println("<tbody>");
        for (int i = 0; i < interviewAllocatedList.size(); i++) {
            Applicant applicant = new Applicant();
            applicant = (Applicant) interviewAllocatedList.get(i);
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>"+applicant.getApplicationNum());
            

                out.println("<tr>\n"
                        + "<td>"+applicant.getApplicationNum()+"</td>\n"
                        + "<td>"+applicant.getFullName()+"</td>\n"
                        + "<td>"+applicant.getEmail()+"</td>\n"
                        + "</tr>");

                }
        out.println("</tbody></table>");
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
