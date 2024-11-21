<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">


	<frameset rows="80px, *">
		<frame src="AdminHeader.ad" name="adminHeader" frameborder="0" noresize/>
		<frameset cols="250px, *">
			<frame src="AdminNav.ad" name="adminNav" frameborder="0"/>
			<frame src="Admin.ad" name="admin" frameborder="0"/>
		</frameset>
	</frameset>
</head>
<body>


</body>
</html>