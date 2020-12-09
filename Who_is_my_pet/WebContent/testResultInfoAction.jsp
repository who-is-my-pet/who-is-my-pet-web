<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<%@ page import="dto.AnimalDTO"%>
<%@ page import="dao.AnimalDAO"%>
<%@ page import="dto.UserAnimalDTO"%>
<%@ page import="dao.UserAnimalDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/style.css">
<title>나의 동물상 찾기</title>
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
			<%!int animal_idx = 0;%>
			<%
				AnimalDAO animalDAO = new AnimalDAO();
				ArrayList<AnimalDTO> list = animalDAO.getAnimalInfo();

				request.setCharacterEncoding("UTF-8");
				String animal_id = null;
				String user_id = null;

				if (request.getParameter("animal_idx") != null) {
					animal_id = (String) request.getParameter("animal_idx");
					if (animal_id.equals("강아지상"))
						animal_idx = 0;
					if (animal_id.equals("고양이상"))
						animal_idx = 1;
					if (animal_id.equals("토끼상"))
						animal_idx = 2;
					if (animal_id.equals("공룡상"))
						animal_idx = 3;
					if (animal_id.equals("여우상"))
						animal_idx = 4;
					if (animal_id.equals("사슴상"))
						animal_idx = 5;
					if (animal_id.equals("말상"))
						animal_idx = 6;
					if (animal_id.equals("개구리상"))
						animal_idx = 7;
					if (animal_id.equals("곰상"))
						animal_idx = 8;
					if (animal_id.equals("나무늘보상"))
						animal_idx = 9;
				}

				if (animal_id == null) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('입력되지 않은 사항이 있습니다.');");
					script.println("history.back();");
					script.println("</script>");
					script.close();
					return;
				}
				/*
						HttpSession session = request.getSession(false);
						if(session==null){
							session = request. getSession(); 
						}
						//세션의 속성 사용
						String id = (String)session.getAttribute("id");
						
						String id = "";
				
				
				
						try{
				
						id = (String)session.getAttribute("id");            // request에서 id 파라미터를 가져온다
				
				
				
						if(id==null||id.equals(""){                            // id가 Null 이거나 없을 경우
				
						response.sendRedirect("loginform.jsp");    // 로그인 페이지로 리다이렉트 한다.
						history.go(-1);                                    // 이전 페이지로 이동
				
						}
				
				*/
				UserAnimalDAO userAnimalDAO = new UserAnimalDAO();
				int result = userAnimalDAO.faceInfo(1, animal_idx);
				System.out.println("result" + result);

				/*
				if (result == 1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('DB로 정보 보내기 성공');");
					script.println("</script>");
					script.close();
					//return;
				}
				*/
			%>
			<br>
			<div
				style="text-align: center; font-size: 60px; color: #000; margin-bottom: 80px"><%=list.get(animal_idx).getName()%></div>
			<%
				if (animal_idx == 0) {
			%>
			<img src="img/dog3.png" alt="dog" style="width: 400px; height: auto;">
			<%
				}
				if (animal_idx == 1) {
			%>
			<img src="img/cat1.png" alt="cat" style="width: 400px; height: auto;">
			<%
				}
			%>
			<%
				if (animal_idx == 2) {
			%>
			<img src="img/rabbit3.png" alt="rabbit"
				style="width: 400px; height: auto;">
			<%
				}
				if (animal_idx == 3) {
			%>
			<img src="img/dino2.png" alt="dino"
				style="width: 400px; height: auto;">
			<%
				}
			%>
			<%
				if (animal_idx == 4) {
			%>
			<img src="img/fox3.png" alt="fox" style="width: 400px; height: auto;">
			<%
				}
				if (animal_idx == 5) {
			%>
			<img src="img/deer2.png" alt="deer"
				style="width: 400px; height: auto;">
			<%
				}
			%>
			<%
				if (animal_idx == 6) {
			%>
			<img src="img/horse3.png" alt="horse"
				style="width: 400px; height: auto;">
			<%
				}
				if (animal_idx == 7) {
			%>
			<img src="img/frog1.png" alt="frog"
				style="width: 400px; height: auto;">
			<%
				}
			%>
			<%
				if (animal_idx == 8) {
			%>
			<img src="img/bear1.png" alt="bear"
				style="width: 400px; height: auto;">
			<%
				}
				if (animal_idx == 9) {
			%>
			<img src="img/sloth.png" alt="sloth"
				style="width: 400px; height: auto;">
			<%
				}
			%>
			<div style="padding: 25px;">
				<div
					style="text-align: center; font-size: 15px; color: #000; margin-top: 50px; margin-bottom: 10px">
					닮은 연예인:
					<%=list.get(animal_idx).getCelebs()%></div>
				<div style="text-align: center; font-size: 15px; color: #000;"><%=list.get(animal_idx).getDescription()%></div>
			</div>
		</div>
		<div></div>
		<!-- 본문영역 끝 -->
		<!-- 하단영역 시작 -->
		<div id="footer">Copyright (c) 2020 김하경 백선혜 유새연</div>
		<!-- 하단영역 끝 -->
	</div>
	<!-- 전체영역 끝 -->
</body>
</html>
