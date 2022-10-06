<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    errorPage="postError.jsp"
    %>
   <%
   	request.setCharacterEncoding("UTF-8");
   %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardPost</title>
</head>
<body>
<h2>게시판을 등록합니다.</h2>
<form name="boardPostForm" action="boardPost" method="post">
	<table>
		<tr>
			<td>카테고리
				<select name="category">
					<option value="Java" selected>Java</option>
					<option value="SQL">SQL</option>
					<option value="Spring">Spring</option>
				</select>			
			</td>
		</tr>
		
		<tr>
			<td>
				제목 <input type="text" name="title"/>
			</td>
		</tr>
		
		<tr>
			<td>
				비밀번호<input type="password" name="password"/>
			</td>
		</tr>
		
		<tr>
			<td>
				작성자명 <input type="text" name="writer"/>
			</td>
		</tr>
		
		
		
		<tr>
			<td>
				내용<textarea name="text"></textarea>
			</td>
		</tr>
	</table>
	
	<input type="submit" value="저장"/>
	<input type="button" value="취소" onclick="history.back()"/>
	
</form>

</body>
</html>