<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
<br/>
        <a href="logout.jsp">Logout</a><br/>

       <h2>Password incorrect</h2>


        <form action="loginController" method="post">
            Username:<input name="username"/><br/>
            Password:<input type="password" name="password"/><br/>
            <input type="submit" name="submit" value="submit"/><br/>
        </form>
        <a href="registration.jsp">Registration</a>

    </body>
</html>