/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.BuyControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Buy;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
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
import util.BuyProd;

/**
 *
 * @author Dell Laptop
 */
@WebServlet(urlPatterns = {"/setProfile"})
public class setProfile extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    BuyControl bc = new BuyControl();
    Users user = new Users();
    DatabaseManager d = new DatabaseManager();
    Connection con = d.getConn();
    ProductsControl pc = new ProductsControl();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
            List<Products> allProducts = (List<Products>) session.getAttribute("products");
            ArrayList<BuyProd> bProds = new ArrayList<BuyProd>();
            ArrayList<Buy> buy = new ArrayList<Buy>();
            user = (Users) session.getAttribute("user");
            Buy b = new Buy();
            b.setUserId(user.getId());
            buy = bc.retrievealluser(b, con);
            if(buy!=null){
            for(Buy bT:buy){
                for(Products pT:allProducts){
                    if(bT.getProdId()==pT.getId()){
                        BuyProd temp = new BuyProd();
                        temp.setId(pT.getId());
                        temp.setCategory(pT.getCategory());
                        temp.setName(pT.getName());
                        temp.setDescription(pT.getDescription());
                        temp.setQuantity(bT.getbQuantity());
                        temp.setDate(bT.getDate());
                        temp.setImage(pT.getImage());
                        bProds.add(temp);
                    }
                }
            }
            }
            session.setAttribute("bProds", bProds);
        RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
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
