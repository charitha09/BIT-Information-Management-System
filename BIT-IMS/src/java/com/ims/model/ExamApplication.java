
package com.ims.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author Indusaranie Tharusha
 */
public class ExamApplication {
    private int applicationID;
    private String learningMethod;
    private String paymentStatus;
    
    public ExamApplication(){
    }
    
    public ExamApplication(int applicationID, String learningMethod, String paymentStatus){
        this.applicationID = applicationID;
        this.learningMethod = learningMethod;
        this.paymentStatus = paymentStatus;
    }

    public void setApplicationID(int applicationID) {
        this.applicationID = applicationID;
    }
    
    public int getApplicationID() {
        return applicationID;
    }

    public void setLearningMethod(String learningMethod) {
        this.learningMethod = learningMethod;
    }
    
    public String getLearningMethod() {
        return learningMethod;
    }


    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    
    public String getPaymentStatus() {
        return paymentStatus;
    }
    
    @Override
    public String toString(){
        return "ExamApplication{" + "applicationID=" + applicationID + ", learningMethod=" + learningMethod 
                + ", paymentStatus=" + paymentStatus + '}';
                
    }
    
    public static void main(String[] args) {
        ExamApplication ExAp = new ExamApplication();
        ExAp.setLearningMethod("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(ExAp);
        
        s.getTransaction().commit();
        
    }

}
