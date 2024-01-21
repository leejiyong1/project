<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="emailch.do" method="post">
	<input name="randaomkey">
	<input type="button" value="확인" onclick="send(this.form)">
</form>
</body>
</html>