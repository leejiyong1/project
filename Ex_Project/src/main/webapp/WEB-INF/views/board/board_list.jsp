<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/pro/resources/css/board.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
	 <a href="board_write_form.do" class="btn btn-success">글쓰기</a>
		<h2 align="center">게시판</h2>
		<table>
			<tr>
				<th>게시물 번호</th>
				<th>제목</th>
				<th>작성자 아이디</th>
				<th>작성 날짜</th>
			</tr>
			<c:forEach var="board" items="${list}">

				<tr class="record">
					<td width="10%">${board.idx }</td>
					<td width="50%"><a href="board_view.do?idx=${board.idx }&page=${empty param.page ? 1 : param.page}">${board.title }</a></td>
					<td width="20%">${board.id }</td>
					<td width="20%">${fn:split(board.regdate,' ')[0]}</td>
				</tr>
			</c:forEach>
			<tr align="center">
			<td colspan="5">
				${menu }
			</td>
		</tr>
		</table>
	</div>
</body>
</html>