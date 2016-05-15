
package com.ims.model;

import java.sql.Date;
import java.sql.Time;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Indusaranie Tharusha
 */
public class Interview {
    private int interviewID;
    private Date date;
    private Time time;
    
    public Interview(){
    }
    
    public Interview(int interviewID, Date date, Time time){
        this.interviewID = interviewID;
        this.date = date;
        this.time = time;
    }
    
    public int getInterviewID() {
        return interviewID;
    }

    public void setInterviewID(int interviewID) {
        this.interviewID = interviewID;
    }
    
    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
    
    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    @Override
    public String toString(){
        return "Interview{" + "interviewID=" + interviewID + ", date=" + date 
                + ", time=" + time + '}';
                
    }
    
    public static void main(String[] args) {
        Interview in = new Interview();
        in.setInterviewID(7850);
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(in);
        
        s.getTransaction().commit();
        
    }
}
