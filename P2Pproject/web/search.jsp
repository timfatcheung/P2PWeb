<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         import="java.util.List"
         import="java.util.ArrayList"
         import="controller.*"
         %>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
  List<UserBean> urss = (List<UserBean>) request.getAttribute("search");
  if(urss!=null){
    for(UserBean urs: urss){
       out.println("<br/>" + urs.getUserName());
     }
  }
%>
    <body>

    </body>
</html>
