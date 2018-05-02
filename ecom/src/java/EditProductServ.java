/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DTO.Buy;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(urlPatterns = {"/EditProductServ"})
public class EditProductServ extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

          HttpSession session = request.getSession(true); // to be remove
        Users user = new Users();
        user = (Users) session.getAttribute("userAdmin");
        if (user==null)
        {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
        int productid = Integer.parseInt( request.getParameter("prodId"));
        Products product = new Products();
        ArrayList<Products> allProducts = (ArrayList<Products>) session.getAttribute("products");
        int flag = 0;
        for (int i = 0 ; i < allProducts.size();i++){
         if (productid== allProducts.get(i).getId()){
           product = allProducts.get(i);
           flag = 1;
        session.setAttribute("product", product);
        RequestDispatcher rd = request.getRequestDispatcher("editProducts.jsp");
        rd.include(request, response);
            }
        }
        if(flag==0)
        response.sendRedirect("404.jsp");
     }
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
