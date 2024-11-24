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
  nav {
      width: 220px;
      position: fixed;
  		height: calc(100% - 80px);
      padding-left: 30px;
      font-family: 'Dovemayo_gothic'; /* 둘기마요고딕 : 동글 얇 */
  }
  nav a {
      color: #97BFB4;
      text-decoration: none;
      font-size: 1.5em;
      display: block;
      padding: 10px 20px;
      margin: 5px 0;
      border-radius: 5px;
  }
  nav a:hover {
      background-color: #457b9d;
      color: #fff;
      text-decoration: none;
  }
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<nav>
    <a href="userList.ad" target="admin">회원 리스트</a>
    <a href="businessList.ad" target="admin">업체 리스트</a>
    <a href="CounselList.ad" target="admin">상담 신청 리스트</a>
    <a href="PostList.ad" target="admin">게시물 리스트</a>
    <a href="Adjustment.ad" target="admin">정산</a>
    <a href="ClaimList.ad" target="admin">신고 글 보기</a>
    <div style="position: absolute; bottom: 0; color: gray; font-size: 10px;"><a href="main.main" target="_top">나가기</a></div>
</nav>

</body>
</html>