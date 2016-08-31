

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class selectSemesterServlet extends HttpServlet {
    
    Connection conn;
    ResultSet res;
    
    String semester,query;
    databaseConnection dbconn;
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        try {
            
            semester=request.getParameter("semester");    //here you get the value => S001,S002,....,S006
            
            
            query="select * from examination where sem_id='"+semester+"'";
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            res=dbconn.getResult(query,conn);
            
            
            /**************************************
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            //get current date time with Date()
            Date date = new Date();
            out.write(dateFormat.format(date)+"<br>");

            //get current date time with Calendar()
            Calendar cal = Calendar.getInstance();
            out.write(dateFormat.format(cal.getTime())+"<br>");

            Calendar now = Calendar.getInstance();
            out.write("Current Year is : " + now.get(Calendar.YEAR)+"<br>");
            // month start from 0 to 11
            out.write("Current Month is : " + (now.get(Calendar.MONTH) + 1)+"<br>");
            out.write("Current Date is : " + now.get(Calendar.DATE)+"<br>");
            //******************************************/
            
            
            if(res.next()){
                
                if("S001".equals(semester)){
                    RequestDispatcher rd=request.getRequestDispatcher("/selectSemester1Courses.jsp");
                    rd.forward(request,response);
                }
                else if("S002".equals(semester)){
                    RequestDispatcher rd=request.getRequestDispatcher("/selectSemester2Courses.jsp");
                    rd.forward(request,response);
                }
                else if("S003".equals(semester)){
                    RequestDispatcher rd=request.getRequestDispatcher("/selectSemester3Courses.jsp");
                    rd.forward(request,response);
                }
                else if("S004".equals(semester)){
                    RequestDispatcher rd=request.getRequestDispatcher("/selectSemester4Courses.jsp");
                    rd.forward(request,response);
                }
                else if("S005".equals(semester)){
                    RequestDispatcher rd=request.getRequestDispatcher("/selectSemester5Courses.jsp");
                    rd.forward(request,response);
                }
                else{
                    RequestDispatcher rd=request.getRequestDispatcher("/selectSemester6Courses.jsp");
                    rd.forward(request,response);
                }
    
                /*                               
                RequestDispatcher rd=request.getRequestDispatcher("/selectSemester1Courses.jsp");
                rd.forward(request,response);
                */
                
                HttpSession session = request.getSession();
                session.setAttribute("setSemester",semester);
                
                
            }
        } 
            
        catch(SQLException e){
            RequestDispatcher rd=request.getRequestDispatcher("/loginError.jsp");
            rd.forward(request,response);
        } catch (ServletException e) {
            RequestDispatcher rd=request.getRequestDispatcher("/loginError.jsp");
            rd.forward(request,response);
        } catch (IOException e) {
            RequestDispatcher rd=request.getRequestDispatcher("/loginError.jsp");
            rd.forward(request,response);
        }   
        
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
