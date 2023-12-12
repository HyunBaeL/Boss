<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성 폼</title>
</head>
<body class="is-preload">
<div class="container" align="center">
		<h2>공지사항</h2>
		<div class="inner">
		<form action="masterNoticeUpdate.do" 
		method="post" enctype="multipart/form-data">
			<input type="hidden" name="mnId" value="${mn.mnId }">
			<input type="hidden" name="nowPage" value="${mn.rnum }">
			<input type="hidden" name="cntPerPage" value="${pp.cntPerPage }">
			<table class="table table-hover">
				<tr>
					<td>제목</td>
					<td><input type="text" size="52" maxlength="50" name="mnTitle" value="${mn.mnTitle }"></td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td><input type = "file" id="mnOriFile1" name="mnOriFile1"></td>
				</tr>
				<tr>
				<td colspan="2">
				<img
				src="C:\\bossRepository\\boss\\src\\main\\webapp\\images\\${mnd.mnOriFile}">
				</tr>
				<tr>
					<td>내용</td>
					<td><pre><textarea cols="50" rows="10" name="mnContent">${mn.mnContent }</textarea></pre></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" style="margin-left:325px" value="확인">
					<input type="reset" style="margin-left:5px" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>