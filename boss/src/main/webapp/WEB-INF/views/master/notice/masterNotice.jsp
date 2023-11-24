<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Phantom by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "category.do?nowPage=${pp.nowPage}&cid=${cid}&cntPerPage="
				+ sel;
	}
</script>
</head>

<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Header -->
		<header id="header">
			<div class="inner">

				<c:if test="${sessionId eq null}">
					<a href="NaverLogin.do" style="text-decoration: none">로그인</a>
				</c:if>
				<c:if test="${sessionId ne null && sessionId eq 'boss'}">
				${sessionId }님 환영합니다.
				<a href="Logout.do" onclick="alert('로그아웃')"
						style="text-decoration: none"><br>로그아웃</a>
					<a href="productInsertForm.do" onclick="alert('상품등록')"
						style="text-decoration: none"><br>상품등록</a>
				</c:if>
				<c:if test="${sessionId ne null && sessionId ne 'boss'}">
				${sessionId }님 환영합니다.
				<a href="Logout.do" onclick="alert('로그아웃')"
						style="text-decoration: none"><br>로그아웃</a>
				</c:if>

				<div align="center" width="100px" height="100px">
					<input type="text" maxlength="50" placeholder="검색어를 입력하세요."><br>


				</div>
				<!-- Logo -->
				<a href="main.do" class="logo"> <span class="symbol"><img
						src="images/logo.png" alt="" style="width: 200px; height: 100px;"></span><span
					class="title">JY & HB</span>
				</a>
				<!-- Nav -->
				<nav>
					<ul>
						<li><a href="#menu">Menu</a></li>
					</ul>
				</nav>
			</div>
		</header>

		<!-- Menu -->
		<nav id="menu">
			<h2>Menu</h2>
			<ul>
				<li><a href="main.do">Home</a></li>
				<li><a href="category.do">카테고리</a></li>
				<li><a href="productDetail.do">Tempus etiam</a></li>
				<li><a href="productDetail.do">Consequat dolor</a></li>
				<li><a href="elements.do">Elements</a></li>
				<input type="button" value="관리자페이지"
					onclick="location.href='masterMain.do'">
				<br>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header align="left">

					<h1>공지사항</h1>
					<br>
				</header>

				<section class="tiles">
				<!-- 공지사항 테이블 출력 -->
				
				</section>
			</div>
			<!-- 다른 페이지로 넘어가기 위한 숫자들 자리 -->
			<div><!-- 가운데 정렬 필요 -->
				<c:if test="${c.startPage != 1 }">
					<a style="text-decoration: none; color: deeppink"
						href="./categoryList.do?cid=${c.cid}&nowPage=${c.startPage - 1 }&cntPerPage=${c.cntPerPage}">
						<- 
					</a>
				</c:if>
				<c:forEach begin="${c.startPage }" end="${c.endPage }" var="p">
				<!-- 내부 데이터가 0이라 아무것도 표시X  -->
					<c:choose>
						<c:when test="${p == c.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != c.nowPage }">
							<a style="text-decoration: none; color: deeppink"
								href="./categoryList.do?cid=${c.cid}&nowPage=${p }&cntPerPage=${c.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${c.endPage != c.lastPage}">
					<a style="text-decoration: none; color: deeppink"
						href="./categoryList.do?cid=${c.cid}&nowPage=${c.endPage+1 }&cntPerPage=${c.cntPerPage}">
						-> </a>
				</c:if>
			</div>

		</div>




		<!-- Footer -->
		<footer id="footer">
			<div class="inner">
				<section>
					<h2>Get in touch</h2>
					<form method="post" action="#">
						<div class="fields">
							<div class="field half">
								<input type="text" name="name" id="name" placeholder="Name" />
							</div>
							<div class="field half">
								<input type="email" name="email" id="email" placeholder="Email" />
							</div>
							<div class="field">
								<textarea name="message" id="message" placeholder="Message"></textarea>
							</div>
						</div>
						<ul class="actions">
							<li><input type="submit" value="Send" class="primary" /></li>
						</ul>
					</form>
				</section>
				<section>
					<h2>Follow</h2>
					<ul class="icons">
						<li><a href="#" class="icon brands style2 fa-twitter"><span
								class="label">Twitter</span></a></li>
						<li><a href="#" class="icon brands style2 fa-facebook-f"><span
								class="label">Facebook</span></a></li>
						<li><a href="#" class="icon brands style2 fa-instagram"><span
								class="label">Instagram</span></a></li>
						<li><a href="#" class="icon brands style2 fa-dribbble"><span
								class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon brands style2 fa-github"><span
								class="label">GitHub</span></a></li>
						<li><a href="#" class="icon brands style2 fa-500px"><span
								class="label">500px</span></a></li>
						<li><a href="#" class="icon solid style2 fa-phone"><span
								class="label">Phone</span></a></li>
						<li><a href="#" class="icon solid style2 fa-envelope"><span
								class="label">Email</span></a></li>
					</ul>
				</section>
				<ul class="copyright">
					<li>&copy; Untitled. All rights reserved</li>
					<li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
				</ul>
			</div>
		</footer>

	</div>
	<%@ include file="../common/footer.jsp"%>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>