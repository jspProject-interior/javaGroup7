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
  .tabs button.active {
      color: #a67d3f;
      border-bottom: 2px solid #a67d3f;
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
  .control:focus {
      border-color: #43a047;
      outline: none;
      box-shadow: 0 0 5px rgba(67, 160, 71, 0.5);
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
  
  .tel-group {
      display: flex;
      gap: 10px; /* 입력 필드 간 간격 */
  }
  .tel-group .control {
      flex: 1; /* 각 입력 필드가 동일한 비율로 크기를 차지 */
  }
</style>
<script>
  function switchTab(tabId) {
      const findIdForm = document.getElementById('findIdForm');
      const findPasswordForm = document.getElementById('findPasswordForm');
      const tabs = document.querySelectorAll('.tabs button');
      
      // Remove active class from all buttons
      tabs.forEach(tab => tab.classList.remove('active'));
      
      // Add active class to clicked button
      document.getElementById(tabId).classList.add('active');
      
      // Toggle form visibility
      if (tabId === 'idTab') {
          findIdForm.style.display = 'block';
          findPasswordForm.style.display = 'none';
      } else if (tabId === 'passwordTab') {
          findIdForm.style.display = 'none';
          findPasswordForm.style.display = 'block';
      }
  }
</script>
</head>
<body>
  <div class="Logo">
      <a href="main.main">GRINTERIOR</a>
  </div>
  <div class="con">
    <div class="tabs">
        <button id="idTab" class="active" onclick="switchTab('idTab')">아이디 찾기</button>
        <button id="passwordTab" onclick="switchTab('passwordTab')">비밀번호 찾기</button>
    </div>
    <!-- 아이디 찾기 폼 -->
    <div id="findIdForm">
      <form method="post" action="FindId.mem">
          <div class="form-group">
              <label for="name">이름</label>
              <input type="text" class="control" id="name" name="name" placeholder="이름을 입력해주세요." required>
          </div>
          <div class="form-group">
              <label for="phone">핸드폰 번호</label>
              <div class="tel-group">
	              <input type="text" class="control" id="tel1" name="tel1" placeholder="010" value="010" maxlength="3" required>
	              <input type="text" class="control" id="tel2" name="tel2" placeholder="1234" maxlength="4" required>
	              <input type="text" class="control" id="tel3" name="tel3" placeholder="5678" maxlength="4" required>
              </div>
          </div>
          <button type="submit" class="nextBtn">다음</button>
      </form>
    </div>
    <!-- 비밀번호 찾기 폼 -->
    <div id="findPasswordForm" style="display: none;">
      <form method="post" action="FindPassword.mem">
          <div class="form-group">
              <label for="mid">아이디</label>
              <input type="text" class="control" id="mid" name="mid" placeholder="아이디를 입력해주세요." required>
          </div>
          <div class="form-group">
              <label for="name">이름</label>
              <input type="text" class="control" id="name" name="name" placeholder="이름을 입력해주세요." required>
          </div>
          <div class="form-group">
              <label for="phone">핸드폰 번호</label>
              <div class="tel-group">
	              <input type="text" class="control" id="tel1" name="tel1" placeholder="010" value="010" maxlength="3" required>
	              <input type="text" class="control" id="tel2" name="tel2" placeholder="1234" maxlength="4" required>
	              <input type="text" class="control" id="tel3" name="tel3" placeholder="5678" maxlength="4" required>
              </div>
          </div>
          <button type="submit" class="nextBtn">다음</button>
      </form>
    </div>
  </div>
</body>
</html>