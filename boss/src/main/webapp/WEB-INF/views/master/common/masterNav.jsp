<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="js/master.js"></script>
<link rel="stylesheet" href="css/masterCss.css">

<title>Insert title here</title>
</head>
<body>

<nav class="nav">
  <button onclick="location.href='masterMemberList.do'">회원관리</button>
  <button onclick="location.href='masterProductList.do'">상품관리</button>
  <button onclick="location.href='#'">Q&A관리</button>
  <button onclick="location.href='masterReviewtList.do'">리뷰관리</button>
  <button onclick="location.href='#'">메뉴4</button>
</nav>

	<div class="bottom-buttons">
		<a href="#" onclick="history.go(-1)"><</a> <a href="masterMain.do">Master</a>
		<a href="main.do">MAIN</a>
	</div>

</body>
</html>