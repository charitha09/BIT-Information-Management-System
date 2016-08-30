
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
public class loginServlet extends HttpServlet {
    
    Connection conn;
    ResultSet res;
    
    String username,password,query;
    databaseConnection dbconn;    
    
        
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        try {
                   
            username=request.getParameter("username"); 
            password=request.getParameter("password");
            
            query="select * from user where username='"+username+"' and password='"+password+"';";
            dbconn=new databaseConnection();
            conn=dbconn.setConnection();
            res=dbconn.getResult(query,conn);
            
            if(res.next()){
            
                                
                HttpSession session = request.getSession();
                session.setAttribute("setUsername",username);
                session.setAttribute("setPassword",password);
                
                
                RequestDispatcher rd=request.getRequestDispatcher("/selectExamCenter.jsp");
                rd.forward(request,response);
                
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
