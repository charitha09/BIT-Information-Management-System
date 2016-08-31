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
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import com.ims.model.Message;

/**
 *
 * @author Indusaranie Tharusha
 */
@WebServlet(name = "MessageReceive", urlPatterns = {"/MessageReceive"})
public class MessageReceive extends HttpServlet {

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
            out.println("<title>Servlet MessageReceive</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet MessageReceive at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String messageBody = request.getParameter("Message");
        String messageTitle =request.getParameter("Title");
        String senderID = request.getParameter("Sender");
        
        DateFormat df =new SimpleDateFormat("dd/MM/yy HH:mm:ss");
        Date dateobj =new Date();
        
         HttpSession httpSession = request.getSession(true);
        String receiverID = (String) httpSession.getAttribute("id");
        
        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            
            session.beginTransaction();
            
            Message message = new Message() ;
            
            message = null;
            message = (Message)session.get(Message.class,1);
            
            message.getMessageBody();
            message.getMessageTitle();
            message.getreceiverID();
            message.getSenderID();
            message.getMessageDate(df.format(dateobj));
            message.getMessageTime(df.format(dateobj));
            
            //System.out.println(message.getMessageId());
            
       }
    }

    
