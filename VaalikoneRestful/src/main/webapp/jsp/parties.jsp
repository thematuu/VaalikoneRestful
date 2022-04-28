<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
     <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.questions" %> 
 <%@ page import="app.Login" %> 
 <%@ page import="dao.Dao" %>  
  <%@ page import="data.party" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%@ include file="../html/header.html" %>
<h1>Parties</h1>
<div class='grid-container-party'>
<%
ArrayList<party> questionList=(ArrayList<party>)request.getAttribute("questionList");
for (int i=0;questionList!=null && i<questionList.size();i++){
	party q=questionList.get(i);
	String party = q.getParties();
	if(party.equals("Vihreät")){
		party = "Vihreat";
	}
	out.println("<div class='grid-item-party'>");
	out.println("<a href='/Ehdokkaat?party="+party+"'>"+q.getParties() +"</a>");
	out.println("</div>");
}
%>
<div class='grid-item-party'>
<a href='/Ehdokkaat?party=all'>Show all candidates</a>
</div>
</div>

</body>
</html>