/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import DATABASELAYER.DAO.CartControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Cart;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell Laptop
 */
@WebServlet(name = "AddToCart", urlPatterns = {"/AddToCart"})
public class AddToCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        DatabaseManager d = new DatabaseManager();
        Connection con = d.getConn();
        CartControl cc = new CartControl();
        ProductsControl pc = new ProductsControl();
        try {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession(true);
            Users user = (Users) session.getAttribute("user");
            int x = Integer.parseInt(request.getParameter("prodId"));
            int quant = Integer.parseInt(request.getParameter("quant"));
            Cart c = new Cart();
            c.setUserId(user.getId());
            int max=0;
            List<Products> allProducts = (List<Products>) session.getAttribute("products");
        if (allProducts == null) {
            allProducts = new ArrayList<Products>();
            allProducts = pc.retrieveall(con);
            session.setAttribute("products", allProducts);
            
        }
        
        int flag = 0;
        
        for(Products p: allProducts){
            if(p.getId()== x){
                max = p.getQuantity();
                flag = 1;
            }
        }
        if(flag==0){
            response.sendRedirect("404.jsp");
        }
            List<Cart> cart = cc.retrieve(c, con);
            int found = -1;
            if (quant == -1) {
                if (cart != null) {
                    for (Cart cx : cart) {
                        if (cx.getProdId() == x) {
                            cx.setbQuantity(cx.getbQuantity() + 1);
                            if(cx.getbQuantity()>max){
                                cx.setbQuantity(max);
                            }
                            cc.update(cx, con);
                            found = 1;
                        }
                    }
                }
                if (found == -1) {
                    c.setProdId(x);
                    c.setUserId(user.getId());
                    c.setbQuantity(1);
                    if(c.getbQuantity()<=max){
                        cc.create(c, con);
                    }
                }
                response.sendRedirect("index");
            }
            else if(quant>0){
                if (cart != null) {
                    for (Cart cx : cart) {
                        if (cx.getProdId() == x) {
                            cx.setbQuantity(quant);
                            if(cx.getbQuantity()>max){
                                cx.setbQuantity(max);
                            }
                            cc.update(cx, con);
                            found = 1;
                        }
                    }
                }
                if (found == -1) {
                    c.setProdId(x);
                    c.setUserId(user.getId());
                    c.setbQuantity(quant);
                    if(c.getbQuantity()<=max){
                        cc.create(c, con);
                    }
                }
                response.sendRedirect("Cart");
            }
            else if(quant==0){
                Cart cDel = new Cart();
                cDel.setProdId(x);
                cDel.setUserId(user.getId());
                cc.delete(cDel, con);
                response.sendRedirect("Cart");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("page404.jsp");
        }
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
