<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.questions" %>
 <%@ page import="data.answers" %>  
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidate Answers</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<% 	String candidateFirstname = String.valueOf(request.getAttribute("candidateFirstName"));
	String candidateLastname = String.valueOf(request.getAttribute("candidateLastName"));
%>

<%@ include file="../html/header.html" %>
<h1>Candidate <%out.println(candidateFirstname + " " + candidateLastname + "'s");%> answers: </h1>
<br><br>
	
	<div class='grid-container-questions'>
<%
ArrayList<String> answerList=(ArrayList<String>)request.getAttribute("answerList");
ArrayList<questions> questionList=(ArrayList<questions>)request.getAttribute("questionList");
ArrayList<String> cookieList=(ArrayList<String>)request.getAttribute("cookieList");
for (int i=0;questionList!=null && i<questionList.size();i++){
	questions q=questionList.get(i);
	out.println("<div class='grid-item-questions'>");
	out.println(i+1 + ": " + q.getQuestion()+"<br>");
	String id = Integer.toString(q.getId());
		
		String a = null;
		String option = null;
		if (i < answerList.size()) {
			a=answerList.get(i);
		
			out.println("<p> Candidate answer: </p>");
	
			
			if (a.equals("1")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test-selected'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("2")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test-selected'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("3")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test-selected'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("4")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test-selected'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("5")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test-selected'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else {
				out.println("<p>Candidate hasn't answered to this question yet.</p>");
			}
			
			
		}
		
		else {
			out.println("<p>Candidate hasn't answered to this question yet.</p>");
		}
		
		if (cookieList.size() != 0) {
			out.println("<p> Your answer: </p>");
		
		if (i < cookieList.size()) {
			a=cookieList.get(i);
		
	
	
			
			if (a.equals("1")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test-selected'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("2")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test-selected'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("3")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test-selected'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("4")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test-selected'><p>disagree</p></div>");
				out.println("<div class='grid-item-test'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else if (a.equals("5")) {
				out.println("<div class='grid-container-test'>");
				out.println("<div class='grid-item-test'><p>strongly agree</p></div>");
				out.println("<div class='grid-item-test'><p>agree</p></div>");
				out.println("<div class='grid-item-test'><p>neutral</p></div>");
				out.println("<div class='grid-item-test'><p>disagree</p></div>");
				out.println("<div class='grid-item-test-selected'><p>strongly disagree</p></div>");
				out.println("</div>");
			}
			else {
				out.println("<p>Candidate hasn't answered to this question yet.</p>");
			}
			
			
			
		}
		
		else {
			out.println("<p>Candidate hasn't answered to this question yet.</p>");
		}
			
		
	}
	
	out.println("</div>");
	
}
	%>
		
	
	</div>
           
        	

</body>
</html>