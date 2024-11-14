<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>회원가입 | 그린테리어</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/include/bs4.jsp"/>
  <jsp:include page="/include/fonts.jsp"/>
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
    
    /* 라디오버튼 css */
		ul, li, dl, dt, dd, p, span {
			margin:0;
			padding:0
		}
		
		a {
			text-decoration:none;
			color:#777
		}
		
		li{
			list-style:none
		}
		
		*, :after, :before{
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
		
		.wrap .radio_area label{
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
		
		.wrap .radio_area label span{
		opacity:.3;
		display:flex;
		width:20px;
		height:20px;
		border:2px solid #111;
		border-radius:50%;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label span:before{
		content:"";
		width:6px;
		height:6px;
		margin:auto;
		border-radius:50%;
		background:#111;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label:hover{
		background:#e1e1e1;
		}
		
		.radio_area input[type=radio]{
		display:none;
		}
		
		.radio_area input[type=radio]:checked + label{
		color:#fff;
		background:#111;
		}
		.radio_area input[type=radio]:checked + label span{
		opacity:1;
		border-color:#fff;
		}
		.radio_area input[type=radio]:checked + label span:before{
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
    
    /*회원가입*/
    html {scroll-behavior:smooth;}
		#container {font-size: 1.1em;}
		
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
 		let regex6 = /[0-9]{6}[1-4]{1}$/; //(resident-고객(주민등록번호):마지막자리는 성별을 나타내서 1-4까지의 숫자만 들어오도록) 오류임
 		//let regex6 = /\d{6}[1-4]$/; //(resident-고객(주민등록번호):마지막자리는 성별을 나타내서 1-4까지의 숫자만 들어오도록)
 		//let regex7 = /\d{10}$/; //(resident-업체)

 /* 고 객 회 원 가 입 */		
		
		// 아이디 중복 검사 
		function idCheck() {
			let mid = myform.mid.value.trim();
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
		    check = false;
		  } 
		  else {
			   document.getElementById("midError").innerHTML="";
			   check = true;
		  }			
		}
		
		function pwd1Check() {
			//let regex2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
			let pwd1 = document.getElementById("pwd1").value.trim();
			document.getElementById("pwdError1").innerHTML="";
			
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError1").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		    check = false;
		  }
		  else {
		    document.getElementById("pwdError1").innerHTML="";
	  	  check = true;
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
			    check = false;
		  }
		  else {
	  	  document.getElementById("pwdError1").innerHTML="";
	  	  document.getElementById("pwdError2").innerHTML="";
	  	  check = true;
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
		    check = false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
			  check = true;
			  document.getElementById('name').addEventListener('keydown', function(event) {
			        if (event.key === 'Enter') {
		        	  document.getElementById('resident1').focus();
			        }
				    });
		  }			
		}
		
		function residentCheck1() {
			//let regex6 = /\d{6}[1-4]$/; //(resident-고객)
			let resident = document.getElementById("resident1").value.trim();
			document.getElementById("residentError1").innerHTML="";
			
		  // 주민번호 확인
		  if(!regex6.test(resident)){
		    document.getElementById("residentError1").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
		    check = false;
		  }
		  else {
			  document.getElementById("residentError1").innerHTML="";
			  check = true;
			  document.getElementById('resident1').addEventListener('keydown', function(event) {
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
		    check = false;
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
		  if(tel2===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		    document.getElementById('tel2').focus();
		    check = false;
		  }
		  else if(tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		    document.getElementById('tel3').focus();
		    check = false;
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호 형식에 맞게 입력해주세요.";
		    check = false;
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		    check = true;
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
		    check = false;
		  }
		  else {
			  document.getElementById("emailError").innerHTML="";
			  check = true;
			  
		  }			
		}
		
		// 회원가입 버튼 클릭시 체크
		function joinCheck(){
		  let mid = document.getElementById("mid").value.trim();
		  let pwd1 = document.getElementById("pwd1").value.trim();
		  let pwd2 = document.getElementById("pwd2").value.trim();
		  let name = document.getElementById("name").value.trim();
		 	let resident = document.getElementById("resident1").value.trim();
	  	//let company = document.getElementById("comany").value.trim();
	  	let email = document.getElementById("email").value.trim();
	  	 
		  let tel1 = myform.tel1.value;
		  let tel2 = myform.tel2.value;
		  let tel3 = myform.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
	  	
		  let postcode = myform.postcode.value + " ";
		  let roadAddress = myform.roadAddress.value + " ";
		  let detailAddress = myform.detailAddress.value + " ";
		  let extraAddress = myform.extraAddress.value + " ";
			let adress = postcode + " /" + roadAddress + " /" + detailAddress + " /" + extraAddress + " ";
		  
		  // 코스라이브러리 받아주는 서블릿쪽이 멀티파츠로 받아야 합니다 (사진을 넘길때- 업체에서 멀티파츠 갯 파라멬타)
			
		  // 아이디 확인
		  if(!regex1.test(mid)) {
		    document.getElementById("midError").innerHTML="아이디 형식에 맞춰주세요.(영어/숫자만 4~20자)";
		    check = false;
		  } 
		  else {
			   document.getElementById("midError").innerHTML="";
			   check = true;
		  }
		  
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError1").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		    check = false;
		  }
		  else {
		    document.getElementById("pwdError1").innerHTML="";
		    
			  if(pwd2=== "") {
			    document.getElementById("pwdError2").innerHTML="비밀번호를 다시 입력해주세요.";
			    check = false;
			  }
			  else if(pwd1 !== pwd2) {
			    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
			    check = false;
			  }
			  else {
		  	  document.getElementById("pwdError1").innerHTML="";
		  	  document.getElementById("pwdError2").innerHTML="";
		  	  check = true;
			  }
		  }
				  
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 10자 이내)";
		    check = false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
			  check = true;
		  }
		   
		  // 이메일확인
		  if(!regex4.test(email)){
		    document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다.";
		    check = false;
		  }
		  else {
			  document.getElementById("emailError").innerHTML="";
			  check = true;
		  }	 
				     
		  // 전화번호 확인
		  if(tel2==="" || tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		    check = false;
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호 형식에 맞게 입력해주세요.";
		    check = false;
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		    check = true;
		  }
		  
		  if(!regex6.test(resident)){
			    document.getElementById("residentError1").innerHTML="주민등록번호가 올바르지 않습니다.(생년월일 + 성별(1~4))";
			    check = false;
			  }
			  else {
				  document.getElementById("residentError1").innerHTML="";
				  check = true;
			  }
		  
		  if(!check){
			  alert('입력된 값을 다시 확인해주세요.');
			  check = true;
		  }
		  else {
		    if(idCheckSw == 0) {
					alert("아이디 중복확인을 해주세요.");
					document.getElementById("midBtn").focus();
				} 
				else {
			    myform.tel.value = tel;
			    myform.address.value = address;	    
			   	myform.submit();
				}
		  }
		}
	 		
/* 업 체 회 원 가 입  */	 		
	 		
	 		
	 		
	 		
		
		
		/* 회원가입폼 */  
  function showCustomerForm() {
	    document.getElementById('customerForm').style.display = 'block';  // 고객 폼 보이기
 	    document.getElementById('customerForm').classList.add('show'); 		// 애니메이션 효과 추가
	    document.getElementById('companyForm').style.display = 'none';    // 업체 폼 숨기기
	    document.querySelector('.wrap').classList.add('move-up'); // 라디오 버튼 위치 위로 이동
	  }

	  function showCompanyForm() {
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
  
  <!--Customer(1)/Company(2)  -->
  <div class="wrap">
	  <div class="radio_area">
	    <input type="radio" name="level" id="level1" value="1" onclick="showCustomerForm()">
	    <label for="level1"><span></span>고객 </label>  
	  </div>
	  <div class="radio_area">
	    <input type="radio" name="level" id="level0" onclick="showCompanyForm()">
	    <label for="level0"><span></span>업체 </label>  
	  </div>   
	</div>

  <!-- 고객 회원가입 폼 (초기에는 숨김) -->
	<form name="myform" method="post" action="MemberJoinOk.mem">
	  <div id="customerForm" style="display:none;">   
	   <div class="container h-100">
			<div class="card" style="width: 72%;">
			  <div class="card-body">
			    <div class="m-sm-4 p-3">
			      <div class="mb-3"> <font color="red">*</font> 필수 입력 항목(고객)</div>  
			      <div class="form-group">
			        <font color="red"><b>*&nbsp;</b></font><label for="mid" class="m-0 p-0">아이디 (ID)</label>
			        <input type="button" value="아이디 중복체크" class="btn text-right float-right mb-1" onclick="idCheck()"/>
			        <input type="text" class="form-control form-control-lg" name="mid" id="mid" oninput="midCheck()" maxlength="20" placeholder="영문과 숫자를 포함한 4~20자 이내" required autofocus/>
			        <div id="midError" class="text-primary"></div>
			      </div>
			      <div class="form-group password">
			        <font color="red"><b>*&nbsp;</b></font><label for="pwd1" class="password">비밀번호 (PASSWORD)</label>
			        <input type="password" class="form-control form-control-lg"  name="pwd1" id="pwd1" oninput="pwd1Check()" maxlength="20" placeholder="영문/숫자 필수, 특수문자 가능 4~20자 이내">
			        <div id="pwdError1" class="text-primary"></div>
			      </div>
			      <div class="form-group passwordCheck">
			        <font color="red"><b>*&nbsp;</b></font><label for="pwd2">비밀번호 재확인 (PASSWORD CHECK)</label>
			        <input type="password" class="form-control form-control-lg"  name="pwd2" id="pwd2" oninput="pwd2Check()" maxlength="20" placeholder="비밀번호 재확인">
			         <div id="pwdError2" class="text-primary"></div>
			      </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="name" >성명 (NAME)</label>
	            <input type="text" class="form-control form-control-lg"  name="name" id="name" onchange="nameCheck()" maxlength="10" placeholder="한글 또는 영문 10자 이내">
	            <div id="nameError" class="text-primary"></div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="resident1" >주민등록번호 (RESIDENT)</label>
	            <input type="text" class="form-control form-control-lg" name="resident1" id="resident1" maxlength="7" oninput="residentCheck1()" placeholder="주민등록번호 앞 7자리만">
							<input type="hidden" name="resident" id="resident"/>	            
	            <div id="residentError1" class="text-primary"></div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
	            <div class="input-group">
	              <div class="input-group-append">
	                <select name="tel1" name="tel1" id="tel1" class="form-control">
			              <option value="010" selected>010</option>
			              <option value="02">02</option>
					          <option value="032">032</option>
					          <option value="033">033</option>
					          <option value="041">041</option>
					          <option value="042">042</option>
					          <option value="043">043</option>
			            </select>
	                <input type="text" class="form-control form-control-lg" name="tel2" id="tel2" maxlength="4" placeholder="가운데 자리"/>
	                <input type="text" class="form-control form-control-lg" name="tel3" id="tel3" maxlength="4" onchange="telCheck()" placeholder="마지막 자리"/>
	                <input type="hidden" name="tel" id="tel"/>
					    	</div>
					    	<div id="telError" class="text-primary"></div>
	          	</div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="email">이메일</label>
	            <input class="form-control form-control-lg" type="text" name="email" id="email" oninput="emailCheck()" placeholder="이메일 형식에 맞춰 입력해주세요">
	            <div id="emailError" class="text-primary"></div>
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label for="address">주소</label><input class="btn text-right float-right" type="button" value="주소 찾기" onclick="sample6_execDaumPostcode()">
	            <input type="hidden" name="address" id="address">
	          </div>
	          <div id="homeAddressInput">
	            <div class="form-group">
	              <div class="input-group-append mb-1">
					        <input type="text" name="postcode" id="sample6_postcode"  placeholder="우편번호" class="form-control" style="width: 150px;" onclick="sample6_execDaumPostcode()" readonly>
					      </div>
					     	<div class="input-group">
					     		<input type="text" name="roadAddress" id="sample6_address" placeholder="주소" class="form-control mb-1" onclick="sample6_execDaumPostcode()" readonly>
					     	</div>
					      <div class="input-group">
					        <div class="input-group-append" style="display: flex; width: 100%;">
					          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" class="form-control" style="flex: 4;" onclick="sample6_execDaumPostcode()" readonly>
					        	<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" class="form-control" style="flex: 6;">
					        </div>
					      </div>
					    </div>
					  </div>
						<p><br/></p>
	          <div class="text-center">
	          	<button class="learn-more" type="button" onclick="joinCheck()">회 원 가 입</button>
	            <!-- <input type="button" value="회원가입" class="btn form-control" onclick="joinCheck()"> -->
	          </div>
					</div>
	      </div>
	    </div>
	  </div>
	</div>

    <!-- 업체 회원가입 폼 (초기에는 숨김) -->
  <div id="companyForm" style="display:none;">
	  <div class="container h-100">
	    <div class="row h-100">
	      <div class="d-table h-100" style="width: 70%; margin-left: 15%">
	        <div class="d-table-cell align-middle">
	          <div class="card">
	            <div class="card-body">
	              <div class="m-sm-4">
	                <div class="mb-3">
	                  <font color="red">*</font> 필수 입력 항목(업체)
	                </div>
	               <!--    <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>아이디 (ID)</label>
	                    <input type="text" class="form-control form-control-lg" name="mid" id="mid" onchange="midCheck()" placeholder="영문과 숫자를 포함한 4-12자 이내"required autofocus/>
	                    <div id="midError" class="text-primary"></div>
	                  </div>
	                  <div class="form-group password">
	                    <font color="red"><b>*&nbsp;</b></font><label class="password">비밀번호 (PASSWORD)</label> &nbsp; <span class="pwdEyes"><i class="fa fa-eye fa-lg"></i></span>
	                    <input type="password" class="form-control form-control-lg"  name="pwd1" id="pwd1" onchange="pwd1Check()" placeholder="특수문자, 영문 대소문자, 숫자를 포함한 8-16자 이내">
	                    <div id="pwdError" class="text-primary"></div>
	                  </div>
	                  <div class="form-group passwordCheck">
	                    <font color="red"><b>*&nbsp;</b></font><label>비밀번호 재확인 (PASSWORD CHECK)</label> &nbsp; <span class="rePwdEyes"><i class="fa fa-eye fa-lg"></i></span>
	                    <input type="password" class="form-control form-control-lg"  name="pwd2" id="pwd2" onchange="pwd2Check()" placeholder="비밀번호 재확인">
	                     <div id="pwdError2" class="text-primary"></div>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>업종</label>
	                    <input type="radio" class="form-control form-control-sm" name="level" id="level2" value="2">인테리어
	                    <input type="radio" class="form-control form-control-sm" name="level" id="level3" value="3">가구
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>업체명 (COMPANY)</label>
	                    <input type="text" class="form-control form-control-lg" name="company" id="company" placeholder="한글,영문 또는 특수문자">
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>대표자명 (NAME)</label>
	                    <input type="text" class="form-control form-control-lg"  name="name" id="name" onchange="nameCheck()" placeholder="한글 또는 영문">
	                    <div id="nameError" class="text-primary"></div>
	                  </div>
	                   <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>사업자번호</label>
	                    <input type="text" class="form-control form-control-lg" name="resident" id="resident" placeholder="주민번호 앞 7자리만 입력해주세요">
	                  </div>
	                  
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
	                    <div class="input-group">
	                      <div class="input-group-append">
	                        <input type="text" class="form-control form-control-lg"  name="tel1" id="tel1" value="010" readonly=""/>
	                        <input type="text" class="form-control form-control-lg" name="tel2" id="tel2" placeholder="가운데 4자리"/>
	                        <input type="text" class="form-control form-control-lg" name="tel3" id="tel3" placeholder="마지막 4자리"/>
	                      </div>
	                    </div>
	                    <span id="telCheck"><font color="red">&nbsp;전화번호 형식에 맞지 않습니다!</font></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>이메일</label>
	                    <input class="form-control form-control-lg" type="email" name="email" id="email" placeholder="이메일 형식에 맞춰 입력해주세요">
	                    <span id="emailCheck"><font color="red">&nbsp;이메일을 입력해주시기 바랍니다!</font></span>
	                  </div>
                    <div class="form-group">
                      <font color="red"><b>*&nbsp;</b></font><label>로고(LOGO)</label>
                      <input class="form-control-file" type="file" name="photo" id="photo"/>
                    </div>
	                  <div class="form-group">
	                    <label>주소</label>
	                    <input class="btn btn-secondary text-right float-right" type="button" value="주소 찾기" onclick="sample6_execDaumPostcode()">
	                  </div>
	                  <div id="homeAddressInput">
	                    <div class="form-group">
	                      <label>우편번호</label>
	                      <div class="input-group">
	                        <input class="form-control form-control-lg" type="text" name="postcode" id="sample6_postcode" readonly=""/>
	                      </div>
	                    </div>
	                    <div class="form-group">
	                      <label>도로명 주소 / 지번 주소</label>
	                      <input class="form-control form-control-lg" type="text" name="roadAddress" id="sample6_address" readonly=""/>
	                    </div>
	                    <div class="form-group">
	                      <label>상세 주소</label>
	                      <input class="form-control form-control-lg" type="text" name="detailAddress" id="sample6_detailAddress"/>
	                    </div>
	                  </div>
	                  <p><br/></p>
	                  <div class="text-center mt-3">
	                    <input type="button" value="회원가입" class="form-control btn btn-lg btn-secondary" onclick="joinCheck()">
	                  </div> -->
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
</form>
</body>
</html>
