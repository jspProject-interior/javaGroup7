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
    position: absolute; /* 부모 요소 기준으로 위치 */
    top: 30px; /* 연락처 텍스트와 수평 정렬 */
    transform: translateY(-50%); /* 수직 중앙 정렬 */
    right: 20px; /* 오른쪽으로 배치 */
    background: transparent;
    text-decoration: underline;
    color: black;
    font-size: 16px;
    cursor: pointer;
	}
  .info-Update:hover {
      color: black;
      text-decoration: none;
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
  .tab:hover{
  	background: #eee;
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
    background: #eee;
  }
  .user-details {
    flex-direction: column;
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
  .button-group{
  	width: 100%;
  	margin-bottom: 50px;
  }
  .button-group div{
  	width: 50%;
  }
  .button-group button{
  	border: 2px solid #eee;
  	border-radius: 5px;
  	padding: 30px;
  	background: transparent;
  	display: flex;
  	align-items: center;
  	justify-content: center;
  	width: 100%;
  }
  .button-group button:hover{
  	background: #eee;
  }
    .MemberDelete{
  	color: gray;
  	text-decoration: underline;
  	float: right;
  }
  .MemberDelete:hover{
  	color: gray;
  	text-decoration: underline;
  }
</style>
<script type="text/javascript">
	function MemberDelete() {
		let ans = confirm("탈퇴하시겠습니까?");
		if(ans){
			location.href = "MemberUserDel.mem?idx=" + ${vo.idx};
		}
		else{
			return false;
		}
	}
</script>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<div class="contain">
	<div class="information">
    <div class="user-details">
        <div class="Name">${vo.company}</div>
        <div class="Id">${vo.mid}</div>
    </div>
    <button onclick="location.href='MemberLogout.mem'" class="logout">로그아웃</button>
	</div>


  
  <div class="user-information">
		<div class="user" style="width: 60%;">
	  	<div class="user-title">주소</div>
	  	<div class="user-info">${fn : replace(vo.address, '/', ' ')}</div>
	  </div>
	  
		<div class="user" style="width: 40%; position: relative;">
	    <div class="user-title">연락처</div>
	    <div class="user-info">${vo.tel}</div>
    	<a href="moveUpdate.mem" class="info-Update">내 정보 수정</a>
	  </div>
  </div>
  
  <div style="margin-bottom: 50px;" class="input-group">
		<div class="tab">
			<a href="MyPost.ap">
		  	<p class="talTitle">내 게시물</p>
		  	<c:if test="${vo.level == 2}"><div class="talContent">${interiorPostCnt==null? 0 : interiorPostCnt}</div></c:if>
		  	<c:if test="${vo.level == 3}"><div class="talContent">${furniturePostCnt==null? 0 : furniturePostCnt}</div></c:if>
	  	</a>
	  </div>
		<div class="tab">
			<c:if test="${counselListCnt != 0}">
		    <a href="CounselList.ap?mid=${vo.mid}">
			  	<p class="talTitle">상담신청 내역</p>
			  	<div class="talContent">${counselListCnt}</div>
		  	</a>
			</c:if>
			<c:if test="${counselListCnt == 0}">
				<span style="padding: 20px;">
			  	<p class="talTitle">상담신청 내역</p>
			  	<div class="talContent">0</div>
		  	</span>
			</c:if>
	  </div>
		<div class="tab">
	    <a href="#">
		  	<p class="talTitle">판매 내역</p>
		  	<div class="talContent">0</div>
	  	</a>
	  </div>
  </div>
  
  <div class="button-group input-group">
  	<div><button type="button" onclick="location.href='InteriorInput.in'">게시물 등록</button></div>
  	<div><button type="button" onclick="location.href='FurnitureInput.fu'">상품 등록</button></div>
  </div>
  
  <div class="section-title">혜택</div>
  <div class="section">
    <a href="#"><i class="fa-solid fa-ticket"></i> 프로모션</a>
  </div>
  <div class="section-title">고객 서비스</div>
  <div class="section">
    <a href="#"><i class="fa-solid fa-truck-fast"></i> 반품 및 교환</a>
    <a href="#"><i class="fa-solid fa-headphones"></i> 문의 내역</a>
    <a href="#"><i class="fa-solid fa-user-slash"></i> 신고 내역</a>
  </div>
  <a href="javascript:MemberDelete()" class="MemberDelete">회원탈퇴</a>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>