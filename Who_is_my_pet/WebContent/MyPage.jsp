<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
</head>
<body>

<h2> <%= request.getAttribute("id") %> 님의 마이페이지 </h2>

<div id="modify">
<a href="*">정보수정하기</a>
</div>

<div id="like_me_list">
<a href="*">나를 좋아하는 사람은?</a>
</div>
</body>
</html>