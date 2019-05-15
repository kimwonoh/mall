<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>상세보기 VIEW(spring mvc 방식)</title>
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
		<h1>${getProductCommon.productCommonName} 상세보기</h1>
		<table class="table">
			<tbody>
				<tr>
					<td>제목 :${getProductCommon.productCommonName}</td>
				</tr>
				<c:if test= "${categoryNo == 1}">
					<c:set var="no">전지적 독자 시점</c:set>
					<c:set var="no2">만년만에 귀환한 플레이어</c:set>
					<c:choose>
				    <c:when test="${name == no}">
				    	<tr>
							<td><img src="/upload/wjsehrtl.jpg"></td>
						</tr>
					</c:when>
					<c:when test="${name == no2}">
				    	<tr>
							<td><img src="/upload/aksrnlvmf.jpg"></td>
						</tr>
					</c:when>
					</c:choose>
				</c:if>
				<c:if test= "${categoryNo == 2}">
				<tr>
					<td><img src="/upload/ekfqlc.jpg"></td>
				</tr>
				</c:if>
				<tr>
					<td>편당 대여 가격 : ${getProductCommon.productCommonPrice}원</td>
				</tr>
				<tr>
					<td>장르 :${getProductCommon.productCommonDescription}</td>
				</tr>
				<tr>
					<td>등록 날짜 : ${getProductCommon.productCommonDate}</td>
				</tr>
				<tr>
					<td><select name="">
							<option value="">==연재중인 소설 목록==</option>
						<c:forEach var="p" items="${getProductCommon.products}">
							<option value="${p.productStock}">${p.productStock}</option>
						</c:forEach>
					</select>
					<select name="">
							<option value="">==구매 여부==</option>
						<c:forEach var="p" items="${getProductCommon.products}">
							<option value="${p.productRental}">${p.productRental} : ${p.productPrice}</option>
						</c:forEach>
					</select>					
					</td>
				</tr>		
			</tbody>
		</table>
		<%-- <a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/modifyBoard?boardNo=${board.boardNo}">수정</a>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/board/removeBoard?boardNo=${board.boardNo}">삭제</a> --%>
		<a class="btn btn-default" href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&searchWord=${searchWord}&currentPage=${currentPage}">글목록</a>
</body>
</html>


