/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author omnia
 */
@WebServlet(name = "Delete_product", urlPatterns = {"/deleteProductServ"})
public class deleteProductServ extends HttpServlet {

    ProductsControl pc = new ProductsControl();
    DatabaseManager d = new DatabaseManager();
        Connection con = d.getConn();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

          HttpSession session = request.getSession(true); // to be remove
        Users user = new Users();
        user = (Users) session.getAttribute("userAdmin");
        if (user==null)
        {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
        Products obj = new Products();
        obj = (Products) session.getAttribute("product");
        obj.setQuantity(-1);
        pc.update(obj, con);
        session.invalidate();
        session = request.getSession(true);
        session.setAttribute("userAdmin", user);
        response.sendRedirect("HomeAdmin");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
