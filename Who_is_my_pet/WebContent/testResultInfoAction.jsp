<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp"%>
<%@ page import="animal.AnimalDTO"%>
<%@ page import="animal.AnimalDAO"%>
<%@ page import="user_has_animal.UserAnimalDTO"%>
<%@ page import="user_has_animal.UserAnimalDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/testAnimal.css">
<title>나의 동물상 찾기</title>
</head>
<body>
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
		UserAnimalDAO userAnimalDAO = new UserAnimalDAO();
		int result = userAnimalDAO.faceInfo(1, animal_idx);
		System.out.println("result" + result);
		if (result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('DB로 정보 보내기 성공');");
			script.println("</script>");
			script.close();
			//return;
		}
	%>
	getParameter() 입력 값:
	<%=request.getParameter("animal_idx")%>
	<br>
	<div
		style="text-align: center; font-size: 60px; color: #000; margin-top: 100px; margin-bottom: 60px"><%=list.get(animal_idx).getName()%></div>
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
	<img src="img/dino2.png" alt="dino" style="width: 400px; height: auto;">
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
	<img src="img/deer2.png" alt="deer" style="width: 400px; height: auto;">
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
	<img src="img/frog1.png" alt="frog" style="width: 400px; height: auto;">
	<%
		}
	%>
	<%
		if (animal_idx == 8) {
	%>
	<img src="img/bear1.png" alt="bear" style="width: 400px; height: auto;">
	<%
		}
		if (animal_idx == 9) {
	%>
	<img src="img/sloth.png" alt="sloth"
		style="width: 400px; height: auto;">
	<%
		}
	%>
	<div
		style="text-align: center; font-size: 15px; color: #000; margin-top: 50px; margin-bottom: 10px">
		닮은 연예인:
		<%=list.get(animal_idx).getCelebs()%></div>
	<div style="text-align: center; font-size: 15px; color: #000;"><%=list.get(animal_idx).getDescription()%></div>

</body>
</html>
