

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="controller.UserBean"%>
<!DOCTYPE html>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));
String username = User.getUserName() ;%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript">
        var ws = null;
        var User= "<% out.print(username);%>" ;
        var connecturl = "ws://localhost:8080/P2Pproject/one/";
        function startWebSocket() {
            if ('WebSocket' in window)
                ws = new WebSocket(connecturl + "<% out.print(username);%>" );
            alert(User);
            else if ('MozWebSocket' in window)
                ws = new MozWebSocket(connecturl + "<% out.print(username);%>");
            alert(User);
            else
                alert("not support");

            ws.onmessage = function(evt) {
                //alert(evt.data);
                console.log(evt);
                // $("#xiaoxi").val(evt.data);
                setMessageInnerHTML(evt.data);
            };
            function setMessageInnerHTML(innerHTML){
                document.getElementById('message').innerHTML += innerHTML + '<br/>';
            }
            ws.onclose = function(evt) {
                //alert("close");
                document.getElementById('denglu').innerHTML="離線";
            };

            ws.onopen = function(evt) {
                alert("open");
                document.getElementById('denglu').innerHTML="在線";
                document.getElementById('userName').innerHTML="<% out.print(username);%>"
            };
        }

        function sendMsg() {
            var fromName = User;
            var toName = document.getElementById('name').value;
            var content = document.getElementById('writeMsg').value; 
            ws.send(fromName+","+toName+","+content);
        }
    </script>
</head>
<body onload="startWebSocket();">
<p>聊天功能實現</p>
登錄狀態：
<span id="denglu" style="color:red;">正在登錄</span>
<br>
登錄人：
<span id="userName"></span>
<br>
<br>
<br>
<%= username %>

發送給誰：<select id="name">
    <option value="all">所有人</option>
    <option value="小玲">小玲</option>
    <option value="小摩納">小摩納</option>
</select>
<br>
發送內容：<input type="text" id="writeMsg"></input>
<br>
聊天框：<div id="message" style="height: 250px;width: 280px;border: 1px solid; overflow: auto;"></div>
<br>
<input type="button" value="send" onclick="sendMsg()"></input>
</body>
</html>