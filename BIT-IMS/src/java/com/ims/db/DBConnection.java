package com.ims.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
