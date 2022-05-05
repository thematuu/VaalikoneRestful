<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>

<%@ page import="app.Login" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <title>Candidate Admin Page</title>
  </head>
 <%
if(session.getAttribute("currentSessionUser")==null)
{
response.sendRedirect("/admin.html");
}
else{
}
%>
<script>
window.onload = readAllCandidate();
window.onload = readAllParty();
function readAllCandidate(){
    var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          var jsonCandidatelist=this.responseText;
          //Add JSON string as a content of element resultall
          //document.getElementById("resultall").innerHTML = jsonCandidatelist;
          var Candidatelist=JSON.parse(jsonCandidatelist);
          //print fish by function printOneFish.
          printAllCandidate(Candidatelist);
      }
    };
    xmlhttp.open("GET", "/rest/service/getall", true);
    xmlhttp.send();    
}

function readAllCandidateSorted(x){
    var xmlhttp=new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
          var jsonCandidatelist=this.responseText;
          //Add JSON string as a content of element resultall
          //document.getElementById("resultall").innerHTML = jsonCandidatelist;
          var Candidatelist=JSON.parse(jsonCandidatelist);
          var CandidatelistSorted = null;
          if (x == 1) {
        	   CandidatelistSorted = Candidatelist.sort(function(a, b) {
           	   return a.etunimi.localeCompare(b.etunimi);
             });
          }
          else if (x == 2) {
        	  CandidatelistSorted = Candidatelist.sort(function(a, b) {
              	   return b.etunimi.localeCompare(a.etunimi);
                });
           }
          else if (x == 3) {
        	  CandidatelistSorted = Candidatelist.sort(function(a, b) {
              	   return a.sukunimi.localeCompare(b.sukunimi);
                });
           }
          else if (x == 4) {
        	  CandidatelistSorted = Candidatelist.sort(function(a, b) {
              	   return b.etunimi.localeCompare(a.etunimi);
                });
           }
          else if (x == 5) {
        	  CandidatelistSorted = Candidatelist.sort(function(a, b) {
              	   return a.puolue.localeCompare(b.puolue);
                });
           }
          else if (x == 6) {
        	  CandidatelistSorted = Candidatelist.sort(function(a, b) {
              	   return b.etunimi.localeCompare(a.etunimi);
                });
           }
 		  else {
 			 CandidatelistSorted = Candidatelist;
              
           }
           printAllCandidate(CandidatelistSorted);
      }
    };
    xmlhttp.open("GET", "/rest/service/getall", true);
    xmlhttp.send();    
}


