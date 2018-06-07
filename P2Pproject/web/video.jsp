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
        <style>
            .videoContainer {
                position: relative;
                width: 200px;
                height: 150px;
            }
            .videoContainer video {
                position: absolute;
                width: 100%;
                height: 100%;
            }
            .volume {
                position: absolute;
                left: 15%;
                width: 70%;
                bottom: 5px;
                height: 5px;
                display: none;
            }
            .connectionstate {
                position: absolute;
                top: 0px;
                width: 100%;
                text-align: center;
                color: #fff
            }
            #localScreenContainer {
                display: none;
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
                        <input type="hidden" name="SessionUser" value="<%= User.getUserName()%>">
                        <A HREF="javascript:document.submitForm.submit()">Create Group</A>
                    </form>
                </div>
                <div id="FunctionBox03">
                    <a href="one.jsp" align="center">chat</a>
                </div>
            </div>
            <div style=margin: 0px auto; id="main">
                 <h3 id="title">Start video chat</h3>
                <hr>
                <div class="videoContainer">
                    <video id="localVideo" style="height: 150px;" oncontextmenu="return false;"></video>
                    <meter id="localVolume" class="volume" min="-45" max="-20" high="-25" low="-40"></meter>
                </div>
                <br/>
                <div id="localScreenContainer" class="videoContainer">
                </div>
                <div id="remotes"></div>

            </div>
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="webrtc.js"></script>
        <script src="video.js"></script>
    </body>
</html>
