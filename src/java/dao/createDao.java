/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.classBean;
import bean.memberBean;
import bean.programBean;
import bean.trainerBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DBConnection;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class createDao {
    public String addTrainer(trainerBean tb) throws ClassNotFoundException{
        String fullname = tb.getFullname();
        int age = tb.getAge();
        String gender = tb.getGender();
        String icno = tb.getIcno();
        String phone = tb.getPhone();
        String email = tb.getEmail();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO TRAINERS(TRAINER_FULLNAME,TRAINER_AGE,TRAINER_GENDER,TRAINER_ICNO,TRAINER_PHONE,TRAINER_EMAIL) VALUES(?,?,?,?,?,?)");
            ps.setString(1, fullname);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, icno);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Trainer already registered.";
    }
    public String addMember(memberBean mb) throws ClassNotFoundException{
        String fullname = mb.getFullname();
        int age = mb.getAge();
        String gender = mb.getGender();
        String icno = mb.getIcno();
        String phone = mb.getPhone();
        String email = mb.getEmail();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO MEMBER(MEMBER_FULLNAME,MEMBER_AGE,MEMBER_GENDER,MEMBER_ICNO,MEMBER_PHONE,MEMBER_EMAIL) VALUES(?,?,?,?,?,?)");
            ps.setString(1, fullname);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, icno);
            ps.setString(5, phone);
            ps.setString(6, email);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Member already registered.";
    }
    public String addProgram(programBean pb) throws ClassNotFoundException{
        String program_name = pb.getProgram_name();
        String program_intensity = pb.getProgram_intensity();
        String program_duration = pb.getProgram_duration();
        String program_desc = pb.getProgram_desc();
        
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO PROGRAMS(PROGRAM_NAME,PROGRAM_INTENSITY,PROGRAM_DURATION,PROGRAM_DESC) VALUES(?,?,?,?)");
            ps.setString(1, program_name);
            ps.setString(2, program_intensity);
            ps.setString(3, program_duration);
            ps.setString(4, program_desc);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
            e.printStackTrace();
        }

        return "Program already added.";
    }
    public String addClass(classBean cb) throws ClassNotFoundException{
        String program_name = cb.getProgram_name();
        String trainer_fullname = cb.getTrainer_Fullname();
        String day = cb.getDay();
        String time = cb.getTime();
          
        if(checkClass(day, time)== true){
            return "Time slot not available.";
        }
        else{
            try{
                Connection con = DBConnection.createConnection();
                PreparedStatement ps = con.prepareStatement("INSERT INTO PROGRAM_CLASS(CLASS_DAY,CLASS_TIME,PROGRAM_NAME,TRAINER_NAME) VALUES(?,?,?,?)");
                ps.setString(1, day);
                ps.setString(2, time);
                ps.setString(3, program_name);
                ps.setString(4, trainer_fullname);
                ps.executeUpdate();
                return "SUCCESS";
                
            }catch(SQLException e){
                e.printStackTrace();
            }

            return "Class already added.";
        }
        
        
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
