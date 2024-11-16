<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>회원가입 | 그린테리어</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/include/bs4.jsp"/>
  <jsp:include page="/include/fonts.jsp"/>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <%-- <link rel="stylesheet" type="text/css" href="${ctp}/css/memberJoin.css"> --%>
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
    
    /* 라디오버튼 css */
		ul, li, dl, dt, dd, p, span {
			margin:0;
			padding:0
		}
		
		a {
			text-decoration:none;
			color:#777
		}
		
		li {
			list-style:none
		}
		
		*, :after, :before {
		-webkit-box-sizing:border-box;
		-moz-box-sizing:border-box;
		box-sizing:border-box
		}
		
		.wrap {
		display:flex;
		align-items: center;
		justify-content: center;
		gap: 10%;
		margin-top: 20%;
		margin-bottom: 1%;
		  }
		
		.wrap .radio_area label {
		cursor:pointer;
		display:flex;
		align-items:center;
		gap:20px;
		height:50px;
		padding:0 30px 0 20px;
		border-radius:30px;
		font-size:25px;
		font-weight:500;
		color:#999;
		background:#f2f2f2;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label span {
		opacity:.3;
		display:flex;
		width:20px;
		height:20px;
		border:2px solid #111;
		border-radius:50%;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label span:before {
		content:"";
		width:6px;
		height:6px;
		margin:auto;
		border-radius:50%;
		background:#111;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label:hover {
		background:#e1e1e1;
		}
		
		.radio_area input[type=radio] {
		display:none;
		}
		
		.radio_area input[type=radio]:checked + label {
		color:#fff;
		background:#111;
		}
		
		.radio_area input[type=radio]:checked + label span {
		opacity:1;
		border-color:#fff;
		}
		
		.radio_area input[type=radio]:checked + label span:before {
		background:#fff;
		}    
		
		 /* 애니메이션 효과 */
     /* 라디오 버튼 선택 시 상단으로 이동하는 효과 */
    .wrap.move-up {
      margin-top: 50px; /* 두 버튼을 상단으로 이동시킴 */
    }

    .wrap .radio_area input[type=radio] + label ,.wrap.move-up {
      position: relative;
      margin-top: 0%; /* 선택된 라디오 버튼을 위로 밀기 */
      transition: all .5s ease-in-out;
    }
    
    #customerForm, #companyForm {
      display: none;
      transition: all .5s ease-in-out; /* 부드러운 전환 */
    }

    #customerForm.show, #companyForm.show {
      display: block;
      animation: slideUp 0.5s forwards; /* 폼이 올라오는 애니메이션 */
    }

    @keyframes slideUp {
      0% {
        transform: translateY(20%);
        opacity: 0;
      }
      100% {
        transform: translateY(0);
        opacity: 1;
      }
    }
    
    /* 회원가입 */
    html {
   		scroll-behavior:smooth;
    }
    
		#container {
			font-size: 1.1em;
		}
		
    #homeAddressInput {
      display: none;
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
		
		.jClick {
			width:100%;
		  max-width: 300px;
	    padding: 15px;
	    border-radius:500px; 
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
			--text: #fff;
			--light-pink: #e8e6df;
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
		// 아이디 중복 검사 
		function idCheck() {
			let mid = myform.mid.value;
			//let mid = document.getElementById("mid").value;
			
			if(mid == "") {
				alert("아이디를 입력하세요");
				myform.mid.focus();
			}
			else if(!regex1.test(mid)) {
				document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		    myform.mid.focus();
			}
			else {
  		  document.getElementById("midError").innerHTML="";
				let url = "MemberIdCheck.mem?mid="+mid;
				document.getElementById('mid').readOnly = true;
				window.open(url, "idCheckWindow", "width=500px, height=250px");
				idCheckSw = 1;
			}
		}
		function midCheck() {
			//let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자 
			let mid = document.getElementById("mid").value.trim();
			document.getElementById("midError").innerHTML="";
			
		  // 아이디 확인
		  if(!regex1.test(mid)) {
		    document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		  } 
		  else {
			   document.getElementById("midError").innerHTML="";
		  }			
		}
		
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
		
		
		
/* 		function residentCheck2() {
			//let regex7 = /\d{10}$/; //(resident-업체)
			let resident = document.getElementById("resident").value.trim();
			document.getElementById("residentError").innerHTML="";
			
		  // 사업자번호 확인
		  if(!regex7.test(resident)){
		    document.getElementById("residentError").innerHTML="사업자등록번호가 올바르지 않습니다.(사업자등록번호 10자리)";
		   return false;;
		  }
		  else {
			  document.getElementById("residentError").innerHTML="";
			  check = true;
			  document.getElementById('resident').addEventListener('keydown', function(event) {
	        if (event.key === 'Enter') {
        	  document.getElementById('tel2').focus();
	        }
		    });
		  }			
		} */
		
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
		  
			//let birthdayR = myform.birthday.value.trim();
			//let genderR = myform.gender.value.trim(); 
		  let resident = birthday + "-" + gender; 
			
		  // 코스라이브러리 받아주는 서블릿쪽이 멀티파츠로 받아야 합니다 (사진을 넘길때- 업체에서 멀티파츠 갯 파라멬타)
			
		  // 아이디 확인
		  if(!regex1.test(mid)) {
		    document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		    document.getElementById("mid").focus();
		    return false;
		  } 
		  else {
			   document.getElementById("midError").innerHTML="";
		  }
		  
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
	    if(idCheckSw == 0) {
				alert("아이디 중복확인을 해주세요.");
				document.getElementById("mid").focus();
			} 
			else {
		    myform.tel.value = tel;
		    myform.address.value = address;	    
		    myform.resident.value = resident;
		   	myform.submit();
			}
		}
	 		
