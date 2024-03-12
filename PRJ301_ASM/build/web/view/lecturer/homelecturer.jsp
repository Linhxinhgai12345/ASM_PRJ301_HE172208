<%-- 
    Document   : homelecturer
    Created on : Feb 29, 2024, 11:30:19 PM
    Author     : DEll
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="stylesheet" href="css/home.css">
    <script src="fontawesome.js"></script>
    <link rel="stylesheet" href="css/homelecturer.css"/>
</head>

<body>
    <div class="header">
        <div class="nav">
            <div class="nav-logo">
                <img src="img/Logo.jpg" alt="">
            </div>
            <div class="nav-content">
                <a href="lecturer/timetable?id=${sessionScope.lecturer.id}">Timetable</a>
                <a href="lecturer/markreport">Report Mark</a>
            </div>
        </div>
        <div class="sign-out-btn">
            <a href="logout">Sign out</a>
        </div>
    </div>
    <div class="body">

    </div>
    <div class="foorter">
        <p>Phòng dịch vụ sinh viên: Email: dichvusinhvien@fe.edu.vn.
            Điện thoại: (024)7308.13.13
        </p>
        <p> © Powered by FPT University | CMS | library | books24x7</p>
    </div>

</body>

</html>