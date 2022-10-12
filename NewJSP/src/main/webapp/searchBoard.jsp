<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Board</title>
</head>
<body>
<table border="1">
		<tr align="center">
			<td>번호</td>
			<td>카테고리</td>
			<td>제목</td>
			<td>작성자</td>
			<td>조회수</td>
			<td>게시 일자</td>
			<td>수정 일자</td>
		</tr>
		
		<% 
		ArrayList<BoardDto> searchList = new ArrayList<>();

		BoardDao dao = new BoardDao();

		String search = request.getParameter("search");

		searchList = dao.searchBoard(search);

		for(int i=1; i<=searchList.size(); i++){
			BoardDto bean = searchList.get(i);
 		%> 
		
		<tr>
			<td><%=bean.getNum()%></td>
			<td><%=bean.getCategory() %></td>
			<td><a href="boardRead.jsp?num=<%=bean.getNum()%>"><%=bean.getTitle()%></a></td>
			<td><%=bean.getWriter()%></td>
			<td><%=bean.getHit() %>
			<td><%=bean.getCreate_date()%></td>
			<td><%=bean.getMod_date()%></td>
		</tr>
		
		<%}%>
		</table>
		
</body>
</html>