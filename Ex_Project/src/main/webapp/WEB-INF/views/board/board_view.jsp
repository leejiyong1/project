<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<!-- Ajax사용을 위한 js추가 -->
		<script src="/pro/resources/js/httpRequest.js"></script>
		
		<script>
			function del(f) {
				let url = "board_del.do";
				let param = "idx="+f.idx.value+"&id="+f.id.value;
				
				sendRequest(url,param,resdel,"post");
			}
			
			function resdel() {
				if(xhr.readyState == 4 &&xhr.status == 200){
					let data = xhr.responseText;
					
					if(data == 1){
						alert('삭제성공');
						location.href = 'board_list.do';
					}else{
						alert('삭제실패');
					}
				}
			}
		</script>
		
	</head>
	
	<body>
		
		<form name="f" method="post">
		<input type="hidden" value="${vo.idx}" name="idx">
		<table border="1" width="700" align="center">
		
			<tr>
				<td>제목</td>
				<td>${ vo.title }</td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td>${ vo.id }</td>
			</tr>
			
			<tr>
				<td>작성일</td>
				<td>${ vo.regdate }</td>
			</tr>
			
			<tr>
				<td>ip</td>
				<td>${ vo.ip }</td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td><pre>${ vo.content }</pre></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 목록으로 -->
					<img src="/pro/resources/img/btn_list.gif" 
					onclick="location.href='board_list.do?page=${param.page}'"
					     style="cursor:pointer;">
					<c:if test="${!empty mem }">
					<input type="hidden" name="id" value="${mem.id }">
					<c:if test="${ vo.depth eq 0 }">
						<!-- 댓글 -->
						<img src="/pro/resources/img/btn_reply.gif" onclick="reply();" 
						     style="cursor:pointer;">
					</c:if>     
					     
					<!-- 수정 -->
					<img src="/pro/resources/img/btn_modify.gif" onclick="modify();"
					     style="cursor:pointer;">  
					     
					<!-- 삭제 -->
					
					
					<img src="/pro/resources/img/btn_delete.gif" onclick="del(this.form);"
					     style="cursor:pointer;">
					</c:if>         
				</td>
			</tr>
		</table>
		</form>
	</body>
</html>










