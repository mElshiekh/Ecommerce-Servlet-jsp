/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATABASELAYER.DAO;

import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Cart;
import java.sql.Connection;
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
public class CartControl {
    private Statement s;
    private PreparedStatement st;
    private ResultSet rs;
    private DatabaseManager managerObj;
    public int create(Cart obj, Connection con) {
        try {
            st = con.prepareStatement("INSERT  INTO cart (userid, prodid, bquantity)VALUES (?, ?, ?) ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getUserId());
            st.setInt(2, obj.getProdId());
            st.setInt(3, obj.getbQuantity());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(CartControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int update (Cart obj, Connection con){
        try {
            st = con.prepareStatement("update cart set bquantity = ? where userid = ? and prodid = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getbQuantity());
            st.setInt(2, obj.getUserId());
            st.setInt(3, obj.getProdId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(CartControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int delete (Cart obj, Connection con){
        try {
            st = con.prepareStatement("delete from cart where userid = ? and prodid = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getUserId());
            st.setInt(2, obj.getProdId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(CartControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public int deleteAll (Cart obj, Connection con){
        try {
            st = con.prepareStatement("delete from cart where userid = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getUserId());
            st.setInt(2, obj.getProdId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(CartControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    
    public ArrayList<Cart> retrieve (Cart obj, Connection con){
        try {
            ArrayList<Cart> b;
            b = new ArrayList<Cart>();
            Statement st = con.createStatement();
           rs = st.executeQuery(" SELECT * FROM Cart WHERE userid = '"+obj.getUserId()+"'");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               Cart temp = new Cart();
               temp.setbQuantity(rs.getInt(1));
               temp.setUserId(rs.getInt(2));
               temp.setProdId(rs.getInt(3));
               b.add(temp);
               rs.next();
           }
            return b;
        } catch (SQLException ex) {
            Logger.getLogger(CartControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
  
}
