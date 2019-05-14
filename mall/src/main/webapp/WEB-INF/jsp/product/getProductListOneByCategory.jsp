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
					<td>제목 :${productCommon.productCommonName}</td>
				</tr>
				<c:if test= "${categoryNo == 1}">
				<tr>
					<td><img src="/upload/wjsehrtl.jpg"></td>
				</tr>
				</c:if>
				<c:if test= "${categoryNo == 2}">
				<tr>
					<td><img src="/upload/ekfqlc.jpg"></td>
				</tr>
				</c:if>
				<tr>
					<td>가격 :${productCommon.productCommonPrice}원</td>
				</tr>
				<tr>
					<td>장르 :${productCommon.productCommonDescription}</td>
				</tr>
				<tr>
					<td>날짜 : ${productCommon.productCommonDate}</td>
				</tr>			
			</tbody>
		</table>
		<%-- <a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a> --%>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}">글목록</a>

</body>
</html>


