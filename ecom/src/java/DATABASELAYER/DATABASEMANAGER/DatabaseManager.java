/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATABASELAYER.DATABASEMANAGER;

import com.mysql.jdbc.Driver;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell Laptop
 */
public class DatabaseManager {
  
    private Connection con;
    public static final String URL = "jdbc:mysql://127.0.0.1:3306/";
    public static final String USER = "root";
    public static final String PASS = "";

  
    public Connection getConn() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
             con = DriverManager.getConnection(URL + "ecommerce", USER, PASS);
             return con ;
        } catch (SQLException ex) {
             Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }




//  public Connection getConn() {
//        try {
//            DriverManager.registerDriver(new Driver());
//            con = DriverManager.getConnection("jdbc:mysql://localhost/ecommerce", "root", "123456789");
//            //DriverManager.registerDriver(new OracleDriver());
//            //con = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:1521:xe","hr","hr");
//            return con;
//        } catch (SQLException ex) {
//            Logger.getLogger(DatabaseManager.class.getName()).log(Level.SEVERE, null, ex);
//            return null;
//        }
//    }


}