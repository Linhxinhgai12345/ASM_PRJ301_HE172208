<%-- 
    Document   : studentmarkreport
    Created on : Mar 19, 2024, 10:39:03 AM
    Author     : DEll
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Grade Report</title>
        <link rel="stylesheet" href="viewmarkstudent.css">
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
                background-color: #c8ced2;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 2);
                border-radius: 4px;
            }

            h1 {
                text-align: center;
                margin-bottom: 2rem;
                color: #070606;
                font-size: 40px;
                margin-top: 10px;
                border-radius: 10px;
                padding: 10px;
                background-color: rgb(245 182 64);
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            }

            form {
                display: flex;
                flex-wrap: wrap;
                margin-bottom: 10px;
                width: 800px;
                align-items: end;
                font-weight: 600;
            }

            form input{
                width: 200px;
            }

            form div{
                width: 100%;
            }

            form button{
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
                width: 25%;
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
                    <a href="../student/timetable?id=${sessionScope.lecturer.id}">Timetable</a>
                    <a href="../student/presentreport">Present report</a>
                </div>
            </div>
            <div class="sign-out-btn">
                <a href="../logout">Sign out</a>
            </div>
        </div>
        <div class="container">
            <h1>Grade Report</h1>
            <form action="../student/markreport" method="get">
                <label for="term">Select a term:</label>
                <select id="term">
                    <option value="fall2023">Fall 2023</option>
                    <option value="spring2024">Spring 2024</option>
                    <!-- Add more terms here -->
                </select> <br />
                <label for="course">Select a course:</label>
                <select id="course" name="subjectchoosen">
                    <c:forEach items="${listgroup}" var="group">
                        <c:choose>
                            <c:when test="${subjectchoosen == group.subject.id}">
                                <option value="${group.subject.id},${group.id}" selected="">
                                    ${group.getName()}-${group.subject.name}
                                </option>
                            </c:when>
                            <c:otherwise>
                                <option value="${group.subject.id},${group.id}">${group.getName()}-${group.subject.name}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select> <br />
                <div>
                    <button type="submit" id="submit">View Mark</button>
                </div>
            </form>
            <table id="gradeReport">
                <thead>
                    <tr>
                        <th>Grade Item</th>
                        <th>Weight</th>
                        <th>Value</th>
                        <th> Comment</th>
                    </tr>
                    <c:set var="totalWeightedScore" value="0"/>
                    <c:set var="totalWeight" value="0"/>
                    <c:forEach items="${listScoreType}" var="scoreType">
                        <tr>
                            <td>${scoreType.sctname}</td>
                            <td>${scoreType.sctpercent}</td>
                            <c:set var="weight" value="${fn:replace(scoreType.sctpercent, '%', '') div 100}"/>
                            <c:forEach items="${listScore}" var="score">
                                <c:if test="${(score.scoreType.sctid == scoreType.sctid) and (score.student.id == sessionScope.student.id)}">
                                    <c:set var="scoreofstudent" value="${score.score}"/>
                                    <c:set var="weightedScore" value="${scoreofstudent * weight}"/>
                                    <c:set var="totalWeightedScore" value="${totalWeightedScore + weightedScore}"/>
                                    <c:set var="totalWeight" value="${totalWeight + weight}"/>
                                </c:if>
                            </c:forEach>
                            <td>${scoreofstudent == null ? 0 : scoreofstudent}</td>
                            <td>No comment!</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${totalWeight > 0}">
                        <c:set var="averange" value="${totalWeightedScore div totalWeight}"/>
                    </c:if>






                </thead>

                <tbody>
                    <!-- Grades will be inserted here -->
                </tbody>
            </table>
            <div>

                <h4>AVERAGE: <c:if test="${totalWeight > 0}">${averange}</c:if></h4>
                <h4 id="status">STATUS: <c:if test="${totalWeight > 0}"><span id="passFail">PASSED</span></c:if></h4>


                </div>
            </div>
            <script>
                window.onload = function () {
                    var average = parseFloat("${averange}").toFixed(1); // Định dạng số thập phân
                    var averageDisplay = document.querySelector('h4:nth-of-type(1)');
                    averageDisplay.textContent = 'AVERAGE: ' + average; // Hiển thị giá trị đã định dạng

                    var statusSpan = document.getElementById("passFail");
                    if (average < 5.0) {
                        statusSpan.textContent = "NOT PASSED";
                        statusSpan.style.color = "red";
                    } else {
                        statusSpan.textContent = "PASSED";
                        statusSpan.style.color = "green";
                    }
                };

        </script>
    </body>

</html>
