/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DAO.ProductsControl;
import DATABASELAYER.DATABASEMANAGER.DatabaseManager;
import DATABASELAYER.DTO.Products;
import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Java Champion
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(urlPatterns = {"/addProductServ"})
public class addProductServ extends HttpServlet {

    ProductsControl pc = new ProductsControl();
    DatabaseManager d = new DatabaseManager();
    Connection con = d.getConn();

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
        HttpSession session = request.getSession(true); // to be remove
        Users user = new Users();
        user = (Users) session.getAttribute("userAdmin");
        if (user == null) {
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response);
        }
        String productName = request.getParameter("ProductName");
        String productCategory = request.getParameter("ProductCategory");
        String pPrice = request.getParameter("ProductPrice");
        String pQuantity = request.getParameter("ProductQuantity");
        String productDescription = request.getParameter("ProductDescription");
        Pattern r = Pattern.compile("^[0-9]*$");
        Matcher pp = r.matcher(pPrice);
        Matcher pq = r.matcher(pQuantity);
        if (!pp.find()) {
            session.setAttribute("invadd", "quant");
            response.sendRedirect("addproducts.jsp");
        } else if (!pq.find()) {
            session.setAttribute("invadd", "price");
            response.sendRedirect("addproducts.jsp");
        } else {
            long productPrice = Long.parseLong(pPrice);
            int productQuantity = Integer.parseInt(pQuantity);
            String path = request.getServletContext().getRealPath("") + "images\\";
            System.out.println(path + " how da elpath");
            Part filePart = request.getPart("photo");
            String fileName = productName + (String) getFileName(filePart);
            filePart.write(path + fileName);
            Products obj = new Products();
            obj.setName(productName);
            obj.setCategory(productCategory);
            obj.setPrice(productPrice);
            obj.setQuantity(productQuantity);
            obj.setDescription(productDescription);
            obj.setImage(fileName);
            pc.create(obj, con);

            session.invalidate();
            session = request.getSession(true);
            session.setAttribute("userAdmin", user);
            response.sendRedirect("HomeAdmin");
        }
    }

    private String getFileName(final Part part) {
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                //return content.substring(
                //content.indexOf('=') + 1).trim().replace("\"", "");
                String str = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                return str.substring(str.indexOf('.'));
            }
        }
        return null;
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

//        response.sendRedirect();
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
