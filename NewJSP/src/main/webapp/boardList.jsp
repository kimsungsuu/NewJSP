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
	
	<form method="get" action="searchBoard.jsp">
	<input size="30" placeholder="제목으로 검색하세요" name="search">
	<%
	String search = request.getParameter("search");
	%>
	<input type="button" onclick="location.href='searchBoard.jsp?search=<%=search%>'" value="검색">
	</form>

	
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
		
		// pageNum을 파라미터로 가져옴
		// boardList가 메인 화면이기 때문에 처음에 pageNum 값은 null로 존재
		String stPageNum = request.getParameter("pageNum");
		
		// null로 존재하는 pageNum 파라미터 값에 임의로 1 값을 부여
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
<%-- 			<td><%=count-- %></td> --%>
			<td><%=bean.getNum()%></td>
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
		// 첫번째로 와야하는 페이지 번호
		int startPage = 1;
		
		// 하나의 라인에 표시될 수 있는 페이지 번호 개수
		int pageBlock = 10;
		
		// startPage 값 부여하는 로직
		if(pageNum/pageBlock == 0){
			startPage = 1;
		}else{
			startPage = ((pageNum-1)/pageBlock)*10+1;
		}
		
		// next 버튼을 클릭했을 때 다음 페이지 블록으로 이동
		int nextBlock = startPage + pageBlock;
		
		// prev 버튼을 클릭했을 때 이전 페이지 블록으로 이동
 		int prevBlock = startPage - pageBlock;
		
		//페이지 번호 개수
		int cnt = 0;
		
		// 게시글 개수 % pageBlock 나머지 여부에 따른 페이지 번호 수
		if(dao.cnt()%pageBlock==0){
			cnt = dao.cnt()/pageBlock;
		}else{
			cnt = dao.cnt()/pageBlock+1;
		}
		
		// 화면에 출력되는 페이지 번호 수를 지정
		// endPage가 페이지 번호 개수만큼만 출력 되도록 설정
		int endPage = startPage + (pageBlock-1);
		if(cnt < endPage){
			endPage = cnt;
		}
		%>
		
		<%if(pageNum >= pageBlock+1){%>
		<a href="boardList.jsp?pageNum=<%=prevBlock%>">prev</a>
		<%}%>
		
		<%for(int i=startPage; i<=endPage; i++){%>
			<a href="boardList.jsp?pageNum=<%=i%>"><%=i%></a>
		<%}%>
		
		<a href="boardList.jsp?pageNum=<%=nextBlock%>">next</a>
		
</body>
</html>