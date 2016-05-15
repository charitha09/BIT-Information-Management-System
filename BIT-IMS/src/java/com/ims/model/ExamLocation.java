
package com.ims.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
/**
 *
 * @author Indusaranie Tharusha
 */
public class ExamLocation {
    private int districtCode;
    private String districtName;
    private int noOfCenters;
    
    public ExamLocation(){
    }
    
    public ExamLocation(int districtCode, String districtName, int noOfCenters){
        this.districtCode = districtCode;
        this.districtName = districtName;
        this.noOfCenters = noOfCenters;
    }

    public int getDistrictCode() {
        return districtCode;
    }
    
    public void setDistrictCode(int districtCode) {
        this.districtCode = districtCode;
    }

    public String getDistrictName() {
        return districtName;
    }
    
    public void setDistrictName(String districtName) {
        this.districtName = districtName;
    }

    public int getNoOfCenters() {
        return noOfCenters;
    }
    
     public void setNoOfCenters(int noOfCenters) {
        this.noOfCenters = noOfCenters;
    }
     
    @Override
    public String toString(){
        return "ExamLocation{" + "districtCode=" + districtCode + ", districtName=" + districtName 
                + ", noOfCenters=" + noOfCenters + '}';
                
    }
    
    public static void main(String[] args) {
        ExamLocation loc = new ExamLocation();
        loc.setDistrictName("asderty");
        
        SessionFactory sf = new Configuration().configure().buildSessionFactory();
        Session s = sf.openSession();
        s.beginTransaction();
        
        s.save(loc);
        
        s.getTransaction().commit();
        
    }

}
