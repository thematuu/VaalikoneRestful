package app;

import java.io.IOException;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import data.ResultScoring;
import data.answers;
import data.candidate;
import data.questions;

/**
 * servlet for answers
 */
@WebServlet("/ShowAnswers")
public class ShowAnswers extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Dao dao=null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowAnswers() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Cookie[] cookies = request.getCookies();

		for (int i = 0; i < cookies.length; i++) {
			System.out.println(cookies[i].getName() + " " + cookies[i].getValue());
		}
		
		ArrayList<questions> list = null;
		if (dao.getConnection()) {
			list = dao.readAllQuestions();
		} else {
			System.out.println("No connection to the database!");
		}
		ArrayList<candidate> list2 = null;
		if (dao.getConnection()) {
			list2 = dao.readAllCandidates();
		}

		ArrayList<questions> questionList = (ArrayList<questions>) list;
		ArrayList<candidate> candidateList = (ArrayList<candidate>) list2;
		ArrayList<ResultScoring> Scorelist = new ArrayList<ResultScoring>() ;
		try {
		for (int j = 0; candidateList != null && j < candidateList.size(); j++) {
			//response.getWriter().println();
			//response.getWriter().println();
			candidate c = candidateList.get(j);
			//response.getWriter().println("candidate ID: " + c.getId());
			for (int i = 0; questionList != null && i < questionList.size(); i++) {
				questions q = questionList.get(i);
				//response.getWriter().println("questions ID: " + q.getId());

				String canditateAnswer = null;
				if (dao.getConnection()) {
					String eid = Integer.toString(c.getId());
					String kid = Integer.toString(q.getId());
					canditateAnswer = dao.readAnswer(eid, kid);
					int canditateAnswerInt = Integer.parseInt(canditateAnswer);
					//response.getWriter().println("Canditaatin vastaus: " + canditateAnswerInt);
					for (int l = 0; l < cookies.length; l++) {
						Cookie cookie1 = cookies[l];
						int userAnswer = 0;
						if (cookie1.getName().equals("id" + kid)) {
							userAnswer = Integer.parseInt(cookie1.getValue());
							//response.getWriter().print("Vastasit: " + userAnswer);
							//response.getWriter().println();
							ResultScoring rs = new ResultScoring();
							int score = rs.score(userAnswer, canditateAnswerInt);
							//response.getWriter().println("Score: " + score);
							System.out.println(j);
							if (j >= Scorelist.size() || j < 0) {  //Scorelist.get(j) != null //Scorelist.size()==j
								System.out.println("TESTI");
								ResultScoring s = new ResultScoring();
								s.setId(Integer.parseInt(eid));
								s.setTotalPoints(score);
								Scorelist.add(s);
								
							}
							else{
								int TotalScore=score+Scorelist.get(j).getTotalPoints();
								Scorelist.get(j).setTotalPoints(TotalScore);
								System.out.println("boo");
							}
							System.out.println(Scorelist.get(j));
						}
					}
					//response.getWriter().println();

				} else {
					System.out.println("No connection to the database!");
				}

			}
		}
		Collections.sort(Scorelist);
		for (int j = 0; Scorelist != null && j < Scorelist.size(); j++) {
			ResultScoring s = Scorelist.get(j);
			System.out.println("Candidate ID: " + s.getId());
			System.out.println("Candidate TotalPoints: " + s.getTotalPoints());
			
			request.setAttribute("questionList", list);
			request.setAttribute("candidateList", list2);
			request.setAttribute("Scorelist", Scorelist);
			// request.setAttribute("candidateAnswer", s);
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/showresults.jsp");
			rd.forward(request, response);
		}

		}
		catch (Exception e) {
			RequestDispatcher rd=request.getRequestDispatcher("/html/error.html");
			rd.forward(request, response);
		}
	}

}

