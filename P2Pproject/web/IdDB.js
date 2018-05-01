        var indexedDB = window.indexedDB || window.webkitIndexedDB || 
                        window.mozIndexedDB || window.msIndexedDB;
        var IDBTransaction = window.IDBTransaction || window.webkitIDBTransaction;
        var db;
        (function () {     
            var peopleData = [
                { name: "John Dow", email: "john@company.com" },
                { name: "Don Dow", email: "don@company.com" }
            ];
 
            function initDb() {
                var request = indexedDB.open("PeopleDB", 1);  
                request.onsuccess = function (evt) {
                    db = request.result;                                                            
                };
 
                request.onerror = function (evt) {
                    console.log("IndexedDB error: " + evt.target.errorCode);
                };
 
                request.onupgradeneeded = function (evt) {                   
                    var objectStore = evt.currentTarget.result.createObjectStore(
                             "people", { keyPath: "id", autoIncrement: true });
 
                    objectStore.createIndex("name", "name", { unique: false });
                    objectStore.createIndex("email", "email", { unique: true });
 
                    for (i in peopleData) {
                        objectStore.add(peopleData[i]);
                    }
                };
            }
 
            function contentLoaded() {
                initDb();                
                var btnAdd = document.getElementById("btnAdd");
                var btnDelete = document.getElementById("btnDelete");
                var btnPrint = document.getElementById("btnPrint");                
 
                btnAdd.addEventListener("click", function () {
                    var name = document.getElementById("txtName").value;
                    var email = document.getElementById("txtEmail").value;
 
                    var transaction = db.transaction("people", IDBTransaction.READ_WRITE);
                    var objectStore = transaction.objectStore("people");                    
                    var request = objectStore.add({ name: name, email: email });
                    request.onsuccess = function (evt) {
                        // do something after the add succeeded
                    };
                }, false);
 
                btnDelete.addEventListener("click", function () {
                    var id = document.getElementById("txtID").value;
 
                    var transaction = db.transaction("people", IDBTransaction.READ_WRITE);
                    var objectStore = transaction.objectStore("people");
                    var request = objectStore.delete(id);
                    request.onsuccess = function(evt) {  
                        // It's gone!  
                    };
                }, false);
 
                btnPrint.addEventListener("click", function () {
                    var output = document.getElementById("printOutput");
                    output.textContent = "";
 
                    var transaction = db.transaction("people", IDBTransaction.READ_WRITE);
                    var objectStore = transaction.objectStore("people");
 
                    var request = objectStore.openCursor();
                    request.onsuccess = function(evt) {  
                        var cursor = evt.target.result;  
                        if (cursor) {  
                            output.textContent += "id: " + cursor.key + 
                                        " is " + cursor.value.name + " ";                            
                            cursor.continue();  
                        }  
                        else {  
                            console.log("No more entries!");  
                        }  
                    };  
                }, false);              
            }
 
            window.addEventListener("DOMContentLoaded", contentLoaded, false); 
    })();       