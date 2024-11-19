<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>계정찾기 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
<style>
  body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      align-items: center;
      height: 100vh;
      display: flex;
      flex-direction: column;
      margin-top: 5%;
      overflow-y: hidden; 
  }
  .Logo {
      font-family: "Playfair Display", serif;
      font-size: 40px;
      color: black;
      text-decoration: none;
      margin-bottom: 20px;
      text-align: center;
  }
  .Logo a {
      color: black;
      text-decoration: none;
  }
  .Logo a:hover {
      color: black;
      text-decoration: none;
  }
  .con {
      width: 100%;
      max-width: 500px;
      padding: 30px;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
  }
  .tabs {
      display: flex;
      justify-content: space-around;
      margin-bottom: 20px;
      border-bottom: 2px solid #ddd;
  }
  .tabs button {
      background: none;
      border: none;
      font-size: 16px;
      font-weight: bold;
      color: #555;
      padding: 10px;
      cursor: pointer;
      transition: color 0.3s ease, border-bottom 0.3s ease;
  }
  .form-group {
      margin-bottom: 20px;
  }
  label {
      font-size: 14px;
      color: #555;
  }
  .control {
      width: 100%;
      height: 45px;
      border-radius: 8px;
      border: 1px solid #ddd;
      padding: 10px;
      font-size: 16px;
      transition: border-color 0.3s ease;
  }
  .nextBtn {
      background: #a67d3f;
      color: #fff;
      border: none;
      width: 100%;
      height: 50px;
      font-size: 18px;
      font-weight: bold;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease, transform 0.2s ease;
  }
  .nextBtn:hover {
      background: #a67d3e;
      transform: translateY(-2px);
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
  }
  .nextBtn:active {
      transform: translateY(0);
      box-shadow: none;
  }
</style>
</head>
<body>
  <div class="Logo">
      <a href="main.main">GRINTERIOR</a>
  </div>
  <div class="con">
    <div class="tabs">
        <button class="active" >아이디</button>
    </div>
    <div id="findIdForm">
      <form method="post" action="main.main">
          <div class="form-group">
	          <c:if test="${empty mid}">
	            <label for="name">아이디</label>
	            <input type="text" class="control" id="mid" name="mid" value="검색된 아이디가 없습니다." readonly>
	          </c:if>
	          <c:if test="${!empty mid}">
	            <label for="name">아이디</label>
	            <input type="text" class="control" id="mid" name="mid" value="${mid}" readonly>
	          </c:if>
          </div>
          <c:if test="${empty mid}">
	          <input type="button" onclick="location.href='FindAccount.mem'" class="nextBtn" value="돌아가기"/>
          </c:if>
          <c:if test="${!empty mid}">
	          <button type="submit" class="nextBtn" style="margin-bottom: 5px;">로그인으로</button>
	          <input type="button" style="background: gray;" onclick="location.href='FindAccount.mem'" class="nextBtn" value="비밀번호 찾기"/>
          </c:if>
      </form>
    </div>
  </div>
</body>
</html>