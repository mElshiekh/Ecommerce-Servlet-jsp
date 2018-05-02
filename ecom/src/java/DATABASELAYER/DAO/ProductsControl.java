/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DATABASELAYER.DAO;

import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Products;
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
public class ProductsControl {
    private Statement s;
    private PreparedStatement st;
    private ResultSet rs;
    private DatabaseManager managerObj;
    // photo not added yet
    public int create(Products obj, Connection con) {
        try {
            // photo not added yet
            st = con.prepareStatement("INSERT  INTO products (id, name, price, description, quantity, category, image)VALUES (?, ?, ?, ?, ?, ?, ?) ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getId());
            st.setString(2, obj.getName());
            st.setLong(3, obj.getPrice());
            st.setString(4,obj.getDescription());
            st.setInt(5, obj.getQuantity());
            st.setString(6,obj.getCategory());
            st.setString(7, obj.getImage());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int update(Products obj, Connection con) {
        try {
            // photo not added yet
            st = con.prepareStatement("update products set name = ?, price = ?, description = ?, quantity = ?, category = ?, image = ? where id = ? ", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setString(1, obj.getName());
            st.setLong(2, obj.getPrice());
            st.setString(3, obj.getDescription());
            st.setInt(4, obj.getQuantity());
            st.setString(5, obj.getCategory());
            st.setString(6, obj.getImage());
            st.setInt(7, obj.getId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public int delete (Products obj, Connection con){
        try {
            st = con.prepareStatement("delete from products where id = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
            st.setInt(1, obj.getId());
            st.executeUpdate();
            return 0;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return -1;
        }
    }
    public Products retrieve (Products obj, Connection con){
        try {
            Products p = new Products();
            Statement st = con.createStatement();
           rs = st.executeQuery(" SELECT * FROM products WHERE id = '"+obj.getId()+"'");
           rs = st.getResultSet();
           rs.next();
           if(!rs.isAfterLast()){
               p.setId(rs.getInt(1));
               p.setName(rs.getString(2));
               p.setPrice(rs.getLong(3));
               p.setImage(rs.getString(4));
               p.setDescription(rs.getString(5));
               p.setQuantity(rs.getInt(6));
               p.setCategory(rs.getString(7));
           }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public ArrayList<Products> retrieveall (Connection con){
        try {
            ArrayList<Products> p;
            p = new ArrayList<Products>();
            Statement st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM products");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               Products temp = new Products();
               temp.setId(rs.getInt(1));
               temp.setName(rs.getString(2));
               temp.setPrice(rs.getLong(3));
               temp.setImage(rs.getString(4));
               temp.setDescription(rs.getString(5));
               temp.setQuantity(rs.getInt(6));
               temp.setCategory(rs.getString(7));
               p.add(temp);
               rs.next();
           }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public ArrayList<String> retrieveCategories (Connection con){
        try {
            ArrayList<String> cat;
            cat = new ArrayList<String>();
            Statement st = con.createStatement();
           rs = st.executeQuery("SELECT DISTINCT category FROM products where quantity>0");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               cat.add(rs.getString(1));
               rs.next();
           }
            return cat;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
    public ArrayList<Products> retrieveByCat (String cat,Connection con){
        try {
            ArrayList<Products> p;
            p = new ArrayList<Products>();
            Statement st = con.createStatement();
           rs = st.executeQuery("SELECT * FROM products WHERE category = '"+ cat +"'");
           rs = st.getResultSet();
           rs.next();
           while(!rs.isAfterLast()){
               Products temp = new Products();
               temp.setId(rs.getInt(1));
               temp.setName(rs.getString(2));
               temp.setPrice(rs.getLong(3));
               temp.setImage(rs.getString(4));
               temp.setDescription(rs.getString(5));
               temp.setQuantity(rs.getInt(6));
               temp.setCategory(rs.getString(7));
               p.add(temp);
               rs.next();
           }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(UsersControl.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }
}
