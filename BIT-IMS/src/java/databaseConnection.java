
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author nadeesh
 */

public class databaseConnection {
 
    Statement stmt;
    ResultSet res;
    Connection conn;
    
    public databaseConnection(){
         
    }
    
    @SuppressWarnings("CallToThreadDumpStack")
    
    public Connection setConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost/BIT_SMS","root","");    
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return conn;
    }
    
    public ResultSet getResult(String query,Connection conn){
        this.conn=conn;
        try{
            stmt=conn.createStatement();
            res=stmt.executeQuery(query);
        }
        catch(Exception e){
 
        }
        return res;
    }
    
}
