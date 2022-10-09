<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bean" class="dto.BoardDto"/>
    <jsp:useBean id="dao" class="dao.BoardDao"/>
    <%
    	String num = request.getParameter("num");
    	bean = dao.readBoard(num);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardRead</title>
</head>
<body>
<table>
	<tr>
		<td>카테고리:</td>
		<td><%=bean.getCategory() %></td>
	</tr>
	<tr>
		<td>제목:</td>
		<td><%=bean.getTitle()%></td>
	</tr>
	<tr>
		<td>작성자:</td>
		<td><%=bean.getWriter() %></td>
	</tr>
	<tr>
		<td>내용:</td>
		<td><%=bean.getText() %></td>
	</tr>
</table>
<input type="button" value="수정" onclick="location.href='boardUpdate.jsp?num=<%=num%>'"/>
<input type="button" value="목록" onclick="location.href='boardList.jsp'"/>
<input type="button" value="삭제" onclick="location.href='boardDelete.jsp?num=<%=num%>'"/>
<input type="hidden" name="num " value="<%=num%>"/>
</body>
</html>