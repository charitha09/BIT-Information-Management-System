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
public class Notice {
    private int noticeID;
    private String title;
    private String body;
    private Date date;
    private Time time;
    
    public Notice(){
    }

    
    public Notice(int noticeID, String title, String body, Date date, Time time){
        this.noticeID = noticeID;
        this.title = title;
        this.body = body;
        this.date = date;
        this.time =time;
    }
    
    public int getNoticeId() {
        return noticeID;
    }

    public void setNoticeId(int NoticeId) {
        this.noticeID = NoticeId;
    }
    
    public String getNoticeTitle(){
        return title;
    }
    
    public void setNoticeTitle(String NoticeTitle){
        this.title = NoticeTitle;
    }
    
    public String getNoticeBody(){
        return body;
    }
    
    public void setNoticeBody(String NoticeBody){
        this.body = NoticeBody;
    }
    
    public Date getNoticeDate(){
        return date;
    }
    
    public void setNoticeDate(Date NoticeDate){
        this.date = NoticeDate;
    }
    
    public Time getNoticeTime(){
        return time;
    }
    
    public void setNoticeTitle(Time NoticeTime){
        this.time = NoticeTime;
    }
    
    @Override
    public String toString(){
        return "Notice{" + "noticeID=" + noticeID + ", title=" + title + ", body=" + body 
                + ", time=" + time + ", date=" + date + '}';
                
    }
    
    public static void main(String[] args) {
        Notice no = new Notice();
        no.setNoticeTitle("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(no);
        
        s.getTransaction().commit();
        
    }

    
}
