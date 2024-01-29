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
<script>
	function searchBoard() {
		let keyword = document.getElementById('keyword').value;
		let searchType = document.getElementById('searchType').value;
		
		location.href = 'board_search.do?keyword='+keyword+"&searchType="+searchType;
	}
	
	function handleEnterKeyPress(event) {
		if (event.key === 'Enter') {
			searchBoard();
		}
	}
	
	window.onload = function() {
        // 페이지 로드 시 실행되는 함수
        setPageDefaults();
    }

    function setPageDefaults() {
        // URL에서 searchType 파라미터 가져오기
        let params = new URLSearchParams(window.location.search);
        let searchType = params.get('searchType');

        // searchType 값이 있으면 select 박스 값을 해당 값으로 설정
        if (searchType) {
            document.getElementById('searchType').value = searchType;
        }
    }
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/mypage/index.jsp"/>
	<div class="container">
	 <a href="board_write_form.do" class="btn btn-success">글쓰기</a>
		<h2 align="center">게시판</h2>
		<table>
			<tr>
				<th>게시물 번호</th>
				<th>제목</th>
				<th>작성자 아이디</th>
				<th>조회수</th>
				<th>작성 날짜</th>
			</tr>
			<c:forEach var="board" items="${list}">

				<tr class="record">
					<td width="10%">${board.idx }</td>
					<c:if test="${param.keyword eq null }">
					<td width="30%"><a href="board_view.do?idx=${board.idx }&page=${empty param.page ? 1 : param.page}">${board.title }</a></td>
					</c:if>
					<c:if test="${param.keyword ne null }">
					<td width="30%"><a href="board_view.do?idx=${board.idx }&page=${empty param.page ? 1 : param.page}&keyword=${param.keyword}&searchType=${param.searchType}">
					${board.title }</a></td>
					</c:if>
					<td width="20%">${board.id }</td>
					<td width="20%">${board.hit}</td>
					<td width="20%">${fn:split(board.regdate,' ')[0]}</td>
				</tr>
			</c:forEach>
			<tr align="center">
			<td colspan="5">
				${menu }
			</td>
		</tr>
		</table>
		<!-- 검색 창 -->
		<!-- 검색 창 -->
    <div class="row mb-3">
        <div class="col-md-4">
            <select class="form-control" id="searchType">
                <option value="title">제목</option>
                <option value="titleContent">제목+내용</option>
                <option value="id">아이디</option>
            </select>
        </div>
        <div class="col-md-4">
        <c:if test="${empty param.keyword }">
        	<input type="text" class="form-control" id="keyword" placeholder="검색어를 입력하세요" onkeypress="handleEnterKeyPress(event)">
        </c:if>
            <c:if test="${!empty param.keyword }">
        	<input type="text" class="form-control" id="keyword" value="${param.keyword }" onkeypress="handleEnterKeyPress(event)">
        </c:if>
        </div>
        <div class="col-md-4">
            <button class="btn btn-primary" onclick="searchBoard()">검색</button>
        </div>
    </div>
	</div>
</body>
</html>