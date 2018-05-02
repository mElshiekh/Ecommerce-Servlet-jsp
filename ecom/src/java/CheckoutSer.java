/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.BuyControl;
import DATABASELAYER.DAO.CartControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Buy;
import DATABASELAYER.DTO.Cart;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.cartProd;

/**
 *
 * @author Dell Laptop
 */
@WebServlet(urlPatterns = {"/CheckoutSer"})
public class CheckoutSer extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    CartControl cc = new CartControl();
    Users user = new Users();
    DatabaseManager d = new DatabaseManager();
    Connection con = d.getConn();
    ProductsControl pc = new ProductsControl();
    UsersControl uc = new UsersControl();
    BuyControl bc = new BuyControl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        List<Products> allProducts = new ArrayList<Products>();
        allProducts = pc.retrieveall(con);
        session.setAttribute("products", allProducts);
        long total = 0l;    
        Users user = (Users) session.getAttribute("user");
        Cart c = new Cart();
        int flag=0;
        if (user != null) {
            c.setUserId(user.getId());
        }
        ArrayList<Cart> cL = new ArrayList<Cart>();
        ArrayList<cartProd> cart = new ArrayList<cartProd>();
        cL = cc.retrieve(c, con);
        System.out.println("elsize" + cL.size());
        if (cL != null) {
            for (Cart cx : cL) {
                for (Products px : allProducts) {
                    System.out.println(px.getId());
                    if (px.getId() == cx.getProdId()) {
                        System.out.println("da5allaaaaaa");
                        total= total + (px.getPrice()*cx.getbQuantity());
                        System.out.println(total+"da eltotal");
                        System.out.println("user credit" + user.getCredit());
                        if(cx.getbQuantity()>px.getQuantity()){
                            flag=-1;
                        }
                    }
                }
            }
        }
        if(total>user.getCredit()){
            session.setAttribute("balance", -1);
            response.sendRedirect("Cart");
            System.out.println("elcredit 2olayel");
            flag=-1;
        }
        else if (cL != null && flag==0) {
            DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            for (Cart cx : cL) {
                for (Products px : allProducts) {
                    System.out.println(px.getId());
                    if (px.getId() == cx.getProdId()) {
                        Products temp = new Products();
                        temp.setId(px.getId());
                        temp.setCategory(px.getCategory());
                        temp.setDescription(px.getDescription());
                        temp.setName(px.getName());
                        temp.setPrice(px.getPrice());
                        temp.setQuantity(px.getQuantity()-cx.getbQuantity());
                        temp.setImage(px.getImage());
                        pc.update(temp, con);
                        Cart cDel = new Cart();
                        cDel.setProdId(cx.getProdId());
                        cDel.setUserId(user.getId());
                        cc.delete(cDel, con);
                        Buy b = new Buy();
                        b.setProdId(px.getId());
                        b.setUserId(user.getId());
                        b.setbQuantity(cx.getbQuantity());
                        b.setDate(sdf.format(date));
                        System.out.println(sdf.format(date) +"ya rab");
                        bc.create(b, con);
                    }
                }
            }
            session.invalidate();
            user.setCredit(user.getCredit()-total);
            session = request.getSession(true);
            session.setAttribute("user",user);
            uc.update(user, con);
            response.sendRedirect("index");
            //update eluser;
            //send to success page;
            //e3mel lkol page mn btoo3 eladmin elcheck 3lashan yd5ol aw y7wel lel login;
        }
        else if(flag==-1){
            response.sendRedirect("Cart");
        }
        else{
            session.invalidate();
            session = request.getSession(true);
            session.setAttribute("user",user);
            response.sendRedirect("index");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
