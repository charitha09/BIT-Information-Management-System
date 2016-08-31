package com.ims.model;

import java.sql.Date;
import java.sql.Time;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Indusaranie Tharusha
 */
@Entity
public class Message {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int messageID;
    private String senderID;
    private String receiverID;
    private String title;
    private String body;
    private String date;
    private String time;
    private int view=0;
    
    public Message(){
    } 
    
    public Message(int messageID, String title, String body, String date, String time,int view,String senderId, String rceiverID ){
        this.messageID = messageID;
        this.title = title;
        this.body = body;
        this.date = date;
        this.time =time;
        this.view = view;
        this.senderID = senderID;
        this.receiverID = receiverID;
        
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
    
    public String getMessageDate(String MessageDate){
        return date;
    }
    
    public void setMessageDate(String MessageDate){
        this.date = MessageDate;
    }
    
    public String getMessageTime(String MessageTime){
        return time;
    }
    
    public void setMessageTime(String MessageTime){
        this.time = MessageTime;
    }
    
     public int getMessageView(){
        return view;
    }
    
    public void setMessageView(int MessageView){
        this.view = MessageView;
    }
    
    public String getSenderID(){
        return senderID;
    }
    
    public void setSenderID(String SenderID){
        this.senderID = SenderID ;
    }
    
    public String getreceiverID(){
        return receiverID;
    }
    
    public void setReceiverID(String ReceiverID){
        this.receiverID = ReceiverID;
    }
    
    @Override
    public String toString(){
        return "Message{" + "messageID=" + messageID + ", title=" + title + ", body=" + body 
                + ", time=" + time + ", date=" + date + ", view= " + view + ", senderID=" + senderID 
                + ", receiverID=" + receiverID + '}';
                
    }
    
    public static void main(String[] args) {
        Message message = new Message();
        message.setMessageTitle("asderty");
        
        SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
        Session session = sessionFactory.openSession();
        session.beginTransaction();
        
        session.save(message);
        
        session.getTransaction().commit();
        
    }
}
