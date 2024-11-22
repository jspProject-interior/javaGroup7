<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
<jsp:include page="/include/fonts.jsp"/>
<style type="text/css">
	body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
  }
  header {
      color: #DE8F5F;
      text-align: left;
      font-family: "Playfair Display", serif;
 			font-size: 30px;
 			position: fixed;
      top: 0;
      background-color: #fff;
      width: 100%;
      z-index: 1000;
      padding: 30px;
  }
  a{
  	color: #DE8F5F;
  	text-decoration: none;
  }
  a:hover{
  	color: #DE8F5F;
  	text-decoration: none;
  }
  
</style>
</head>
<body>
	<header>
	  <h1><a href="AdminMain.ad" target="_top">GRINTERIOR Admin</a></h1>
	</header>
</body>
</html>