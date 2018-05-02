/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.CartControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Cart;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
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

/**
 *
 * @author Java Champion
 */
@WebServlet(urlPatterns = {"/HomeAdmin"})
public class HomeAdmin extends HttpServlet {

    ProductsControl pc = new ProductsControl();
    CartControl cc = new CartControl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
          HttpSession session = request.getSession(true); // to be remove
        Users user = new Users();
        user = (Users) session.getAttribute("userAdmin");
        if (user==null){
            user = (Users) session.getAttribute("user");
            if (user==null)
            response.sendRedirect("login.jsp");
            else
                response.sendRedirect("index");
        }
//        user.setId(1);
//        user.setCredit(3000);
//        user.setName("ay7agaj");
//        user.setEmail("ay7agaj");
        //
        DatabaseManager d = new DatabaseManager();
        Connection con = d.getConn();
        //session.setAttribute("user", user);
        List<Products> allProducts = new ArrayList<Products>();
            allProducts = pc.retrieveall(con);
            
       
        ArrayList<Products> products = new ArrayList<Products>();
        if(allProducts!=null){
        for(Products p:allProducts){
            File img = new File(request.getServletContext().getRealPath("")+"images\\"+p.getImage());
            System.out.println(img.exists()+ "ya rab");
            if(p.getImage()==null  || !img.exists()){
                p.setImage("nopro.jpg");  
            }
            products.add(p);
        }
        }
        session.setAttribute("products", products);
        
        List<String> allCategories = (List<String>) session.getAttribute("categories");
            if (allCategories == null) {
                allCategories = new ArrayList<String>();
                allCategories = pc.retrieveCategories(con) ;
                session.setAttribute("categories", allCategories);
            }
        RequestDispatcher rd = request.getRequestDispatcher("HomeAdmin.jsp");
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
