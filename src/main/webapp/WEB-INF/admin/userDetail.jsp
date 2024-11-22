<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f9;
      margin: 0;
      padding: 0;
    }
    .container-fluid {
      max-width: 1200px;
      margin: 30px auto;
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      padding: 20px;
    }
    .leftContainer {
      background: #f8f9fa;
      padding: 20px;
      border-right: 2px solid #ddd;
    }
    .leftContainer img {
      width: 100%;
      height: auto;
      border-radius: 10px;
      margin-bottom: 20px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .leftContainer h1 {
      font-size: 22px;
      margin-bottom: 10px;
      color: #333;
    }
    .leftContainer p {
      font-size: 14px;
      color: #555;
      margin-bottom: 5px;
    }
    .RightContainer {
      padding: 20px;
    }
    .RightContainer h2 {
      font-size: 20px;
      margin-bottom: 10px;
      color: #333;
    }
    .RightContainer hr {
      margin: 10px 0;
    }
    .RightContainer textarea {
      margin-bottom: 15px;
      resize: none;
    }
    .row {
      display: flex;
      flex-wrap: wrap;
    }
    .col {
      flex: 1;
      margin: 10px;
    }
    .btn-danger {
        background-color: #dc3545;
        border: none;
        color: #fff;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
        border-radius: 5px;
        transition: all 0.3s ease-in-out;
        cursor: pointer;
        display: inline-block;
        text-align: center;
        width: 100%;
    }
    .btn-danger:hover {
        background-color: #c82333;
        box-shadow: 0 4px 8px rgba(220, 53, 69, 0.3);
        transform: translateY(-2px);
    }
    .btn-danger:active {
        background-color: #bd2130;
        box-shadow: 0 2px 4px rgba(220, 53, 69, 0.3);
        transform: translateY(1px);
    }
    
  </style>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- 좌측 컨테이너 -->
    <div class="leftContainer col">
      <img src="${ctp}/images/${vo.photo}" alt="${vo.name}님의 사진">
      <h1>개인정보</h1>
      <hr>
      <p><strong>아이디:</strong> ${vo.mid}</p>
      <p><strong>이름:</strong> ${vo.name}</p>
      <p><strong>생일:</strong> ${fn: substring(vo.birthday, 0, 10)}</p>
      <p><strong>전화:</strong> ${vo.tel}</p>
      <p><strong>메일:</strong> ${vo.email}</p>
      <p><strong>주소:</strong> ${fn: replace(vo.address, "/" , "")}</p>
    </div>
    
    <!-- 우측 컨테이너 -->
    <div class="RightContainer col">
      <h2>회원정보</h2>
      <hr>
      <p><strong>회원 등급:</strong> 
        <c:if test="${vo.level == 1}">개인</c:if>
        <c:if test="${vo.level == 2}">인테리어</c:if>
        <c:if test="${vo.level == 3}">가구</c:if>
      </p>
      <p><strong>이름:</strong> ${vo.name}</p>
      <hr>
      <textarea class="form-control" rows="5" placeholder="메모를 입력하세요"></textarea>
      <h2>함께한 정보</h2>
      <hr>
      <p><strong>시작일:</strong> ${fn: substring(vo.joinDay, 0, 10)}</p>
      <p><strong>마지막 접속일:</strong> ${fn: substring(vo.lastDate, 0, 10)}</p>
      <p><strong>활동 여부 :</strong> ${vo.userDel == 'NO' ? "활동 중" : "탈퇴신청회원"}</p>
      <button type="button" onclick='location.href="MemberDelete.mem?idx=${vo.idx}"' class="btn btn-danger">회원탈퇴</button>
    </div>
  </div>
</div>
<p><br/></p>
</body>
</html>
