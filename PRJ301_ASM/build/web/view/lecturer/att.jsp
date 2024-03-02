<%-- 
    Document   : att
    Created on : Mar 3, 2024, 12:54:02 AM
    Author     : DEll
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="att" method="POST">
            <input type="hidden" name="id" value="${param.id}" />
            <table border="1px">
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Presented</td>
                    <td>Note</td>
                    <td>Time</td>
                </tr>
                <c:forEach items="${sessionScope.atts}" var="a">
                    <tr>
                        <td>${a.student.id}</td>
                        <td>${a.studnet.name}</td>
                        <td>
                            <input type="radio" ${!a.present?"checked=\"checked\"":""}
                                   name="present${a.student.id}" value="no/"> No
                            <input type="radio" ${!a.present?"checked=\"checked\"":""}
                                   name="present${a.student.id}" value="yes/"> Yes


                        </td>
                        <td>
                            <input type="text" name="description${a.student.id}" value="${a.student.id}"/>
                        </td>
                        <td>${a.time}</td>
                    </tr>

                </c:forEach>
            </table>
            <input type="submit" value="Save"/>
    </body>
</html>
