/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.controller;


import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ims.model.Applicant;
import com.ims.db.DBConnection;

/**
 *
 * @author amila
 */
public class ApplicantController {

    public static int saveApplicant(Applicant applicant) throws Exception {
        int result = 0;
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        String sql = "INSERT INTO applicant (application_num, full_name, initial, last_name, title, gender, citizenship, "
                + "nationality, national_id, date_of_birth, address, country, telephone_num, email, al_subject_01, subject_01_result,"
                + "al_subject_02, subject_02_result, al_subject_03, subject_03_result, ol_maths_result, 0l_english_result, is_employ, "
                + "designation, is_computer_field, monthly_salary)"
                + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            connection = new DBConnection().getConnection();
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, applicant.getApplicationNum());
            preparedStatement.setString(2, applicant.getFullName());
            preparedStatement.setString(3, applicant.getInitial());
            preparedStatement.setString(4, applicant.getLastName());
            preparedStatement.setString(5, applicant.getTitle());
            preparedStatement.setString(6, applicant.getGender());
            preparedStatement.setString(7, applicant.getCitizenship());
            preparedStatement.setString(8, applicant.getNationality());
            preparedStatement.setString(9, applicant.getNicNo());
            preparedStatement.setDate(10, applicant.getBirthDay());
            preparedStatement.setString(11, applicant.getAddress());
            preparedStatement.setString(12, applicant.getCountry());
            preparedStatement.setString(13, applicant.getTelephoneNum());
            preparedStatement.setString(14, applicant.getEmail());
            preparedStatement.setString(15, applicant.getAlSubject01());
            preparedStatement.setString(16, applicant.getSubject01Result());
            preparedStatement.setString(17, applicant.getAlSubject02());
            preparedStatement.setString(18, applicant.getSubject02Result());
            preparedStatement.setString(19, applicant.getAlSubject03());
            preparedStatement.setString(20, applicant.getSubject03Result());
            preparedStatement.setString(21, applicant.getOlMathsResult());
            preparedStatement.setString(22, applicant.getOlEnglishResult());
            preparedStatement.setInt(23, applicant.getIsEmploy());
            preparedStatement.setString(24, applicant.getDesignation());
            preparedStatement.setInt(25, applicant.getIsComputerField());
            preparedStatement.setInt(26, applicant.getMonthlySalary());
            
            result = preparedStatement.executeUpdate();
            
            
            return result;
        } catch (Exception ex) {
            // operation failed
            throw ex;
        } finally{
            if(preparedStatement != null){
                preparedStatement.close();
            }
            if(connection != null){
                connection.close();
            }
        }

        
    }
 /*   
    public static void main(String[] args) {
        Date d = Date.valueOf(LocalDate.now());
        System.out.println(d);
        Applicant ap = new Applicant("a", "2", "4", "5", "6", "7", "8", "9", d, "1", "2", "3", "4", "5", "6", "7", "8", "9", "1", "2", "3", 4, "5", 6, 7);
        ap.setFullName("amila");
        int x = 20;
        try {
            x = ApplicantController.saveApplicant(ap);
        } catch (Exception ex) {
            System.out.println(ex);
        }
        finally{
            System.out.println(x);
        }
         }
    */
}
