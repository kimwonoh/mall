<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
 
<script>
    $(document).ready(function(){
    //    alert('jquery test');
    /* 입력폼 유효성 관련 요구사항
        1. 모든 폼은 공백 또는 "" 문자는 입력되면 안된다.
        2. 비밀번호는 4자이상 입력하여야 한다.
    */
        $('#addButton').click(function(){
            if($('#memberId').val().length <4) {
                alert('memberId는 6자이상 이어야 합니다');
                $('#memberId').focus();
            } else if($('#memberPw').val()=='') {
                alert('memberPw을 입력하세요');
                $('#memberPw').focus();
            } else {
                $('#addForm').submit();
            }
        });
    });
</script>
<title>로그인</title>
</head>
<body>
<div class="container">
    <h1>로그인</h1>
    <form id="addForm" action="${pageContext.request.contextPath}/member/login" method="post">
        <div class="form-group">
            <label for="memberId">memberId :</label>
            <input class="form-control" name="memberId" id="memberId"type="text"/>
        </div>
        <div class="form-group">
            <label for="memberPw">memberPw :</label>
            <input class="form-control" name="memberPw" id="memberPw" type="password"/>
        </div>
        <div>
            <input class="btn btn-default" id="addButton" type="submit" value="로그인"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/">메인화면</a>
            <a href="/find/idFind">아이디찾기</a>
            <a href="/find/pwFind">비밀번호찾기</a>
        </div>
    </form>
</div>
</body>
</html>


