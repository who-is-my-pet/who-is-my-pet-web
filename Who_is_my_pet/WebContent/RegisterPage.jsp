<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Who's my pet 회원가입</title>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<div id="wrap">
		<br>
		<br> 
		<b><font size="6" color="gray">회원가입</font></b> <br>
		<br>
		<br>

		<form method="POST" action="Register.do" >
		
			아이디 : <input type="text" name="newid" maxlength="50"> 			
			<input type="button" value="중복확인"> <br>
			
			<div class="content_title">비밀번호</div>
			<div class="content_content">
				<input type="password" name="newpassword" id="pw_1" class="pw" maxlength="50"><br>
			</div>
			
			<div class="content_title">비밀번호 확인</div>
			<div class="content_content">
				<input type="password" name="newpassword" id="pw_2" class="pw" maxlength="50">
				<span id="alert-success" style="display:none;">비밀번호가 일치합니다.</span>
				<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
			</div>
			
			<script>
			    $('.pw').focusout(function () {
			        var pwd1 = $("#pw_1").val();
			        var pwd2 = $("#pw_2").val();
			 
			        if ( pwd1 != '' && pwd2 == '' ) {
			            null;
			        } else if (pwd1 != "" || pwd2 != "") {
			            if (pwd1 == pwd2) {
			                $("#alert-success").css('display', 'inline-block');
			                $("#alert-danger").css('display', 'none');
			            } else {
			                alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
			                $("#alert-success").css('display', 'none');
			                $("#alert-danger").css('display', 'inline-block');
			            }
			        }
			    });
			</script>
			
			이름 : <input type="text" name="name" maxlength="50"> <br>
			성별 <input type="radio" name="gender" value="남" checked>남 
			<input type="radio" name="gender" value="여" checked>여 <br>
			나이 : <input type="text" name="age" maxlength="50"> <br>
			인스타 주소 : <input type="text" name="insta" maxlength="50"> <br>
			이메일 : <input type="text" name="mail1" maxlength="50"> 
				<select name="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com</option>
				</select> <br>
			프로필 사진 : <input type="file" value="첨부파일" name="profileimg"> <br>
			자기 소개 : <input type="text" name="description" maxlength="200"> <br>
			<input type="submit" value="가입" /> <input type="button" value="취소">
			
		</form>
	</div>
</body>
</html>