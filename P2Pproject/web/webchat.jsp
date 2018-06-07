<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
        <% UserBean User = (UserBean) (session.getAttribute("SessionUser"));
            String username = User.getUserName();%>
        <script type="text/javascript">
            var ws = null;
            function startWebSocket() {
                if ('WebSocket' in window)
                    ws = new WebSocket("ws://localhost:8080/P2Pproject/one/" + '<% out.print(username); %>');
                else if ('MozWebSocket' in window)
                    ws = new MozWebSocket("ws://localhost:8080/P2Pproject/one/" + '<% out.print(username); %>');
                else
                    alert("not support");


                ws.onmessage = function (evt) {
                    //alert(evt.data);
                    console.log(evt);
                    // $("#xiaoxi").val(evt.data);
                    setMessageInnerHTML(evt.data);
                };
                function setMessageInnerHTML(innerHTML) {
                    document.getElementById('message').innerHTML += innerHTML + '<br/>';
                }
                ws.onclose = function (evt) {
                    //alert("close");
                    document.getElementById('denglu').innerHTML = "Offline";
                };

                ws.onopen = function (evt) {
                    //alert("open");
                    document.getElementById('denglu').innerHTML = "Online";
                    document.getElementById('userName').innerHTML = '<% out.print(username); %>';
                };
            }

            function sendMsg() {
                var fromName = "<% out.print(username);%>";
                var toName = document.getElementById('name').value;
                var content = document.getElementById('writeMsg').value;
                ws.send(fromName + "," + toName + "," + content);
            }
        </script>
    </head>

    <body onload="startWebSocket();">
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
        </div>
        <div style=margin: 0px auto; id="main">
            <p>Chat</p>
            Status:
            <span id="denglu" style="color:red;">Online</span>
            <br>
            User:
            <span id="userName"></span>
            <br>
            <br>
            <br>
            Send to:<select id="name">
                <option value="all">all</option>
                <option value="two">two</option>
                <option value="three">three</option>
            </select>
            <br>
            Message:<input type="text" id="writeMsg"></input>
            <br>
            ChatBox:<div id="message" style="height: 250px;width: 280px;border: 1px solid; overflow: auto;"></div>
            <br>
            <input type="button" value="send" onclick="sendMsg()"></input>
        </div>
    </body>
</html>