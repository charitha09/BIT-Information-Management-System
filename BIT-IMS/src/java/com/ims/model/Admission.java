
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
public class Admission {
    private int admissionID;
    private String subjectCode;
    private Date date;
    private Time time;
    
    public Admission(){
    }
    
    public Admission(int admissionID, String subjectCode, Date date, Time time){
        this.admissionID = admissionID;
        this.subjectCode = subjectCode;
        this.date = date;
        this.time = time;
    }
    
    public int getAdmissionID() {
        return admissionID;
    }

    public void setAdmissionID(int admissionID) {
        this.admissionID = admissionID;
    }
    
    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
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
        return "Admission{" + "admissionID=" + admissionID + ", subjectCode=" + subjectCode 
                + ", date=" + date + ", time=" + time + '}';
                
    }
    
    public static void main(String[] args) {
        Admission ad = new Admission();
        ad.setAdmissionID(5756);
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(ad);
        
        s.getTransaction().commit();
        
    }
    
    
}
