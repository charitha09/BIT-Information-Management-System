
package com.ims.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author Indusaranie Tharusha
 */
public class ExamHall {
    private int hallID;
    private String hallName;
    private int capasity;
    
    public ExamHall(){
    }
    
    public ExamHall(int hallID, String hallName, int capasity){
        this.hallID = hallID;
        this.hallName = hallName;
        this.capasity = capasity;
    }
    
    public int getHallID() {
        return hallID;
    }

    public void setHallID(int hallID) {
        this.hallID = hallID;
    }
    
    public String getHallName() {
        return hallName;
    }

    public void setHallName(String hallName) {
        this.hallName = hallName;
    }
    
    public int getCapasity() {
        return capasity;
    }

    public void setCapasity(int capasity) {
        this.capasity = capasity;
    }
    
    @Override
    public String toString(){
        return "ExamHall{" + "hallID=" + hallID + ", hallName=" + hallName 
                + ", capasity=" + capasity + '}';
                
    }
    
    public static void main(String[] args) {
        ExamHall hall= new ExamHall();
        hall.setHallName("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(hall);
        
        s.getTransaction().commit();
        
    }

}
