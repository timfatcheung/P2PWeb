<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="connection" class="databaseweb.MyConnection" scope="application"/> 

<%
            java.sql.PreparedStatement checkUser = connection.statement("select * from customer where cid=? and password=?");
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login</h1>
        <%
                    boolean showForm = true;
                    String username = request.getParameter("username");
                    if (username != null) {
                        String password = request.getParameter("password");
                        checkUser.setString(1, username);
                        checkUser.setString(2, password);
                        java.sql.ResultSet re = checkUser.executeQuery();
                        if (re.next()) {
                            showForm = false;
                            session.setAttribute("username", username);
        %>Welcome back <%=username%><br/>
        <a href="shopping.jsp">Go shopping</a><br/>
        <a href="logout.jsp">Logout</a><br/>
        <%
                                } else {
        %><h2>Password incorrect</h2>
        <%                                            }
                    }
                    if (showForm) {%>
        <form method="post">
            Username:<input name="username"/><br/>
            Password:<input type="password" name="password"/><br/>
            <input type="submit" name="submit" value="submit"/><br/>
        </form>
        <a href="registration.jsp">Registration</a>
        <%}%>
    </body>
</html>