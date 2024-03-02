<%-- 
    Document   : timetable
    Created on : Feb 28, 2024, 5:01:32 PM
    Author     : sonnt
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
body {
    font-family: 'Arial', sans-serif;
    background-color: rose;
    margin: 0;
    padding: 0;
}

h1 {
    color: #333;
}

form {
    margin-bottom: 20px;
}

table {
    width: 800px; /* Giới hạn chiều rộng của bảng */
    margin: 20px auto; /* Canh giữa bảng */
    border-collapse: collapse;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    overflow-x: scroll;
}

th, td {
    padding: 15px;
    text-align: left;
    border: 1px solid #ddd;
    border-width: 0.5px; /* Điều chỉnh kích thước của border tại đây */
}

th {
    background-color: #3498db;
    color: white;
}

td {
    background-color: #fff;
}

a {
    color: #3498db;
    text-decoration: none;
    transition: color 0.3s ease-in-out;
}

a:hover {
    color: #2070a7;
    text-decoration: underline;
}


        </style>
    </head>
    <body>
        <h1>Lecturer name: ${sessionScope.account.displayname}</h1>
        <form action="timetable" method="GET">
            <input type="hidden" value="1" name="id"/>
            From: <input type="date" name="from" value="${requestScope.from}"/> -
            <input type="date" name="to" value="${requestScope.to}"/>
            <input type="submit" value="View"/>
        </form>
        <table border="1px">
            <tr>
                <td></td>
                <!--hang dau tien in ra date sau khi lap qua array list dates-->
                <c:forEach items="${requestScope.dates}" var="d">
                    <td>
                (<fmt:formatDate pattern="E" value="${d}" />)
                        ${d}</td>
                </c:forEach>
            </tr>
            <!--Lap qua mang arraylisst các slot-->
            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.lessions}" var="les">
                                <c:if test="${les.date eq d and les.slot.id eq slot.id}">
                                    ${les.group.name} - ${les.group.subject.name}
                                   
                                    <a href="att?id=${les.id}">
                                        <c:if test="${les.attended}">Edit</c:if>
                                        <c:if test="${!les.attended}">Take</c:if>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
