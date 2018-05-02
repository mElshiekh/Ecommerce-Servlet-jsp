/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATABASELAYER.DAO;

import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Buy;
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
public class BuyControl {
    private Statement s;
    private PreparedStatement st;
    private ResultSet rs;
    private DatabaseManager managerObj;
    public int create(Buy obj, Connection con) {
        try {
            st = con.prepareStatement("INSERT  INTO buy (userid, prodid, bquantity, dop)VALUES (?, ?, ?, ?) ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getUserId());
            st.setInt(2, obj.getProdId());
            st.setInt(3, obj.getbQuantity());
            st.setString(4, obj.getDate());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(BuyControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int update (Buy obj, Connection con){
        try {
            st = con.prepareStatement("update buy set bquantity = ? where userid = ? and prodid = ? and dop = ? ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getbQuantity());
            st.setInt(2, obj.getUserId());
            st.setInt(3, obj.getProdId());
            st.setString(4, obj.getDate());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(BuyControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int delete (Buy obj, Connection con){
        try {
            st = con.prepareStatement("delete from buy where userid = ? and prodid = ? and dop = ? ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getUserId());
            st.setInt(2, obj.getProdId());
            st.setString(3, obj.getDate());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(BuyControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public ArrayList<Buy> retrievealluser (Buy obj, Connection con){
        try {
            ArrayList<Buy> b;
            b = new ArrayList<Buy>();
            Statement st = con.createStatement();
           rs = st.executeQuery(" SELECT * FROM Buy WHERE userid = '"+obj.getUserId()+"'");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               Buy temp = new Buy();
               temp.setbQuantity(rs.getInt(1));
               temp.setDate(rs.getString(2));
               temp.setUserId(rs.getInt(3));
               temp.setProdId(rs.getInt(4));
               b.add(temp);
               rs.next();
           }
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(BuyControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public Buy retrieve (Buy obj, Connection con){
        try {
            Buy b = new Buy();
            Statement st = con.createStatement();
           rs = st.executeQuery(" SELECT * FROM Buy WHERE userid = '"+obj.getUserId()+"' and prodid = '"+obj.getProdId()+"' and dop = '"+obj.getDate()+"'");
           rs = st.getResultSet();
           rs.next();
           if(!rs.isAfterLast()){
               b.setbQuantity(rs.getInt(1));
               b.setDate(rs.getString(2));
               b.setUserId(rs.getInt(3));
               b.setProdId(rs.getInt(4));
           }
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(BuyControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public ArrayList<Buy> retrieveall (Connection con){
        try {
            ArrayList<Buy> b;
            b = new ArrayList<Buy>();
            Statement st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM Buy ");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               Buy temp = new Buy();
               temp.setbQuantity(rs.getInt(1));
               temp.setDate(rs.getString(2));
               temp.setUserId(rs.getInt(3));
               temp.setProdId(rs.getInt(4));
               b.add(temp);
               rs.next();
           }
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(BuyControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
