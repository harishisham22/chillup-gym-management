/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.adminBean;
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
public class signupDao {
    public String registerAdmin(adminBean ab) throws ClassNotFoundException{
        String fullname = ab.getFullname();
        String email = ab.getEmail();
        String username = ab.getUsername();
        String password = ab.getPassword();
        
        if(adminExists(username)==true){
            return "Username already taken.";
        }
        else{
            try{
            Connection con = DBConnection.createConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO ADMINS(ADMIN_FULLNAME,ADMIN_EMAIL,ADMIN_USERNAME,ADMIN_PASSWORD) VALUES(?,?,?,?)");
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, username);
            ps.setString(4, password);
            ps.executeUpdate();
            return "SUCCESS";
            }
            catch(SQLException e){
                e.printStackTrace();
            }
        }

        
        return "Invalid user credentials";

    }
    
    public boolean adminExists(String username){
        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;
        String sql = "";
        String usernameDB = "";
        
        
        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();

            //sql = "select username,email,address,university,password from user";
            sql = "SELECT ADMIN_USERNAME FROM ADMINS";

            resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {     
                usernameDB = resultSet.getString("ADMIN_USERNAME");
                if(username.equals(usernameDB)) {
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
