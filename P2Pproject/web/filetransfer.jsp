<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>
<!DOCTYPE html>
<html>
    <head>
        <title>AtoZ</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="WebRTC, SimpleWebRTC, Talky, Talky.io, library, JavaScript, Node.js">
        <style>
            li span {
                margin-right: 1em;
            }

            progress {
                margin-right: 1em;
                width: 50%;
            }

            li .filename {
                display: inline-block;
                width: 50%;
            }

            .peerContainer {
                margin-bottom: 1em;
            }

            .p2pChecking {
                background-color: #ffeed7;
            }
            .p2pConnected, .p2pCompleted {
                background-color: #7aa5ff;
            }
            .p2pFailed {
                background-color: #ffe3eb
            }
            .p2pDisconnected {
                background-color: #ffeed7;
            }
            .p2pClosed {
                background-color: #f5f7f8;
            }

            .receiving a {
                color: #ec008c;
            }
        </style>
        <% UserBean User = (UserBean) (session.getAttribute("SessionUser"));
            String username = User.getUserName();%>
        <link rel="stylesheet" type="text/css" href="index.css">
    </head>
    <body>

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

             <h3 id="title">Start file transfer</h3>
            <p id="subTitle"></p>

            <hr>
            <div id="remotes"></div>
        </div>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
        <script src="webrtc.js"></script>
        <script src="filetransfer.js"></script>
    </body>
</html>
