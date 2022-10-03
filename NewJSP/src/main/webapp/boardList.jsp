<%@page import="dto.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>게시판 간략하게 출력</h2>
<%
	BoardDao dao = new BoardDao();

	Vector<BoardDto> vlist = new Vector<>();
	
	vlist = dao.boardList();
	
	for(int i=0; i < vlist.size(); i++){
		BoardDto bean = vlist.get(i);
		
		out.print("</br> 제목 : " + bean.getTitle() + "</br>"); 
		out.print("작성자 : " + bean.getWriter() + "</br>");
		out.print("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
	}
%>

</body>
</html>