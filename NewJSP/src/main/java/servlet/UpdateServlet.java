package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/boardUpdate")
public class UpdateServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		
		BoardDao dao = new BoardDao();
		
		dao.updateBoard(request);
		
		response.sendRedirect("boardRead.jsp?num="+num);
		
	}

}
