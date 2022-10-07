<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="dao" class="dao.BoardDao"/>
    <jsp:useBean id="bean" class="dto.BoardDto"/>
    <%
	String num = request.getParameter("num");
	bean = dao.readBoard(num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardUpdate</title>
</head>
<body>
<form method="post" action="boardUpdate">
<table>
	<tr>
		<td>카테고리 :</td>
		<td><select name="category">
				<option value="<%=bean.getCategory()%>" selected><%=bean.getCategory()%></option>
				<option value="Java">Java</option>
				<option value="SQL">SQL</option>
				<option value="Spring">Spring</option>
		</select></td>
	</tr>

	<tr>
		<td>제목 :</td>
		<td><input name="title" value="<%=bean.getTitle()%>"></td>
	</tr>

	<tr>
		<td>작성자 명 :</td>
		<td><input name="writer" value="<%=bean.getWriter()%>"></td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td>
			<textarea name="text"><%=bean.getText()%></textarea>
		</td>
	</tr>
</table>
	<input type="submit" value="수정">
	<input type="button" value="취소" onclick="history.back()"/>
	<input type="hidden" name="num" value="<%=num%>"/>
</form> 
</body>
</html>