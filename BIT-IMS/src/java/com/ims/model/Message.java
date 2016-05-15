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
public class Message {
    private int messageID;
    private String title;
    private String body;
    private Date date;
    private Time time;
    
    public Message(){
    } 
    
    public Message(int messageID, String title, String body, Date date, Time time){
        this.messageID = messageID;
        this.title = title;
        this.body = body;
        this.date = date;
        this.time =time;
    }
    
    public int getMessageId() {
        return messageID;
    }

    public void setMessageId(int MessageId) {
        this.messageID = MessageId;
    }
    
    public String getMessageTitle(){
        return title;
    }
    
    public void setMessageTitle(String MessageTitle){
        this.title = MessageTitle;
    }
    
    public String getMessageBody(){
        return body;
    }
    
    public void setMessageBody(String MessageBody){
        this.body = MessageBody;
    }
    
    public Date getMessageDate(){
        return date;
    }
    
    public void setMessageDate(Date MessageDate){
        this.date = MessageDate;
    }
    
    public Time getMessageTime(){
        return time;
    }
    
    public void setMessageTitle(Time MessageTime){
        this.time = MessageTime;
    }
    
    @Override
    public String toString(){
        return "Message{" + "messageID=" + messageID + ", title=" + title + ", body=" + body 
                + ", time=" + time + ", date=" + date + '}';
                
    }
    
    public static void main(String[] args) {
        Message msg = new Message();
        msg.setMessageTitle("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(msg);
        
        s.getTransaction().commit();
        
    }
}
