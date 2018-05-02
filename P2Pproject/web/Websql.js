//Test for browser compatibility
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

        postholder.innerHTML += "<li>" + row.post_onwer + " <br> " + row.content + " (<a href='javascript:void(0);' onclick='deletePOST(" + row.id + ");'>Delete POST</a>)<br> <textarea rows='4' cols='50' id='comment' align='center'></textarea><a href=' 'onclick='addComment();'>Send!</a>";

         
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