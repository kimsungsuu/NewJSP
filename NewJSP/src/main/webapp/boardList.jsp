<%@page import="java.util.ArrayList"%>
<%@page import="dto.BoardDto"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dao" class="dao.BoardDao"/>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
</head>
<body>
	<input type="button" onclick="location.href='boardPost.jsp'" value="등록">
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
		ArrayList<BoardDto> list = new ArrayList<>();
		
		String stPageNum = request.getParameter("pageNum");
		
		if(stPageNum == null){
			stPageNum="1";
		}
		
		int pageNum = Integer.parseInt(stPageNum);
		
		
		list = dao.boardList(pageNum);
		
		int count  = list.size();

		for (int i = 0; i < list.size(); i++) {
			BoardDto bean = list.get(i);
		%>
		<tr>
			<td><%=count-- %></td>
			<td><%=bean.getCategory() %></td>
			<td><a href="boardRead.jsp?num=<%=bean.getNum()%>"><%=bean.getTitle()%></a></td>
			<td><%=bean.getWriter()%></td>
			<td><%=bean.getHit() %>
			<td><%=bean.getCreate_date()%></td>
			<td><%=bean.getMod_date()%></td>
		</tr>
		<%
		}
		%>
	</table>
		<%
		for(int i=1; i<=10; i++){
		%>
			<a href="boardList.jsp?pageNum=<%=i%>"><%=i%></a>
		<%
		}
		%>
</body>
</html>