/* 업 체 회 원 가 입  */	 		
	 		
	 		
	 		
	 		
		
		
		/* 회원가입폼 */  
  function showCustomerForm() {
			let level = document.getElementById("level1").value;
			$.ajax({
			    type: "POST",
			    url: "AjaxLevel.mem",
			    data: { level: level },
			    success: function (data) {
            $('#customerForm').html(data);
			    },
			    error: function () {
			        alert("Ajax 호출 오류 발생");
			    }
			});
			
	    document.getElementById('customerForm').style.display = 'block';  // 고객 폼 보이기
 	    document.getElementById('customerForm').classList.add('show'); 		// 애니메이션 효과 추가
	    document.getElementById('companyForm').style.display = 'none';    // 업체 폼 숨기기
	    document.querySelector('.wrap').classList.add('move-up'); // 라디오 버튼 위치 위로 이동
	  }

	  function showCompanyForm() {
		  let level = document.getElementById("level0").value;
			$.ajax({
			    type: "POST",
			    url: "AjaxLevel.mem",
			    data: { level: level },
			    success: function (data) {
          $('#companyForm').html(data);
			    },
			    error: function () {
			        alert("Ajax 호출 오류 발생");
			    }
			});
	    document.getElementById('companyForm').style.display = 'block';   // 업체 폼 보이기
	    document.getElementById('companyForm').classList.add('show'); // 애니메이션 효과 추가
	    document.getElementById('customerForm').style.display = 'none';   // 고객 폼 숨기기
	    document.querySelector('.wrap').classList.add('move-up');
	  }

</script>
</head>
<body>
  <p><br/></p>
  <div><a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a></div>
	<form name="myform" method="post" action="MemberJoinOk.mem">
	  <!--Customer(1)/Company()  -->
	  <div class="wrap">
		  <div class="radio_area">
		    <input type="radio" name="level" id="level1" value="1" onclick="showCustomerForm()">
		    <label for="level1"><span></span>고객 ${vo.level}</label>  
		  </div>
		  <div class="radio_area">
		    <input type="radio" name="level" id="level0" value="" onclick="showCompanyForm()">
		    <label for="level0"><span></span>업체 ${param.level}</label>  
		  </div>   
		</div>
	  <!-- 고객 회원가입 폼 (초기에는 숨김) -->
	  <div id="customerForm" style="display:none;"></div>
    <!-- 업체 회원가입 폼 (초기에는 숨김) -->
	  <div id="companyForm" style="display:none;"></div>
	</form>
</body>
</html>
