<%-- 
    Document   : presentreport
    Created on : Mar 13, 2024, 10:12:51 PM
    Author     : DEll
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Present Report</title>
        <link rel="stylesheet" href="presentreport.css">
        <style>
            * {
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f2f2f2;
            }

            .container {
                max-width: 1200px;
                margin: 40px 40px;
                padding: 2rem;
                background-color:#d9dfe4;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 2);
                border-radius: 4px;
            }

            h1 {
                text-align: center;
                margin-bottom: 2rem;
                color: #070606;
                font-size: 40px;
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
                background-color: rgba(62, 75, 178, 0.685);
                color: rgb(11, 10, 10);
                margin-top: 10px;
                border-radius: 10px;
                padding: 10px;
            }

            form {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 10px;
                width: 800px;
                align-items: end;
                font-weight: 600;
            }

            form input {
                width: 200px;
            }

            form div {
                width: 100%;
            }

            form button {
                float: right;
                margin-top: 15px;
                margin-right: 90px;
                font-weight: 600;
                background-color: rgba(24, 15, 7, 0.329);
                color: rgb(11, 10, 10);
            }

            label {
                flex-basis: 18%;
                margin-bottom: 0.5rem;
                color: #4a4a4a;
            }

            select,
            button {
                flex-basis: 70%;
                padding: 10px;
                margin-bottom: 0.5rem;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #f2f2f2;
                color: #000000;
                cursor: pointer;

            }

            select:focus,
            button:focus {
                outline: none;
                background-color: #e6e6e6;
            }

            select:hover,
            button:hover {
                background-color: #e6e6e6;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            th,
            td {

                text-align: left;
                padding: 0.5rem;
                border-bottom: 1px solid #e0e0e0;
            }

            th {
                background-color: #f2f2f2;
                color: #4a4a4a;
                font-weight: bold;
            }

            td {
                color: #4a4a4a;
            }

            .header{
                display: flex;
                justify-content: space-between;
                align-items: start;

            }

            .nav-logo {
                background-color: rgba(0, 0, 0, 0.219);
                text-align: center;
                padding: 10px;
                border-radius: 5px;

            }
            .nav-logo img{
                width: 40%;

            }
            .sign-out-btn{
                margin-right: 30px;
                margin-top: 20px;
            }
            .sign-out-btn a{
                padding: 7px;
                font-size: 15px;
                border-radius: 5px;
                border: none;
                background-color: rgba(0, 0, 0, 0.306);
                color: black;
                text-decoration: none;

            }

            .nav-content a{
                text-decoration: none;

                margin-right: 15px;
                background-color: rgb(241, 151, 5);
                color: rgb(255, 255, 255);
                padding: 5px 10px;
                border-radius: 3px;

            }
            .nav-content{
                display: flex;
                justify-content: space-between;
                margin-top: 12px;
                padding: 0px 30px;

            }
        </style>
    </head>

    <body>
        <div class="header">
            <div class="nav">
                <div class="nav-content">
                    <a href="../homelecturer">Home</a>
                    <a href="../lecturer/timetable?id=${sessionScope.lecturer.id}">Timetable</a>
                </div>
            </div>
            <div class="sign-out-btn">
                <a href="../logout">Sign out</a>
            </div>
        </div>
        <div class="container">
            <h1>View Attendance</h1>
            <form action="../lecturer/presentreport" method="get">
                <label for="term">Select a term:</label>
                <select id="term">
                    <option value="fall2023">Fall 2023</option>
                    <option value="spring2024">Spring 2024</option>
                    <!-- Add more terms here -->
                </select> <br />
                <label for="course">Select a course:</label>
                <select id="course" name="groupchoosen">
                    <c:forEach items="${studentgroup}" var="group">
                        <c:choose>
                            <c:when test="${groupchoosen == group.id}">
                                <option value="${group.id}" selected="">${group.getName()}-${group.subject.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${group.id}">${group.getName()}-${group.subject.name}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select> <br />
                <div>
                    <button type="submit" id="submit">See Report</button>
                </div>
            </form>
            <table id="gradeReport">
                <thead>
                    <tr>
                        <th>ID</th>				
                        <th>Name</th>
                        <th>Alert</th>
                            <c:set var="counter" value="0" />
                            <c:forEach items="${listLession}" var="l" >
                                <c:set var="counter" value="${counter + 1}" />
                            <th title="${l.date}">${counter}</th>
                            </c:forEach>
                        <th>Total</th>



                    </tr>
                    <c:forEach items="${listStudent}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <td><button style="padding: 2px 5px">Send Email</button></td>
                            <c:forEach items="${listLession}" var="les" >
                                <c:forEach items="${listAttendence}" var="atten">
                                    <c:if test="${atten.lession.id == les.id && atten.student.id == student.id}">
                                        <td>${atten.present ? 'P' : 'A'}</td>
                                    </c:if>
                                </c:forEach>
                            </c:forEach>
                            <td>..%</td>

                        </tr>

                    </c:forEach>
                    <tr>

                    </tr>
                </thead>
            </table>
            <h4></h4>

        </div>

        <script>
            window.onload = function () {
                // Get the table by its ID
                var table = document.getElementById('gradeReport');

                // Loop over the rows in the table
                for (var i = 1, row; row = table.rows[i]; i++) {
                    // Start at the first attendance column index, which is 2 in this case
                    var countA = 0;
                    var totalColumns = 0;

                    // Loop over the cells in the current row
                    for (var j = 2, col; col = row.cells[j]; j++) {
                        // Count only the attendance columns, exclude the 'Total' column
                        if (j < row.cells.length - 1) {
                            totalColumns++;
                            if (col.textContent === 'A') {
                                countA++;
                            }
                        }
                    }

                    // Calculate the percentage of 'A's
                    var percentage = (countA / 20) * 100;

                    // Update the 'Total' cell with the percentage and color code the cell
                    var totalCell = row.cells[row.cells.length - 1];
                    totalCell.textContent = percentage.toFixed(0) + '%';

                    if (percentage > 20) {
                        // Cells with more than 20% 'A's are red
                        totalCell.style.color = 'red';            // Set text color to white for better readability
                    } else {
                        // Cells with 20% or less 'A's are green
                        totalCell.style.color = 'green';            // Set text color to white for better readability
                    }
                }
            };
        </script>
    </body>

</html>

