<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/testAnimal.css">
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/normalize.css" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<title>나와 닮은 동물상 찾기</title>
</head>
<body>
	<!-- 전체영역 시작 -->
	<div id="wrap">
		<!-- 상단영역 시작 -->
		<div id="header">
			<div class="globalArea">
				<a href="">Join</a> <a href="">Login</a> <a href="">MyPage</a> <a
					href="">Home</a>
			</div>
			<div class="logoArea"></div>
		</div>
		<!-- 상단영역 끝 -->

		<!-- 본문영역 시작 -->
		<div id="content">
			<div>
				<h4 style="font-size: 16px; margin-top: 100px; color: #000">당신은
					어떤 동물인가요?</h4>
				<h3 style="font-size: 20px; margin-top: 10px; color: #000; style:bold">내
					얼굴로 알아보는 닮은꼴 동물상 찾기</h3>
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
				<button class="start-button"
					onClick="location.href='testAnimal.jsp'"> 동물상 테스트 시작하기 </button>
			</div>
		</div>
		<div>
		
		</div>
		<!-- 본문영역 끝 -->
	</div>
	<!-- 전체영역 끝 -->
</body>
</html>