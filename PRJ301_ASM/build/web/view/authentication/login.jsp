<%-- 
    Document   : login
    Created on : Feb 21, 2024, 4:14:07 PM
    Author     : sonnt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
    margin: 0;
    padding: 0;
}
body{
    background-image: url('img/background1.jpeg');
    background-position: center;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}
.body-content{
    background-color: white;
    width: 350px;
    height: 400px;
    border-radius: 5px;
    text-align: center;
}
.login-title{
    color: white;
    background-color:#fc8403;
    font-family: 'Times New Roman', Times, serif;
    font-size: 26px;
    padding: 10px 0px;
}
.body-content img{
    width: 60%;
    padding: 10px;
}
.body-content form input{
    width: 80%;
    margin: 0px 0px 20px;
    padding: 15px;
    border: 0px;
    background-color: rgba(128, 128, 128, 0.208);
    border-radius: 3px;
}
.body-content form button{
    width: 307px;
    padding: 10px;
    color: white;
    border: none;
    border-radius: 3px;
    background-color: #fc8403;
    font-size: 17px;
    font-weight: 600;
    font-family: Arial, Helvetica, sans-serif;
}
.body-content form button:hover{
    background-color: rgb(229, 182, 101);
    cursor: pointer;
}
.body-content form div{
    margin-left: 22px;
    margin-right: 22px;
    font-size: 13px;
    margin-bottom: 5px;
    display: flex;
    justify-content: space-between;
    align-items: end;
}
.body-content form a{
    text-decoration: none;
    color: rgba(21, 20, 20, 0.58);
    font-weight: 600;
}
.body-content form a:hover{
    color: black;
    cursor: pointer;
}
.body-content form select{
    border-radius: 3px;
    border: none;
    background-color: rgba(128, 128, 128, 0.208); 
    padding: 7px;
}
        </style>
    </head>
    <body>
        <div class="body-content">
            <h2 class="login-title">Welcom to FPT University</h2>
            <img src="img/Logo.jpg" alt="">
            <form action="login" method="post">
                <input type="text" name="username" placeholder="Fpt email" required=""> <br />
                <input type="password" name="password" placeholder="Password" required=""> <br />
                <div> 
                    <select name="Campus" id="">
                        <option value="1">HaNoi</option>
                        <option value="2">DaNang</option>
                        <option value="3">HCM</option>
                        <option value="4">CanTho</option>
                    </select>
                    <a href="home.html">Forgot the password</a>
                </div>
                <button>Login</button>
            </form>

        </div>
<!--        <form action="login" method="POST">
            Username: <input type="text" name="username"/> <br/>
            Password: <input type="password" name="password"/> <br/>
            <input type="checkbox" name="remember" value="remember"/> Remember me. <br/>
            <input type="submit" value="Login"/>
        </form>-->
    </body>
</html>
