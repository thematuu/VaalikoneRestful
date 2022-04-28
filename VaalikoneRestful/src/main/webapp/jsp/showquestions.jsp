<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.questions" %>   
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vaalikone Questions</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%@ include file="../html/header.html" %>
<h1>Answer these questions: </h1>
<br><br>
	<form action="/Vaalikone" method="POST">
	<div class='grid-container-questions'>
<%
ArrayList<questions> questionList=(ArrayList<questions>)request.getAttribute("questionList");
int name = 0;
for (int i=0;questionList!=null && i<questionList.size();i++){
	questions q=questionList.get(i);
	out.println("<div class='grid-item-questions'>");
	out.println(i+1 + ": " + q.getQuestion()+"<br><br>");
	%>
				<input type="radio" id=<%out.println(q.getId() + "-option-5");%> value=<%out.println(q.getId() + "-option-5");%> name=<%out.println(name);%>>
				<label for=<%out.println(q.getId() + "-option-5");%>>strongly agree</label>
				<input type="radio" id=<%out.println(q.getId() + "-option-4");%> value=<%out.println(q.getId() + "-option-4");%> name=<%out.println(name);%>>
				<label for=<%out.println(q.getId() + "-option-4");%>>agree</label>
				<input type="radio" id=<%out.println(q.getId() + "-option-3");%> value=<%out.println(q.getId() + "-option-3");%> name=<%out.println(name);%> checked>
                <label for=<%out.println(q.getId() + "-option-3");%>>neutral</label>
                <input type="radio" id=<%out.println(q.getId() + "-option-2");%> value=<%out.println(q.getId() + "-option-2");%> name=<%out.println(name);%>>
                <label for=<%out.println(q.getId() + "-option-2");%>>disagree</label>
                <input type="radio" id=<%out.println(q.getId() + "-option-1");%> value=<%out.println(q.getId() + "-option-1");%> name=<%out.println(name);%>>
               	<label for=<%out.println(q.getId() + "-option-1");%>>strongly disagree</label>
    		<%out.println("</div>");
    		name++;
    		%>
    		
	<%}%>
	
	</div>
	<div class='grid-container-questions'>
	<div style='width: 50%; margin: 0 auto;'>
        <input class='question' type="submit" value="Submit">
               </div>
                </div>
        </form>	    

</body>
</html>