package com.ims.controller;

import com.ims.model.Applicant;
import com.ims.model.Interview;
import com.ims.model.User;
import static com.sun.xml.bind.util.CalendarConv.formatter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

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
        String startTime = request.getParameter("interStartTime");
        String address = request.getParameter("interAddress");
        String district = request.getParameter("interDistrict");
        int capacity = Integer.parseInt(request.getParameter("numberOfApplicant"));
        int applicantPerHour = Integer.parseInt(request.getParameter("applicantsPreHour"));;
        Timestamp timeStamp = new Timestamp(System.currentTimeMillis());

        HttpSession httpSession = request.getSession(true);
        String author = httpSession.getAttribute("id").toString();

        Interview interview = new Interview();
        interview.setDate(date);
        interview.setStartTime(startTime);
        interview.setAddress(address);
        interview.setDistrict(district);
        interview.setCapacity(capacity);
        interview.setApplicantPerHour(applicantPerHour);
        interview.setTimeStamp(timeStamp);
        interview.setAuthor(author);

        System.out.println("-->" + interview.toString());

        SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactry.openSession();
        Transaction tx = null;

        try {
            tx = session.beginTransaction();
            session.save(interview);
            session.getTransaction().commit();

            Query query = session.createQuery("FROM Applicant WHERE doPayment = 1 AND interviewID = NULL");//
            List applicantList = query.list();
            Applicant applicant = new Applicant();
            if (applicantList.size() < capacity) {
                capacity = applicantList.size();
            }
            int startTimeCounter = 0;
            Transaction t2 = null;

            for (int i = 1; i <= capacity; i++) {
                Session session02 = sessionFactry.openSession();
                try {

                    t2 = session02.beginTransaction();
                    System.out.println("\n\n---------->03\n\n");
                    applicant = (Applicant) applicantList.get(i-1);
                    applicant.setInterviewID(interview.getInterviewID());
                    String t = interview.getStartTime().substring(0, 2);
                    int applicantStartHour = Integer.parseInt(t) + startTimeCounter;
                    String applicantStartTime = applicantStartHour + ":" + interview.getStartTime().substring(3);

                    applicant.setInterviewStartTime(applicantStartTime);

                    session02.update(applicant);
                    t2.commit();

                    System.out.println("---------->" + applicant.toString());

                    if (i % applicantPerHour == 0) {
                        startTimeCounter++;
                    }

                } catch (HibernateException hex) {
                    System.out.println("--->" + hex);
                    t2.rollback();
                } catch (Exception e) {
                    System.out.println("--->" + e);
                    t2.rollback();
                } finally {
                    session02.close();
                }
            }
            response.sendRedirect("user/coordinator/interview_create_edit.jsp");

        } catch (HibernateException e) {
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
