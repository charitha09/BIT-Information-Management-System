/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.applicant;

import com.ims.model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author Hp
 */
public class Test {
    public static void main(String[] args) {
        
            SessionFactory sessionFactry = new Configuration().configure().buildSessionFactory();
            Session session = sessionFactry.openSession();
            Transaction tx = null;
            try {
                tx = session.beginTransaction();
                System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh");
                User u = new User();
                u = (User) session.get(User.class, "U_7");
                System.out.println(u.getEmail());
                System.out.println(u.getName());
                u.setName("Admin");
               // u.setEmail(email);
               // u.setUserLevel(userLevel);
                //u.setPassword(password);
                session.update(u);
                session.getTransaction().commit();
               // response.sendRedirect("usr/admin/user_create_edit.jsp");

            } catch (HibernateException e) {
                System.out.println("Exception " + e);
                tx.rollback();
            } finally {
                session.close();
            }

    }
    
}
