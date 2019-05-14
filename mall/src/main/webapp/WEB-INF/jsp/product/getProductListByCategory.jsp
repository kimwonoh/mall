<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ProductCommon LIST(spring mvc + mybatis 방식)</title>
<!-- bootstrap을 사용하기 위한 CDN주소 -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#serchBtn').click(function(){
		$('#serchForm').submit(); //아이디 넣을땐 # 다른건 . 
	});
});
</script>
</head>
<body>
<div class="container">
    <h1>상품목록(spring mvc + mybatis 방식)</h1>
   <div>전체행의 수 : ${productCommonCount}</div>
    <table class="table table-striped">
        <thead>
            <tr>        
            	<th>productCommonNo</th>
                <th>productCommonName</th>
                <th>productCommonPrice</th>
                <th>productCommonDescription</th>
                <th>productCommonDate</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                	<td>${b.productCommonNo}</td>
                    <td><a href="${pageContext.request.contextPath}/product/getProductListOneByCategory?categoryNo=${categoryNo}&productCommonNo=${b.productCommonNo}">${b.productCommonName}</a></td>
                    <td>${b.productCommonPrice}원</td>
                    <td>${b.productCommonDescription}</td>
                    <td>${b.productCommonDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form id="serchForm" action="${pageContext.request.contextPath}/product/getProductListByCategory" method="get">
    	<input type="hidden" name="categoryNo" value="${categoryNo}">
    	상품 이름 검색<input type="text" name="searchWord">
    	<button type="button" id="serchBtn">검색</button>
    </form>
    <ul class="pager">
        <c:if test="${currentPage > 1}">
            <li class="previous"><a href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&currentPage=${currentPage-1}">이전</a></li>
        </c:if>
        <c:if test="${currentPage < lastPage}">
            <li class="next"><a href="${pageContext.request.contextPath}/product/getProductListByCategory?categoryNo=${categoryNo}&currentPage=${currentPage+1}">다음</a></li>
        </c:if>
    </ul>
    <div>
        <a class="btn btn-default" href="${pageContext.request.contextPath}/">메인화면</a>
    </div>
</div>
</body>