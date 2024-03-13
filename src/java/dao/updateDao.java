/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.adminBean;
import bean.classBean;
import bean.memberBean;
import bean.programBean;
import bean.trainerBean;
import com.sun.org.apache.bcel.internal.util.BCELifier;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.DispatcherType;
import javax.servlet.http.HttpServletRequest;
import util.DBConnection;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class updateDao {
    public String updateMember(int ID, memberBean mb) throws ClassNotFoundException{
        int id = ID;
        String fullname = mb.getFullname();
        int age = mb.getAge();
        String gender = mb.getGender();
        String icno = mb.getIcno();
        String phone = mb.getPhone();
        String email = mb.getEmail();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE MEMBER SET MEMBER_FULLNAME=?,MEMBER_AGE=?,MEMBER_GENDER=?,MEMBER_PHONE=?,MEMBER_EMAIL=?,MEMBER_ICNO=? WHERE MEMBER_ID=?");
            ps.setString(1, fullname);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, icno);
            ps.setInt(7, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Update failed.";
    }
    public String updateTrainer(int ID, trainerBean tb) throws ClassNotFoundException{
        int id = ID;
        String fullname = tb.getFullname();
        int age = tb.getAge();
        String gender = tb.getGender();
        String icno = tb.getIcno();
        String phone = tb.getPhone();
        String email = tb.getEmail();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE TRAINERS SET TRAINER_FULLNAME=?,TRAINER_AGE=?,TRAINER_GENDER=?,TRAINER_PHONE=?,TRAINER_EMAIL=?,TRAINER_ICNO=? WHERE TRAINER_ID=?");
            ps.setString(1, fullname);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, icno);
            ps.setInt(7, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Update failed.";
    }
    public String updateAdmin(adminBean ab) throws ClassNotFoundException{
        String fullname = ab.getFullname();
        String email = ab.getEmail();
        String phone = ab.getPhone();
        String username = ab.getUsername();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE ADMINS SET ADMIN_FULLNAME=?,ADMIN_EMAIL=?,ADMIN_PHONE=? WHERE ADMIN_USERNAME=?");
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Update failed.";
    }
    public String updatePassword(adminBean ab) throws ClassNotFoundException{
        String username = ab.getUsername();
        String password = ab.getPassword();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE ADMINS SET ADMIN_PASSWORD=? WHERE ADMIN_USERNAME=?");
            ps.setString(1, password);
            ps.setString(2, username);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Password change failed.";
    }
    
    public String updateProgram(int id, programBean pb) throws ClassNotFoundException{
        String programName = pb.getProgram_name();
        String programDuration = pb.getProgram_duration();
        String programIntensity = pb.getProgram_intensity();
        String programDesc = pb.getProgram_desc();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE PROGRAMS SET PROGRAM_NAME=?, PROGRAM_DURATION=?, PROGRAM_INTENSITY=?, PROGRAM_DESC=? WHERE PROGRAM_ID=?");
            ps.setString(1, programName);
            ps.setString(2, programDuration);
            ps.setString(3, programIntensity);
            ps.setString(4, programDesc);
            ps.setInt(5, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Password change failed.";
    }
    
    public String updateClass(int id, classBean cb) throws ClassNotFoundException{
        String day = cb.getDay();
        String time = cb.getTime();
        String programName = cb.getProgram_name();
        String trainerName = cb.getTrainer_Fullname();
            
        if(checkClass(day, time)== true){
            return "Time slot not available.";
        }
        else{
            try{
                Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement("UPDATE PROGRAM_CLASS SET CLASS_DAY=?, CLASS_TIME=?, PROGRAM_NAME=?, TRAINER_NAME=? WHERE CLASS_ID=?");
                ps.setString(1, day);
                ps.setString(2, time);
                ps.setString(3, programName);
                ps.setString(4, trainerName);
                ps.setInt(5, id);
                ps.executeUpdate();
                return "SUCCESS";
            }catch(SQLException e){
                    e.printStackTrace();
            }
        }
        

        return "Password change failed.";
    }
    public boolean checkClass(String day, String time){
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "";
        String dayDB = "";
        String timeDB = "";
        
        
        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            //sql = "select username,email,address,university,password from user";
            sql = "SELECT CLASS_DAY, CLASS_TIME FROM PROGRAM_CLASS WHERE CLASS_DAY = '"+ day +"' AND CLASS_TIME = '" + time + "'";

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {     
                dayDB = resultSet.getString("CLASS_DAY");
                timeDB = resultSet.getString("CLASS_TIME");
                if(day.equals(dayDB) && time.equals(timeDB)) {
                    return true;
                }
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(signupDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
