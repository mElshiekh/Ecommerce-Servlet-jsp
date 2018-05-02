/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.CartControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import DATABASELAYER.DTO.Cart;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet(urlPatterns = {"/Cart"})
public class Cartset extends HttpServlet {

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

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        //List<Products> allProducts = (List<Products>) session.getAttribute("products");
        List<Products> allProducts = (List<Products>) session.getAttribute("products");
        if (allProducts == null) {
            allProducts = new ArrayList<Products>();
            allProducts = pc.retrieveall(con);
            
        }
        ArrayList<Products> products = new ArrayList<Products>();
        for(Products p:allProducts){
            File img = new File(request.getServletContext().getRealPath("")+"images\\"+p.getImage());
            if(p.getImage()==null || !img.exists()){
                p.setImage("nopro.jpg");
                
            }
            products.add(p);
        }
        session.setAttribute("products", products);
            
        Users user = (Users) session.getAttribute("user");
        Cart c = new Cart();
        if (user != null) {
            c.setUserId(user.getId());
        }
        ArrayList<Cart> cL = new ArrayList<Cart>();
        ArrayList<cartProd> cart = new ArrayList<cartProd>();
        cL = cc.retrieve(c, con);
        if (cL != null) {
            for (Cart cx : cL) {
                for (Products px : products) {
                    System.out.println(px.getId());
                    if (px.getId() == cx.getProdId()) {
                        cartProd temp = new cartProd();
                        temp.setId(px.getId());
                        temp.setName(px.getName());
                        temp.setCategory(px.getCategory());
                        temp.setDescription(px.getDescription());
                        temp.setPrice(px.getPrice());
                        temp.setQuantity(cx.getbQuantity());
                        temp.setavQuantity(px.getQuantity());
                        temp.setImage(px.getImage());
                        cart.add(temp);
                    }
                }
            }
        }
        session.setAttribute("cartx", cart);
        RequestDispatcher rd = request.getRequestDispatcher("Cart.jsp");
        rd.include(request, response);
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
