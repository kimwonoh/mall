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
        $('#ModifyMemberButton').click(function(){
            if($('#memberPw').val()=='') {
                alert('현재 비밀번호를 입력하세요');
                $('#memberPw').focus();
            } else if($('memberName').val()=='') {
                alert('이름을 입력하세요');
                $('#memberName').focus();
            } else if($('memberPhone').val()=='') {
                alert('전화번호를 입력하세요');
                $('#memberPhone').focus();
            } else if($('memberAddress').val()=='') {
                alert('주소를 입력하세요');
                $('memberAddress').focus();
            } else if($('memberGender').val()=='') {
                alert('성별을 입력하세요');
                $('#memberGender').focus();
            } else {
                $('#ModifyMemberForm').submit();
            }
        });
    });
</script>
<title>비밀번호 수정하기</title>
</head>
<body>
<div class="container">
    <h1>비밀번호 수정하기 폼</h1> 
    <form id="ModifyMemberForm" action="${pageContext.request.contextPath}/member/modifyMember" method="post">
        <div class="form-group">
            <label for="memberId">아이디 :</label>
            <input class="form-control" name="memberId" id="memberId" value="${getMemberOne.memberId}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="memberPw">비밀번호 :</label>
            <input class="form-control" name="memberPw" id="memberPw" value="${getMemberOne.memberPw}" type="password"/>
        </div>
        <div class="form-group">
            <label for="memberName">이름 :</label>
            <input class="form-control" name="memberName" id="memberName" value="${getMemberOne.memberName}" type="text"/>
        </div>    
        <div class="form-group">
            <label for="memberPhone">전화번호 :</label>
            <input class="form-control" name="memberPhone" id="memberPhone" value="${getMemberOne.memberPhone}" type="text"/>
        </div>
        <div class="form-group">
            <label for="memberAddress">주소 :</label>
            <input class="form-control" name="memberAddress" id="memberAddress" value="${getMemberOne.memberAddress}" type="text"/>
        </div>
        <div class="form-group">
            <label for="memberGender">성별 :</label>
            <input class="form-control" name="memberGender" id="memberGender" value="${getMemberOne.memberGender}" type="text" readonly="readonly"/>
        </div>
        <div>
            <input class="btn btn-default" id="ModifyMemberButton" type="submit" value="회원정보수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/">메인으로</a>
        </div>
    </form>
</div>
</body>
</html>


