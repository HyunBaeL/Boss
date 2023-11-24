<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="css/masterCss.css">
<script src="js/master.js"></script>
<title>회원관리</title>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "masterOrdersList.do?nowPage=${pp.nowPage}&cntPerPage="
				+ sel;
	}
</script>




</head>
<body>
	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterOrdersDelete.do">
		<div class="container">

			<h1 class="h1_caption">주 문 관 리</h1>


			<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()"
					class="selected-five">
					<option value="5"
						<c:if test="${pp.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
					<option value="10"
						<c:if test="${pp.cntPerPage == 10}">selected</c:if>>10줄
						보기</option>
					<option value="15"
						<c:if test="${pp.cntPerPage == 15}">selected</c:if>>15줄
						보기</option>
					<option value="20"
						<c:if test="${pp.cntPerPage == 20}">selected</c:if>>20줄
						보기</option>
				</select>
			</div>
			<!-- 옵션선택 끝 -->
			<table>
				<tr>
					<th><label><input type="checkbox"
							class="check-all-checkbox">주문번호</label></th>
					<th>ID</th>
					<th>수령인</th>
					<th>휴대폰</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>총금액</th>
					<th>배송비</th>
					<th>메시지</th>
					<th>주문일</th>
					<th>관리</th>
				</tr>
				<c:set var="i" value="1"></c:set>
				<c:forEach var="orders" items="${list}" varStatus="loop">
					<tr>
						<td id="${i }"><label><input type="checkbox"
								name="chkId" value="${orders.oid }">${orders.oid }</label></td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.memail}</td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.oname}</td>

						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.ophone}</td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.opost}</td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.oaddress}</td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.ototalprice}</td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.odelivery}</td>
						<td><input type="text" readonly="readonly"
							value="${orders.omessage}"></td>
						<td
							onclick="location.href='masterOrdersSelect.do?oid=${orders.oid}' ">${orders.oreg}</td>
						<td>
							<button type="button"
								onclick="location.href='masterOrdersUpdateForm.do?oid=${orders.oid}'">수정</button>
							<button type="button"
								onclick="location.href='masterOrdersDelete.do?oid=${orders.oid}' ">삭제</button>
						</td>
					</tr>
					<c:set var="i" value="${i + 1}"></c:set>
				</c:forEach>
			</table>

			<button type="submit" align="left" class="putsub">선택삭제</button>
			<div align="right" class="search">
	</form>
	<form action="masterOrdersSearch.do" method="post">
		<select class="putsub" name="type">
			<option value="">검색 유형 선택</option>
			<option value="eEmail">ID</option>
			<option value="eName">이름</option>
			<option value="eAddress">주소</option>
			<option value="eGrade">회원등급</option>
		</select> <input type="text" align="right" id="keyword" name="keyword"
			placeholder="검색어를 입력하세요." maxlength="10" class="text-input">
		<input type="submit" value="검색" class="putsub">
	</form>

	<div class="pageFont1">
		<c:if test="${pp.startPage != 1 }">
			<a style="text-decoration: none; color: deeppink"
				href="./masterOrdersList.do?nowPage=${pp.startPage - 1 }&cntPerPage=${pp.cntPerPage}">
				< </a>
		</c:if>
		<c:forEach begin="${pp.startPage }" end="${pp.endPage }" var="p">
			<c:choose>
				<c:when test="${p == pp.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != pp.nowPage }">
					<a style="text-decoration: none; color: deeppink"
						href="./masterOrdersList.do?nowPage=${p }&cntPerPage=${pp.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${pp.endPage != pp.lastPage}">
			<a style="text-decoration: none; color: deeppink"
				href="./masterOrdersList.do?nowPage=${pp.endPage+1 }&cntPerPage=${pp.cntPerPage}">
				> </a>
		</c:if>
	</div>
	</div>
</body>
</html>