/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.sql.Connection;
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
@WebServlet(urlPatterns = {"/UserLogin"})
public class UserLogin extends HttpServlet {

    UsersControl uc = new UsersControl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        DatabaseManager d = new DatabaseManager();
        Connection con = d.getConn();
        System.out.println(con);
        Users us = new Users();
        Users newUser = new Users();
        String email = request.getParameter("email");
        String password = request.getParameter("pass");
        us.setEmail(email);
        us.setPassword(password);
        newUser = uc.retreiveByEmailAndPass(us, con);
        if (newUser == null) {
        response.sendRedirect("login.jsp?flage=You Entered A Wrong Data");
        } 
        else {
            session.setAttribute("user", newUser);
            response.sendRedirect("checkCookies");            
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
