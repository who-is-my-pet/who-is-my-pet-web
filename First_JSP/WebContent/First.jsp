<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page errorPage="err/FirstErr.jsp"%>
<%@ include file="footer.html"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%!int doubleCount() {
		count = count * 2;
		return count;
	}%>

	<%!int count = 0;%>
	<%
		count++;
	%>
	The page count is now:
	<%=doubleCount()%>
	<br/>
	<jsp:include page="TestInit.jsp" />

	<%@ include file="footer.html"%>
</body>
</html>