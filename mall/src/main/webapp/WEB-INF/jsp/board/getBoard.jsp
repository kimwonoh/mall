<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>BOARD VIEW(spring mvc 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>BOARD VIEW(spring mvc 방식)</h1>
		<table class="table">
			<tbody>
				<tr>
					<td>board_title :</td>
					<td>${board.boardTitle}</td>
				</tr>
				<tr>
					<td>board_content :</td>
					<td>${board.boardContent}</td>
				</tr>
				<tr>
					<td>board_user :</td>
					<td>${board.boardUser}</td>
				</tr>
				<tr>
					<td>board_date :</td>
					<td>${board.boardDate}</td>
				</tr>
				<c:if test="${boardFile != null}">
					<tr>
						<td>board_File :</td>
						<td><a
							href="${pageContext.request.contextPath}/upload/${boardFile.boardFileSaveName}.${boardFile.boardFileExt}">${boardFile.boardFileSaveName}.${boardFile.boardFileExt}</a></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/getBoardList">글목록</a>
		<hr>
		<c:forEach items="${boardCommentList}" var="bc">
			<div>
				<form id="removeBoardComment"
					action="${pageContext.request.contextPath}/board/removeBoardComment"
					method="post">
					<input type="hidden" name="boardCommentNo"
						value="${bc.boardCommentNo}"> <input type="hidden"
						name="boardNo" value="${bc.boardNo}">
					<div>no.${bc.boardCommentNo}: ${bc.boardCommentContent} [작성자]
						:${bc.boardCommentUser}</div>
					<button type="submit">삭제</button>
				</form>
			</div>
		</c:forEach>
		<!-- 댓글 입력 폼 -->
		<div>
			<form
				action="${pageContext.request.contextPath}/board/addBoardComment"
				method="post">
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<div>
					<textarea name="boardCommentContent" rows="3" cols="80"></textarea>
				</div>
				<div>
					작성자 : <input type="text" name="boardCommentUser">
				</div>
				<div>
					<button type="submit">댓글입력</button>
				</div>
			</form>
		</div>
		</hr>
	</div>

</body>
</html>


