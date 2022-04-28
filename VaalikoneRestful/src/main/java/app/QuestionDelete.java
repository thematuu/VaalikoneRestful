package app;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import data.questions;

@WebServlet(
    name = "Delete",
    urlPatterns = {"/deleteQuestion"}
)
public class QuestionDelete extends HttpServlet {
	private Dao dao=null;
	public void init() {
		dao=new Dao("jdbc:mysql://localhost:3306/db_vaalikone", "root", "root"); }
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
	     throws IOException, ServletException {
		String id=request.getParameter("id");
		ArrayList<questions> list=null;
		if (dao.getConnection()) {
			list=dao.deleteQuestion(id);
		}
		request.setAttribute("questionList", list);
		RequestDispatcher rd=request.getRequestDispatcher("/jsp/adminpage.jsp");
		rd.forward(request, response);
	}
}