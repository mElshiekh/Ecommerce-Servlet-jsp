/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import DATABASELAYER.DTO.Users;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Java Champion
 */
//urlPatterns = "/uploadFilter",
//        initParams = @WebInitParam(name = "fileTypes", value = "doc;xls;zip;txt;jpg;png;gif"
//@WebFilter(urlPatterns ={"/*"},initParams = (@WebInitParam(name="name",name="password" ,value="Filtering"))
//                ,initParams = @WebInitParam(name = "fileTypes", value = "")
@WebFilter(servletNames = { "UserLogin"})

public class Filtering implements Filter {

    FilterConfig filterConfig;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("Filter INIT");
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse res = (HttpServletResponse) response;
              HttpServletRequest req = (HttpServletRequest)request; 
        
        HttpSession session = req.getSession();

        System.out.println("Filter doFilter");
        PrintWriter out = response.getWriter();
        String userName = request.getParameter("email");
        String password = request.getParameter("pass");
        if (userName==null|| password==null) {
            RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
        rd.forward(req, res);
        }
        System.out.println("ya rab");
        System.out.println(userName+"name");
        System.out.println(password+"pass");
        if (userName.equals("admin") && password.equals("admin")) {
            Users us = new Users();
            us.setEmail(userName);
            us.setPassword(password);
            session.setAttribute("userAdmin", us);
           // RequestDispatcher rd = req.getRequestDispatcher("checkCookies");
        //rd.forward(req, res);
        res.sendRedirect("checkCookies");

        } else {
            chain.doFilter(request, response);

        }

    }

    @Override
    public void destroy() {
        System.out.println("Filter DESTROY");

    }

}
