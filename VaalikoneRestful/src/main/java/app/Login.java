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

@WebServlet("/Admin")
public class Login extends HttpServlet {
	private static Dao dao;

	public void init() {
		dao = new Dao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root");
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		String username = request.getParameter("username");
		String password = MD5.crypt(request.getParameter("password"));
		
		
		if (dao.getConnection()) {
			String s = dao.readUser(username);
			if(s != null) {
				if (s.equals(password)) {
					ArrayList<questions> list = null;
					if (dao.getConnection()) {
						HttpSession session = request.getSession(true);
				        session.setAttribute("currentSessionUser",s);
						list = dao.readAllQuestions();
					} else {
						System.out.println("No connection to database");
					}

					request.setAttribute("questionList", list);
					RequestDispatcher rd = request.getRequestDispatcher("/jsp/adminpage.jsp");
					rd.forward(request, response);

				} else {
					response.getWriter().print("Wrong password!");

				}
			}
			else {
				response.getWriter().print("Wrong username or password!");

			}
			
		}

	}

}
