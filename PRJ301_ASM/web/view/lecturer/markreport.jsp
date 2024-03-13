<%-- 
    Document   : markreport
    Created on : Mar 5, 2024, 10:48:24 PM
    Author     : DEll
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Attendance </title>
        <link rel="stylesheet" href="/markreport.css">
        <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                padding: 30px;
                background-color:rgba(202, 185, 130, 0.427);

            }

            .header img{
                width: 200px;

            }

            .header{
                text-align: left;

                position: fixed;
                display: flex;
            }

            .header div{
                padding: 10px 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                background-color: #F2994A;
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                font-size: 25px;
                align-items: center;
                font-weight: 600;
                margin-left: 30px;
                color: aliceblue;
            }

            .information{
                background-color: rgba(255, 248, 220, 0.808);
                display: inline-block;
                padding: 10px;
                border-radius: 5px;
                margin-top: 150px;
                position: fixed;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                overflow-y: scroll;
                height: 200px;
                width: 170px;
            }

            .information td{
                border: 1px solid rgba(0, 0, 0, 0.42);
                padding: 10px 6px;
                font-size: 15px;
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
                width: 150px;
                font-weight: 500;
                background-color: rgb(251, 210, 157);
                text-align: center;

            }

            .information td a{
                color:black;
                text-decoration: none;
            }

            .information tr:first-child td{
                background-color: rgba(255, 166, 0, 0.575);
                font-size: 17px
            }

            .body{
                height: 300px;
                width: 925px;
                background-color: rgba(0, 0, 0, 0.107);
                float: right;
                margin-top: 100px;
                box-shadow: 0 0 10px rgb(0 0 0 / 29%);
                border-radius: 5px;
                padding: 30px;
                overflow-y: scroll;
            }

            .body table{
                border: 2px solid rgba(0, 0, 0, 0.521);
                padding: 10px;
                background-color: white;
            }

            .body table td{
                border-bottom: 1px solid rgba(0, 0, 0, 0.521);
                padding: 10px;
            }

            .body table tr:first-child{
                background-color: rgba(38, 38, 189, 0.575);
                color: white;
                font-size: 17px;

            }

            .body table td{
                border-right: 1px solid rgba(0, 0, 0, 0.521);
                padding: 5px 10px;
                margin-right: 5px;
                width: 300px;
                word-wrap: break-word;
                padding-left: 10px;
            }

            .body table td:first-child {
                width: 40px;
                text-align: center;
            }

            .body table td input{
                padding: 5px;
                background-color: rgba(0, 0, 0, 0.107);
                border: 1px solid rgba(0, 0, 0, 0.304);
                border-radius: 10px;
            }

            .body-footer {
                display: flex;
                justify-content: end;
                margin-top: 20px;
            }

            .body-footer button{
                padding: 10px 20px;
                color: white;
                background-color: rgb(0, 70, 174);
                font-size: 14px;
                font-weight: 600;
                margin-left: 20px;
                border: none;
                border-radius: 10px;


            }

            .body-footer button:hover{
                cursor: pointer;
                background-color: rgb(39, 39, 227);
            }

            .nav-header{
                display: flex;
                justify-content: right;
                align-items: start;

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
        <div class="nav-header">
            <div class="nav">
                <div class="nav-content">
                    <a href="../homelecturer">Home</a>
                    <a href="../lecturer/timetable?id=${sessionScope.lecturer.id}">Time table</a>
                </div>
            </div>
            <div class="sign-out-btn">
                <a href="../logout">Sign out</a>
            </div>
        </div>
        <div class="header">
            <img src="img/Logo.jpg" alt="">
            <div>View Attendance for ${sessionScope.account.username}</div>
        </div>

        <div class="information">
            <table>
                <tr>
                    <td>Class-Subject</td>

                </tr>
                <!--list group-->
                <c:forEach items="${studentgroup}" var="group">
                    <tr>
                        <td><a href="../lecturer/markreport?groupchoosen=${group.id}&subject=${group.subject.id}">${group.getName()}-${group.subject.name}</a></td>

                    </tr>
                </c:forEach>

            </table>


        </div>

        <div class="body">
            <form action="../lecturer/markreport" method="post">
                <table >
                    <tr>
                        <td>Id</td>
                        <td>Name</td>
                        <!--list score type--> 
                        <c:forEach items="${listScoreType}" var="score">
                            <td >${score.sctname}<br/>(${score.sctpercent})</td>
                            </c:forEach>

                    </tr>
                    <!--lisst student-->
                    <c:forEach items="${listStudent}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.name}</td>
                            <c:forEach items="${listScoreType}" var="type">
                                <c:forEach items="${listScore}" var="score">
                                    <c:if test="${(score.scoreType.sctid == type.sctid) and (score.student.id == student.id)}">
                                        <c:set var="scoreofstudent" value="${score.score}"/>
                                    </c:if>
                                </c:forEach>
                                <td>
                                    <input type="number" max="10" min="0" step="1" name="score${student.id}and${type.sctid}" value="${scoreofstudent == null? 0 : scoreofstudent}">
                                    <input type="hidden" value="${student.id}" name="student${student.id}"/>
                                    <input type="hidden" value="${type.sctid}" name="scoreType${type.sctid}"/>
                                </td>


                            </c:forEach>
                        </tr>   
                    </c:forEach>


                </table>
                <input type="hidden" name="groupchoosen" value="${groupchoosen}"/>
                <input type="hidden" name="subjectchoosen" value="${subjectchoosen}"/>
                <c:if test="${listStudent != null}">
                    <div class="body-footer">

                        <button>Save</button>
                    </div>
                </c:if>

            </form>
        </div>
    </body>
</html>

