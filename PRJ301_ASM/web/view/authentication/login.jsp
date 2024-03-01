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
        <title>Login Page</title>
        <link rel="stylesheet" href="css/login.css"/>
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
