<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
     <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.questions" %> 
 <%@ page import="app.Login" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN PAGE</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
 <div class="header">
        <a href="/index.html" class="logo">Election compass</a>
        <div class="header-right">
          <a href="/Logout">Logout</a>
        </div>
      </div>
<body>
<%@ include file="../html/somehtml.html" %>
<%
if(session.getAttribute("currentSessionUser")==null)
{
response.sendRedirect("/admin.html");
}
else{
}
%>
<div class='grid-container-admin'>
<div class='grid-item-admin'>
<h2>Add question!</h2>
        <form action="/AddQuestion" method="POST">
            <p>
                Give the question you want to add <input type="text" name="question">
            </p>
            <p>
                <input type="submit" value="Add">
            </p>
        </form>	
        </div>
</div>

        <div class='grid-container'>
<%
ArrayList<questions> questionList=(ArrayList<questions>)request.getAttribute("questionList");

for (int i=0;questionList!=null && i<questionList.size();i++){
	questions q=questionList.get(i);
	out.println("<div class='grid-item'>");
	out.println("<p>ID: "+q.getId()+"  Question: "+q.getQuestion()+"</p> <form action='/deleteQuestion' style='display: inline-block;' method='POST'><input type='hidden' name='id' value='"+q.getId()+"'><input type='submit' name='ok' value='Delete'></form>");
	out.println("<form action='/UpdateQuestion' method='POST'>");
	out.println("<input type='hidden' name='id' value='"+q.getId()+"'><br>UPDATE THE QUESTION: <input type='text'data-required='true' size='50' name='kysymys' value=''><br>");
	out.println("<input type='submit' name='ok' value='Update'></form>");
	out.println("</div>");
}
%>
</div>



</body>
</html>