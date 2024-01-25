<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${!empty sessionScope.mem }">
<a href="mypage.do">마이페이지</a>/
<a href="logout.do">로그아웃</a>
</c:if>
<c:if test="${empty sessionScope.mem }">
<a href="join_form.do">회원가입</a>/
<a href="login_form.do">로그인</a>
</c:if>
</body>
</html>