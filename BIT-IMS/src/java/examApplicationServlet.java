
import java.util.Date;

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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nadeesh
 */
public class examApplicationServlet extends HttpServlet {
   
    Connection conn;
    ResultSet res,res2,res3,res4,res5;
    
    PreparedStatement ps;
    
    String username,query,query2,query3,query4,query5;
    databaseConnection dbconn; 
    
    String getUserId,getExamCenter,getSemester,semesterNum;
    
    String w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12;
    String p3;
    
    private static final Font catFont = new Font(Font.FontFamily.TIMES_ROMAN, 14,Font.NORMAL);
    private static final Font redFont = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.NORMAL, BaseColor.RED);
    private static final Font subFont = new Font(Font.FontFamily.TIMES_ROMAN, 16,Font.BOLD);
    private static final Font smallBold = new Font(Font.FontFamily.TIMES_ROMAN, 12,Font.BOLD);
    private static final Font smallFont = new Font(Font.FontFamily.TIMES_ROMAN, 10,Font.NORMAL);
      
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, DocumentException, SQLException {
        
        //////////////////////////////////////////////////////////
        
        //Get the output stream for writing PDF object        
        OutputStream out=response.getOutputStream();
        
        HttpSession session = request.getSession();
        
        getUserId=(String)session.getAttribute("setUserId").toString();           //get user_id U001
        getExamCenter=(String)session.getAttribute("setExamCenter").toString();   //get examCenter_id D001
        getSemester=(String)session.getAttribute("setSemester").toString();       //get semester_id  S001 
        
        
        //res.getString();     //this is how you get database data

        //////////////////////////////////////////////////////////
        
        
        //Set content type to application/pdf
        //browser will open the document only if this is set
        response.setContentType("application/pdf");
        
    
        
        if("S001".equals(getSemester)){
                semesterNum="1";
        }
        else if("S002".equals(getSemester)){
                semesterNum="2";
        }
        else if("S003".equals(getSemester)){
                semesterNum="3";
        }
        else if("S004".equals(getSemester)){
                semesterNum="4";
        }
        else if("S005".equals(getSemester)){
                semesterNum="5";
        }
        else{
                semesterNum="6";
        }
        
        
        
        try {
            
            
            query="SELECT user.id,  user.firstName, user.lastName, user.title, user.gender, user.citizenship, user.nicNo, user.birthDay, user.address, user.telephoneNumFix, user.telephoneNumMob, user.email FROM user INNER JOIN select_exam ON user.id=select_exam.id where user.id='"+getUserId+"';";
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            res=dbconn.getResult(query,conn);
                   
            if(res.next()){
                w1=res.getString("id");
                w2=res.getString("firstName");
                w3=res.getString("lastName");
                w4=res.getString("title");
                w5=res.getString("gender");
                w6=res.getString("citizenship");
                w7=res.getString("nicNo");
                w8=res.getString("birthDay");
                w9=res.getString("address");
                w10=res.getString("telephoneNumFix");
                w11=res.getString("telephoneNumMob");
                w12=res.getString("email");
            }
            
            //////////////////////////////////////////////////////////////////////////////////////////////////////    
            
            //Date date = null; // your date
            Calendar cal = Calendar.getInstance();
            //cal.setTime(date);
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH);
            int day = cal.get(Calendar.DAY_OF_MONTH);
            
            query2="SELECT course.course_code, course.course_name, course.compulsory_optional, select_exam.method_id FROM select_exam INNER JOIN course ON select_exam.course_code=course.course_code where select_exam.id='"+getUserId+"' and select_exam.year='"+year+"';";
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            res2=dbconn.getResult(query2,conn);

            
            query3="select * from exam_center where dis_code='"+getExamCenter+"';";
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            res3=dbconn.getResult(query3,conn);
            if(res3.next()){
                p3=res3.getString("dis_name");
            }
            
            
            //////////////////////////////////////////////////////////////////////////////////////////////////////
            
            Document document = new Document();
            /* Basic PDF Creation inside servlet */
            PdfWriter.getInstance(document, out);
                   
            document.open();
            
                addMetaData(document);
                addTitlePage(document);
                
                Paragraph preface = new Paragraph();
                
                preface.add(new Paragraph("YEAR: " + year + "     SEMESTER: " + semesterNum, catFont));
                preface.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------"));
                
                //***********************************************************************************************************
                //add an empty line
                addEmptyLine(preface, 1);
                preface.add(new Paragraph("REGISTRATION NUMBER : "+w1,smallBold));
                preface.add(new Paragraph("FULL NAME : "+w2+" "+w3,smallBold));
                preface.add(new Paragraph("NAME FOR MAILLING : "+w2,smallBold));
                preface.add(new Paragraph("TITLE : "+w4,smallBold));
                preface.add(new Paragraph("SEX : "+w5,smallBold));
                preface.add(new Paragraph("CITIZENSHIP : "+w6,smallBold));
                preface.add(new Paragraph("NIC No : "+w7,smallBold));
                preface.add(new Paragraph("DATE OF BIRTH : "+w8,smallBold));
                preface.add(new Paragraph("POSTAL ADDRESS : "+w9,smallBold));
                preface.add(new Paragraph("TELEPHONE NUMBER : "+w10+" / "+w11,smallBold));
                preface.add(new Paragraph("e-MAIL ADDRESS : "+w12,smallBold));
                preface.add(new Paragraph("SELECTED DISTRICT/LOCATION FOR THE EXAMINATION : "+p3,smallBold));
                
                //***********************************************************************************************************
                addEmptyLine(preface, 1);
                preface.add(new Paragraph("SELECTED SUBJECTS : ",smallBold));           
                
                //creating a table => Course Slection Table
                PdfPTable table = new PdfPTable(7);
                //setting widths for each cell
                table.setWidths(new int[]{20,50,150,70,40,40,50});
                                
                PdfPCell c1;
                
                c1 = new PdfPCell(new Phrase("",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                c1 = new PdfPCell(new Phrase("Course Code",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);

                c1 = new PdfPCell(new Phrase("Course Name",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);

                c1 = new PdfPCell(new Phrase("Compulsory / Optional",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                c1 = new PdfPCell(new Phrase("Self Study",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                c1 = new PdfPCell(new Phrase("Private Tuition",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                c1 = new PdfPCell(new Phrase("Attending an Institute",smallFont));
                c1.setHorizontalAlignment(Element.ALIGN_CENTER);
                table.addCell(c1);
                
                                
                table.setHeaderRows(1);
                             
                while(res2.next()){
                    
                    String method_id=res2.getString("method_id");
                    
                    if("I001".equals(method_id) || "I002".equals(method_id) || "I003".equals(method_id) || "I004".equals(method_id) || "I005".equals(method_id) || "I006".equals(method_id)){
                        table.addCell(new Phrase("*",smallFont));  //attending an institute      column 1   
                    }
                    else{
                        table.addCell(new Phrase("",smallFont));  //attending an institute       column 1
                    }
                    
                    /*if("M003".equals(res2.getString("method_id"))){
                        table.addCell(new Phrase("*",smallFont));  //attending an institute      column 1   
                    }
                    else{
                        table.addCell(new Phrase("",smallFont));  //attending an institute       column 1
                    }*/
                    
                    table.addCell(new Phrase(res2.getString("course_code"),smallFont));  //course code      column 2
                    table.addCell(new Phrase(res2.getString("course_name"),smallFont));  //course name      column 3 
                    table.addCell(new Phrase(res2.getString("compulsory_optional"),smallFont));  //compulsory/optional     column 4
                    
                    if("M001".equals(res2.getString("method_id"))){
                        table.addCell(new Phrase("*",smallFont));  //self study      column 5
                    }
                    else{
                        table.addCell(new Phrase("",smallFont));  //self study       column 5 
                    }
                    if("M002".equals(res2.getString("method_id"))){
                        table.addCell(new Phrase("*",smallFont));  //private tuition   column 6
                    }
                    else{
                        table.addCell(new Phrase("",smallFont));  //private tuition    column 6
                    }
                    
                    if("I001".equals(res2.getString("method_id")) || "I002".equals(res2.getString("method_id")) || "I003".equals(res2.getString("method_id")) || "I004".equals(res2.getString("method_id")) || "I005".equals(res2.getString("method_id")) || "I006".equals(res2.getString("method_id"))){
                        table.addCell(new Phrase("*",smallFont));  //attending an institute      column 1   
                    }
                    else{
                        table.addCell(new Phrase("",smallFont));  //attending an institute       column 1
                    }
                    
                    /*if("M003".equals(res2.getString("method_id"))){
                        table.addCell(new Phrase("*",smallFont));  //attending an institute   column 7
                    }
                    else{
                        table.addCell(new Phrase("",smallFont));  //attending an institute    column 7
                    }*/
                    
                }    
                preface.add(table);
                
                //***********************************************************************************************************
                
                
                query4="SELECT course.course_code, course.course_name, course.compulsory_optional, select_exam.method_id FROM select_exam INNER JOIN course ON select_exam.course_code=course.course_code where select_exam.id='"+getUserId+"' and select_exam.year='"+year+"';";
                dbconn=new databaseConnection();
                conn=dbconn.setConnection();
                res4=dbconn.getResult(query4,conn);

                addEmptyLine(preface, 1);                
                preface.add(new Paragraph("SELECTED SUBJECT'S INSTITUTE : ",smallBold));
                    
                
                //creating a table => Institute Table
                PdfPTable table2 = new PdfPTable(7);
                //setting widths for each cell
                table2.setWidths(new int[]{20,150,70,100,100,50,50});

                PdfPCell c2;
                
                c2 = new PdfPCell(new Phrase("",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                c2 = new PdfPCell(new Phrase("Course Name",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                c2 = new PdfPCell(new Phrase("Compulsory / Optional",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                c2 = new PdfPCell(new Phrase("Institute Name",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                c2 = new PdfPCell(new Phrase("Institute Address",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                c2 = new PdfPCell(new Phrase("From",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                c2 = new PdfPCell(new Phrase("To",smallFont));
                c2.setHorizontalAlignment(Element.ALIGN_CENTER);
                table2.addCell(c2);

                table2.setHeaderRows(1);
                    
    
                while(res4.next()){
                    
                    String method_id=res4.getString("method_id");
                    
                    query5="select * from institute where institute_id='"+method_id+"';";
                    dbconn=new databaseConnection();
                    conn=dbconn.setConnection();
                    res5=dbconn.getResult(query5,conn);
                    
                    
                    
                    while(res5.next()){
                    
                        if("I001".equals(method_id) || "I002".equals(method_id) || "I003".equals(method_id) || "I004".equals(method_id) || "I005".equals(method_id) || "I006".equals(method_id)){
                        /*if("M003".equals(res4.getString("method_id"))){*/

                            table2.addCell(new Phrase("*",smallFont));
                            table2.addCell(new Phrase(res4.getString("course_name"),smallFont));  //course name
                            table2.addCell(new Phrase(res4.getString("compulsory_optional"),smallFont));  //compulsory/optional
                            table2.addCell(new Phrase(res5.getString("institute_name"),smallFont));  //institute name
                            table2.addCell(new Phrase(res5.getString("institute_address"),smallFont));  //institute address
                            table2.addCell(new Phrase(res5.getString("from_month"),smallFont));  //from month
                            table2.addCell(new Phrase(res5.getString("to_month"),smallFont));  //to month

                        }
                    
                    }
                        
                }  
                
                preface.add(table2);

                
                //***********************************************************************************************************

                addEmptyLine(preface, 1);
                System.getProperty("user.timezone","UTC");
                preface.add(new Paragraph(""+new Date(),smallBold)); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$

                //***********************************************************************************************************
             
                document.add(preface);
                
               /*Image image = Image.getInstance("ucsc.png");
                image.setAbsolutePosition(500f, 650f);
                document.add(new Paragraph ("Image"));
                document.add(image);*/
                
            document.close();
        }
        catch (DocumentException exc){
            throw new IOException(exc.getMessage());
            
        }
        finally {            
            out.close();
        }
        
    }

     
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        }
        catch (DocumentException ex) {
            Logger.getLogger(pdfDownloaderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(examApplicationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } 
        catch (DocumentException ex) {
            Logger.getLogger(pdfDownloaderServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(examApplicationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
              
    }

    @Override
    public String getServletInfo() {
        return "This Servlet Generates PDF Using iText Library";
    }

    
   
    
    
    
    // iText allows to add metadata to the PDF which can be viewed in your Adobe
    // Reader
    // under File -> Properties
    private static void addMetaData(Document document) {
        document.addTitle("Application");
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
        preface.add(new Paragraph("APPLICATION FORM FOR EXAMINATIONS", catFont));
        preface.add(new Paragraph("UNIVERSITY OF COLOMBO SCHOOL OF COMPUTING", catFont));
        preface.add(new Paragraph("DEGREE OF BACHELOR OF INFORMATION TECHNOLOGY (EXTERNAL)", catFont));
        
        document.add(preface);
        
        // Start a new page
        //document.newPage();
    }


    private static void addEmptyLine(Paragraph paragraph, int number) {
        for (int i = 0; i < number; i++) {
            paragraph.add(new Paragraph(" "));
        }
    }
    
    
    
}
