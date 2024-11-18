<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>calculator.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<p><br/></p>
<div class="container">
    시공계산기
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>