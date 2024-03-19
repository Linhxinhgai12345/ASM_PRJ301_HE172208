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
                    <a href="../student/timetable?id=${sessionScope.student.id}">Timetable</a>
                    <a href="../student/markreport">Report Mark</a>
                </div>
            </div>
            <div class="sign-out-btn">
                <a href="../logout">Sign out</a>
            </div>
        </div>
        <div class="container">
            <h1>Present Report</h1>
            <form action="../student/presentreport" method="get">
                <label for="term">Select a term:</label>
                <select id="term">
                    <option value="fall2023">Fall 2023</option>
                    <option value="spring2024">Spring 2024</option>
                    <!-- Add more terms here -->
                </select> <br />
                <label for="course">Select a course:</label>
                <select id="course" name="groupchoosen">
                    <c:forEach items="${listgroup}" var="group">
                        <c:choose>
                            <c:when test="${groupchoosen == group.subject.id}">
                                <option value="${group.id}" selected="">
                                    ${group.getName()}-${group.subject.name}
                                </option>
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
                        <th>SLOT</th>				
                        <th>DATE</th>
                        <th>ROOM</th>
                        <th>LECTURER</th>
                        <th>Status</th>


                    </tr>
                </thead>
                <tbody>
                    <c:set var="counter" value="0" />
                    <c:forEach items="${listLession}" var="lession" >
                        <tr>
                            <td><c:set var="counter" value="${counter + 1}"/>${counter}</td>
                            <td>${lession.date}</td>
                            <td>${lession.room.name}</td>
                            <td>${lession.lecturer.name}</td>
                            <c:forEach items="${listAttendence}" var="atten">
                                <c:if test="${atten.lession.id == lession.id && atten.student.id == sessionScope.student.id}">
                                    <c:choose>
                                        <c:when test="${atten.present}">
                                            <td style="color: green">Present</td>
                                        </c:when>
                                        <c:when test="${!atten.present}">
                                            <td style="color: red">Absent</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>Not Yet</td>
                                        </c:otherwise>
                                    </c:choose>    

                                </c:if>
                            </c:forEach>
                            <td></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
            <h4></h4>

        </div>

        <script>
            window.addEventListener('DOMContentLoaded', (event) => {
                calculateAttendancePercentage();
            });

            function calculateAttendancePercentage() {
                var absentCount = 0;
                var totalSlots = 20; // Tổng số buổi là 20

                // Lặp qua mỗi dòng trong bảng
                var tableRows = document.querySelectorAll('#gradeReport tbody tr');
                tableRows.forEach(function (row) {
                    // Lấy giá trị của cột "Status"
                    var statusCell = row.querySelector('td:nth-child(5)');
                    if (statusCell) {
                        var status = statusCell.textContent.trim();
                        if (status === 'Absent') {
                            absentCount++;
                        }
                    }
                });

                // Tính toán tỷ lệ phần trăm vắng mặt
                var absentPercentage = (absentCount / totalSlots) * 100;
                var totalCell = document.querySelector('#gradeReport tbody tr:last-child td:last-child');
                if (totalCell) {
                    totalCell.textContent = '' + absentPercentage.toFixed(2) + '%';
                    // Đổi màu nền dựa trên tỷ lệ phần trăm vắng mặt
                    if (absentPercentage > 20) {
                        totalCell.style.color = 'red'; 
                    } else {
                        totalCell.style.color = 'green'; 
                    }
                }
            }

        </script>

    </body>

</html>

