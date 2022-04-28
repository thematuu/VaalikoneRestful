<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.questions" %>   
 <%@ page import="data.candidate" %> 
 <%@ page import="data.ResultScoring" %> 
 <%@ page import="java.text.DecimalFormat" %> 
 <%@ page import = "java.io.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Vaalikone Results</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%@ include file="../html/header.html" %>
<h1>Results: </h1>
<br>
<div class='grid-container-result '>
<%

ArrayList<questions> questionList=(ArrayList<questions>)request.getAttribute("questionList");
ArrayList<candidate> candidateList=(ArrayList<candidate>)request.getAttribute("candidateList");
ArrayList<ResultScoring> Scorelist=(ArrayList<ResultScoring>)request.getAttribute("Scorelist");
double maxscore = questionList.size()*2;
for (int i = 0; Scorelist != null && i < Scorelist.size(); i++) {
			int rank = i+1;
			ResultScoring s = Scorelist.get(i);
			out.println("<div class='grid-item-result'>");
			out.println("<h2>Compatibility ranking: " + rank +". </h1>");
			//out.println("<p>Candidate ID: " + s.getId()+"</p>");
			candidate c=null;
			for (int j=0;candidateList!=null && j<candidateList.size();j++){
			 	c=candidateList.get(j);
			 	if(c.getId()==s.getId()){
			 		out.println("<p>Candidate Name: " + c.getFirstName()+" " + c.getLastName()+"</p>");
					out.println("<p> Puolue: "+c.getParty()+"</p>");
					out.println("<form action='/ShowCandidateAnswers' method='post'>");
					out.println("<input type='hidden' name='etunimi' value='"+c.getFirstName()+"'>");
					out.println("<input type='hidden' name='sukunimi' value='"+c.getLastName()+"'>");
					out.println("<input type='hidden' name='id' value='"+c.getId()+"'>");
				
			 	}
			}
			double score = s.getTotalPoints();
			double prosent = score/maxscore*100;
			DecimalFormat df = new DecimalFormat("0.0");
			out.println("<p> Candidate fit percentage: " + df.format(prosent)+"%</p>");
			out.println("<input type='submit' name='ok' value='Show candidate answers'>");
			out.println("</form>");
			out.println("</div>");
		}
%>	
</div>	


</body>
</html>