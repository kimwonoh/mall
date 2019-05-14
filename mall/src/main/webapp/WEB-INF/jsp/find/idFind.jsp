<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 
<!-- bootstrap javascript소스를 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<title>로그인</title>
</head>
<body>
<div class="container">
    <h1>아이디 찾기</h1>
    <form action="${pageContext.request.contextPath}/find/idFind" method="post">
    	<div class="form-group">
            <label for="memberPhone">전화번호 입력 :</label>
            <input class="form-control" name="memberPhone" type="text" placeholder="전화번호를 입력해주세요"/>
        </div>
        <div class="form-group">
            <label for="memberPw">비밀번호 입력 :</label>
            <input class="form-control" name="memberPw" type="password" placeholder="비밀번호를 입력해주세요"/>
        </div>
        <div>
            <input class="btn btn-default" type="submit" value="찾기"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/">메인화면</a>
         	   비밀번호가 기억이 나지않는다면.<a href="/find/pwFind">비밀번호 찾기</a> 
        </div><br><br>
	    <c:if test="${member2 != null}">
	    <div>
	 		아이디 찾기 완료 : ${member2.memberId}
		</div>
		</c:if>
    </form>
</div>
</body>
</html>


