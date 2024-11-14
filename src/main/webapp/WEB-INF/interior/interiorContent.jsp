<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">
	.main-img{
		height: 720px;
		width: 100%;
	}
</style>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<div class="main-img">
	<img src="${ctp}/images/interior/upload/${vo.titleImg}">
</div>
<div class="container">
 	
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>