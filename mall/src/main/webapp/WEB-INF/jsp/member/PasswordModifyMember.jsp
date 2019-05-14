<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
 
<!-- jquery를 사용하기위한 CDN주소 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
 
<script>
    $(document).ready(function(){
        $('#passWordModifyMemberButton').click(function(){
            if($('#getMemberOnePw').val()=='') {
                alert('현재 비밀번호를 입력하세요');
                $('#getMemberOnePw').focus();
            } else if($('#변경하실 비밀번호').val()=='') {
                alert('memberPw를 입력하세요');
                $('#memberPw').focus();
            } else {
                $('#passWordModifyMemberForm').submit();
            }
        });
    });
</script>
<title>비밀번호 수정하기</title>
</head>
<body>
<div class="container">
    <h1>비밀번호 수정하기 폼</h1> 
    <form id="passWordModifyMemberForm" action="${pageContext.request.contextPath}/member/PasswordModifyMember" method="post">
        <div class="form-group">
            <label for="getMemberOnePw">현재 비밀번호 확인 :</label>
            <input class="form-control" name="getMemberOnePw" id="getMemberOnePw" type="password"/>
        </div>    
        <div class="form-group">
            <label for="memberPw">변경하실 비밀번호 확인 :</label>
            <input class="form-control" name="memberPw" id="memberPw" type="password"/>
        </div>
        <div>
            <input class="btn btn-default" id="passWordModifyMemberButton" type="submit" value="비밀번호수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/">메인화면</a>
        </div>
    </form>
</div>
</body>
</html>


