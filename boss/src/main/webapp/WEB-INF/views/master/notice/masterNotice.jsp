<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />

<!-- buttons_master css -->
<link rel="stylesheet" href="assets/css/mainhs.css" />
<!-- <link rel="stylesheet" href="assets/css/mainhsSlide.css" /> -->
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<script>
    function popup(){
      location.href="masterNoticeInsertForm.do"
    }
    
    function deleteCheck(abc) {
        if(window.confirm("삭제하시겠습니까?")){
        	location.href="masterNoticeDelete.do?mnId="+abc+"&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }"
        	alert("삭제되었습니다!")		
        }
        event.stopPropagation()
      }
    function enterkey() {
		if (window.event.keyCode == 13) {
			// 엔터키가 눌렸을 때
			var s = document.getElementById("search").value;
			location.href = "masterNoticeSearch.do?keyword=" + s;
			/* searchType을 적용시킨 검색도 필요 */
		}
	}
    
    function update(a,b){
    	location.href="masterNoticeUpdateForm.do?rnum="+a+"&mnId="+b+"&cntPerPage=${pp.cntPerPage}"
    	event.stopPropagation()
    }
</script>

<style type="text/css">
/* 팝업 스타일 */
.popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	/* background-color: rgba(0,0,0,0.7); */
	z-index: 9999; /* 팝업을 최상위로 올림 */
}

.popup-content {
	position: absolute;
	top: 50%;
	left: 6%;
	/*transform: translate(-50%, -50%);*/
	background-color: #fff;
	padding: 10px; /* 팝업 내용 여백 조절 */
	text-align: center;
	max-width: 400px; /* 팝업 최대 가로 크기 설정 */
	width: 100%; /* 팝업 너비 100%로 설정 */
	max-height: 400px; /* 팝업 최대 세로 크기 설정 */
	overflow: auto; /* 내용이 넘칠 경우 스크롤 표시 */
}

/* 팝업 내용 스타일 조절 */
.popup-content p {
	font-size: 14px; /* 내용 폰트 크기 조절 */
	line-height: 1.4; /* 내용 줄 간격 조절 */
}
/* 팝업 내 이미지 스타일 조절 */
.popup-content img {
	max-width: 100%; /* 이미지 최대 가로 크기를 부모 요소에 맞춤 */
	height: auto; /* 이미지 세로 크기 자동 조절 */
}

/* 닫기 버튼 스타일 */
.popup-close {
	position: absolute;
	bottom: 10px; /* 아래쪽 여백 조절 */
	right: 10px;
	font-size: 20px;
	cursor: pointer;
}
</style>
</head>

<%@include file="/WEB-INF/views/common/chatbot.jsp"%>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<div class="inner">

				<!-- 쇼핑몰 로고 & 상단 아이콘 불러오기 -->
				<%@include file="../../common/header.jsp"%>

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
					<div align="center" width="30px" height="100px">
					</div>
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

					<h1>공지사항</h1>
				</header>

				<section class="tiles">

					<!-- 공지사항 테이블 출력 -->
						<div class="container">
							<!-- 옵션선택 끝 -->
							<table
								style="border: 1px solid black; margin-left: auto; margin-right: auto;">
								<tr>
									<th>글번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
									<th></th>
									<th></th>
								</tr>
								<c:set var="i" value="${pp.total - (pp.nowPage-1)* pp.cntPerPage }"></c:set>
								<c:forEach var="masterNotice" items="${list}" varStatus="loop">
									<tr 
									onclick="location.href='masterNoticeDetail.do?mnId=${masterNotice.mnId}&nowPage=${pp.nowPage }&cntPerPage=${pp.cntPerPage }' ">
										<td id="${i }">${i }</td>
										<td>${masterNotice.mnTitle}</td>
										<td><fmt:formatDate
												pattern="yyyy-MM-dd hh:mm" value="${masterNotice.mnReg}" /></td>
										<td>${masterNotice.mnReadCount}</td>
										<c:if test="${member ne null && member.mEmail eq 'master'}">
											<td>
												<button type="button"
													onclick="javascript:update(${masterNotice.rnum},${masterNotice.mnId})">수정</button>
												<button type="button" id="delete"
													onclick="javascript:deleteCheck(${masterNotice.mnId})">삭제</button>
												<!-- mnId는 items="{list}" 안에 포함된 정보.  -->
											</td>
										</c:if>
									</tr>
									<c:set var="i" value="${i - 1}"></c:set>
								</c:forEach>
							</table>
							<c:if test="${member ne null && member.mEmail eq 'master'}">
								<button type="button" class="putsub" onclick="javascript:popup()">공지사항 등록</button>
							</c:if>
					</form>
				</section>
				<form action="masterNoticeSearch.do">
		<select class="putsub" name="searchtype">
			<option value="">검색 유형 선택</option>
			<option value="mnTitle">제목</option>
			<option value="mnContent">내용</option>
		</select> <input type="text" align="right" id="keyword" name="keyword"
			placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
		<input type="submit" value="검색" class="putsub">
	</form>
				
				
				
			</div>

			<!-- 다른 페이지로 넘어가기 위한 숫자들 자리 -->
			<div align="center">
				<c:if test="${pp.startPage != 1 }">
					<a style="text-decoration: none; color: deeppink"
						href="./masterNotice.do?nowPage=${pp.startPage - 1 }&cntPerPage=${pp.cntPerPage}">
						<- </a>
				</c:if>
				<c:forEach begin="${pp.startPage }" end="${pp.endPage }" var="p">
					<c:choose>
						<c:when test="${p == pp.nowPage }">
							<b>${p }</b>
						</c:when>
						<c:when test="${p != pp.nowPage }">
							<a style="text-decoration: none; color: deeppink"
								href="./masterNotice.do?nowPage=${p }&cntPerPage=${pp.cntPerPage}">${p }</a>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${pp.endPage != pp.lastPage}">
					<a style="text-decoration: none; color: deeppink"
						href="./masterNotice.do?nowPage=${pp.endPage+1 }&cntPerPage=${pp.cntPerPage}">
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
	<%@ include file="../../common/footer.jsp"%>
	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>