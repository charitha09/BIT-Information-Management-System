
package com.ims.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Indusaranie Tharusha
 */
public class User {
    private int userID;
    private String userName;
    private String email;
    private String password;
    private String userLevel;
    
    public User(){
    }
    
    public User(int userID, String userName, String email, String password, String userLevel){
        this.userID = userID;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.userLevel = userLevel;
    }
    
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }
    
    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
     public String getUserLevel() {
        return userLevel;
    }

    public void setUserLevel(String userLevel) {
        this.userLevel = userLevel;
    }
    
    @Override
    public String toString(){
        return "User{" + "userID=" + userID + ", userName=" + userName + ", email=" + email 
                + ", password=" + password + ", userLevel=" + userLevel + '}';
                
    }
    
    public static void main(String[] args) {
        User use = new User();
        use.setUserName("sdwheq");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(use);
        
        s.getTransaction().commit();
        
    }

}
