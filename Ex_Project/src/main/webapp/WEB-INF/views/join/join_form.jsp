<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/pro/resources/css/join.css">
<script src="/pro/resources/js/httpRequest.js"></script>
<script>
	
	let check = false;
	
	function idCheck() {
		let id = document.getElementById('id').value.trim();
		
		if(id == ''){
			alert('아이디 입력하세요');
			return;
		}
		
		let url = 'id_check.do';
		let param = "id="+id;
		sendRequest(url,param,checkId,'post');
	}
	
	function checkId() {
		if(xhr.readyState == 4 &&xhr.status==200){
			let data = xhr.responseText;
			
			if(data == 'no'){
				alert('동일한 아이디가 존재합니다');
			}else{
				check = true;
				alert('사용가능한 아이디 입니다.');
			}
		}
	}
	
	function change() {
		check=false;
	}
	
</script>
</head>
<body>
  <div class="route">
        <p>Home > Join</p>
    </div>
    <div class="wrap">
        <h2>SIGN UP</h2>
        <p>회원정보 입력</p>
        <form action="join.do" method="post" name="frm" id="frm">
		<table>
			<tr>
				<td>이름*</td>
				<td><input type="text" name="name" size="20"></td>			
			</tr>
			<tr>
				<td>아이디*</td>
				<td><input type="text" name="id" size="20" id="id" onchange="change()">
				<input class="btn_idcheck" type="button" value="중복체크" onclick="idCheck()"></td>			
			</tr>
			<tr>
				<td>비밀번호*</td>
				<td><input type="password" name="pwd"size="20"></td>			
			</tr>
			<tr>
				<td>비밀번호 확인*</td>
				<td><input type="password" name="pwd_ch" size="20"></td>
			</tr>
			<tr>
				<td>전화번호( - 제외)*</td>
				<td><input type="text" name="phone" size="20" maxlength="11"></td>			
			</tr>
			<tr>
				<td>이메일*</td>
				<td><input type="text" name="email" size="20"> 
				<!-- <select id="email" name="email2" size="1">
                    <option value="">선택하세요</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="naver.com">naver.com</option>
                    <option value="hotmail.com">hotmail.com</option>
                    <option value="yahoo.co.kr">yahoo.co.kr</option>
                    <option value="paran.com">paran.com</option>
                    <option value="nate.com">nate.com</option>
                    <option value="gmail.com">gmail.com</option>
			    </select> --></td>
			</tr>
			<tr>
				<td>생년월일(8자리)*</td>
				<td><input type="date" name="birth" size="10" maxlength="5"></td>			
			</tr>
			<tr>
				<td>성별*</td>
				<td><input type="radio" class="gender" name="gender" value="male" checked="checked" />남자
					<input type="radio" class="gender" name="gender" value="female" />여자</td>			
			</tr>
			<!-- <tr>
				<td>우편번호</td>
				<td><input type="text" name="member_postcode" id="member_postcode" size="10" readonly />
				<input type="button" class="btn_findpost" value="우편번호찾기" 
                onclick='execDaumPostcode("member_postcode", "member_Addr1", "member_Addr2")' /></td>		
			</tr> -->
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"size="28" readonly /></td>			
			</tr>
			<!-- <tr>
				<td>상세주소</td>
				<td><input type="text" name="member_Addr2" id="member_Addr2" size="28"></td>			
			</tr> -->
			<tr>
				<td colspan="2" align="center">
				<input class="btn_submit" type="button" value="가입하기" onclick="return joinCheck()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input class="btn_reset" type="reset" value="다시작성"></td>
			</tr>
		</table>
	</form>
    </div>
</body>
</html>