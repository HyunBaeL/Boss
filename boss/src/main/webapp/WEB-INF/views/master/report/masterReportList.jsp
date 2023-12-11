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
<title>신고 관리</title>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "masterReportList.do?nowPage=${page.nowPage}&cntPerPage="
				+ sel;
	}
</script>




</head>
<body>
	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterReportDelete.do">
		<div class="container">
			<h1 class="h1_caption">신고 관리</h1>
			<div style="float: right;">
				<select id="cntPerPage" name="sel" onchange="selChange()"
					class="selected-five">
					<option value="5"
						<c:if test="${page.cntPerPage == 5}">selected</c:if>>5줄
						보기</option>
					<option value="10"
						<c:if test="${page.cntPerPage == 10}">selected</c:if>>10줄
						보기</option>
					<option value="15"
						<c:if test="${page.cntPerPage == 15}">selected</c:if>>15줄
						보기</option>
					<option value="20"
						<c:if test="${page.cntPerPage == 20}">selected</c:if>>20줄
						보기</option>
				</select>
			</div>
			<!-- 옵션선택 끝 -->
			<table>
				<tr>
					<th><label><input type="checkbox"
							class="check-all-checkbox">RID</label></th>
					<th>신고자</th>
					<th>제목</th>
					<th>내용</th>
					<th>이미지</th>
					<th>신고작성일</th>
					<th>피신고자</th>
					<th>답변</th>
					<th>답변일</th>
					<th>답변여부</th>
					<th>삭제여부</th>
				</tr>

				<c:set var="i" value="1"></c:set>
				<c:forEach var="Report" items="${list}" varStatus="loop">
					<tr>
						<td id="${i }"><label><input type="checkbox"
								name="chkId" value="${Report.reportid}">
								${Report.reportid }</label></td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.memail}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reporttitle}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reportcontent}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">
							<img src="uploadReport/${Report.reportimage}" width="50" height="50">

						</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' "><fmt:formatDate
								pattern="yyyy-MM-dd" value="${Report.reportreg}" /></td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reportname}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reportreply}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reportreplyreg}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reportanswer}</td>
						<td
							onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">${Report.reportdrop}</td>



						<%-- 						<c:if test="${Report.qnayn == 'Y'}"> --%>
						<!-- 							<td -->
						<%-- 								onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' " --%>
						<%-- 								style="color: cyan;">${Report.qnayn}</td> --%>
						<%-- 						</c:if> --%>
						<%-- 						<c:if test="${Report.qnayn == 'N'}"> --%>
						<!-- 							<td -->
						<%-- 								onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' " --%>
						<%-- 								style="color: red;">${Report.qnayn}</td> --%>
						<%-- 						</c:if> --%>
						<%-- 						<c:if test="${Report.qnadrop == 'Y'}"> --%>
						<!-- 							<td -->
						<%-- 								onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' " --%>
						<%-- 								style="color: cyan;">${Report.qnadrop}</td> --%>

						<!-- 							</td> -->
						<%-- 						</c:if> --%>
						<%-- 						<c:if test="${Report.qnadrop == 'N'}"> --%>
						<!-- 							<td -->
						<%-- 								onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' " --%>
						<%-- 								style="color: red;">${Report.qnadrop}</td> --%>
						<%-- 						</c:if> --%>

						<%-- 						<td><c:if test="${Report.qnayn == 'N'}"> --%>
						<!-- 								<button type="button" -->
						<%-- 									onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }'">답변</button> --%>
						<!-- 								<button type="button" -->
						<%-- 									onclick="location.href='masterReportDelete.do?id=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">삭제</button> --%>
						<%-- 							</c:if> <c:if test="${Report.qnayn == 'Y'}"> --%>
						<!-- 								<button type="button" -->
						<%-- 									onclick="location.href='masterReportSelect.do?reportid=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }'">수정</button> --%>
						<!-- 								<button type="button" -->
						<%-- 									onclick="location.href='masterReportDelete.do?id=${Report.reportid}&nowPage=${page.nowPage }&cntPerPage=${page.cntPerPage }' ">삭제</button> --%>
						<%-- 							</c:if></td> --%>
					</tr>
					<c:set var="i" value="${i + 1}"></c:set>
				</c:forEach>
			</table>

			<button type="submit" align="left" class="putsub">삭제여부 수정</button>
			<div align="right" class="search">
	</form>
	<!-- 	<form action="masterReportSearch.do" method="post"> -->
	<!-- 		<select class="putsub" name="searchtype"> -->
	<!-- 			<option value="">검색 유형 선택</option> -->
	<!-- 			<option value="memail">ID</option> -->
	<!-- 			<option value="reportid">글번호</option> -->
	<!-- 			<option value="qnatitle">글제목</option> -->
	<!-- 			<option value="qnayn">답변여부</option> -->
	<!-- 		</select> <input type="text" align="right" id="keyword" name="keyword" -->
	<!-- 			placeholder="검색어를 입력하세요." maxlength="10" class="text-input"> -->
	<!-- 		<input type="submit" value="검색" class="putsub"> -->
	<!-- 	</form> -->

	<div class="pageFont1">
		<c:if test="${page.startPage != 1 }">
			<a style="text-decoration: none; color: deeppink"
				href="./masterReportList.do?nowPage=${page.startPage - 1 }&cntPerPage=${page.cntPerPage}">
				< </a>
		</c:if>
		<c:forEach begin="${page.startPage }" end="${page.endPage }" var="p">
			<c:choose>
				<c:when test="${p == page.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != page.nowPage }">
					<a style="text-decoration: none; color: deeppink"
						href="./masterReportList.do?nowPage=${p }&cntPerPage=${page.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${page.endPage != page.lastPage}">
			<a style="text-decoration: none; color: deeppink"
				href="./masterReportList.do?nowPage=${page.endPage+1 }&cntPerPage=${page.cntPerPage}">
				> </a>
		</c:if>
	</div>
	<h4 class="info-message">클릭시 해당 신고글로 이동합니다.</h4>
	</div>

	<%@ include file="../../common/footer.jsp"%>
</body>
</html>