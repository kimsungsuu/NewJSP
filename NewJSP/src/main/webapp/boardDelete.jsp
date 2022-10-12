<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String num = request.getParameter("num");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDelete</title>
</head>
<body>
<h1>정말로 삭제하시겠습니까?</h1>

<form method="post" action="boardDelete">
	<input type="submit" value="확인"/>
	<input type="button" value="취소" onclick="history.back()"/>
	<input type="hidden" name="num" value="<%=num%>"/>
</form>
</body>
</html>