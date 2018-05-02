/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.BuyControl;
import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
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
@WebServlet(urlPatterns = {"/Charge"})
public class Charge extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    UsersControl uc = new UsersControl();
    Users user = new Users();
    DatabaseManager d = new DatabaseManager();
    Connection con = d.getConn();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        Users user = (Users) session.getAttribute("user");
        String card = request.getParameter("card");
        System.out.println(card+ "yarab");
        Pattern r = Pattern.compile("^[0-9]*$");
        Matcher cm = r.matcher(card);
        long val = 0;
        if(cm.find()){
        System.out.println(Long.parseLong(card));
        val = Long.parseLong(card);
        System.out.println(val);
        }
        //
        if(card.length()==14){
            System.out.println(val);
            if(val%2000==0){
                user.setCredit(user.getCredit()+2000);
                session.setAttribute("user",user);
                session.setAttribute("charged", "0");
                uc.update(user, con);
                System.out.println("et722 2000");
            }
            else if(val%1000==0){
                user.setCredit(user.getCredit()+1000);
                session.setAttribute("user",user);
                session.setAttribute("charged", "0");
                uc.update(user, con);
                System.out.println("et722 1000");
            }
            else if(val%500==0){
                user.setCredit(user.getCredit()+500);
                session.setAttribute("user",user);
                session.setAttribute("charged", "0");
                uc.update(user, con);
                System.out.println("et722 500");
            }
            else if(val%200==0){
                user.setCredit(user.getCredit()+200);
                session.setAttribute("user",user);
                session.setAttribute("charged", "0");
                uc.update(user, con);
                System.out.println("et722 200");
            }
            else if(val%100==0){
                user.setCredit(user.getCredit()+100);
                session.setAttribute("user",user);
                session.setAttribute("charged", "0");
                uc.update(user, con);
                System.out.println("et722 100");
            }
            else if(val%50==0){
                user.setCredit(user.getCredit()+50);
                session.setAttribute("user",user);
                session.setAttribute("charged", "0");
                uc.update(user, con);
                System.out.println("et722 50");
            }
            else{
                session.setAttribute("charged", "-1");
            }
            
        }
        else{
                session.setAttribute("charged", "-1");
            }
        response.sendRedirect("setProfile");
       
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
