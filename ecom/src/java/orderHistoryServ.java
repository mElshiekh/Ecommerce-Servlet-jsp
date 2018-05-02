/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.BuyControl;
import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Buy;
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

/**
 *
 * @author Java Champion
 */
@WebServlet(urlPatterns = {"/orderHistoryServ"})
public class orderHistoryServ extends HttpServlet {
    BuyControl bc = new BuyControl();

   
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
            PrintWriter out = response.getWriter();
        Buy b = new Buy();
        String s1 = request.getParameter("hi");
        int id = Integer.parseInt(s1);
        System.out.println(id);
        b.setUserId(id);
          DatabaseManager d = new DatabaseManager();
        Connection con = d.getConn();
          List<Buy> allUser = (List<Buy>) request.getAttribute("alls");
            if (allUser == null) {
                allUser = new ArrayList<Buy>();
                allUser = bc.retrievealluser(b,con) ;
                request.setAttribute("alls", allUser);
            }
        
        RequestDispatcher rd = request.getRequestDispatcher("showUserData.jsp");
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
