//Test for browser compatibility
if (window.openDatabase) {
    //Create the database the parameters are 1. the database name 2.version number 3. a description 4. the size of the database (in bytes) 1024 x 1024 = 1MB
    var mydb = openDatabase("post_db", "0.1", "A Database of Post Content", 2048 * 2048);

    //create the cars table using SQL for the database using a transaction
    mydb.transaction(function (t) {
        t.executeSql("CREATE TABLE IF NOT EXISTS normalPOST (id INTEGER PRIMARY KEY ASC,post_onwer TEXT,content TEXT,status TEXT)");
    });



} else {
    alert("WebSQL is not supported by your browser!");
}

//function to output the list of cars in the database
function updatePost(transaction, results) {
    //initialise the listitems variable
    var listitems = "";
    //get the car list holder ul
    var postholder = document.getElementById("postcontent");

    //clear cars list ul
    postholder.innerHTML = "";

    var i;
    //Iterate through the results
    for (i = 0; i < results.rows.length; i++) {
        //Get the current row
        var row = results.rows.item(i);

        postholder.innerHTML += "<li>" + row.post_onwer + " <br> " + row.content + " (<a href='javascript:void(0);' onclick='deletePOST(" + row.id + ");'>Delete POST</a>)";

         
    }

}

//function to get the list of cars from the database

function outputPOST() {
    //check to ensure the mydb object has been created
    if (mydb) {
        //Get all the cars from the database with a select statement, set outputCarList as the callback function for the executeSql command
        mydb.transaction(function (t) {
            t.executeSql("SELECT * FROM normalPOST", [], updatePost);
        });
    } else {
        alert("db not found, your browser does not support web sql!");
    }
}

//function to add the car to the database

function addPost() {
    //check to ensure the mydb object has been created
    if (mydb) {
        //get the values of the make and model text inputs
        var onwer = document.getElementById("UserName").value;
         
        var content = document.getElementById("content").value;
        var status = document.getElementById("status").value;

        //Test to ensure that the user has entered both a make and model
        if (onwer !== "" && content !== "") {
            //Insert the user entered details into the cars table, note the use of the ? placeholder, these will replaced by the data passed in as an array as the second parameter
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

//function to remove a car from the database, passed the row id as it's only parameter

function deletePOST(id) {
    //check to ensure the mydb object has been created
    if (mydb) {
        //Get all the cars from the database with a select statement, set outputCarList as the callback function for the executeSql command
        mydb.transaction(function (t) {
            t.executeSql("DELETE FROM normalPOST WHERE id=?", [id], outputPOST);
        });
    } else {
        alert("db not found, your browser does not support web sql!");
    }
}

outputPOST();