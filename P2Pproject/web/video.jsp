<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>
<!DOCTYPE html>
<html>
    <head>
        <script type='text/javascript' src='https://cdn.scaledrone.com/scaledrone.min.js'></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width">
        <style>
            video {
                max-width: calc(50% - 100px);
                margin: 0 50px;
                box-sizing: border-box;
                border-radius: 2px;
                padding: 0;
                box-shadow: rgba(156, 172, 172, 0.2) 0px 2px 2px, rgba(156, 172, 172, 0.2) 0px 4px 4px, rgba(156, 172, 172, 0.2) 0px 8px 8px, rgba(156, 172, 172, 0.2) 0px 16px 16px, rgba(156, 172, 172, 0.2) 0px 32px 32px, rgba(156, 172, 172, 0.2) 0px 64px 64px;
            }
            .copy {
                position: fixed;
                top: 10px;
                left: 50%;
                transform: translateX(-50%);
                font-size: 16px;
                color: rgba(0, 0, 0, 0.5);
            }
        </style>
        <title>AtoZ</title>
        <link rel="stylesheet" type="text/css" href="index.css">

        <% UserBean User = (UserBean) (session.getAttribute("SessionUser"));
            String username = User.getUserName();%>
    </head>
    <body>
        <div id="container">
            <header>
                <div id="header">
                    <div id="headerbox">
                        <div id="headerlogo">
                            <a href="index.jsp"><img src="logo.png" width="86" height="86"/></a>
                        </div>
                        <div id="headeruser">
                            Welcome, <%= User.getUserName()%>!
                        </div>
                        <div>
                            <form method="link" action="logout.jsp" >
                                <input id="logout" type="submit" value="Logout">
                            </form>
                        </div>
                    </div>
                </div>
            </header>
            <div id="LeftMenu">
                <br/>
                <div id="FunctionBox01">
                    <a href="findUser.jsp" align="center">Find User</a>
                </div>
                <div id="FunctionBox02">
                    <form name="submitForm" method="POST" action="ListFriend">
                        <input type="hidden" name="param1" value="param1Value">
                        <A HREF="javascript:document.submitForm.submit()">Friend list</A>
                    </form>
                </div>
                <div id="FunctionBox03">
                    <a href="one.jsp" align="center">chat</a>
                </div>
            </div>
            <div style=margin: 0px auto; id="main">
                 <br/>
                <video id="localVideo" autoplay muted></video>
                <video id="remoteVideo" autoplay></video>
                <script src="video.js"></script>
                
            </div>
        </div>
    </body>
</html>
