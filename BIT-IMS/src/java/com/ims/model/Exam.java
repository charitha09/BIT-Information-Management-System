/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class Exam {
    private int examID;
    private String examName;
    private int academicYear;
    private Date date;
    private Time time;
    
    public Exam(){
    }
    
    public Exam(int examID, String examName, int academicYear, Date date, Time time){
        this.examID = examID;
        this.examName = examName;
        this.academicYear = academicYear;
        this.date = date;
        this.time =time;
    }

    /**
     * @return the examID
     */
    public int getExamID() {
        return examID;
    }

    /**
     * @param examID the examID to set
     */
    public void setExamID(int examID) {
        this.examID = examID;
    }

    /**
     * @return the examName
     */
    public String getExamName() {
        return examName;
    }

    /**
     * @param examName the examName to set
     */
    public void setExamName(String examName) {
        this.examName = examName;
    }

    /**
     * @return the academicYear
     */
    public int getAcademicYear() {
        return academicYear;
    }

    /**
     * @param academicYear the academicYear to set
     */
    public void setAcademicYear(int academicYear) {
        this.academicYear = academicYear;
    }

    /**
     * @return the date
     */
    public Date getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(Date date) {
        this.date = date;
    }

    /**
     * @return the time
     */
    public Time getTime() {
        return time;
    }

    /**
     * @param time the time to set
     */
    public void setTime(Time time) {
        this.time = time;
    }
    
    @Override
    public String toString(){
        return "Exam{" + "examID=" + examID + ", examName=" + examName + ", academicYear=" + academicYear 
                + ", date=" + date + ", time=" + time + '}';
                
    }
    
    public static void main(String[] args) {
        Exam ex = new Exam();
        ex.setExamName("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(ex);
        
        s.getTransaction().commit();
        
    }
    
    
}
