/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.ids;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SessionImplementor;
import org.hibernate.id.IdentifierGenerator;

/**
 *
 * @author Hp
 */
public class InterviewNum implements IdentifierGenerator{
      @Override
    public Serializable generate(SessionImplementor session, Object object)
            throws HibernateException {

        String prefix = "I_";
        Connection connection = session.connection();

        try {
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("select count(interviewID) as interviewID from Interview");

            if (rs.next()) {
                int id = rs.getInt(1) + 1;
                String generatedId = prefix + new Integer(id).toString();
                System.out.println("Generated Id: " + generatedId);
                return generatedId;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
    
    
}
