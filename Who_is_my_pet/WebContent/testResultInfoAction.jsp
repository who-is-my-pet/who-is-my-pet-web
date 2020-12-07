<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/error.jsp" %>
<%@ page import = "user_has_animal.UserAnimalDTO" %>
<%@ page import = "user_has_animal.UserAnimalDAO" %>
<%@ page import = "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 동물상 찾기</title>
</head>
<body>
    getParameter() 입력 값: <%=request.getParameter("animal_id")%> <br>
</body>
</html>
<%
	request.setCharacterEncoding("UTF-8");
	String animal_id = null;
	String user_id = null; 

	if(request.getParameter("animal_id") != null){
		animal_id = (String)request.getParameter("animal_id");
		if(animal_id.equals("Dog")) animal_id = "1";
		if(animal_id.equals("Cat")) animal_id = "2";
		if(animal_id.equals("Rabbit")) animal_id = "3";
		if(animal_id.equals("Dinosour")) animal_id = "4";
		if(animal_id.equals("Fox")) animal_id = "5";
		if(animal_id.equals("Deer")) animal_id = "6";
		if(animal_id.equals("Horse")) animal_id = "7";
		if(animal_id.equals("Frog")) animal_id = "8";
		if(animal_id.equals("Bear")) animal_id = "9";
		if(animal_id.equals("Sloth")) animal_id = "10";
	}

	if(animal_id == null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력되지 않은 사항이 있습니다.');");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return; 
	}
	UserAnimalDAO userAnimalDAO = new UserAnimalDAO();
	int result = userAnimalDAO.faceInfo(1, Integer.parseInt(animal_id));
	System.out.println("result"+result);
	if(result == 1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('DB로 정보 보내기 성공');");
		script.println("</script>");
		script.close();
		return;
	}
%>