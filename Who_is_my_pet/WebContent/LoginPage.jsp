<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Who's my pet 로그인 페이지</title>
<script type="text/javascript">
    
        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.id.value)
            {
                alert("아이디를 입력하세요");    
                inputForm.id.focus();
                return false;
            }
            if(!inputForm.password.value)
            {
                alert("비밀번호를 입력하세요");    
                inputForm.password.focus();
                return false;
            }
        }
    </script>
</head>
<body>
	<form method="POST" action="Login.do" name="loginInfo" onsubmit="return checkValue()">
		<label> ID : </label> 
		<input name="id" type="text"><br /> 
		
		<label>Password : </label> 
		<input name="pw" type="password"><br /> 
		
		<input type="submit" value="로그인">
		<a href="RegisterPage.jsp">회원가입</a>
	</form>
</body>
</html>