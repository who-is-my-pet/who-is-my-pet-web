<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Hello
	<jsp:useBean id="person" class="model.Person" scope="request" />
	Person created by servlet:
	<jsp:getProperty name="person" property="name" />
	(
	<jsp:getProperty name="person" property="job" />
	)
	<br/>
	<jsp:setProperty name="person" property="job" value="Student" />
	After modify job : <jsp:getProperty name="person" property="job" />
</body>
</html>