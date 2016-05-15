/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Indusaranie Tharusha
 */
public class Subject {
    private String subjectCode;
    private String subjectName;
    private int noOfCredits;
    private int semester;
    private String isCompulsory;
    
    public Subject(){
    }
    
    public Subject(String subjectCode, String subjectName, int noOfCredits, int semester, String isCompulsory){
        this.subjectCode = subjectCode;
        this.subjectName = subjectName;
        this.noOfCredits = noOfCredits;
        this.semester = semester;
        this.isCompulsory =isCompulsory;
    }
    
    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }
    
    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    
    public String getSubjectName() {
        return subjectName;
    }
    
    public void setNoOfCredits(int noOfCredits) {
        this.noOfCredits = noOfCredits;
    }
    
    public int getNoOfCredits() {
        return noOfCredits;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }
    
    public int getSemester() {
        return semester;
    }

    public void setIsCompulsory(String isCompulsory) {
        this.isCompulsory = isCompulsory;
    }
    
    public String getIsCompulsory() {
        return isCompulsory;
    }
    
     @Override
    public String toString(){
        return "Subject{" + "subjectCode=" + subjectCode + ", subjectName=" + subjectName + ", noOfCredits=" + noOfCredits
                + ", semester=" + semester + ", isCompulsory=" + isCompulsory + '}';
                
    }
    
    public static void main(String[] args) {
        Subject sub = new Subject();
        sub.setSubjectName("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(sub);
        
        s.getTransaction().commit();
        
    }
    
   
}
