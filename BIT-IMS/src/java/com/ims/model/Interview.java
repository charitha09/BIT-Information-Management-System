
package com.ims.model;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Indusaranie Tharusha
 * Edit Amila Sankha
 */
@Entity
public class Interview {
    @Id
    @GenericGenerator(name = "sequence_interview_num", strategy = "com.ims.ids.InterviewNum")
    @GeneratedValue(generator = "sequence_interview_num")
    private String interviewID;
    private Date date;
    private Time startTime;
    private int capacity;
    private int applicantPerHour;
    private Timestamp timeStamp;
    private String author;
  
    public Interview(){
    }

    public Interview(String interviewID, Date date, Time startTime, int capacity, int applicantPerHour, Timestamp timeStamp, String author) {
        this.interviewID = interviewID;
        this.date = date;
        this.startTime = startTime;
        this.capacity = capacity;
        this.applicantPerHour = applicantPerHour;
        this.timeStamp = timeStamp;
        this.author = author;
    }

    public String getInterviewID() {
        return interviewID;
    }

    public void setInterviewID(String interviewID) {
        this.interviewID = interviewID;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getStartTime() {
        return startTime;
    }

    public void setStartTime(Time startTime) {
        this.startTime = startTime;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int geAapplicantPerHour() {
        return applicantPerHour;
    }

    public void setApplicantPerHour(int applicantPerHour) {
        this.applicantPerHour = applicantPerHour;
    }

    public Timestamp getTimeStamp() {
        return timeStamp;
    }

    public void setTimeStamp(Timestamp timeStamp) {
        this.timeStamp = timeStamp;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Interview{" + "interviewID=" + interviewID + ", date=" + date + ", startTime=" + startTime + ", capacity=" + capacity + ", applicantPerHour=" + applicantPerHour + ", timeStamp=" + timeStamp + ", author=" + author + '}';
    }

    
    
    public static void main(String[] args) {
        Interview in = new Interview();
       // in.setInterviewID(7850);
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(in);
        
        s.getTransaction().commit();
        s.close();
        
    }
}
