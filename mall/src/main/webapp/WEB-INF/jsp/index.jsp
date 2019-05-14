<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

	<h1>INDEX</h1>
	<h3>쇼핑몰 메인 페이지</h3>
	<div>
		<ul>
			<c:if test= "${loginMember == null}">
				<li><a href="/member/login">로그인</a></li>
				<li><a href="/member/addMember">회원가입</a></li>
			</c:if>
			<c:if test= "${loginMember != null}">
				<li><a href="/member/logout">로그아웃</a></li>
				<li><a href="/member/getMemberOne">내정보(마이페이지)</a></li>
			</c:if>
		</ul>
	</div>
	<div>
		<ul>
			<c:forEach var="category" items="${categoryList}">
				<li>
					<a href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${category.categoryNo}">${category.categoryName}</a>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>