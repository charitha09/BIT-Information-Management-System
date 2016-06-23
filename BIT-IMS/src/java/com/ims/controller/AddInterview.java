package com.ims.controller;

import com.ims.model.Interview;
import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Amila Sankha
 */
@WebServlet(name = "AddInterview", urlPatterns = {"/AddInterview"})
public class AddInterview extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Date date = Date.valueOf(request.getParameter("interviewDate"));
        
        
        int capacity = Integer.parseInt(request.getParameter("numberOfApplicant"));
        int applicantPerHour = Integer.parseInt(request.getParameter("applicantsPreHour"));;
        Timestamp timeStamp = new Timestamp(System.currentTimeMillis());
        
        HttpSession httpSession = request.getSession(true);
        String author = httpSession.getAttribute("id").toString();
        
        Interview interview = new Interview();
        interview.setDate(date);
        //interview.setStartTime(startTime);
        interview.setCapacity(capacity);
        interview.setApplicantPerHour(applicantPerHour);
        interview.setTimeStamp(timeStamp);
        interview.setAuthor(author);
        
        System.out.println("-->"+interview.toString());


    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
