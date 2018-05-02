<%-- 
    Document   : showAll
    Created on : Feb 6, 2018, 3:40:55 PM
    Author     : Java Champion 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
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
                    <th>id</th>
                    <th>email</th>
                    <th>name</th>
                    <th>password</th>
                    <th>credit</th>
                    <th>bod</th>
                    <th>address</th>
                    <th>interests</th>
                    <th>job</th>

                </tr>

                <c:forEach items="${all}" var="user">
                    <tr>
                        <td onclick="/orderHistoryServ?flag=${user.id}"><c:out value="${user.id}"/></td>
                        <td><c:out value="${user.email}"/></td>
                        <td><c:out value="${user.name}"/></td>
                        <td><c:out value="${user.password}"/></td>
                        <td><c:out value="${user.credit}"/></td>
                        <td><c:out value="${user.bod}"/></td>
                        <td><c:out value="${user.address}"/></td>
                        <td><c:out value="${user.interests}"/></td>
                        <td><c:out value="${user.job}"/></td>
                    </tr>
                </c:forEach>


            </table>


        </div>
    </body>
</html>
