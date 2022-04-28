<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="data.questions"%>
<%@ page import="dao.Dao"%>
<%@ page import="data.candidate"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Candidates</title>
<link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>
<%@ include file="../html/header.html" %>

	<h1>Candidates</h1>
	<div class='grid-container-candidate'>
	<%
		String party = request.getParameter("party");
		if (party.equals("Vihreat")) {
			party = "Vihreät";
		}
		ArrayList<candidate> questionList = (ArrayList<candidate>) request.getAttribute("questionList");
		if (party.equals("all")) {
			for (int i = 0; questionList != null && i < questionList.size(); i++) {
				candidate q = questionList.get(i);
				out.println("<div class='grid-item-candidate'>");
				out.println("<p>Name: " + q.getCandidateFirstName() + " "
						+ q.getCandidateLastName() + "<br>Party: " + q.getCandidateParty() + "</p>");
				out.println("<form action='/ShowCandidateAnswers' method='post'>");
				out.println("<input type='hidden' name='etunimi' value='"+q.getCandidateFirstName()+"'>");
				out.println("<input type='hidden' name='sukunimi' value='"+q.getCandidateLastName()+"'>");
				out.println("<input type='hidden' name='id' value='"+q.getId()+"'>");
				out.println("<input type='submit' name='ok' value='Show candidate answers'>");
				out.println("</form></div>");
			}
		} else {
			for (int i = 0; questionList != null && i < questionList.size(); i++) {
				candidate q = questionList.get(i);

				if (q.getCandidateParty().equals(party)) {
					out.println("<div class='grid-item-candidate'>");
					out.println("<p>Name: " + q.getCandidateFirstName() + " "
							+ q.getCandidateLastName() + "<br>Party: " + q.getCandidateParty() + "</p>");
					out.println("<form action='/ShowCandidateAnswers' method='post'>");
					out.println("<input type='hidden' name='etunimi' value='"+q.getCandidateFirstName()+"'>");
					out.println("<input type='hidden' name='sukunimi' value='"+q.getCandidateLastName()+"'>");
					out.println("<input type='hidden' name='id' value='"+q.getId()+"'>");
					out.println("<input type='submit' name='ok' value='Show candidate answers'>");
					out.println("</form></div>");
				}
			}

		}
	%>
	</div>

</body>
</html>