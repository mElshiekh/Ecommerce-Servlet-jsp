<%-- 
    Document   : userData
    Created on : Feb 6, 2018, 9:17:15 PM
    Author     : Java Champion 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
    <c:if test="${userAdmin.Email!='admin'}">
    <c:redirect url="index"></c:redirect>
    </c:if>
    <c:if test="${userAdmin.Password!='admin'}">
        <c:redirect url="index"></c:redirect>
    </c:if>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <style>
            table {
                font-family: arial, sans-serif;
                border-collapse: collapse;
                width: 100%;
            }

            td, th {
                border: 1px solid #dddddd;
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even) {
                background-color: #dddddd;
            }
        </style>
        
    </head>
    <body>
       
        
          <div align="center">

            <table>
                <tr>
                    <th>user id</th>
                    <th>product id</th>
                    <th>quantity</th>
                    <th>date</th>
                </tr>

                <c:forEach items="${alls}" var="user">
                    <tr>
                        <td><c:out value="${user.userId}"/></td>
                        <td><c:out value="${user.prodId}"/></td>
                        <td><c:out value="${user.bQuantity}"/></td>
                        <td><c:out value="${user.date}"/></td>

                    </tr>
                </c:forEach>


            </table>

    </body>
</html>
