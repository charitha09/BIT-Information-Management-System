
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
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
public class selectExamCenterServlet extends HttpServlet {

    Connection conn;
    ResultSet res;
    
    String examCenter,query;
    databaseConnection dbconn;
    
       
    //String getUsername,getPassword;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        try {
            
            examCenter=request.getParameter("examCenter"); 
            
            query="select * from exam_center where dis_code='"+examCenter+"'";
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            res=dbconn.getResult(query,conn);
            
            if(res.next()){
                RequestDispatcher rd=request.getRequestDispatcher("/selectSemester.jsp");
                rd.forward(request,response);
                                          
                
                //out.write("<br>You selected "+examCenter+"<br>");
                
                HttpSession session = request.getSession();
                //getUsername = (String)session.getAttribute("setUsername");
                //getPassword = (String)session.getAttribute("setPassword");
                       
                //out.write("<br>You are "+getUsername+"<br>");
                //out.write("<br>Your password is "+getPassword+"<br>");
                
                session.setAttribute("setExamCenter",examCenter);
                
            }
            else{
                RequestDispatcher rd=request.getRequestDispatcher("/loginError.jsp");
                rd.forward(request,response);
            }
            
            
            
        } 
        
        catch(Exception e){
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
