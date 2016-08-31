package com.ims.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import com.ims.model.Message;

/**
 * DataBase Connection class
 *
 * @author amila
 */
public class DBConnection {

    // parameters for JDBC

    private String url = "jdbc:mysql://localhost/bit_ims";
    private String user = "root";
    private String pass = "";
    private String driver = "com.mysql.jdbc.Driver";
    private Connection connection;
    private PreparedStatement pst = null;

    /**
     * This method loads the mySQL driver and establish the connection
     *
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public Connection getConnection() throws ClassNotFoundException,
            SQLException {
        Class.forName(driver);
        connection = DriverManager.getConnection(url, user, pass);
        System.out.println("Connection to db success!");
        return connection;
    }

    /**
     * This method is for debugging This method prints the error with less
     * overhead
     *
     * @param e
     */
    public static void printError(Exception e) {
        System.err.println("ERROR: " + e.getMessage());

    }
    
    /*public boolean sendMessage(Message msg){
        try{
            connection = (Connection) DriverManager.getConnection(url,this.user,this.pass);
            String query = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?)";
            pst = (com.mysql.jdbc.PreparedStatement)connection.prepareStatement(query);
            pst.setInt(1,msg.getMessageId());
            pst.setString(2,msg.getSenderID());
            pst.setString(3,msg.getreceiverID());
            pst.setString(4,msg.getMessageTitle());
            pst.setString(5,msg.getMessageBody());
            pst.setString(6,msg.getMessageDate());
            pst.setString(7,msg.getMessageTime());
            pst.setInt(8,msg.getMessageView());
            pst.executeUpdate();
            return true;
        }catch(Exception e){
            return false;
        }finally{
            try{
                if(pst != null){
                    pst.close();
                    
                }
                if(connection != null){
                    connection.close();
                }
            }catch(Exception ex){
                
            }
        }
    }*/
/*
    public static void main(String[] args) {

        int result = 0;
        Connection connection = null;
        PreparedStatement pst = null;
        String sql = "INSERT INTO `test`  VALUES (?,?, ?);";

        try {
            connection = new DBConnection().getConnection();

            pst = connection.prepareStatement(sql);
            pst.setInt(1, 0);
            pst.setInt(2, 110);
            pst.setString(3, "asdf");
            result = pst.executeUpdate();

            if (pst != null) {
                pst.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
*/
}
