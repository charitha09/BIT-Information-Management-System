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
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author amila
 */
@Entity
public class Applicant {

    @Id
    //@GeneratedValue(strategy = GenerationType.AUTO)
    @GenericGenerator(name = "sequence_application_num", strategy = "com.ims.ids.ApplicationNum")
    @GeneratedValue(generator = "sequence_application_num")
    private String applicationNum;
    private String fullName;
    private String initial;
    private String lastName;
    private String title;
    private String gender;
    private String citizenship;
    private String nationality;
    private String nicNo;
    private Date birthDay;
    private String address;
    private String country;
    private String telephoneNumFix;
    private String telephoneNumMob;
    private String email;
    private String fitResult;
    private String alSubject01;
    private String Subject01Result;
    private String alSubject02;
    private String Subject02Result;
    private String alSubject03;
    private String Subject03Result;
    private String olMathsResult;
    private String olEnglishResult;
    private int isEmploy;
    private String designation;
    private int isComputerField;
    private int monthlySalary;
    private String interviewID;
    private String interviewStartTime;
    private int doPayment = 0;
    private int isRegisteredAsStudent = 0;
            

    public Applicant() {
    }
    
    /**
     * 
     * @param applicationNum
     * @param fullName
     * @param initial
     * @param lastName
     * @param title
     * @param gender
     * @param citizenship
     * @param nationality
     * @param nicNo
     * @param birthDay
     * @param address
     * @param country
     * @param telephoneNumFix
     * @param telephoneNumMob
     * @param email
     * @param fitResult
     * @param alSubject01
     * @param Subject01Result
     * @param alSubject02
     * @param Subject02Result
     * @param alSubject03
     * @param Subject03Result
     * @param olMathsResult
     * @param olEnglishResult
     * @param isEmploy
     * @param designation
     * @param isComputerField
     * @param monthlySalary
     * @param interviewID
     * @param interviewStartTime
     * @param doPayment 
     */

    public Applicant(String applicationNum, String fullName, String initial, String lastName, String title, String gender, String citizenship, String nationality, String nicNo, Date birthDay, String address, String country, String telephoneNumFix, String telephoneNumMob, String email, String fitResult, String alSubject01, String Subject01Result, String alSubject02, String Subject02Result, String alSubject03, String Subject03Result, String olMathsResult, String olEnglishResult, int isEmploy, String designation, int isComputerField, int monthlySalary, String interviewID, String interviewStartTime, int doPayment) {
        this.applicationNum = applicationNum;
        this.fullName = fullName;
        this.initial = initial;
        this.lastName = lastName;
        this.title = title;
        this.gender = gender;
        this.citizenship = citizenship;
        this.nationality = nationality;
        this.nicNo = nicNo;
        this.birthDay = birthDay;
        this.address = address;
        this.country = country;
        this.telephoneNumFix = telephoneNumFix;
        this.telephoneNumMob = telephoneNumMob;
        this.email = email;
        this.fitResult = fitResult;
        this.alSubject01 = alSubject01;
        this.Subject01Result = Subject01Result;
        this.alSubject02 = alSubject02;
        this.Subject02Result = Subject02Result;
        this.alSubject03 = alSubject03;
        this.Subject03Result = Subject03Result;
        this.olMathsResult = olMathsResult;
        this.olEnglishResult = olEnglishResult;
        this.isEmploy = isEmploy;
        this.designation = designation;
        this.isComputerField = isComputerField;
        this.monthlySalary = monthlySalary;
        this.interviewID = interviewID;
        this.interviewStartTime = interviewStartTime;
        this.doPayment = doPayment;
    }

    public String getApplicationNum() {
        return applicationNum;
    }

    public int getIsRegisteredAsStudent() {
        return isRegisteredAsStudent;
    }

    public void setIsRegisteredAsStudent(int isRegisteredAsStudent) {
        this.isRegisteredAsStudent = isRegisteredAsStudent;
    }

    public void setApplicationNum(String applicationNum) {
        this.applicationNum = applicationNum;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getInitial() {
        return initial;
    }

    public void setInitial(String initial) {
        this.initial = initial;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getNicNo() {
        return nicNo;
    }

    public void setNicNo(String nicNo) {
        this.nicNo = nicNo;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getTelephoneNumFix() {
        return telephoneNumFix;
    }

    public void setTelephoneNumFix(String telephoneNumFix) {
        this.telephoneNumFix = telephoneNumFix;
    }

    public String getTelephoneNumMob() {
        return telephoneNumMob;
    }

    public void setTelephoneNumMob(String telephoneNumMob) {
        this.telephoneNumMob = telephoneNumMob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFitResult() {
        return fitResult;
    }

    public void setFitResult(String fitResult) {
        this.fitResult = fitResult;
    }

    public String getAlSubject01() {
        return alSubject01;
    }

    public void setAlSubject01(String alSubject01) {
        this.alSubject01 = alSubject01;
    }

    public String getSubject01Result() {
        return Subject01Result;
    }

    public void setSubject01Result(String Subject01Result) {
        this.Subject01Result = Subject01Result;
    }

    public String getAlSubject02() {
        return alSubject02;
    }

    public void setAlSubject02(String alSubject02) {
        this.alSubject02 = alSubject02;
    }

    public String getSubject02Result() {
        return Subject02Result;
    }

    public void setSubject02Result(String Subject02Result) {
        this.Subject02Result = Subject02Result;
    }

    public String getAlSubject03() {
        return alSubject03;
    }

    public void setAlSubject03(String alSubject03) {
        this.alSubject03 = alSubject03;
    }

    public String getSubject03Result() {
        return Subject03Result;
    }

    public void setSubject03Result(String Subject03Result) {
        this.Subject03Result = Subject03Result;
    }

    public String getOlMathsResult() {
        return olMathsResult;
    }

    public void setOlMathsResult(String olMathsResult) {
        this.olMathsResult = olMathsResult;
    }

    public String getOlEnglishResult() {
        return olEnglishResult;
    }

    public void setOlEnglishResult(String olEnglishResult) {
        this.olEnglishResult = olEnglishResult;
    }

    public int getIsEmploy() {
        return isEmploy;
    }

    public void setIsEmploy(int isEmploy) {
        this.isEmploy = isEmploy;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public int getIsComputerField() {
        return isComputerField;
    }

    public void setIsComputerField(int isComputerField) {
        this.isComputerField = isComputerField;
    }

    public int getMonthlySalary() {
        return monthlySalary;
    }

    public void setMonthlySalary(int monthlySalary) {
        this.monthlySalary = monthlySalary;
    }

    public String getInterviewID() {
        return interviewID;
    }

    public void setInterviewID(String interviewID) {
        this.interviewID = interviewID;
    }

    public String getInterviewStartTime() {
        return interviewStartTime;
    }

    public void setInterviewStartTime(String interviewStartTime) {
        this.interviewStartTime = interviewStartTime;
    }

    public int getDoPayment() {
        return doPayment;
    }

    public void setDoPayment(int doPayment) {
        this.doPayment = doPayment;
    }

    


    ///////////////////////////////////////////////////////////////////////////////////////////////////
    public static void main(String[] args) {
        Applicant ap = new Applicant();
        ap.setFullName("asdfghjkl");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(ap);
        
        s.getTransaction().commit();
        
    }
    
    /////////////////////////////////////////////////////////////
}
