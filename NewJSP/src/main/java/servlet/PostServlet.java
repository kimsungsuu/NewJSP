package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDao;

@WebServlet("/boardPost")
public class PostServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
							throws IOException, ServletException{
		
	PrintWriter out = response.getWriter();
		
	request.setCharacterEncoding("UTF-8");

	
	// 게시글 저장 로직 호출(dao)
	BoardDao dao = new BoardDao();
	dao.insertBoard(request);
	
	// 서블릿 처리된 데이터를 정적 페이지로 웹서버에 보내줌(redirect)
	
	response.sendRedirect("boardList.jsp");
	
	out.print("실행 Test!!");
}
	
	
}
