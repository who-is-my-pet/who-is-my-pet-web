<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="person" class="model.Person">
		<jsp:setProperty name="person" property="name" param="userName" />
		<jsp:setProperty name="person" property="id" param="userID" />
	</jsp:useBean>
	Hello
	<%=person.getName()%>
	<jsp:getProperty name="person" property="id" />
	!!
</body>
</html>