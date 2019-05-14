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
        $('#modifyButton').click(function(){
            if($('#boardPw').val().length <4) {
                alert('boardPw는 4자이상 이어야 합니다');
                $('#boardPw').focus();
            } else if($('#boardTitle').val()=='') {
                alert('boardTitle을 입력하세요');
                $('#boardTitle').focus();
            } else if($('#boardContent').val()=='') {
                alert('boardContent을 입력하세요');
                $('#boardContent').focus();
            } else if($('#boardUser').val()=='') {
                alert('boardUser을 입력하세요');
                $('#boardUser').focus();
            } else {
                $('#modifyForm').submit();
            }
        });
    });
</script>
<title>BOARD MODIFY FORM(spring mvc 방식)</title>
</head>
<body>
<div class="container">
    <h1>BOARD MODIFY FORM(spring mvc 방식)</h1> 
    <form id="modifyForm" action="${pageContext.request.contextPath}/board/modifyBoard" method="post">
        <div class="form-group">boardNo :
            <input class="form-control" name="boardNo" value="${board.boardNo}" type="text" readonly="readonly"/>
        </div>
        <div class="form-group">
            <label for="boardPw">비밀번호 확인 :</label>
            <input class="form-control" name="boardPw" id="boardPw" type="password"/>
        </div>    
        <div class="form-group">
            <label for="boardPw">boardTitle :</label>
            <input class="form-control" value="${board.boardTitle}" name="boardTitle" id="boardTitle" type="text"/>
        </div>
        <div class="form-group">boardContent :
            <textarea class="form-control" id="boardContent" name="boardContent" rows="5" cols="50">${board.boardContent}</textarea>
        </div>
        <c:if test= "${boardFile != null}">
            <tr>
      			<td>board_File :</td>
      			<td><a href="${pageContext.request.contextPath}/upload/${boardFile.boardFileSaveName}.${boardFile.boardFileExt}">${boardFile.boardFileSaveName}.${boardFile.boardFileExt}</a>
   				<a class="btn btn-primary btn-sm" href="${pageContext.request.contextPath}/board/removeBoardFile?boardNo=${board.boardNo}&boardFileNo=${boardFile.boardFileNo}">삭제</a>
      			</td>
      		</tr>
      	</c:if>
      	<div class="form-group">
            <label for="boardFile">boardFile :</label>
            <input class="form-control" name="boardfile" id="boardfile" type="file"/>
            <input class="form-control" name="boardfile" id="boardfile" type="file"/>
            <input class="form-control" name="boardfile" id="boardfile" type="file"/>
            <input class="form-control" name="boardfile" id="boardfile" type="file"/>
            <input class="form-control" name="boardfile" id="boardfile" type="file"/>
        </div>
        <div>
            <input class="btn btn-default" id="modifyButton" type="submit" value="글수정"/>
            <input class="btn btn-default" type="reset" value="초기화"/>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/board/getBoardList">글목록</a>
        </div>
    </form>
</div>
</body>
</html>


