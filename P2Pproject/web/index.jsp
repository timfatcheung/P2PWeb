<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         %>

<!DOCTYPE html>
<% UserBean User = (UserBean) (session.getAttribute("SessionUser"));%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AtoZ</title>
        <link rel="stylesheet" type="text/css" href="index.css">
        <script type="text/javascript">
            
            //Test for browser compatibility
            var username = '<% out.print(User.getUserName()); %>' ;
if (window.openDatabase) {
    var mydb = openDatabase("post_db", "0.1", "A Database of Post Content", 2048 * 2048);

    //create table
    mydb.transaction(function (t) {
        t.executeSql("CREATE TABLE IF NOT EXISTS normalPOST (id INTEGER PRIMARY KEY ASC,post_onwer TEXT,content TEXT,status TEXT)");
    });



} else {
    alert("WebSQL is not supported by your browser!");
}

function updatePost(transaction, results) {
    //initialise the listitems variable
    var listitems = "";
    var postholder = document.getElementById("postcontent");

    postholder.innerHTML = "";

    var i;
    //Iterate through the results
    for (i = 0; i < results.rows.length; i++) {
        //Get the current row
        var row = results.rows.item(i);
    if(row.post_onwer == username){
        postholder.innerHTML += "<li>" + row.post_onwer + " <br> " + row.content + " (<a href='javascript:void(0);' onclick='deletePOST(" + row.id + ");'>Delete POST</a>)<br> <textarea rows='1' cols='50' id='comment' align='center'></textarea><a href=' 'onclick='addComment();'>Send!</a>";
    }else{
        postholder.innerHTML += "<li>" + row.post_onwer + " <br> " + row.content + " <br> <textarea rows='1' cols='50' id='comment' align='center'></textarea><a href=' 'onclick='addComment();'>Send!</a>";
    }
         
    }

}

function addComment(){
    
}

function outputPOST() {
    //check to ensure the mydb object has been created
    if (mydb) {

        mydb.transaction(function (t) {
            t.executeSql("SELECT * FROM normalPOST", [], updatePost);
        });
    } else {
        alert("db not found, your browser does not support web sql!");
    }
}

//function to add the post to the database

function addPost() {
    //check to ensure the mydb object has been created
    if (mydb) {

        var onwer = document.getElementById("UserName").value;     
        var content = document.getElementById("content").value;
        var status = document.getElementById("status").value;

        //Test to ensure that the user has entered both a make and model
        if (onwer !== "" && content !== "") {
            mydb.transaction(function (t) {
                t.executeSql("INSERT INTO normalPOST (post_onwer, content,status) VALUES (?, ?, ?)", [onwer, content,status]);
                outputPOST();
            });
        } else {
            alert("You must enter all information!");
        }
    } else {
        alert("db not found, your browser does not support web sql!");
    }
}

//remove a post from the database

function deletePOST(id) {
    //check to ensure the mydb object has been created
    if (mydb) {
        mydb.transaction(function (t) {
            t.executeSql("DELETE FROM normalPOST WHERE id=?", [id], outputPOST);
        });
    } else {
        alert("db not found, your browser does not support web sql!");
    }
}

outputPOST();
        </script> 
    </head>

    <body>
		<div id="container">
			<header>
        		<div id="header">
            		<div id="headerbox">
                		<div id="headerlogo">
							<img src="logo.png" width="86" height="86"/>
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
            		            <form name="submitForm" method="POST" action="servlet/openChat">
                <input type="hidden" name="param1" value="param1Value">
                <A HREF="javascript:document.submitForm.submit()">Chat Room</A>
            </form>
				</div>
                                <div id="FunctionBox03">
            		<a href="one.jsp" align="center">chat</a>
				</div>
                                
			</div>
			<div style=margin: 0px auto; id="main">
				<br/>
            	<form method="post" action="postController" id="postform">
					<input type="submit"  value="Make Post">
					<br/>
                	<input type="hidden" name ="UserName" value="<%= User.getUserName()%>"/>
                	<textarea rows="4" cols="50" name="comment" form="postform" align="center">What's on your mind?</textarea>
            	</form>
                        
<div id="controls">
    <input type="hidden" id="UserName" name ="UserName" value="<%= User.getUserName()%>"/>
    <label>privacy setting:</label>
    <select id="status">
     <option value="public">public</option>
     <option value="friends">friend only</option>
</select>
    <br />
    <textarea rows="4" cols="50" id="content" align="center"></textarea>
    <br />
    <button type="button" id="addcar" onclick="addPost();">POST</button>
</div>
<div id="postcontentholder">

    <ul id="postcontent"></ul>
</div>
   
            
            <!-- Use foreach to print username from the Users 
            <h1>You have invite!</h1>
            <form method="post" action="addFriendList">
            <table>
            <tr>
            <th>User:</th>
            <th>Confirm?</th>
            </tr>
            for (Sting users : rs){ 
            <tr>
            <td>%=users%></td>
            <td>
            <input type="hidden" name ="UserName" value="%=users%>"/>
            Yes<input type="radio" name ="Confirm" value="true"/>
            No<input type="radio" name ="Confirm" value="false"/>
            </td>
            </tr>
            }
            </table>
            <input type="submit" name="submit" value="Submit"/>
            </form> 
            -->
			</div>
			<div id="RightBody">
				
			</div>
		</div>
	</body>

</html>
