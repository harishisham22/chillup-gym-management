/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author MOHAMMAD NORHARIS
 */
public class DBConnection {
    public static Connection createConnection() throws ClassNotFoundException, SQLException{
        String driver = "org.apache.derby.jdbc.ClientDriver";
        String url = "jdbc:derby://localhost:1527/chillup";
        String uname = "app";
        String pass = "app";

        Class.forName(driver);

        Connection conn = DriverManager.getConnection(url, uname, pass);

        return conn;
    }
}
