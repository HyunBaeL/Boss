<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.lang.Math"%>
<%@page import="java.lang.Integer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetailReview.css">
<!-- css 불러오기 -->
<link rel="stylesheet" href="css/productDetail.css">
</head>
<body>

	<table class="review_select">



		<tr>
			<th>작성일</th>
			<td style="color: black;"><fmt:formatDate
					pattern="yyyy-MM-dd hh:mm" value="${mnd.mnReg}" /></td>
			<th>조회수</th>
			<td style="color: black;">${mnd.mnReadCount }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3" style="color: black;">${mnd.mnTitle }</td>
		</tr>


		<tr>
			<td colspan="4" style="color: black;"><pre>${mnd.mnContent }</pre></td>
		</tr>

		<c:if test="${mnd.mnOriFile != null }">
			<td colspan="4"><img
				src="C:\\bossRepository\\boss\\src\\main\\webapp\\images\\${mnd.mnOriFile}">
			</td>
		</c:if>

	</table>

	<c:if test="${mnd.rnum != 1 }">
			<a href="masterNoticeSearchMove.do?searchtype=${pp.searchtype }&rnum=${mnd.rnum-1 }&cntPerPage=${pp.cntPerPage}&keyword=${pp.keyword }">다음글</a>
			<br>
	</c:if>
	
	<c:if test="${mnd.rnum != pp.total }">
			<a href="masterNoticeSearchMove.do?searchtype=${pp.searchtype }&rnum=${mnd.rnum+1 }&cntPerPage=${pp.cntPerPage}&keyword=${pp.keyword }">이전글</a>
			<br>
	</c:if>
		<button type="button" class="review_button1"
			onclick="location.href='masterNoticeSearch.do?nowPage=${Integer.toString(Math.floor((mnd.rnum-1)/pp.cntPerPage)+1)}&searchtype=${pp.searchtype }&keyword=${pp.keyword }'">목록으로</button>
	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>