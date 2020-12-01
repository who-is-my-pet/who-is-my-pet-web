<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/testAnimal.css">
<title>나와 닮은 동물상 찾기</title>
</head>
<body>
<h4 style="font-size:16px; margin-top:100px">당신은 어떤 동물인가요?</h4>
<h3 style="font-size:20px; margin-top:10px">내 얼굴로 알아보는 닮은꼴 동물상 찾기</h3>
	<div class="fox">
		<div class="head">
			<div class="eye"></div>
			<div class="eye"></div>
		</div>
		<div class="ear"></div>
		<div class="ear"></div>
		<div class="nose"></div>
		<div class="body"></div>
		<div class="tail"></div>
	</div>

	<button class="start-button" onClick="location.href='testAnimal.jsp'">동물상 테스트 시작하기</button>
</body>
</html>