<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>마이페이지</title>
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
		<h1>내정보 확인</h1>
		<table class="table">
			<tbody>
				<tr>
					<td>아이디 :</td>
					<td>${getMemberOne.memberId}</td>
				</tr>
				<tr>
					<td>비밀번호 :</td>
					<td>${getMemberOne.memberPw}
					<a class="btn btn-default" href="${pageContext.request.contextPath}/member/PasswordModifyMember">비밀번호수정</a></td>
				</tr>
				<tr>
					<td>이름 :</td>
					<td>${getMemberOne.memberName}</td>
				</tr>
				<tr>
					<td>전화번호 :</td>
					<td>${getMemberOne.memberPhone}</td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td>${getMemberOne.memberAddress}</td>
				</tr>
				<tr>
					<td>성별 :</td>
					<td>${getMemberOne.memberGender}</td>
				</tr>
				<tr>
					<td>권한 :</td>
					<td>${getMemberOne.memberLevel}</td>
				</tr>
			</tbody>
		</table>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/member/modifyMember">회원수정</a>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/member/removeMember">회원탈퇴</a>
		<a class="btn btn-default"
			href="${pageContext.request.contextPath}/">메인화면</a>
	</div>
</body>
</html>


