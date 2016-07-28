/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.model;

import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author Amila Sankha
 */
@Entity
public class Payment {
    @Id
    @GenericGenerator(name = "sequence_payment_id", strategy = "com.ims.ids.PaymentId")
    @GeneratedValue(generator = "sequence_payment_id")
    private String paymentID;
    private String paymentType;
    private String applicationNumOrStudentID;
    private String paymentAmmount;
    private String paymentBank;
    private Date paymentDate;
    private String ExamID; // Exam payment have value, others null
    private String author;

    public Payment() {
    }

    public Payment(String paymentType, String applicationNumOrStudentID, String paymentAmmount, String paymentBank, Date paymentDate, String author) {
        this.paymentType = paymentType;
        this.applicationNumOrStudentID = applicationNumOrStudentID;
        this.paymentAmmount = paymentAmmount;
        this.paymentBank = paymentBank;
        this.paymentDate = paymentDate;
        this.author = author;
    }

    public String getExamID() {
        return ExamID;
    }

    public void setExamID(String ExamID) {
        this.ExamID = ExamID;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getApplicationNumOrStudentID() {
        return applicationNumOrStudentID;
    }

    public void setApplicationNumOrStudentID(String applicationNumOrStudentID) {
        this.applicationNumOrStudentID = applicationNumOrStudentID;
    }

    public String getPaymentAmmount() {
        return paymentAmmount;
    }

    public void setPaymentAmmount(String paymentAmmount) {
        this.paymentAmmount = paymentAmmount;
    }

    public String getPaymentBank() {
        return paymentBank;
    }

    public void setPaymentBank(String paymentBank) {
        this.paymentBank = paymentBank;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(String paymentID) {
        this.paymentID = paymentID;
    }
    
    
    

}
