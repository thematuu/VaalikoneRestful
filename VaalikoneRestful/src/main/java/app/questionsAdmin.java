package app;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.Dao;
import data.User;
import data.questions;
import data.MD5;
import java.sql.*;
import java.util.ArrayList;
/**
 * servlet for redirecting into adminpage with questions
 */
@WebServlet("/questionsAdmin")
public class questionsAdmin extends HttpServlet {
	private static Dao dao;

	public void init() {
		dao = new Dao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root");
	}

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		ArrayList<questions> list = null;
		if (dao.getConnection()) {
			list = dao.readAllQuestions();
			} else {
					System.out.println("No connection to database");
					}

		request.setAttribute("questionList", list);
		RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminpage.jsp");
		rd.forward(request, response);

				
			
		}

}


