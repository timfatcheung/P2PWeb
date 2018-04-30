<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Index</title>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <%session.setAttribute("user", "小玲");%>
    <script type="text/javascript">
        var ws = null;
        function startWebSocket() {
            if ('WebSocket' in window)
                ws = new WebSocket("ws://localhost:8080/P2Pproject/two/小玲");
            else if ('MozWebSocket' in window)
                ws = new MozWebSocket("ws://localhost:8080/P2Pproject/two/小玲");
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
                //alert("open");
                document.getElementById('denglu').innerHTML="在線";
                document.getElementById('userName').innerHTML='user';
            };
        }

        function sendMsg() {
            var fromName = "user";
            var toName = document.getElementById('name').value;  //發給誰
            var content = document.getElementById('writeMsg').value; //發送內容
            ws.send(fromName+","+toName+","+content);//注意格式
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

發送給誰：<select id="name">
            <option value="all">所有人</option>
            <option value="小摩納">小摩納</option>
            <option value="小明">小明</option>
        </select>
<br>
發送內容：<input type="text" id="writeMsg"></input>
<br>
聊天框：<div id="message" style="height: 250px;width: 280px;border: 1px solid; overflow: auto;"></div>
<br>
<input type="button" value="send" onclick="sendMsg()"></input>
</body>
</html>