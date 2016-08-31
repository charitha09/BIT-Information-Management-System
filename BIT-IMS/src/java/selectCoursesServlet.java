
import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nadeesh
 */

public class selectCoursesServlet extends HttpServlet {

    Connection conn;
    ResultSet res;
    
    PreparedStatement ps,ps1;
    
    String checkbox,learning_method;
    String getUserName,getExamCenter,getSemester;
    String query,userid;
    
    databaseConnection dbconn;    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();
        
        try {
            
            HttpSession session = request.getSession();
            
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            
            getUserName=(String)session.getAttribute("setUsername").toString();       //get username
            getExamCenter=(String)session.getAttribute("setExamCenter").toString();   //get examCenter_id D001
            getSemester=(String)session.getAttribute("setSemester").toString();       //get semester_id  S001 
                    
            query="select id from user where username=?";
            ps= conn.prepareStatement(query);
            ps.setString(1,getUserName);
            res= ps.executeQuery();
            
            //query1="select id from user where username="+getUserName;  //get user_id                
            //res=dbconn.getResult(query1,conn);  //get user_id
                
            while (res.next()) {
                userid=res.getString("id");
            }
            
            session.setAttribute("setUserId",userid);
            
            for(int j=1;j<8;j++){
                
                    Calendar cal = Calendar.getInstance();
                    //cal.setTime(date);
                    int year = cal.get(Calendar.YEAR);
    
                                    
                    checkbox=request.getParameter("check"+Integer.toString(j));   //get subject_code EN1001      check + 1 => check1 
                
                
                    learning_method=request.getParameter(Integer.toString(j));    //get learning_method M001     1,2,3,4,5,6,7

                    //insert data into the database

                    ps=conn.prepareStatement("insert into select_exam(id,sem_id,dis_code,course_code,method_id,year) values(?,?,?,?,?,?)");

                    ps.setString(1,userid);
                    ps.setString(2,getSemester);
                    ps.setString(3,getExamCenter);
                    ps.setString(4,checkbox);
                    ps.setString(5,learning_method); 
                    ps.setString(6,Integer.toString(year));    
                    
                    int i = ps.executeUpdate();

                    /*if(i!=0){ 
                        out.println("Your data has been stored in the database"); 
                    } 
                    else{ 
                        out.println("Your data could not be stored in the database"); 
                    }*/ 


                    //res2=dbconn.getResult(query2,conn);
                    //conn.close();
                 
            }

            RequestDispatcher rd=request.getRequestDispatcher("/admissionCard.jsp");
            rd.forward(request,response);
            
/*                        
            if(i!=0){
            //if(res.next()){    
                RequestDispatcher rd=request.getRequestDispatcher("/admissionCard.jsp");
                rd.forward(request,response);
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
                rd.forward(request,response);
            }
*/            
        
        } 
        
        catch(SQLException e){
            out.println(e.getMessage());
            //RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
            //rd.forward(request,response);
        } 
/*        catch (ServletException e) {
            out.println(e.getMessage());
            //RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
            //rd.forward(request,response);
        } 
        catch (IOException e) {
            out.println(e.getMessage());
            //RequestDispatcher rd=request.getRequestDispatcher("/error.jsp");
            //rd.forward(request,response);
        }
*/        
        finally {
            out.close();
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
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }


}
