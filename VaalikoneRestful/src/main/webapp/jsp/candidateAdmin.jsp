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
<script type="text/javascript" src="/js/script.js"></script>
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
  <button class="dropbtn" onClick='readAllCandidateSorted(7)'>Sort candidates</button>
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