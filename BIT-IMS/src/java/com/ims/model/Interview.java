
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
    private String startTime;
    private String address;
    private String district;
    private int capacity;
    private int applicantPerHour;
    private Timestamp timeStamp;
    private String author;
  
    public Interview(){
    }

    public Interview(String interviewID, Date date, String startTime, String address, String district, int capacity, int applicantPerHour, Timestamp timeStamp, String author) {
        this.interviewID = interviewID;
        this.date = date;
        this.startTime = startTime;
        this.address = address;
        this.district = district;
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

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getApplicantPerHour() {
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
        return "Interview{" + "interviewID=" + interviewID + ", date=" + date + ", startTime=" + startTime + ", address=" + address + ", district=" + district + ", capacity=" + capacity + ", applicantPerHour=" + applicantPerHour + ", timeStamp=" + timeStamp + ", author=" + author + '}';
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
