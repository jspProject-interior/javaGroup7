<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>개인정보수정 | 그린테리어</title>
	<jsp:include page="/include/bs4.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <style>
		body,html {
			height:100%;
			margin:0;
			padding:0;
			font-family:'EliceDigitalBaeum-Bd';
      background-image: url("${ctp}/images/interior/modern/mordern1/1.jpg");
      background-size: cover;
 			background-position: center;
		}
		
		.container {
		  display: flex;
		  justify-content: center; /* 수평 중앙 정렬 */
		  align-items: center; /* 수직 중앙 정렬 */
		  padding-bottom: 3%; /* 폼 아래에 여백을 줘서 배경 이미지가 5% 정도 보이게 함 */
		}
		
		.Logo {
      font-family: "Playfair Display", serif;
      font-size: 30px;
      color: white;
      text-decoration: none;
    }
    
    
    .Logo:hover {
      color: white;
      text-decoration: none;
    }
    
    span {
    display: none;
    }
    
    /* 회원가입 */
    html {
   		scroll-behavior:smooth;
    }
    
		#container {
			font-size: 1.1em;
		}
    
    input.form-control {
    	font-size: 15px;
    }
    
		.text-primary {
			font-size: 0.8em;
			padding:2px 10px;
		}
		
		.form-control {
			border-radius:70px; 
		}
		
		.btn {
		  background-color: white;
  		border-color: #8a7c66;
  		color: #8a7c66;
  		border-width: medium;
		}
		
		.btn:hover {
			background-color: #8a7c66;
			color: white;
		}
		
    .input-group-append {
      z-index: 0;
    }
    
    /* 색상 변수 */
		:root {
			--bg: #fff;
			--text: #382b22;
			--light-pink: #e4dfcb;
			--pink: #8a7c66;
			--dark-pink: #6e5f4f;
			--pink-border: #8a7c66;
			--pink-shadow: #b8b094;
		}
		
    /* 회원가입 등록 버튼 */
    button.learn-more {
			font-size: 25px;
			font-weight: 600;
			width: 100%;
			color: var(--text);
			text-transform: uppercase;
			padding: 10px 15px;
			background: var(--light-pink);
			border: 2px solid var(--pink-border);
			border-radius: 0.75em;
			transform-style: preserve-3d;
			transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), background	150ms cubic-bezier(0, 0, 0.58, 1);
		}
		
		button.learn-more::before {
			position: absolute;
			content: '';
			width: 100%;
			height: 100%;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background: var(--dark-pink);
			border-radius: inherit;
			box-shadow: 0 0 0 2px var(--pink-border), 0 0.625em 0 0 var(--pink-shadow);
			transform: translate3d(0, 0.75em, -1em);
			transition: transform 150ms cubic-bezier(0, 0, 0.58, 1), box-shadow	150ms cubic-bezier(0, 0, 0.58, 1);
		}

		button.learn-more:hover {
			transform: translate(0, 0.25em);
		}
		
		button.learn-more:hover::before {
			box-shadow: 0 0 0 2px var(--pink-border), 0 0.5em 0 0 var(--pink-shadow);
			transform: translate3d(0, 0.5em, -1em);
		}
		
		button.learn-more:active {
			background: var(--light-pink);
			transform: translate(0em, 0.75em);
		}
		
		button.learn-more:active::before {
			box-shadow: 0 0 0 2px var(--pink-border), 0 0 var(--pink-shadow);
			transform: translate3d(0, 0, -1em);
		}
		
  </style>
  <script>
 		// 아이디 중복버튼을 클릭했는지의 여부를 확인하기 위한 변수(버튼 클릭 후엔 내용 수정처리 불가)
		let idCheckSw = 0;
 
		// 정규식 검사 함수
		let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자
	  let regex2 = /^(?=.*?[0-9])(?=.*?[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/;  //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
	  let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
 		let regex4 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; // 이메일 
 		let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/; //(전화번호)
 		let regex6 = /[0-9]{6}$/; //(birthday)
 		//let regex6 = /\d{6}[1-4]$/; //(resident-고객(주민등록번호):마지막자리는 성별을 나타내서 1-4까지의 숫자만 들어오도록)
 		//let regex7 = /\d{10}$/; //(resident-업체)

 		/* 고 객 회 원 가 입 */		
		function pwd1Check() {
			//let regex2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
			let pwd1 = document.getElementById("pwd1").value.trim();
			document.getElementById("pwdError1").innerHTML="";
			
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError1").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		  }
		  else {
		    document.getElementById("pwdError1").innerHTML="";
	  		document.getElementById('pwd1').addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
        	  document.getElementById('pwd2').focus();
	        }
		    });
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
	  		document.getElementById('pwd2').addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
        	  document.getElementById('name').focus();
	        }
		    });
		  }
		}
		
		function nameCheck() {
			//let regex3 = /^[가-힣a-zA-Z]{1,10}$/;  // (성명)한글,영문만 적어도 1자이상 
			let name = document.getElementById("name").value.trim();
			document.getElementById("nameError").innerHTML="";
			
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이하)";
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
			  document.getElementById('name').addEventListener('keydown', function(event) {
			        if (event.key === 'Enter') {
		        	  document.getElementById('resident1').focus();
			        }
				    });
		  }			
		}
		
		function residentCheck1() {
			//let regex6 = /\d{6}$/; //(resident-고객)
			let resident = document.getElementById("resident1").value.trim();
			document.getElementById("residentError1").innerHTML="";
			
		  // 주민번호 확인
		  if(!regex6.test(resident)){
		    document.getElementById("residentError1").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
		  }
		  else {
			  document.getElementById("residentError1").innerHTML="";
			  document.getElementById('resident1').addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
        	  document.getElementById('tel2').focus();
	        }
		    });
		  }			
		}
		
		function birthdayCheck() {
			//let regex6 = /\d{6}$/; //(birthday)
			let birthday = document.getElementById("birthday").value;
			document.getElementById("birthday").innerHTML="";
			
			// 생년월일 확인
			if(!regex6.test(birthday)){
			    document.getElementById("residentError").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
			  }
		  else {
			  document.getElementById("residentError").innerHTML="";
			  if (birthday.length >= 6) {
				  myform.gender.focus();
	      }
		  }
		}
		
		function genderCheck() {
	    let gender = document.getElementById("gender").value.trim();
	    document.getElementById("residentError").innerHTML = "";

	    // 성별 값이 1~4 사이에 있는지 확인
	    if (gender < 1 || gender > 4 || isNaN(gender)) {
	        document.getElementById("residentError").innerHTML = "주민등록번호가 올바르지 않습니다.(성별은 1~4 사이의 숫자여야 합니다)";
	    }
	    else {
        document.getElementById("residentError").innerHTML = "";
        document.getElementById('gender').addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
	        	document.getElementById('tel2').focus();
	        }
		    });
	    }
		}
		
		function telCheck() {
			//let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/g; //(전화번호)
		  let tel1 = myform.tel1.value;
		  let tel2 = myform.tel2.value;
		  let tel3 = myform.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
		  
		  // 전화번호 확인
		  if (document.getElementById("tel2").value.length >= 4) {
			  myform.tel3.focus();
      }
		  if(tel2===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		  }
		  else if(tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호 형식에 맞게 입력해주세요.";
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		    document.getElementById('tel3').addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
	      	  document.getElementById('email').focus();
	        }
		    });
		  }
		}

		function emailCheck() {
			//let regex4 = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/; // 이메일 
			let email = document.getElementById("email").value.trim();
		  document.getElementById("emailError").innerHTML="";

		  // 이메일확인
		  if(!regex4.test(email)){
		    document.getElementById("emailError").innerHTML="올바르지 않는 이메일 형식입니다.";
		  }
		  else {
			  document.getElementById("emailError").innerHTML="";
			  
		  }			
		}
		
		// 회원가입 버튼 클릭시 체크
		function joinCheck(){
		  let mid = document.getElementById("mid").value.trim();
		  let pwd1 = document.getElementById("pwd1").value.trim();
		  let pwd2 = document.getElementById("pwd2").value.trim();
		  let name = document.getElementById("name").value.trim();
	  	//let company = document.getElementById("comany").value.trim();
	  	let email = document.getElementById("email").value.trim();
			let birthday = document.getElementById("birthday").value.trim();
			let gender = document.getElementById("gender").value.trim();
	  	 
		  let tel1 = myform.tel1.value;
		  let tel2 = myform.tel2.value;
		  let tel3 = myform.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
	  	
		  let postcode = myform.postcode.value + " ";
		  let roadAddress = myform.roadAddress.value + " ";
		  let detailAddress = myform.detailAddress.value + " ";
		  let extraAddress = myform.extraAddress.value + " ";
			let address = postcode + " /" + roadAddress + " /" + detailAddress + " /" + extraAddress + " ";
		  
		  let resident = birthday + "-" + gender; 
			
		  // 코스라이브러리 받아주는 서블릿쪽이 멀티파츠로 받아야 합니다 (사진을 넘길때- 업체에서 멀티파츠 갯 파라멬타)
			
		  
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError1").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		    document.getElementById("pwd1").focus();
		    return false;
		  }
		  else {
		    document.getElementById("pwdError1").innerHTML="";
		    
			  if(pwd2=== "") {
			    document.getElementById("pwdError2").innerHTML="비밀번호를 다시 입력해주세요.";
			    document.getElementById("pwd2").focus();
			    return false;
			  }
			  else if(pwd1 !== pwd2) {
			    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
			    document.getElementById("pwd2").focus();
			    return false;
			  }
			  else {
		  	  document.getElementById("pwdError1").innerHTML="";
		  	  document.getElementById("pwdError2").innerHTML="";
			  }
		  }
				  
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이내)";
		    document.getElementById("name").focus();
		    return false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
		  }
		   
		  // 이메일확인
		  if(!regex4.test(email)){
		    document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다.";
		    document.getElementById("email").focus();
		    return false;
		  }
		  else {
			  document.getElementById("emailError").innerHTML="";
		  }	 
				     
		  // 전화번호 확인
		  if(tel2==="" || tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		    document.getElementById("tel2").focus();
		    return false;
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호 형식에 맞게 입력해주세요.";
		    document.getElementById("tel2").focus();
		    return false;
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		  }
		  
		  if(!regex6.test(birthday)|| gender < 1 || gender > 4){
		    document.getElementById("residentError").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
		    document.getElementById("birthday").focus();
		    return false;
		  }
		  else {
			  document.getElementById("residentError").innerHTML="";
		  }
	    myform.tel.value = tel;
	    myform.address.value = address;	    
	    myform.resident.value = resident;
	   	myform.submit();
		}
