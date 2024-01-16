<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="wrap" align="center">
<table class="list">
		
		<tr>
		<td colspan="5" style="border: white; text-align: right"><a href="boardServlet?command=board_write_form">공지 등록</a></td>
		</tr>
			<tr>
				<th>공지번호</th>
				<th>공지내용</th>
				<th>공지일</th>
				<th>삭제</th>
			</tr>

			<c:forEach var="board" items="${list}">
			
				<tr class="record">
				
				
					<td>${board.idx }</td>
					<td>${board.title }</td>
					<td>${fn:split(board.regdate,' ')[0]}</td>
					<td><a href="boardServlet?command=board_delete&boardNum=${board.idx}">공지삭제</a></td>
					
				</tr>
				</c:forEach>
			

		</table>
	</div>
</body>
</html>