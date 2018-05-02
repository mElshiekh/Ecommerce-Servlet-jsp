/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.UsersControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import jdk.nashorn.internal.ir.RuntimeNode;

/**
 *
 * @author omnia
 */
@WebServlet(name = "Profile", urlPatterns = {"/Profile"})
public class Profile extends HttpServlet {

    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String pass = request.getParameter("pass");
        String job = request.getParameter("job");
        String add = request.getParameter("address");
        String interst = request.getParameter("interest");
        String credit = (request.getParameter("credit"));

        Users uobj = (Users) request.getSession(false).getAttribute("user");
        uobj.setName(name);
        uobj.setEmail(email);
        uobj.setBod(dob);
        uobj.setPassword(pass);
        uobj.setJob(job);
        uobj.setAddress(add);
        uobj.setInterests(interst);
        uobj.setCredit(Long.parseLong(credit));

        UsersControl conn = new UsersControl();
        DatabaseManager b = new DatabaseManager();
        conn.update(uobj, b.getConn());
        response.sendRedirect("setProfile");
    }

}
