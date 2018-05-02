/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATABASELAYER.DAO;

import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Users;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Dell Laptop
 */
public class UsersControl {
    private Statement s;
    private PreparedStatement st;
    private ResultSet rs;
    private DatabaseManager managerObj;
    // photo not added yet
    public int create(Users obj, Connection con) {
        try {
            // photo not added yet
            st = con.prepareStatement("INSERT  INTO users (id, email, name, bod, password, job, address, interests, credit)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getId());
            st.setString(2, obj.getEmail());
            st.setString(3, obj.getName());
            st.setString(4, obj.getBod());
            st.setString(5, obj.getPassword());
            st.setString(6, obj.getJob());
            st.setString(7, obj.getAddress());
            st.setString(8, obj.getInterests());
            st.setLong(9, obj.getCredit());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int update(Users obj, Connection con) {
        try {
            // photo not added yet
            st = con.prepareStatement("update users set email = ?, name = ?, bod = ?, password = ?,job = ?, address = ?, interests = ?, credit = ? where id = ? ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setString(1, obj.getEmail());
            st.setString(2, obj.getName());
            st.setString(3, obj.getBod());
            st.setString(4, obj.getPassword());
            st.setString(5, obj.getJob());
            st.setString(6, obj.getAddress());
            st.setString(7, obj.getInterests());
            st.setLong(8, obj.getCredit());
            st.setInt(9, obj.getId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int delete (Users obj, Connection con){
        try {
            st = con.prepareStatement("delete from users where id = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public Users retrieve (Users obj, Connection con){
        try {
            Users u = new Users();
            Statement st = con.createStatement();
           rs = st.executeQuery(" SELECT * FROM users WHERE id = '"+obj.getId()+"'");
           rs = st.getResultSet();
           rs.next();
           if(!rs.isAfterLast()){
               u.setId(rs.getInt(1));
               u.setEmail(rs.getString(2));
               u.setName(rs.getString(3));
               u.setBod(rs.getString(4));
               u.setPassword(rs.getString(5));
               u.setJob(rs.getString(6));
               u.setAddress(rs.getString(7));
               u.setInterests(rs.getString(8));
               u.setCredit(rs.getLong(9));
           }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public ArrayList<Users> retrieveall (Connection con){
        try {
            ArrayList<Users> u;
            u = new ArrayList<Users>();
            Statement st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM users ");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               Users temp = new Users();
               temp.setId(rs.getInt(1));
               temp.setEmail(rs.getString(2));
               temp.setName(rs.getString(3));
               temp.setBod(rs.getString(4));
               temp.setPassword(rs.getString(5));
               temp.setJob(rs.getString(6));
               temp.setAddress(rs.getString(7));
               temp.setInterests(rs.getString(8));
               temp.setCredit(rs.getLong(9));
               u.add(temp);
               rs.next();
           }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public Users retreiveByEmailAndPass (Users obj, Connection con){
        try {
            Users u = new Users();
            Statement st = con.createStatement();
           rs = st.executeQuery(" SELECT * FROM users WHERE email = '"+obj.getEmail()+"' and password = '"+obj.getPassword()+"'");
           rs = st.getResultSet();
            System.out.println(obj.getEmail());
           rs.next();
            System.out.println(rs.getString(1));
           if(!rs.isAfterLast()){
               u.setId(rs.getInt(1));
               u.setEmail(rs.getString(2));
               u.setName(rs.getString(3));
               u.setBod(rs.getString(4));
               u.setPassword(rs.getString(5));
               u.setJob(rs.getString(6));
               u.setAddress(rs.getString(7));
               u.setInterests(rs.getString(8));
               u.setCredit(rs.getLong(9));
           }
            return u;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
     public int IsUserExist(Users obj, Connection con)
    {
        try {
            Statement st = con.createStatement();
            rs = st.executeQuery(" SELECT * FROM users WHERE email = '"+obj.getEmail()+"'");
            rs = st.getResultSet();
            if(rs.next()){
            return 0;  
               // user is exist
            }
            else
            {
                 // new user
             return 1;
            }
          } 
        catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
          return 0;
        }                    
    }
}