</script>
</head>
<body>
	<div style="margin-top: 1%;"><a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a></div>
	<form name="myform" method="post" action="MemberUpdateOk.mem">
	  <div class="container h-100">
			<div class="card" style="width: 72%;">
			  <div class="card-body">
			    <div class="m-sm-4 p-3">
			      <div class="mb-3"> <font color="red">*</font> 필수 입력 항목(고객)</div>  
			      <div class="form-group">
			        <font color="red"><b>*&nbsp;</b></font><label for="mid" class="m-0 p-0">아이디 (ID)</label>
			        <input type="text" class="form-control form-control-lg" name="mid" id="mid" oninput="midCheck()" maxlength="20" value="${sMid}" readonly/>
			      </div>
			      <div class="form-group password">
			        <font color="red"><b>*&nbsp;</b></font><label for="pwd1" class="password">비밀번호 (PASSWORD)</label>
			        <input type="password" class="form-control form-control-lg"  name="pwd1" id="pwd1" oninput="pwd1Check()" maxlength="20" placeholder="영문/숫자 필수, 특수문자 가능 4~20자 이내" autofocus>
			        <div id="pwdError1" class="text-primary"></div>
			      </div>
			      <div class="form-group passwordCheck">
			        <font color="red"><b>*&nbsp;</b></font><label for="pwd2">비밀번호 재확인 (PASSWORD CHECK)</label>
			        <input type="password" class="form-control form-control-lg"  name="pwd2" id="pwd2" oninput="pwd2Check()" maxlength="20" placeholder="비밀번호 재확인">
			         <div id="pwdError2" class="text-primary"></div>
			      </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="name" >성명 (NAME)</label>
	            <input type="text" class="form-control form-control-lg"  name="name" id="name" onchange="nameCheck()" value="${vo.name}" maxlength="10" placeholder="한글 또는 영문 10자 이내">
	            <div id="nameError" class="text-primary"></div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label>주민등록번호 (RESIDENT)</label>
	             <div class="input-group">
	              <div class="input-group-append" style="display: flex; width: 100%;">
			            <input type="text" class="form-control form-control-lg" name="birthday" id="birthday" maxlength="6" onkeyup="birthdayCheck()" value="${resident1}" placeholder="주민등록번호 앞 6자리만">
			            <input type="text" class="form-control form-control-lg" name="gender" id="gender" maxlength="1" onkeyup="genderCheck()"  value="${resident2}" placeholder="주민등록번호 뒤 1자리만">
									<input type="hidden" name="resident" id="resident"/>	  
								</div> 
	            	<div id="residentError" class="text-primary"></div>
							</div>         
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
	            <div class="input-group">
	              <div class="input-group-append" style="display: flex; width: 100%;">
	                <select name="tel1" id="tel1" class="form-control" style="flex: 2;">
			              <option value="010"  ${tel1 == 010 ? "selected" : ""}>010</option>
			              <option value="02"  ${tel1 == 02 ? "selected" : ""}>02</option>
					          <option value="032"  ${tel1 == 032 ? "selected" : ""}>032</option>
					          <option value="033"  ${tel1 == 033 ? "selected" : ""}>033</option>
					          <option value="041"  ${tel1 == 041 ? "selected" : ""}>041</option>
					          <option value="042"  ${tel1 == 042 ? "selected" : ""}>042</option>
					          <option value="043"  ${tel1 == 043 ? "selected" : ""}>043</option>
			            </select>
	                <input type="text" class="form-control form-control-lg" name="tel2" id="tel2" maxlength="4" value="${tel2}" onkeyup="telCheck()" placeholder="가운데 자리" style="flex: 4;"/>
	                <input type="text" class="form-control form-control-lg" name="tel3" id="tel3" maxlength="4" value="${tel3}" onkeyup="telCheck()" placeholder="마지막 자리" style="flex: 4;"/>
	                <input type="hidden" name="tel" id="tel"/>
					    	</div>
					    	<div id="telError" class="text-primary"></div>
	          	</div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="email">이메일</label>
	            <input class="form-control form-control-lg" type="text" name="email" id="email" value="${vo.email}" oninput="emailCheck()" placeholder="이메일 형식에 맞춰 입력해주세요">
	            <div id="emailError" class="text-primary"></div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="address">주소</label><input class="btn text-right float-right" type="button" value="주소 찾기" onclick="sample6_execDaumPostcode()">
	            <input type="hidden" name="address" id="address">
	          </div>
	          <div id="homeAddressInput">
	            <div class="form-group">
	              <div class="input-group-append mb-1">
					        <input type="text" name="postcode" id="sample6_postcode"  placeholder="우편번호" value="${address1}" class="form-control" style="width: 150px;" onclick="sample6_execDaumPostcode()" readonly>
					      </div>
					     	<div class="input-group">
					     		<input type="text" name="roadAddress" id="sample6_address" placeholder="주소" value="${address2}" class="form-control mb-1" onclick="sample6_execDaumPostcode()" readonly>
					     	</div>
					      <div class="input-group">
					        <div class="input-group-append" style="display: flex; width: 100%;">
					          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" value="${address4}" class="form-control" style="flex: 4;" onclick="sample6_execDaumPostcode()" readonly>
					        	<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" value="${address3}" class="form-control" style="flex: 6;">
					        </div>
					      </div>
					    </div>
					  </div>
						<p><br/></p>
	          <div class="text-center">
	          	<button class="learn-more" type="button" onclick="joinCheck()">정 보 수 정</button>
	            <input type="hidden" name="level" id="level" value="1">
	          </div>
					</div>
	      </div>
	    </div>
	  </div>
  </form>
</body>
</html>