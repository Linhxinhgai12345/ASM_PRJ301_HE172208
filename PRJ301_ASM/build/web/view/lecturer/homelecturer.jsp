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
    <link rel="stylesheet" href="/home.css">
    <script src="fontawesome.js"></script>
    <style>
        * {
    margin: 0;
    padding: 0;
}
body{
    height: 100vh;
}

.nav {
    width: 40vw;
    height: 20vh;
    background-color: white;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
    margin-top: 20px;
    margin-left: 20px;
    padding: 20px;
    border-radius: 5px;
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
}

.foorter{
    background-color: rgb(241, 151, 5);
    color: white;
    text-align: center;
    padding: 20px;
}

.foorter p:first-child{
    margin-bottom: 10px;
}
.body{
    height: 295px;
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
            <div class="nav-logo">
                <img src="img/Logo.jpg" alt="">
            </div>
            <div class="nav-content">
                <a href="view/lecturer/timetable.jsp">Timetable</a>
                <a href="">Attendance</a>
                <a href="">Report Mark</a>
            </div>
        </div>
        <div class="sign-out-btn">
            <a href="login.html"><i class="fa-solid fa-right-from-bracket"></i></a>
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