function printAllCandidate(list){
    var s="<div class='grid-container-admin'>";
    	s=s+"<div class='grid-container'>"
    for (i in list){//or for (var i=0;i<list.length;i++){
        s=s+"<div class='grid-item'>";
        s=s+"<p>ID: "+list[i].id; + "</p><br>"
        s=s+"<p>First name: "+list[i].etunimi; + "</p><br>"
        s=s+"<p>Last name: "+list[i].sukunimi; + "</p><br>"
        s=s+"<p>Party: "+list[i].puolue; + "</p>"
        s=s+"<button  onclick='getEhdokas("+list[i].id+")'>Edit</button>";
        s=s+"<button  onclick='DeleteEhdokas("+list[i].id+")'>Delete</button></div>";
    }
    s=s+"</div>";
    document.getElementById("candidate").innerHTML=s;
}
    

    
    
    function getEhdokas(id){
    	var s="<p class='admin'>Editing candidate, ID: "+id+ "</p>"
        s=s+"<form method='post'>";
        s=s+"<div class='grid-container-questions'>";
        s=s+"<div class='grid-item-questions'>";
        s=s+"<input type='hidden' name='id' value='"+id+"' required>";
        s=s+"First name: <input type='text' name='etunimi' value='' required><br>";
        s=s+"Last name: <input type='text' name='sukunimi' value=''required ><br>";
        s=s+"Party: <select name='puolue' id='puolue'>";
        readAllParty2(s)
            }
    
    
    function sendCandidate(form){
    	var candidate=new Object();
    	candidate.id=form.id.value;
    	candidate.etunimi=form.etunimi.value;
    	candidate.sukunimi=form.sukunimi.value;
    	candidate.puolue=form.puolue.value;
    	if (candidate.etunimi === "" || candidate.sukunimi === "" || candidate.puolue === "") {
    		//readAllCandidate();
    		document.getElementById("resultall").innerHTML = "<p class='admin'>Form contains blank information!</p>";
    		return;
    	}
    	var jsonCandidate=JSON.stringify(candidate);
    	//document.getElementById("resultall").innerHTML = "<p class='admin'>Edited candidate: <br>" + "ID: " + candidate.id + "<br>" + "First name: " +  candidate.etunimi + "<br>" + "Last name: " + candidate.sukunimi + "<br>" + "Party: " + candidate.puolue + "</p>";
    	alert("Edited candidate: \n" + "ID: " + candidate.id + "\n" + "First name: " +  candidate.etunimi + "\n" + "Last name: " + candidate.sukunimi + "\n" + "Party: " + candidate.puolue + "\n")
    	var xmlhttp=new XMLHttpRequest();
    	xmlhttp.onreadystatechange = function() {
    	      if (this.readyState == 4 && this.status == 200) {
    	          readAllCandidate();
    	          
    	      }
    	    };
    	xmlhttp.open("POST", "/rest/service/edit", true);
    	xmlhttp.setRequestHeader("Content-type", "application/json");
    	xmlhttp.send(jsonCandidate);
    }
    
    function DeleteEhdokas(id){
    	var xmlhttp=new XMLHttpRequest();
    	xmlhttp.open("DELETE", "/rest/service/delete/"+id, true);
    	xmlhttp.send();
    	xmlhttp.onreadystatechange = function() {
    		if (this.readyState == 4 && this.status == 200) {
  	          readAllCandidate();
  	      }
    	}
    }
    
    function AddEhdokas(form){
        var candidate=new Object();
        candidate.etunimi=form.etunimi.value;
        candidate.sukunimi=form.sukunimi.value;
        candidate.puolue=form.puolue.value;
        var jsonCandidate=JSON.stringify(candidate);
        //document.getElementById("resultall").innerHTML = candidate.etunimi + candidate.sukunimi + candidate.puolue;
        alert("Added candidate: \n" + "ID: " + candidate.id + "\n" + "First name: " +  candidate.etunimi + "\n" + "Last name: " + candidate.sukunimi + "\n" + "Party: " + candidate.puolue + "\n");
        var xmlhttp=new XMLHttpRequest();
        if (candidate.etunimi === "" || candidate.sukunimi === "" || candidate.puolue === "") {
    		//document.getElementById("resultall").innerHTML = "<p class='admin'>Form contains blank information!</p>";
    		
    		//readAllCandidate();
    		return;
    	}
        xmlhttp.onreadystatechange = function() {
    		if (this.readyState == 4 && this.status == 200) {
  	          readAllCandidate();
  	        
  	      }
        }
        xmlhttp.open("POST", "/rest/service/add", true);
        xmlhttp.setRequestHeader("Content-type", "application/json");
        xmlhttp.send(jsonCandidate);
    }
    
    function readAllParty(){
        var xmlhttp=new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
              var jsonPartylist=this.responseText;
              //Add JSON string as a content of element resultall
              //document.getElementById("resultall").innerHTML = jsonCandidatelist;
              var Partylist=JSON.parse(jsonPartylist);
              //print fish by function printOneFish.
              printAllParty(Partylist);
          }
        };
        xmlhttp.open("GET", "/rest/service/getallpuolue", true);
        xmlhttp.send();   
    }
    function readAllParty2(s){
        var xmlhttp=new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
              var jsonPartylist=this.responseText;
              //Add JSON string as a content of element resultall
              //document.getElementById("resultall").innerHTML = jsonCandidatelist;
              var Partylist=JSON.parse(jsonPartylist);
              //print fish by function printOneFish.
              printAllParty2(Partylist,s);
          }
        };
        xmlhttp.open("GET", "/rest/service/getallpuolue", true);
        xmlhttp.send();   
    }
    
    function printAllParty(list){
    	var s= s;
        for (i in list){//or for (var i=0;i<list.length;i++){
            s=s+ "<option value="+list[i].puolue +">"+list[i].puolue+"</option>";
        }
        
     
        
		console.log(s)
        document.getElementById("puolue").innerHTML=s;
    }
        
    function printAllParty2(list,s){
        
        for (i in list){//or for (var i=0;i<list.length;i++){
            s=s+ "<option value="+list[i].puolue +">"+list[i].puolue+"</option>";
        }
        s=s+"<input type='submit' onclick='sendCandidate(this.form);' name='ok' value='OK'>";
        s=s+"</div>";
        s=s+"</div>";
        s=s+"</form id='zs'>";
        document.getElementById("candidate").innerHTML=s;
    }     
        
   
</script>
<div class="header">
        <a href="/index.html" class="logo">Election compass</a>
        <div class="header-right">
          <a href="/Logout">Logout</a>
        </div>
      </div>
  <body>
  <h1>ADMIN PAGE TO MANAGE CANDIDATES</h1>
 <div class="grid-container-admin">
<div class="grid-item-admin">
<h2>Add Candidates!</h2>
        <form method='post'>
    First Name: <input type='text' name='etunimi' value='' required><br>
    Last Name: <input type='text' name='sukunimi' value='' required><br>
	Party: <select name="puolue" id="puolue">
	
	<input type='submit' name='Add' value='Add' onclick='AddEhdokas(this.form);'>
	</form>
        </div>
</div>

<div class="dropdown">
  <button class="dropbtn">Sort candidates</button>
  <div class="dropdown-content">
    <button onClick='readAllCandidateSorted(7)'>ID</button>
    <button onClick='readAllCandidateSorted(1)'>First name ascending</button>
    <button onClick='readAllCandidateSorted(2)'>First name descending</button>
    <button onClick='readAllCandidateSorted(3)'>Last name ascending</button>
    <button onClick='readAllCandidateSorted(4)'>Last name descending</button>
    <button onClick='readAllCandidateSorted(5)'>Party ascending</button>
    <button onClick='readAllCandidateSorted(6)'>Party descending</button>
  </div>
</div>

    
    
    <p id='resultall'></p>
    <div id='candidate'>
    </div>
  </body>
</html>