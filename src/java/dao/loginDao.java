/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import bean.loginBean;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.DispatcherType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import util.DBConnection;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class loginDao {
    public String loginAdmin(loginBean loginbean, HttpServletRequest request) throws ClassNotFoundException{
        String username = loginbean.getUsername();
        String password = loginbean.getPassword();
        HttpSession session = request.getSession();
        String fullnameDB;
        String usernameDB;
        String passwordDB;
        
        try{
            Connection con = DBConnection.createConnection();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM ADMINS");
            con.setAutoCommit(false);
            
            while(resultSet.next()){
                fullnameDB = resultSet.getString("ADMIN_FULLNAME");
                usernameDB = resultSet.getString("ADMIN_USERNAME");
                passwordDB = resultSet.getString("ADMIN_PASSWORD");
                if(username.equals(usernameDB) && password.equals(passwordDB)){
                    session.setAttribute("fullname", fullnameDB);
                    session.setAttribute("username", usernameDB);
                    return "SUCCESS";
                }
            }
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            
        }
        return "Invalid user credentials";
    }
}
