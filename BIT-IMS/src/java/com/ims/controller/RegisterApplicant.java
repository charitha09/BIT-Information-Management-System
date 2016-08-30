
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;

import com.ims.model.Applicant;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
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
    
    
    private static final Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 14,Font.NORMAL);
    private static final Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL, BaseColor.RED);
    private static final Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,Font.BOLD);
    private static final Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.BOLD);
    private static final Font smallFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,Font.NORMAL);


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
            ///////////////////////////////////////////////////////////////////////////////////////
            //Date date = null; // your date
            Calendar cal = Calendar.getInstance();
            //cal.setTime(date);
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH);
            int day = cal.get(Calendar.DAY_OF_MONTH);
            
            
            
            OutputStream out=response.getOutputStream();
            Document document = new Document();
            /* Basic PDF Creation inside servlet */
            PdfWriter.getInstance(document, out);
                   
            document.open();
            
                addMetaData(document);
                addTitlePage(document);
                
                Paragraph preface = new Paragraph();
                
                preface.add(new Paragraph("YEAR: " + year, catFont));
                preface.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------"));
                
                //***********************************************************************************************************
                //add an empty line
                addEmptyLine(preface, 1);
                //preface.add(new Paragraph("Application For : "+w1,smallBold));
                preface.add(new Paragraph("Full Name : "+fullName,smallBold));
                preface.add(new Paragraph("Initials : "+initial,smallBold));
                preface.add(new Paragraph("Last Name : "+lastName,smallBold));
                preface.add(new Paragraph("Title : "+title,smallBold));
                preface.add(new Paragraph("Gender : "+gender,smallBold));
                preface.add(new Paragraph("Citizenship : "+citizenship,smallBold));
                preface.add(new Paragraph("Nationality : "+nationality,smallBold));
                preface.add(new Paragraph("National ID : "+nicNo,smallBold));
                preface.add(new Paragraph("Date of Birth : "+birthDay,smallBold));
                //preface.add(new Paragraph("Registration Center : "+,smallBold));                
                preface.add(new Paragraph("Permanent Address : "+address,smallBold));
                preface.add(new Paragraph("Country : "+country,smallBold));
                preface.add(new Paragraph("Telephone Number(Fix) : "+telephoneNumFix,smallBold));
                preface.add(new Paragraph("Telephone Number(Mobile) : "+telephoneNumMob,smallBold));
                preface.add(new Paragraph("E-mail : "+email,smallBold));
                preface.add(new Paragraph("Foundation in Information Technology Result : "+fitResult,smallBold));
                preface.add(new Paragraph("A/L Result : ",smallBold));
                


                //creating a table => Course Slection Table
                PdfPTable table = new PdfPTable(2);
                //setting widths for each cell
                table.setWidths(new int[]{50,50});
                                
                PdfPCell c1;
                
                c1 = new PdfPCell(new Phrase("Subject",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                c1 = new PdfPCell(new Phrase("Result",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                                
                table.setHeaderRows(1);
                             
                
                table.addCell(new Phrase(alSubject01,smallFont));
                table.addCell(new Phrase(Subject01Result,smallFont));
                
                table.addCell(new Phrase(alSubject02,smallFont));
                table.addCell(new Phrase(Subject02Result,smallFont));
                
                table.addCell(new Phrase(alSubject03,smallFont));
                table.addCell(new Phrase(Subject03Result,smallFont));
                
                preface.add(table);
                
                
                preface.add(new Paragraph("O/L Result : Mathematics - "+olMathsResult,smallBold));
                preface.add(new Paragraph("           : English     - "+olEnglishResult,smallBold));
                
             
                
                preface.add(new Paragraph("Employment Details : Are you currently employed ?        - "+isEmploy,smallBold));
                preface.add(new Paragraph("                   : If employed : Designation           - "+designation,smallBold));
                preface.add(new Paragraph("                   : Are you working on computer field ? - "+isComputerField,smallBold));
                preface.add(new Paragraph("                   : Monthly Salary                      - "+monthlySalary,smallBold));
                
                
                addEmptyLine(preface, 1);
                System.getProperty("user.timezone","UTC");
                preface.add(new Paragraph(""+new java.util.Date(),smallBold));
                
                document.add(preface);
            
            document.close();
            //////////////////////////////////////////////////////////////////////////////////////
            tx = session.beginTransaction();
            session.save(applicant);
            session.getTransaction().commit();
            response.sendRedirect("index.jsp");
            System.out.println(applicant.getApplicationNum());
        } catch (HibernateException e) {
            System.out.println("Exception "+e);
            tx.rollback();
        } catch (DocumentException ex) {
            Logger.getLogger(RegisterApplicant.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            session.close();
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
     /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    // iText allows to add metadata to the PDF which can be viewed in your Adobe
    // Reader
    // under File -> Properties
    private static void addMetaData(Document document) {
        document.addTitle("Application Form");
        document.addSubject("Using iText");
        document.addKeywords("Java, PDF, iText");
        document.addAuthor("Lars Vogel");
        document.addCreator("Lars Vogel");
    }

    private static void addTitlePage(Document document) throws DocumentException {
        Paragraph preface = new Paragraph();
        // We add one empty line
        addEmptyLine(preface, 1);
        // Lets write a big header
        preface.add(new Paragraph("UNIVERSITY OF COLOMBO SCHOOL OF COMPUTING", catFont));
        preface.add(new Paragraph("STUDENT APPLICATION FORM", catFont));
                
        document.add(preface);
        
        // Start a new page
        //document.newPage();
    }


    private static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    

}
