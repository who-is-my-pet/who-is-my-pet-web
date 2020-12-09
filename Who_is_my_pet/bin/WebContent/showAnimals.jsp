<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<%@ page import="dto.AnimalDTO"%>
<%@ page import="dao.AnimalDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>동물상 모아보기</title>
<link rel="stylesheet" type="text/css" href="./css/reset.css" />
<link rel="stylesheet" type="text/css" href="./css/normalize.css" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
</head>
<body>
	<%
		AnimalDAO animalDAO = new AnimalDAO();
		ArrayList<AnimalDTO> list = animalDAO.getAnimalInfo();
	%>
	<!-- 전체영역 시작 -->
	<div id="wrap">
		<!-- 상단영역 시작 -->
		<div id="header">
			<div class="globalArea">
				<a href="">Join</a> <a href="">Login</a> <a href="">MyPage</a> <a
					href="">Home</a>
			</div>
			<div class="logoArea">
				<h1>동물상 모아보기</h1>
			</div>
		</div>
		<!-- 상단영역 끝 -->

		<!-- 본문영역 시작 -->
		<div id="content">
			<div class="contentBoxgray">
				<div class="boxTitle"></div>
				<div class="leftBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/dog3.png"
							alt="dog" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(0).getName()%></h4>
					<p class="info"><%=list.get(0).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(0).getCelebs()%></strong>
					</p>
				</div>
				<div class="rightBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/cat1.png"
							alt="cat" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(1).getName()%></h4>
					<p class="info"><%=list.get(1).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(1).getCelebs()%></strong>
					</p>
				</div>
			</div>
			<div class="contentBoxgray">
				<div class="boxTitle"></div>
				<div class="leftBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/rabbit3.png"
							alt="rabbit" style="width: 300px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(2).getName()%></h4>
					<p class="info"><%=list.get(2).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(2).getCelebs()%></strong>
					</p>
				</div>
				<div class="rightBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/dino2.png"
							alt="dino" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(3).getName()%></h4>
					<p class="info"><%=list.get(3).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(3).getCelebs()%></strong>
					</p>
				</div>
			</div>
			<div class="contentBoxgray">
				<div class="boxTitle"></div>
				<div class="leftBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/fox3.png"
							alt="fox" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(4).getName()%></h4>
					<p class="info"><%=list.get(4).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(4).getCelebs()%></strong>
					</p>
				</div>
				<div class="rightBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/deer2.png"
							alt="deer" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(5).getName()%></h4>
					<p class="info"><%=list.get(5).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(5).getCelebs()%></strong>
					</p>
				</div>
			</div>
			<div class="contentBoxgray">
				<div class="boxTitle"></div>
				<div class="leftBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/horse3.png"
							alt="horse" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(6).getName()%></h4>
					<p class="info"><%=list.get(6).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(6).getCelebs()%></strong>
					</p>
				</div>
				<div class="rightBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/frog1.png"
							alt="frog" style="width: 300px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(7).getName()%></h4>
					<p class="info"><%=list.get(7).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(7).getCelebs()%></strong>
					</p>
				</div>
			</div>
			<div class="contentBoxgray">
				<div class="boxTitle"></div>
				<div class="leftBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/bear1.png"
							alt="bear" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(8).getName()%></h4>
					<p class="info"><%=list.get(8).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(8).getCelebs()%></strong>
					</p>
				</div>
				<div class="rightBox">
					<p>
						<img
							src="https://animal-img.s3.ap-northeast-2.amazonaws.com/sloth.png"
							alt="sloth" style="width: 400px; height: auto;">
					</p>
					<h4 class="title"><%=list.get(9).getName()%></h4>
					<p class="info"><%=list.get(9).getDescription()%></p>
					<p class="celeb">
						<strong>대표 연예인: <%=list.get(9).getCelebs()%></strong>
					</p>
				</div>
			</div>
		</div>
		<!-- 본문영역 끝 -->

		<!-- 하단영역 시작 -->
		<div id="footer">Copyright (c) 2020 김하경 백선혜 유새연</div>
		<!-- 하단영역 끝 -->
	</div>
	<!-- 전체영역 끝 -->
</body>
</html>