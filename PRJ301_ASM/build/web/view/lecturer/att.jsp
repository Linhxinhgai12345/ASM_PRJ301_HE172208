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
        <link rel="stylesheet" href="css/takenattendance.css">
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
                margin-top: 20px;   
                position: fixed;
                display: flex;
            }

            .header div{
                padding: 10px 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                background-color: rgb(213, 163, 89);
                font-family: 'Courier New', Courier, monospace;
                font-size: 25px;
                align-items: center;
                font-weight: 600;
                margin-left: 30px;
            }

            .information{
                background-color: rgba(255, 248, 220, 0.808);
                display: inline-block;
                padding: 10px;
                border-radius: 5px;
                margin-top: 150px;
                position: fixed;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            }

            .information td{
                border: 1px solid rgba(0, 0, 0, 0.42);
                padding: 10px 6px;
                font-size: 17px;
                font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;

                font-weight: 500;
            }

            .information tr td:first-child{
                background-color: rgba(255, 166, 0, 0.575);
            }

            .body{
                height: 300px;
                width: 925px;
                background-color: rgba(0, 0, 0, 0.107);
                float: right;
                margin-top: 100px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 5px;
                padding: 10px;
                overflow-y: scroll;
            }

            .body table{
                width: 100%;
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
                width: 250px;
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
                    <a href="../lecturer/markreport">Report Mark</a>
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
                    <td>Class: </td>
                    <td>${group}</td>
                </tr>
                <tr>
                    <td>Subject</td>
                    <td>${subject}</td>
                </tr>
                <tr>
                    <td>Room</td>
                    <td>${room}</td>
                </tr>
                <tr>
                    <td>Slot</td>
                    <td>${slot}</td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td>${date}</td>
                </tr>
            </table>


        </div>

        <div class="body">
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
                    <c:forEach items="${requestScope.atts}" var="a">
                        <tr>
                            <td>${a.student.id}</td>
                            <td>${a.student.name}</td>
                            <td>
                                <input type="hidden" name="aid${a.student.id}" value="${a.getId()}"/>
                                <input type="radio" 
                                       ${!a.present?"checked=\"checked\"":""}
                                       name="present${a.student.id}" value="no"/> No
                                <input type="radio" 
                                       ${a.present?"checked=\"checked\"":""}
                                       name="present${a.student.id}" value="yes"/> Yes
                            </td>
                            <td>
                                <input type="text" name="description${a.student.id}" value="${a.description}"/>
                            </td>
                            <td>${a.time.toString().substring(0)}</td>
                        </tr>    
                    </c:forEach>
                </table>
                <div class="body-footer">
                    <input type="hidden" name="room" value="${room}"/>
                    <input type="hidden" name="group" value="${group}"/>
                    <input type="hidden" name="subject" value="${subject}"/>
                    <input type="hidden" name="slot" value="${slot}"/>
                    <input type="hidden" name="date" value="${date}"/>

                    <button>Save</button>
                </div>
            </form>


        </div>

    </body>
</html>
