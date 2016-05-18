   package com.ims.model;
   
   import javax.persistence.Entity;
   import javax.persistence.GeneratedValue;
   import javax.persistence.Id;
   import javax.persistence.Table;
   import javax.persistence.UniqueConstraint;
   import org.hibernate.Session;
   import org.hibernate.SessionFactory;
   import org.hibernate.annotations.GenericGenerator;
   import org.hibernate.cfg.Configuration;
   
   /**
    *
    * @author amila
    */
   @Entity
   @Table(uniqueConstraints = @UniqueConstraint(columnNames = "email"))
   public class User {
   
       @Id
       @GenericGenerator(name = "sequence_user_id", strategy = "com.ims.ids.UserId")
       @GeneratedValue(generator = "sequence_user_id")
       private String userId;
       private String name;
       private String email;
       private String userLevel;
       private String userName;
       private String password;
   
       public User() {
       }
   /**
    * 
    * @param userId
    * @param name
    * @param email
    * @param userLevel
    * @param userName
    * @param password 
    */
       public User(String userId, String name, String email, String userLevel, String userName, String password) {
           this.userId = userId;
           this.name = name;
           this.email = email;
           this.userLevel = userLevel;
           this.userName = userName;
           this.password = password;
       }
   
       public String getUserId() {
           return userId;
       }
   
       public void setUserId(String userId) {
           this.userId = userId;
       }
   
       public String getName() {
           return name;
       }
   
       public void setName(String name) {
           this.name = name;
       }
   
       public String getEmail() {
           return email;
       }
   
       public void setEmail(String email) {
           this.email = email;
       }
   
       public String getUserLevel() {
           return userLevel;
       }
   
       public void setUserLevel(String userLevel) {
           this.userLevel = userLevel;
       }
   
       public String getUserName() {
           return userName;
       }
   
       public void setUserName(String userName) {
           this.userName = userName;
       }
   
       public String getPassword() {
           return password;
       }
   
       public void setPassword(String password) {
           this.password = password;
       }
       
   }    
