/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.Properties;
//import javax.jms.Message;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import javax.mail.*;
import javax.mail.internet.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import com.ims.model.Message;

/**
 *
 * @author Indusaranie Tharusha
 */

@WebServlet(name = "MessageController", urlPatterns = {"/MessageController"})
public class MessageController extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MessageController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageController at " + request.getContextPath() + "</h1>");
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
        
        String messageBody = request.getParameter("Message");
        String messageTitle =request.getParameter("Title");
        String receiverID = request.getParameter("Receiver");
        
        DateFormat df =new SimpleDateFormat("dd/MM/yy HH:mm:ss");
        Date dateobj =new Date();
        
         HttpSession httpSession = request.getSession(true);
        String senderID = (String) httpSession.getAttribute("id");
        
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            
            
            
            Message message = new Message() ;
            message.setMessageBody(messageBody);
            message.setMessageTitle(messageTitle);
            message.setReceiverID(receiverID);
            message.setSenderID(senderID);
            message.setMessageDate(df.format(dateobj));
            message.setMessageTime(df.format(dateobj));
            
            session.beginTransaction();
            session.save(message);
            session.getTransaction().commit();
            
       }
    
}   