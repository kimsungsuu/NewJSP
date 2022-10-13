package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/boardDelete")
public class DeleteServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String num = request.getParameter("num");
		String passwordCheck = request.getParameter("passwordCheck");
		Boolean flag=false;
		
		BoardDao dao = new BoardDao();
		flag = dao.deleteBoard(num, passwordCheck);
		
		if(flag == true) {
			response.sendRedirect("boardList.jsp");
		}else{
			response.sendRedirect("failDelete.jsp?num="+num);
		}
	}
}
