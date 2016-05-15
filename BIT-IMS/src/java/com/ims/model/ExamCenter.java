
package com.ims.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Indusaranie Tharusha
 */
public class ExamCenter {
    private int centerID;
    private String centerName;
    private String address;
    
    public ExamCenter(){
    }
    
    public ExamCenter(int centerID, String centerName, String address){
        this.centerID = centerID;
        this.centerName = centerName;
        this.address = address;
    }
    
    public int getCenterID() {
        return centerID;
    }

    public void setCenterID(int centerID) {
        this.centerID = centerID;
    }
    
    public String getCenterName() {
        return centerName;
    }

    public void setCenterName(String centerName) {
        this.centerName = centerName;
    }
    
    public String getAddress() {
        return address;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    @Override
    public String toString(){
        return "ExamCenter{" + "centerID=" + centerID + ", centerName=" + centerName 
                + ", address=" + address + '}';
                
    }
    
    public static void main(String[] args) {
        ExamCenter cent= new ExamCenter();
        cent.setCenterName("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(cent);
        
        s.getTransaction().commit();
        
    }

}
