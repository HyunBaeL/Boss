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
<title>Qna 상세정보</title>


</head>
<body>

	<%@ include file="../common/masterNav.jsp"%>
	<form method="post" action="masterReportInsert.do">
		<input type="hidden" name="memail" value="${Report.memail  }">
		<input type="hidden" name="reportid" value="${Report.reportid }">

		<div class="container">
			<h1 class="h1_caption">Qna 상세정보</h1>

			<table>
				<tr>
					<th>RID</th>
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
				<tr>
					<td>${Report.reportid}</td>
					<td>${Report.memail}</td>
					<td>${Report.qnatitle}</td>
					<td>${Report.qnacontent}</td>
					<td><img src="uploadReport/${Report.reportimage}" width="50"
						height="50">
					<td><input type="text" value="${Report.reportreg}"
						readonly="readonly"></td>

					<td>${Report.reportname}</td>
					<td>${Report.reportreply}</td>
					<td>${Report.reportreplyreg}</td>
					<td>${Report.reportanswer}</td>
					<td>${Report.reportdrop}</td>
					<td>
						<%-- <button type="button"
							onclick="location.href='masterReviewUpdateForm.do?rid=${review.rid}'">수정</button> --%>
						<button type="button"
							onclick="location.href='masterReportDelete.do?id=${Report.reportid}' ">삭제</button>
					</td>
				</tr>
			</table>

 


			<table class="fancy_table">
				<tr>
					<th>제목</th>
					<td>${Report.reporttitle}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${Report.memail}</td>
					<th>작성일</th>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${Report.reportreg}" /></td>
					<th>삭제여부[Y/N]</th>
					<td>${Report.qnadrop}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="5"><textarea readonly="readonly">${Report.reportcontent }</textarea></td>
				</tr>
			</table>
			<table class="fancy_table" width="50%" align="lift">
				<tr>
					<th colspan="5">답변</th>
				</tr>
				<c:if test="${Report.qrcontent == null}">
					<tr>
						<td colspan="5" autofocus="autofocus"><textarea
								name="qrcontent">${Report.reportcontent }</textarea></td>

					</tr>
			</table>
			<%-- <c:if test="${Report.qrcontent == null}"> --%>
			<button type="submit">답변</button>
			</c:if>

		</div>
	</form>

	<c:if test="${Report.qrcontent != null}">
		<form method="post" action="masterReportUpdate.do">
			<input type="hidden" name="reportid" value="${Report.reportid}">
			<tr>
				<td colspan="5" autofocus="autofocus"><textarea
						name="reportcontent">${report.reportcontent }</textarea></td>

			</tr>
			</table>
			<button type="submit">답변수정</button>
		</form>
		<%-- <button type="submit" onclick="location.href='masterReportUpdate.do?qrid=${Report.qrid}'">답변수정</button> --%>
	</c:if>



</body>
</html>