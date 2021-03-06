<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="controller.UserBean"
         import="java.util.List"
         import="java.util.ArrayList"
         import="controller.*"
         import="controller.FriendListBean"
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
            var username = '<% out.print(User.getUserName());%>';
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
                var commentholder = document.getElementById("commentcontent");

                postholder.innerHTML = "";
                commentholder.innerHTML = "";

                var i;
                var x;
                //Iterate through the results
                for (i = 0; i < results.rows.length; i++) {
                    //Get the current row
                    var row = results.rows.item(i);
                    if (row.post_onwer == username) {
                        postholder.innerHTML += "<li>" + row.post_onwer + " <br> " + row.content + " (<a href='javascript:void(0);' onclick='deletePOST(" + row.id + ");'>Delete POST</a>)<br> <textarea rows='1' cols='50' id='comment' align='center'></textarea><a href=' 'onclick='addComment(" + row.id + ");'>Comment</a>";
                        if (mydb) {
                            mydb.transaction(function (t) {
                                t.executeSql("SELECT * FROM POSTComment WHERE postid=?", [[row.id]], function (tx, result) {
                                    for (x = 0; x < result.rows.length; ++x) {
                                        var row2 = result.rows.item(x);
                                        if (row2 != null) {
                                            commentholder.innerHTML += "<li>" + row2.comment_onwer + " <br> " + row2.comment + "<br>";
                                        } else {
                                            commentholder.innerHTML += "<li>" + " no comment" + "<br>";
                                        }
                                    }

                                });
                            });
                        } else {
                            alert("db not found");
                        }
                    } else {
                        postholder.innerHTML += "<li>" + row.post_onwer + " <br> " + row.content + " <br> <textarea rows='1' cols='50' id='comment' align='center'></textarea><a href=' 'onclick='addComment(" + row.id + ");'>Comment</a>";
                        mydb.transaction(function (t) {
                            t.executeSql("SELECT * FROM POSTComment WHERE postid=?", [[row.id]], function (tx, result) {
                                for (x = 0; x < result.rows.length; ++x) {
                                    var row2 = result.rows.item(x);
                                    if (row2 != null) {
                                        commentholder.innerHTML += "<li>" + row2.comment_onwer + " <br> " + row2.comment + "<br>";
                                    } else {
                                        commentholder.innerHTML += "<li>" + " no comment" + "<br>";
                                    }
                                }

                            });
                        });
                    }
                }
            }

            function addComment(id) {
                mydb.transaction(function (t) {
                    t.executeSql("CREATE TABLE IF NOT EXISTS POSTComment (commentid INTEGER PRIMARY KEY ASC,postid INTEGER,comment_onwer TEXT,comment TEXT)");
                });
                var comment = document.getElementById("comment").value;
                if (comment != "") {
                    mydb.transaction(function (t) {
                        t.executeSql("INSERT INTO POSTcomment (postid, comment_onwer,comment) VALUES (?, ?, ?)", [[id], username, comment]);
                        outputPOST();
                    });
                } else {
                    alert("1!");
                }
            }
            function outputComment(id) {
                //check to ensure the mydb object has been created
                if (mydb) {

                    mydb.transaction(function (t) {
                        t.executeSql("SELECT * FROM POSTcomment WHERE id=?", [id], updateComment);
                    });
                } else {
                    alert("db not found, your browser does not support web sql!");
                }
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
                            t.executeSql("INSERT INTO normalPOST (post_onwer, content,status) VALUES (?, ?, ?)", [onwer, content, status]);
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
                    mydb.transaction(function (t) {
                        t.executeSql("DELETE FROM POSTComment WHERE postid=?", [id], outputPOST);
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
                    <form name="submitForm" method="POST" action="ListFriend">
                        <input type="hidden" name="SessionUser" value="<%= User.getUserName()%>">
                        <A HREF="javascript:document.submitForm.submit()">Create Group</A>
                    </form>
                </div>
                <div id="FunctionBox03">
                    <a href="webchat.jsp" align="center">chat</a>
                </div>

            </div>
            <div style=margin: 0px auto; id="main">
                 <br/>
                <div id="controls">
                    <input type="hidden" id="UserName" name ="UserName" value="<%= User.getUserName()%>"/>
                    <label>privacy setting:</label>
                    <select id="status">
                        <option value="public">public</option>
                        <option value="friends">friend only</option>
                    </select>
                    <br/>
                    <textarea rows="4" cols="50" id="content" align="center"></textarea>
                    <br/>
                    <button type="button" id="addcar" onclick="addPost();">POST</button>
                    <br/>
                    <a href="video.jsp?room1">Video</a><br/>
                    <a href="filetransfer.jsp?room1">File Transfer</a>
                </div>
                <div id="postcontentholder">

                    <ul id="postcontent"></ul>
                </div>
                <div id="commentcontentholder">
                    Comment:
                    <ul id="commentcontent"></ul>
                </div>
                <div id="RightBody">
                </div>
            </div>
    </body>

</html>
