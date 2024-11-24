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
  .errorMsg{
  	color: #a67d3f;
  	font-size: 13px;
  }
</style>
<script type="text/javascript">
		let reg2 = /^(?=.*?[0-9])(?=.*?[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/;  //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
		function pwd1Check() {
			//let reg2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
			let pwd1 = document.getElementById("pwd1").value.trim();
			document.getElementById("pwdError1").innerHTML="";
			
		  // 비밀번호 확인
		  if(!reg2.test(pwd1)) {
		    document.getElementById("pwdError1").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		  }
		  else {
		    document.getElementById("pwdError1").innerHTML="";
	  	}	
		}
		function pwd2Check() {
			let pwd1 = document.getElementById("pwd1").value.trim();
			let pwd2 = document.getElementById("pwd2").value.trim();
			document.getElementById("pwdError1").innerHTML="";
			document.getElementById("pwdError2").innerHTML="";

			// 비밀번호 확인2
		  if(pwd1 !== pwd2) {
			    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
		  }
		  else {
	  	  document.getElementById("pwdError1").innerHTML="";
	  	  document.getElementById("pwdError2").innerHTML="";
		  }
		}
		
		function fCheck() {
			let pwd1 = document.getElementById("pwd1").value.trim();
			let pwd2 = document.getElementById("pwd2").value.trim();

			if(pwd1=="" || pwd2==""){
				document.getElementById("pwd1").focus();
				return false;
			}
			
			if(pwd1 != pwd2){
				document.getElementById("pwd2").focus();
				return false;
			}
			
			myform.submit();
		}
</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <div class="Logo">
      <a href="main.main">GRINTERIOR</a>
  </div>
  <div class="con">
    <div class="tabs">
      <button class="active" >비밀번호 변경</button>
    </div>
    <form name="myform" method="post" action="PasswordUpdate.mem">
      <div class="form-group">
      	<c:if test="${pwd == 1}">
	        <label for="pwd1">비밀번호</label>
	        <input type="password" class="control"  name="pwd1" id="pwd1" oninput="pwd1Check()" maxlength="20" placeholder="영문/숫자 필수, 특수문자 가능 4~20자 이내" required>
	        <div id="pwdError1" class="errorMsg"></div>
	        <br>
	        <label for="pwd2">비밀번호 확인</label>
	        <input type="password" class="control"  name="pwd2" id="pwd2" oninput="pwd2Check()" maxlength="20" placeholder="비밀번호를 동일하게 한번 더 입력해주세요." required>
	        <div id="pwdError2" class="errorMsg"></div>
        </c:if>
        <c:if test="${pwd == 0}">
          <label for="name">비밀번호</label>
          <input type="text" class="control" id="pwd" name="pwd" value="검색된 결과가 없습니다." readonly>
        </c:if>
      </div>
      <c:if test="${pwd == 0}">
        <input type="button" onclick="location.href='FindAccount.mem'" class="nextBtn" value="돌아가기"/>
      </c:if>
      <c:if test="${pwd == 1}">
	      <button type="button" onclick="fCheck()" class="nextBtn">비밀번호 변경</button>
      </c:if>
      <input type="hidden" name="mid" value="${mid}">
    </form>
  </div>
</body>
</html>