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
	function enterkey() {
		if (window.event.keyCode == 13) {
			// 엔터키가 눌렸을 때
			var s = document.getElementById("search").value;
			location.href = "categorySearch.do?newCid=${category.newCid}&keyword="
					+ s;
		}
	}
	function selChange() {

		var sel = document.getElementById('cntPerPage').value;
		location.href = "category.do?nowPage=${pp.nowPage}&newCid=${category.newCid}&cntPerPage="
				+ sel;
	}
</script>
</head>
<style>
a {
	text-decoration: none;
}
</style>
<body class="is-preload">

	<%@include file="/WEB-INF/views/common/chatbot.jsp"%>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- 쇼핑몰 로고 & 상단 아이콘 불러오기 -->
				<%@include file="../common/header.jsp"%>

				<!--1. 회원 or 비회원 페이지 -->
				<div class="category-link" align="center">
					<a href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none"
						style="text-decoration: none">OUTER</a> <a
						href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none"
						style="text-decoration: none">KNIT</a> <a
						href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">TOP</a>
					<a href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">BOTTOM</a>
					<a href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">SHIRT</a>
					<a href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">SHOES</a>
					<a href="category.do?newCid=코트"
						style="font-size: 20px; font-weight: bold; margin-right: 10px; text-decoration: none">ACC</a>
				</div>

				<c:if test="${not empty list}">
					<div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()"
							class="selected-five">
							<option value="15"
								<c:if test="${pp.cntPerPage == 15}">selected</c:if>>15개
								보기</option>
							<option value="30"
								<c:if test="${pp.cntPerPage == 30}">selected</c:if>>30개
								보기</option>
							<option value="45"
								<c:if test="${pp.cntPerPage == 45}">selected</c:if>>45개
								보기</option>
						</select>
					</div>
				</c:if>
				<br>

				<!---------------------- Nav --------------------->
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
				<li><a href="category.do?newCid=코트"
					style="text-decoration: none">카테고리</a></li>
				<br>
				<li><a href="freeBoardList.do" style="text-decoration: none">커뮤니티</a></li>
				<br>
				<li><a href="masterNotice.do" style="text-decoration: none">공지사항</a></li>
				<br>
				<li><a href="elements.do" style="text-decoration: none">Elements</a></li>
				<br>
			</ul>
		</nav>
		<!---------------------- Nav ------------------->

		<!-- Main -->
		<div id="main">
			<div class="inner">
				<header align="left">

					<%-- <c:forEach var="sample" items="${sample}" varStatus="loop">
					${sample}
					</c:forEach> --%>
					<c:if test="${not empty clist}">
						<section class="tiles">
							<c:forEach var="list" items="${clist}">
								<article class="style1">
									
										<a href="category.do?newCid=${list }"> ${list}</a>
								
									<c:if test="${empty sample}">
										<h1>등록된 상품이 없습니다</h1>
									</c:if>
									<c:set var="i" value="i+1"></c:set>
								</article>
							</c:forEach>
						</section>
					</c:if>

					<section class="tiles">
						<c:forEach var="s" items="${sample}" varStatus="loop">
							<article class="style1">
								<span class="image"> <img src="images/${s.pimage}">
									<!-- 일단은 엑박 대신 1.png가 출력되도록 처리. 클릭이 안되게 하려면? -->
								</span> <a href="productDetail.do?pid=${s.pid}"/>
									<h2>${s.pname }</h2>
									<div class="content">
										<p>${s.pcontent }</p>
									</div>
								
							</article>
					</c:forEach>
					</section>

					<c:if test="${empty clist}">
						<br>
						<br>
						<br>
						<div align="center">
							<h1>등록된 상품이 없습니다</h1>
						</div>
					</c:if>




					<form action="categorySearch.do">
						<input type="text" align="right" id="keyword" name="keyword"
							placeholder="${param.newCid } 검색" maxlength="10"
							class="text-input"> <input type="submit" class="putsub">
						<input type="hidden" name="newCid" value="${param.newCid }">
					</form>
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