/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ims.applicant;

import com.ims.model.User;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import sun.nio.cs.StandardCharsets;

/**
 *
 * @author Hp
 */
public class Test {

    public static void main(String[] args) throws NoSuchAlgorithmException {
        //String text = "LOL";
       // MessageDigest digest = MessageDigest.getInstance("SHA-256");
        //byte[] hash = digest.digest(text.getBytes(StandardCharsets.UTF_8));

        String k = "12:55";
        String t = k.substring(0, 2);
        System.out.println(k);
        System.out.println(t);
        int a = Integer.parseInt(t)+1;
        String s = a + k.substring(3);
        System.out.println(s);
    }

}
