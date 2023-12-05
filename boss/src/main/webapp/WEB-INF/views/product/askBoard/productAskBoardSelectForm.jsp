<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 문의 작성폼</title>

<!-- css 양식 include -->
<%@include file="/WEB-INF/views/common/header.jsp"%>


<!-- css불러오기 -->
<link rel="stylesheet" href="css/AskBoard.css">
</head>
<body>
	<div class="Ask_insert">
		<h1 class="" align="center">문의 상세폼</h1>
		<form method="post" action="productAskBoardUpdateForm.do">


			<table class="askinsert_table">
				<tr>
					<th>상품번호</th>
					<td class=""><input type="text" class="input_box" name="pid"
						readonly="readonly" value="${pid}"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td class=""><input type="text" class="input_box"
						name="memail" readonly="readonly" value="${askboard.memail}"></td>
				</tr>
				<tr>
					<th>상품문의날짜</th>
					<td class=""><input type="text" class="input_box" name="rreg"
						readonly="readonly" value="${askDate}"></td>
				</tr>


				<tr>
					<!-- 추가할수도 -->
				</tr>


				<tr>
					<th>상품문의내용</th>
					<td><textarea rows="10" cols="50" class="input_box"
							id="askcontent" name="askcontent" readonly="readonly">${askboard.askcontent }</textarea></td>
				</tr>
			</table>

			<div class="ask_insert_button">
			<c:if test="${member != null }">
			<input type="button" value="댓글" class="ask_insert_button2" onclick="location.href='askReplyForm.do?pid=${pid}&&askid=${askboard.askid }'" /> 
				<input type="submit" value="수정" class="ask_insert_button2" />
				</c:if>
				 <input type="reset" value="취소" class="ask_insert_button2"
					onclick="history.go(-1)" />
			</div>
		</form>
	</div>







	<!-- css 양식 include -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>