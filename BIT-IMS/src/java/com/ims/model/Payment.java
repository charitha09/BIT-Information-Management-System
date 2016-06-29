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

/**
 *
 * @author Amila Sankha
 */
@Entity
public class Payment {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int paymentID;
    private String paymentType;
    private String applicationNum;
    private String paymentAmmount;
    private String paymentBank;
    private Date paymentDate;
    private String author;

    public Payment() {
    }

    public Payment(String paymentType, String applicationNum, String paymentAmmount, String paymentBank, Date paymentDate, String author) {
        this.paymentType = paymentType;
        this.applicationNum = applicationNum;
        this.paymentAmmount = paymentAmmount;
        this.paymentBank = paymentBank;
        this.paymentDate = paymentDate;
        this.author = author;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getApplicationNum() {
        return applicationNum;
    }

    public void setApplicationNum(String applicationNum) {
        this.applicationNum = applicationNum;
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

    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }
    
    
    

}
