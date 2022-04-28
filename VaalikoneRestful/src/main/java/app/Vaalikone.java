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
import data.candidate;
import data.questions;
import data.ResultScoring;

/**
 * Servlet implementation class Converter
 */
@WebServlet("/Vaalikone")
public class Vaalikone extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Dao dao = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Vaalikone() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public void init() {
		dao = new Dao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			Cookie cookie = cookies[i];

			Cookie cookiee = new Cookie(cookie.getName(), "");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		}
		catch (Exception e){
			//do nothing
		}
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

		ArrayList<questions> list = null;
		if (dao.getConnection()) {
			list = dao.readAllQuestions();
		} else {
			System.out.println("No connection to the database!");
		}

		request.setAttribute("questionList", list);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/showquestions.jsp");
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");

		Map<String, String[]> allMap = request.getParameterMap();

		for (String key : allMap.keySet()) {
			String[] strArr = (String[]) allMap.get(key);
			for (String val : strArr) {
				String valSplit = val.replace("-option-", "-");
				String[] parts = valSplit.split("-", 2);
				String part1 = parts[0];
				String part2 = parts[1];
				Cookie c = new Cookie("id" + part1, part2);
				c.setMaxAge(60 * 60 * 24);
				response.addCookie(c);
			}
		}

		RequestDispatcher rd = request.getRequestDispatcher("/html/showresults.html");
		rd.forward(request, response);

	}

}
