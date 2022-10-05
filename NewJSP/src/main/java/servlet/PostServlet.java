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
		
	request.setCharacterEncoding("EUC-KR");
	response.setContentType("text/html; charset=EUC-KR");
	
	String title = request.getParameter("title");
	String category = request.getParameter("category");
	String password = request.getParameter("password");
	String writer= request.getParameter("writer");
	String text = request.getParameter("text");
	
	// 게시글 저장 로직 호출(dao)
	BoardDao dao = new BoardDao();
	dao.boardPost(title, category, writer, password, text);
	
	// 서블릿 처리된 데이터를 정적 페이지로 웹서버에 보내줌(redirect)
	
	response.sendRedirect("boardList.js p");
	
	out.print("실행 Test!!");
}
	
	
}
