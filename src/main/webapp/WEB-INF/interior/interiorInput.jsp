<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/favicon.png">
  <title>인테리어 등록하기 | 그린테리어</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">
	.body{
		background-color: #eee;
	}
	form div{
		margin-bottom: 10px;
		background-color: white;
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#etc").hide();
	});
</script>
</head>
<jsp:include page="/include/header.jsp"/>
<body style="background-color: lightgray;">
<form name="myform" action="InteriorInput.in" style="padding-left: 4.5%; align-content: center;">
	<div class="text-center">상품등록</div>
	<div>
		<div class="title">업체명</div>
		<hr>
		<div>
			<input type="text" class="form-control" value="GRINTERIOR" readonly>
		</div>
	</div>
	<div>
		<div class="title">카테고리</div>
		<hr>
		<div>
			<select class="form-control">
				<option>카테고리</option>
				<option value="modern">모던</option>
				<option value="natural">네츄럴</option>
				<option value="vintage">빈티지</option>
				<option value="etc">기타</option>
			</select>
			<div class="mt-2" id="etc"><textarea rows="5" class="form-control"></textarea></div>
		</div>
	</div>
	<div>
		<div class="title">판매가</div>
		<hr>
		<div>
			
		</div>
	</div>
</form>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>