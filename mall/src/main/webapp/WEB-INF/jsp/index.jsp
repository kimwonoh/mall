<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<title>인덱스(spring mvc 방식)</title>
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
		<h1>INDEX</h1>
		<h3>쇼핑몰 메인 페이지</h3>
		<table class="table">
			<tbody>
				<tr>
					<c:if test= "${loginMember == null}">
						<td><a href="/member/login">로그인</a>  /
						<a href="/member/addMember">회원가입</a><td>
					</c:if>
				</tr>
				<tr>
					<c:if test= "${loginMember != null}">
						<td><a href="/member/logout">로그아웃</a>  /
						<a href="/member/getMemberOne">내정보(마이페이지)</a></td>
					</c:if>
				</tr>
				<tr>
					<ul>
						<c:forEach var="category" items="${categoryList}">
							<li>
								<a href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${category.categoryNo}">${category.categoryName}</a>
							</li>
						</c:forEach>
					</ul>
				</tr>		
			</tbody>
		</table>
	</div>
</body>
</html>