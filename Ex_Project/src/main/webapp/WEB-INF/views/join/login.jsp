<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.idsave{-webkit-appearance: checkbox;}
</style>
<link rel="stylesheet" href="/pro/resources/css/login.css">
<script src="/pro/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function login(f) {
		let id = f.id.value.trim();
		let pwd = f.pwd.value.trim();
		
		if(id == ''){
			alert('아이디 입력해주세요');
			return;
		}
		if(pwd == ''){
			alert('비밀번호 입력해주세요');
			return;
		}
		
		if(id.length < 5){
			alert('아이디 글자수');
			return;
		}
		if(pwd.length < 4){
			alert('비밀번호 글자수');
			return;
		}
		let url = "login.do";
		let param = "id="+id+"&pwd="+encodeURIComponent(pwd);
		sendRequest(url,param,resultLogin,"post");
	}
	
	function resultLogin() {
		if(xhr.readyState == 4 && xhr.status == 200){
			let data = xhr.responseText;
			if(data == 'no_id'){
				alert('아이디가 없습니다.');
			}else if(data == 'no_pwd'){
				alert('비밀번호가 틀립니다.');
			}else{
				location.href= "board_list.do";
			}
		}
	}
</script>
</head>
<body>
    <div class="route">
        <p>Home > Login</p>
    </div>
    <div class="wrap">
        <h2>Login</h2>
        <p>회원정보 입력</p>
        <form action="login.do" method="post" name="frm" id="frm">
        <input type="hidden" name="command" value="login">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" id="id" size="20"></td>			
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd" size="20"></td>			
			</tr>
			<!-- <tr>
                 <td>
                 <input type="checkbox" class="idsave" id="idsave" name="idsave" value="saveOk" checked="checked" />아이디 저장</td>
            </tr> -->
			<tr>
				<td colspan="2" align="center">
				<input type="button" class="btn_submit" value="로그인" onclick="login(this.form)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" class="btn_reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<p class="loginSearchBtn" style="border-bottom: none"><a href="join_form.do" class="search">회원가입</a> ㅣ <a href="Searchid_form.do" class="search">아이디 찾기</a> ㅣ <a href="searchPwd_form.do" class="search">비밀번호 찾기</a></p>
    </div>
    <br>
</body>
</html>