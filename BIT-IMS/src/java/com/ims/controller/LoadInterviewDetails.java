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
@WebServlet(name = "LoadInterviewDetails", urlPatterns = {"/LoadInterviewDetails"})
public class LoadInterviewDetails extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String interviewID = request.getParameter("interviewID");
        System.out.println(interviewID);

        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session s = sessionFactry.openSession();
        Interview interview = new Interview();
        interview = (Interview) s.get(Interview.class, interviewID);
        try (PrintWriter out = response.getWriter()) {
           // out.println("");

        
    
    }

}

@Override
        public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
