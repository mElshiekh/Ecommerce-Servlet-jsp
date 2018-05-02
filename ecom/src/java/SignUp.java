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
 * @author omnia samy
 */
@WebServlet(urlPatterns = {"/SignUp"})
public class SignUp extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        DatabaseManager DB = new DatabaseManager();
        Connection con = DB.getConn();
        UsersControl userCtrl = new UsersControl();

        String name = request.getParameter("_name");
        String email = request.getParameter("_email");
        String pass = request.getParameter("_pass");
        String job = request.getParameter("_jop");
        String add = request.getParameter("_add");
        String interests = request.getParameter("_inter");
        String dobs = request.getParameter("_bod");
        Users user = new Users();
        UsersControl userc = new UsersControl();
        user.setCredit(5000); //fixed
        user.setName(name);
        user.setEmail(email);
        user.setJob(job);
        user.setInterests(interests);
        user.setPassword(pass);
        user.setAddress(add);
        user.setBod(dobs);

        int j = userCtrl.IsUserExist(user, con);

        if (j == 1) {
            int i = userCtrl.create(user, con);
            if (i == 0) {
                HttpSession session = request.getSession(true);// create session if user inserted
                user = userc.retreiveByEmailAndPass(user, con);
                session.setAttribute("user", user);
                response.sendRedirect("login.jsp");
            }
        } else {
                response.sendRedirect("register.jsp?flage=User exists");
        }

    }

}
