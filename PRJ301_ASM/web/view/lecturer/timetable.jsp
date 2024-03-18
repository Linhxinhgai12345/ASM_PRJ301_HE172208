<%-- 
    Document   : timetable
    Created on : Feb 28, 2024, 5:01:32 PM
    Author     : dell
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
              integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="css/timetable.css"/>
        <style>
            *{
                margin: 0;
                padding: 0;
            }

            body{
                padding: 20px;
                background-color: rgb(233 233 223);
                background-size: cover;
                background-position: center;
            }

            .logo img{
                width: 300px;
            }

            .lecturer{
                padding-bottom: 20px;
            }

            form{
                display: inline;
                background-color: rgba(0, 0, 0, 0.122);
                padding: 15px 25px;
                border-radius: 5px;

            }

            input{
                padding: 5px 10px;
            }

            button{
                padding: 7px 15px;
                margin-left: 10px;
                background-color: rgb(73, 73, 245);
                color: white;
                border: none;
                border-radius: 5px;
            }



            .table{
                margin-top: 30px;
            }

            .table td{
                width: 200px;
                padding: 10px 15px;
                background-color: white;
            }

            .table tr:first-child td{
                background-color: #6b90da;
            }

            .table tr td:first-child{
                text-align: center;
                padding: 0;
                width: 80px;
            }

            /* ban mau css */

            /*select month css*/



            .select-month-option-find{
                display: inline-block;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
                padding: 10px;
                border-radius: 10px;
                font-size: 18px;
                font-weight: 600;
                margin-left: 20px;
                margin-top: 20px;
                text-align: left;
            }



            .select-month-option-find button{
                padding: 5px 10px;
                border-radius: 0px 10px 10px 0px;
                font-size: 15px;
                font-weight: 400;
                border: none;
                background-color: rgba(128, 128, 128, 0.651);
                color: white;
            }

            .select-month-option-find input{
                height: 32px;
                border: none;
                background-color: rgba(128, 128, 128, 0.151);
            }

            #pills-tab {
                display: flex;
                justify-content: center;
                background-color: rgba(128, 128, 128, 0.351);
                padding: 5px 0px;
                margin: 0px 350px;
                border-radius:20px;
            }

            /*show detail event*/

            /* Select event in calendar*/


            .body-mine {
                /*height: 60vh;*/
                display: flex;
                align-items: start;
                justify-content: center;
                background-color: white;
                margin: 0px 20px;
                margin-top: 30px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
                padding: 20px 30px;
                min-height: 60vh;
            }

            .body-mine .body-table{
                width: 100%;
                border: 2px solid #d3d3d3;
                border-radius: 10px;

            }

            .body-mine .body-table table{
                width: 100%;

            }

            .body-mine .body-table table tr{
                border-bottom: 2px solid #d3d3d3;
                display: flex;
            }

            .body-mine .body-table table tr td{
                padding: 15px 15px 5px 15px;
                color: black;
                display: inline-block;
            }

            .body-mine .body-table table tr td:nth-child(1){
                font-weight: 500;
                font-size: 18px;
                width: 100px;
                padding-top: 25px;
                word-wrap: break-word;
            }


            .body-mine .body-table table tr td:nth-child(2){
                width: 0px;
                font-size: 15px;
                padding-top: 25px;
                word-wrap: break-word;
            }

            .body-mine .body-table table tr td:nth-child(3) div{
                display: flex;
                width: 900px;
                margin-bottom: 10px;
                padding: 10px 10px
            }

            .body-mine .body-table table tr td:nth-child(3) div p:first-child{
                margin: 0px;
                padding: 0px;
                margin-right: 20px;
                word-wrap: break-word;
                width: 200px;
            }


            .body-mine .body-table table tr td:nth-child(3) div p:nth-child(2){
                margin: 0px;
                padding: 0px;
                margin-right: 30px;
                font-weight: 600;
                word-wrap: break-word;
                width: 300px;
            }

            .body-mine .body-table table tr td:nth-child(3) div p:nth-child(3){
                margin: 0px;
                padding: 0px;
                margin-right: 30px;
                font-weight: 600;
                word-wrap: break-word;
                width: 300px;
            }

            .body-mine .body-table table tr td:nth-child(3) div p:nth-child(4){
                margin: 0px;
                padding: 0px;
                margin-right: 30px;
                font-weight: 600;
                word-wrap: break-word;
                width: 300px;
            }


            .body-mine .body-table table tr th{
                font-weight: 700;
                font-size: 22px;
                padding: 15px 15px 5px 15px;
                color: black;
                display: block;
            }

            .body-mine .body-table table tr th:nth-child(3){
                margin-left: 10px;
                display: flex;
            }



            .body-mine .body-table table tr th:nth-child(1){
                width: 100px
            }

            .body-mine .body-table table tr th:nth-child(3) p:nth-child(1){
                width: 160px
            }

            .body-mine .body-table table tr th:nth-child(3) p:nth-child(2){
                width: 240px
            }

            .body-mine .body-table table tr th:nth-child(3) p:nth-child(3){
                width: 240px
            }

            .edit-event-detail-popper{
                width: 500px;
                height: 300px;
                background-color: white;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                border-radius: 10px;
            }

            .edit-event-detail-popper-header{
                width: 100%;
                display: flex;
                align-items: end;
                justify-content: right;
                padding: 20px 10px 0px 10px;
            }

            .edit-event-detail-popper-header i{
                margin: 0px 10px;
                font-size: 20px;
                padding: 5px 5px;
                border-radius: 50%;
                color: rgba(128, 128, 128, 0.9);
            }

            .edit-event-detail-popper-header i:hover{
                background-color: rgba(128, 128, 128, 0.3);
            }

            .edit-event-detail-popper-header i:nth-child(4):hover{
                background-color: white;
            }

            .edit-event-detail-popper-header-body{
                width: 100%;
                padding: 0px 30px;
            }

            .edit-event-detail-popper-header-body table div p{
                padding: 0px;
                margin: 0px
            }


            .edit-event-detail-popper-header-body table td{
                padding: 10px 10px;
                padding-right: 20px
            }

            .edit-event-detail-popper-header-body i{
                color: rgba(128, 128, 128, 0.9);
                font-size: 20px
            }

            .select-month-option-find form{
                background-color: white;
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
                    <a href="../lecturer/presentreport">Present report</a>
                    <a href="../lecturer/markreport">Report Mark</a>
                </div>
            </div>
            <div class="sign-out-btn">
                <a href="/logout">Sign out</a>
            </div>
        </div>
        <div class="logo">
            <img src="img/Logo.jpg" alt="">
        </div>
        <div class="lecturer">
            <h1>Lecturer name: ${sessionScope.account.displayname}</h1>
        </div>
        <div class="header-para">
            <h4>Chu thich : </h4>
            <pre>Các phòng bắt đầu bằng AL thuộc tòa nhà Alpha. VD: AL... 
Các phòng bắt đầu bằng BE thuộc tòa nhà Beta. VD: BE,.. 
Các phòng bắt đầu bằng G thuộc tòa nhà Gamma. VD: G201,...
Các phòng tập bằng đầu bằng R thuộc khu vực sân tập Vovinam.
Các phòng bắt đầu bằng DE thuộc tòa nhà Delta. VD: DE,..
Little UK (LUK) thuộc tầng 5 tòa nhà Delta</pre>   
        </div>
        <div class="select-month-option-find">
            <form action="timetable" method="GET">
                <input type="hidden" value="${sessionScope.lecturer.id}" name="id"/>
                From: <input type="date" name="from" value="${requestScope.from}"/> -
                <input type="date" name="to" value="${requestScope.to}"/>
                <button> View </button>
            </form>
        </div>

        <div class="body-mine">
            <div class="body-table">
                <table>
                    <tr class="table-header">
                        <th>
                            Date
                        </th>
                        <th></th>
                        <th>
                            <p>Slot</p>
                            <p>Time</p>
                            <p>Room</p>
                            <p>Subject - Class</p>
                        </th>
                    </tr>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <tr>
                            <td>
                                <div>
                                    <h5 class="no-padding-margin">(<fmt:formatDate pattern="E" value="${d}" />)
                                        ${d.toString().substring(8,10)}/${d.toString().substring(5,7)}</h5>
                                </div>
                            </td>
                            <td></td>
                            <td>
                                <c:forEach items="${requestScope.slots}" var="slot">
                                    <c:forEach items="${requestScope.lessions}" var="les">
                                        <c:if test="${les.date eq d and les.slot.id eq slot.id}">

                                            <div style="cursor: pointer;">
                                                <p><i class="fas fa-circle" style="color: red"></i>${slot.name}</p>
                                                <p>7:30am - 9:00am</p>
                                                <p>BE301</p>
                                                <p>${les.group.name} - ${les.group.subject.name} 
                                                    <%--<c:if test="${sessionScope.lecturer.name != null}">--%>
                                                    (<a href="att?id=${les.id}&date=${d}&slot=${slot.name}&subject=${les.group.subject.name}&group=${les.group.name}&room=${les.room.name}">
                                                        <c:if test="${les.attended}">Edit</c:if>
                                                        <c:if test="${!les.attended}">Take</c:if>
                                                        </a>)
                                                    <%--</c:if>--%>
                                                </p>
                                            </div>                                            
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                            </td>

                        </tr>
                    </c:forEach>
                </table>
            </div>

        </div>

        <!-- Bootstrap JS -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
        crossorigin="anonymous"></script>        
    </body>
</html>
