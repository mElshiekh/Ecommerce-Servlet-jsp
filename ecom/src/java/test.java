
import DATABASELAYER.DAO.BuyControl;
import DATABASELAYER.DAO.CartControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Buy;
import DATABASELAYER.DTO.Cart;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import java.sql.Connection;
import java.util.ArrayList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Dell Laptop
 */
public class test {
 
    public static void main(String[] args) {
        Users us = new Users();
        Users g = new Users();
        ArrayList<Users> c = new ArrayList<Users>();
        DatabaseManager d = new DatabaseManager();
        Connection con = d.getConn();
        UsersControl uC = new UsersControl();
        //create users
        /*us.setEmail("champ");
        us.setPassword("champ");
        us.setBod("18/10/22");
        us.setAddress("ay 7aga");
        us.setCredit(3000);
        us.setInterests("jhsdjkhsakdasd");
        us.setName("champ");
        us.setJob("asjdshda");
        //retrieve by email&pass and update and retrieve users
        us.setEmail("champ");
        us.setPassword("champ");
        us = uC.retreiveByEmailAndPass(us, con);
        us.setEmail("champ");
        us.setPassword("champ");
        us.setBod("11/11/1990");
        us.setAddress("ay 7aga");
        us.setCredit(3000);
        us.setInterests("jhsdjkhsakdasd");
        us.setName("champ");
        us.setJob("asjdshda");
        int i = uC.update(us, con);
        us = uC.retrieve(us, con);
        // retrieve all users
        c = uC.retrieveall(con);
        //delete users
        us.setEmail("champ");
        us.setPassword("champ");
        us = uC.retreiveByEmailAndPass(us, con);
        int i = uC.delete(us, con);
        System.out.println(i);
        //System.out.println(i);*/
        /*Products p = new Products();
        p.setName("product 2");
        p.setPrice(3000);
        p.setCategory("khodar 14");
        p.setDescription("ay kalam");
        p.setQuantity(10);
        Products p2 = new Products();
        p.setId(4);
        ArrayList<Products> p3 = new ArrayList<Products>();
        ProductsControl pc = new ProductsControl();
        p3 = pc.retrieveall(con);
        System.out.println(p3.get(0).getDescription());
        //System.out.println(p3.size());
        //////////
        Buy b = new Buy();
        Buy b2 = new Buy();
        ArrayList<Buy> ba = new ArrayList<Buy>();
        BuyControl bc = new BuyControl();
        //b.setDate("5/2/2018");
        //b.setProdId(4);
        b.setUserId(1);
        //b.setbQuantity(27);
        
        ba = bc.retrievealluser(b,con);
        System.out.println(ba.get(0).getbQuantity());*/
        //////////
        Cart c1 = new Cart();
        Cart c2 = new Cart();
        ArrayList<Cart> ca = new ArrayList<Cart>();
        CartControl cc = new CartControl();
        c1.setUserId(1);
        c1.setProdId(4);
        c1.setbQuantity(4);
        cc.create(c1, con);
    }
}
