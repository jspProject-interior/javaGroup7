<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>마이페이지 | 그린테리어</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">
  body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
  }
  .contain {
      max-width: 900px;
      margin: 5% auto auto auto;
      background: #fff;
      border-radius: 10px;
      padding: 30px;
  }
  .information {
      display: flex;
      align-items: center;
      border-bottom: 1px solid #eee;
      padding-bottom: 15px;
      margin-bottom: 30px;
  }
  .information div {
      font-size: 24px;
      margin-right: 20px;
  }
  .logout {
      margin-left: auto; /* 버튼을 오른쪽으로 밀어내는 핵심 */
      background: transparent;
      border: 2px solid #eee;
      border-radius: 5px;
      padding: 5px 15px;
      color: gray;
      cursor: pointer;
  }
  .logout:hover {
      background-color: #f0f0f0;
  }
  .info-Update {
    background: transparent;
    text-decoration: underline;
    color: black;
    position: absolute;
    top: 20px;
    right: 20px;
  }
  .info-Update:hover {
      color: black;
  }
  .user-information {
      display: flex;
      margin-bottom: 30px;
  }
  .user {
    border: 1px solid #eee;
    padding: 20px;
    text-align: left;
    display: flex;
  	flex-direction: column;
  }
  .tabs {
    display: flex;
  }
  .tab {
      flex: 1;
      text-align: center;
      border: 1px solid #eee;
      color: black;
  }
  .tab a{
  	color: black;
  	padding: 20px;
  	text-decoration: none;
  }
  .tab a:hover{
  	color: black;
  	text-decoration: none;
  }
  .section {
    margin-bottom: 20px;
  }
  .section a {
    width: 100%;
    border: 1px solid #eee;
    border-radius: 10px;
		font-size: 20px;
    display: block;
    text-decoration: none;
    margin: 5px 0;
    color: black;
    padding: 30px;
  }
  .section a:hover {
    text-decoration: none;
    color: black;  
  }
  .user-details {
    display: flex;
    flex-direction: column;
  }
  .user-details div {
    font-size: 24px;
  }
  .user-title{
  	color: gray;
  }
  .user-info{
  	font-size: 18px;
  	font-weight: bold;
  }
  .section-title{
  	font-size: 30px;
  	font-weight: bold;
  	margin: 20px;
  }
  .Name{
  	font-size: 30px;
  	font-weight: bold; 
  }
  .Id{
  	font-size: 20px;
  	color: gray;
  }
</style>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<div class="contain">
	<div class="information">
    <div class="user-details">
        <span class="Name"><b>${vo.name}</b></span>
        <span class="Id">${vo.mid}</span>
    </div>
    <button onclick="location.href='MemberLogout.mem'" class="logout">로그아웃</button>
	</div>


  
  <div class="user-information">
		<div class="user" style="width: 60%;">
	  	<div class="user-title">주소</div>
	  	<div class="user-info">${fn : replace(vo.address, '/', ' ')}</div>
	  </div>
		<div class="user" style="width: 40%;">
	    <div class="user-title">연락처</div>
	    <div class="user-info">${vo.tel}</div>
    	<a href="moveUpdate.mem" class="info-Update">내 정보 수정</a>
	  </div>
  </div>
  
  <div style="margin-bottom: 100px;" class="input-group">
		<div class="tab">
			<a href="#">
		  	<p class="talTitle">디자인 프로젝트</p>
		  	<div class="talContent">0</div>
	  	</a>
	  </div>
		<div class="tab">
	    <a href="#">
		  	<p class="talTitle">디자인 프로젝트</p>
		  	<div class="talContent">0</div>
	  	</a>
	  </div>
		<div class="tab">
	    <a href="#">
		  	<p class="talTitle">디자인 프로젝트</p>
		  	<div class="talContent">0</div>
	  	</a>
	  </div>
  </div>
  
  <div class="section-title">인테리어 컨설팅 서비스</div>
  <div class="section">
    <a href="#"><i class="fa-regular fa-newspaper"></i> 지난 설문</a>
  </div>
  <div class="section-title">나의 쇼핑</div>
  <div class="section">
    <a href="#">나의 쿠폰</a>
    <a href="#">찜한 상품</a>
    <a href="#">나의 후기</a>
  </div>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>