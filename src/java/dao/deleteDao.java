/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.memberBean;
import com.sun.mail.imap.protocol.ID;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import util.DBConnection;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class deleteDao {
    public String deleteMember(int id, HttpServletRequest request) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM MEMBER WHERE MEMBER_ID=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Delete unsuccessful.";
    }
    public String deleteTrainer(int id, HttpServletRequest request) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM TRAINERS WHERE TRAINER_ID=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Delete unsuccessful.";
    }
    public String deleteAdmin(int id, HttpServletRequest request) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM ADMINS WHERE ADMIN_ID=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Delete unsuccessful.";
    }
    public String deleteProgram(int id, HttpServletRequest request) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM PROGRAMS WHERE PROGRAM_ID=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Delete unsuccessful.";
    }
    public String deleteClass(int id, HttpServletRequest request) throws ClassNotFoundException{
        try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM PROGRAM_CLASS WHERE CLASS_ID=?");
            ps.setInt(1, id);
            ps.executeUpdate();
            return "SUCCESS";
        }catch(SQLException e){
                e.printStackTrace();
        }

        return "Delete unsuccessful.";
    }
}
