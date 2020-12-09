<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.util.*" session="true"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	session.setAttribute("id", 1);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/card.css" />
<title>나를 좋아한 사람</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function likePost(elm, other_idx) {
		console.log("likePost() was called: " + other_idx);
		$.ajax({
			type : "POST",
			url : "InsertLikes",
			data : {
				'other_idx' : other_idx
			},
			success : function(responseText) {
				//alert("inserted success" + responseText);
				$(elm).attr("class", "fa fa-heart");
				$(elm).attr("onclick", "unlikePost(this, " + other_idx + ")");
			},
			error : function(xhr, status) {
				//alert(status + "!!!");
				alert("좋아요를 반영하는 과정에서 에러가 발생했습니다.");
			}
		});
	}
	function unlikePost(elm, other_idx) {
		//console.log("unlikePost() was called: " + other_idx);
		$.ajax({
			type : "POST",
			url : "DeleteLikes",
			data : {
				'other_idx' : other_idx
			},
			success : function(response) {
				//alert("delete success" + response);
				$(elm).attr("class", "fa fa-heart-o");
				$(elm).attr("onclick", "likePost(this, " + other_idx + ")");
			},
			error : function(xhr, status) {
				//alert(status + "!!!");
				alert("좋아요 취소를 반영하는 과정에서 에러가 발생했습니다.");
			}
		});
	}
</script>
</head>
<body>
	<h1>매칭되었어요! 하트를 눌러 상대방의 인스타그램으로 연락해보세요 ^^ 매칭된 리스트는 24시간 내로 사라집니다.</h1>
	<c:forEach var="row" items="${requestScope.matchedUserList}">
		<div class="card">
			<img src="${row.img}" alt="" class="card-image" />
			<div class="card-meta">
				<span class="tag"><c:out value="${row.age}" /> </span>
			</div>
			<div class="card-details">
				<h2>
					<c:out value="${row.name}" />
				</h2>
				<h3>
					<c:out value="${row.email}" />
				</h3>
				<p>
					<c:out value="${row.description}" />
				</p>
				<div class="post-meta">
					<span class="timestamp"> <i class="fa fa-heart" id="likes"
						onclick="unlikePost(this, '${row.idx}')"></i>
					</span> <span class="comments"> <a
						href='https://www.instagram.com/${row.insta_id}'><i
							class="fa fa-instagram"></i></a></span>
				</div>
			</div>
		</div>
	</c:forEach>
	<h1>나를 선택한 사람들이에요! 둘러보세요 ^^</h1>
	<c:forEach var="row" items="${requestScope.yetMatchedUserList}">
		<div class="card">
			<img src="${row.img}" alt="" class="card-image" />
			<div class="card-meta">
				<span class="tag"><c:out value="${row.age}" /> </span>
			</div>
			<div class="card-details">
				<h2>
					<c:out value="${row.name}" />
				</h2>
				<h3>
					<c:out value="${row.email}" />
				</h3>
				<p>
					<c:out value="${row.description}" />
				</p>
				<div class="post-meta">
					<span class="timestamp"> <i class="fa fa-heart-o" id="likes"
						onclick="likePost(this, '${row.idx}')"></i>
				</div>
			</div>
		</div>
	</c:forEach>
</body>
</html>