<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
  <link rel="icon" href="${ctp}/images/favicon.png">
  <title>회원가입 | 그린테리어</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/include/bs4.jsp"/>
  <jsp:include page="/include/fonts.jsp"/>
  
  <!-- Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  
  <!-- jQuery, Popper.js, Bootstrap JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard-dynamic-subset.css"></script>
  <style>
    body {
      background-image: url("${ctp}/images/interior/modern/mordern1/1.jpg");
    }
    
		body,html {
			height:100%;
			margin:0;
			padding:0;
			font-family:'EliceDigitalBaeum-Bd';
		}
    .card {
      margin-bottom: 1.5rem;
      box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
    }
    .input-group-append {
      z-index: 0;
    }
    #homeAddressInput {
      display: none;
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
    
    input.form-control {
    font-size: 15px;
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
		gap:10%;
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
  		border-color: #ffa0c5;
  		color: #ffa0c5;
  		border-width: medium;
		}
		.btn:hover {
			background-color: #ffa0c5;
			color: white;
		}
		.must {
  		color: #ffa0c5;
		}
  </style>
  
  <script>
  // 정규식 검사 함수
 // 아이디 중복버튼을 클릭했는지의 여부를 확인하기 위한 변수(버튼 클릭 후엔 내용 수정처리 불가)
		let idCheckSw = 0;
		
		// 아이디 중복 검사 
		function idCheck() {
			let mid = myform.mid.value.trim();
			let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자
			let url = "/javaweb8J/IdCheck.kn_mem?mid="+mid;
			
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
				idCheckSw = 1;
				myform.mid.readOnly = true;
				window.open(url, "nWin", "width=580px, height=250px");
			}
		}
		
		// 전화번호 길이 제한(4자리 이상부터 입력 불가)
		function handleOnInput(el, maxlength) {
		  if(el.value.length > maxlength)  {
		    el.value 
		      = el.value.substr(0, maxlength);
		  }
		}
		
		// 첫 번째 전화번호 내용 입력 후 자동으로 커서 옮기기
		$(document).ready(function() {
	    $(".inputs").keyup(function () {
        if (this.value.length == this.maxLength) {
          $(this).next('.inputs').focus();
        }
	    });
		});	
		
		
		let check = true;

		// 가입부분 체크
		function joinCheck(){
		  let mid = document.getElementById("mid").value.trim();
		  let pwd1 = document.getElementById("pwd1").value.trim();
		  let pwd2 = document.getElementById("pwd2").value.trim();
		  let name = document.getElementById("name").value.trim();
	  
    	let email1 = myform.email1.value.trim();
    	let email2 = myform.email2.value;
    	let email = email1 + "@" + email2;
    	
		  let birthday = myform.birthday.value;
		  
		  let tel1 = myform.tel1.value;
		  let tel2 = myform.tel2.value;
		  let tel3 = myform.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
		  
		  let postcode = myform.postcode.value + " ";
		  let roadAddress = myform.roadAddress.value + " ";
		  let detailAddress = myform.detailAddress.value + " ";
		  let extraAddress = myform.extraAddress.value + " ";
		  
		  
		  let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자 
		  let regex2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; 
		  //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
		  
		  let regex3 = /^[가-힣a-zA-Z]+$/;  // (성명)한글,영문만 적어도 1자이상 
	 		let regex4 = /^[0-9a-zA-Z]+$/g; // 이메일 
	 		let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/g; //(전화번호)
			
		  	
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
		    document.getElementById("pwdError").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		    check = false;
		  }
		  else {
		    document.getElementById("pwdError").innerHTML="";
			    
			  if(pwd2=== "") {
			    document.getElementById("pwdError2").innerHTML="비밀번호를 다시 입력해주세요.";
			    check = false;
			  }
			  else if(pwd1 !== pwd2) {
			    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
			    check = false;
			  }
			  else {
		  	  document.getElementById("pwdError").innerHTML="";
		  	  document.getElementById("pwdError2").innerHTML="";
		  	  check = true;
			  }
		  }
				  
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 1자이상)";
		    check = false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
			  check = true;
		  }
		   
		  // 이메일확인
		  if(!regex4.test(email1)){
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
		    document.getElementById("telError").innerHTML="전화번호를 완성해주세요.";
		    check = false;
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		    check = true;
		  }
		  
		  // 생년월일 확인
		  if(birthday==""){
		    document.getElementById("birthdayError").innerHTML="생일에 맞춰 특별 쿠폰을 보내드립니다. 생년월일을 입력해주세요.";
		    check = false;
		  }
		  else {
		    document.getElementById("birthdayError").innerHTML="";
		    check = true;
		  }		  
		  
		  
		  if(!check){
			  alert('입력된 값을 다시 확인해주세요.');
			  window.scrollTo(0,100); // (그냥 위치만 바뀌는)스크롤 위로 올리기 
			  check = true;
		  }
		  else {
		    if(idCheckSw == 0) {
					alert("아이디 중복확인을 해주세요.");
					document.getElementById("midBtn").focus();
				} 
				else {
			    myform.tel.value = tel;
			    myform.address.value = postcode + "/" + roadAddress + "/" + detailAddress + "/" + extraAddress + "/";
			    myform.email.value = email;
			   	myform.submit();
				}
		  }
		}
		
		function midCheck() {
			let regex1 = /^[a-zA-Z0-9]{4,20}$/; //(아이디) 영문자 또는 숫자 4~20자 
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
			let regex2 = /^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{4,20}$/g; //(비밀번호)4자 이상 20자 이하, 영어/숫자 1개 이상 필수, 특수문자 허용
			let pwd1 = document.getElementById("pwd1").value.trim();
			document.getElementById("pwdError").innerHTML="";
			
		  // 비밀번호 확인
		  if(!regex2.test(pwd1)) {
		    document.getElementById("pwdError").innerHTML="비밀번호가 올바르지 않습니다.(영어/숫자 필수, 특수문자 가능 4~20자)";
		    check = false;
		  }
		  else {
		    document.getElementById("pwdError").innerHTML="";
	  	  check = true;
	  	}	
		}
		function pwd2Check() {
			let pwd1 = document.getElementById("pwd1").value.trim();
			let pwd2 = document.getElementById("pwd2").value.trim();
			document.getElementById("pwdError").innerHTML="";
			document.getElementById("pwdError2").innerHTML="";
			
			
		  // 비밀번호 확인2
		  if(pwd1 !== pwd2) {
			    document.getElementById("pwdError2").innerHTML="비밀번호가 동일하지 않습니다.";
			    check = false;
		  }
		  else {
	  	  document.getElementById("pwdError").innerHTML="";
	  	  document.getElementById("pwdError2").innerHTML="";
	  	  check = true;
		  }
		}
		
		function nameCheck() {
			let regex3 = /^[가-힣a-zA-Z]+$/;  // (성명)한글,영문만 적어도 1자이상 
			let name = document.getElementById("name").value.trim();
			document.getElementById("nameError").innerHTML="";
			
		  // 성명 확인
		  if(!regex3.test(name)){
		    document.getElementById("nameError").innerHTML="성명이 올바르지 않습니다.(한글/영문만 1자이상)";
		    check = false;
		  }
		  else {
			  document.getElementById("nameError").innerHTML="";
			  check = true;
		  }			
		}
		
		function emailCheck() {
			let regex4 = /^[0-9a-zA-Z]+$/g; // 이메일
    	let email1 = document.getElementById("email1").value.trim();
		  document.getElementById("emailError").innerHTML="";

		  // 이메일확인
		  if(!regex4.test(email1)){
		    document.getElementById("emailError").innerHTML="이메일이 올바르지 않습니다.";
		    check = false;
		  }
		  else {
			  document.getElementById("emailError").innerHTML="";
			  check = true;
		  }			
		}
		
		function telCheck() {
			let regex5 = /\d{2,3}-\d{3,4}-\d{4}$/g; //(전화번호)
		  let tel1 = myform.tel1.value;
		  let tel2 = myform.tel2.value;
		  let tel3 = myform.tel3.value;
		  let tel = tel1 + "-" + tel2 + "-" + tel3;
		  
		  // 전화번호 확인
		  if(tel2==="" || tel3===""){
		    document.getElementById("telError").innerHTML="전화번호를 입력해주세요.";
		    check = false;
		  }
		  else if(!regex5.test(tel)){
		    document.getElementById("telError").innerHTML="전화번호를 완성해주세요.";
		    check = false;
		  }
		  else {
		    document.getElementById("telError").innerHTML="";
		    check = true;
		  }
		}
		
		function birthdayCheck() {
			let birthday = myform.birthday.value;
			document.getElementById("birthError").innerHTML="";
			
		  // 생년월일 확인
		  if(birthday==""){
		    document.getElementById("birthError").innerHTML="생일에 맞춰 특별 쿠폰을 보내드립니다. 생년월일을 입력해주세요.";
		    check = false;
		  }
		  else {
		    document.getElementById("birthError").innerHTML="";
		    check = true;
		  }			
		}
		
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
	    <input type="radio" name="it_radio" id="it_radio1" value="1" onclick="showCustomerForm()">
	    <label for="it_radio1"><span></span>고객 </label>  
	  </div>
	  <div class="radio_area">
	    <input type="radio" name="it_radio" id="it_radio2" value="1" onclick="showCompanyForm()">
	    <label for="it_radio2"><span></span>업체 </label>  
	  </div>   
	</div>

  <!-- 고객 회원가입 폼 (초기에는 숨김) -->
  <div id="customerForm" style="display:none;">   
   <div class="container h-100">
	    <div class="row h-100">
	      <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
	        <div class="d-table-cell align-middle">
	          <div class="card">
	            <div class="card-body">
	              <div class="m-sm-4 p-2">
	                <div class="mb-3"> 
	                <font color="red">*</font> 필수 입력 항목(고객)
	                </div>  
 										<form name="myform" method="post" action="#">
	                  <div class="form-group">
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
	                    <font color="red"><b>*&nbsp;</b></font><label>성명 (NAME)</label>
	                    <input type="text" class="form-control form-control-lg"  name="name" id="name" onchange="nameCheck()" placeholder="한글 또는 영문">
	                    <div id="nameError" class="text-primary"></div>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>닉네임 (NICKNAME)</label>
	                    <input type="text" class="form-control form-control-lg" name="nickName" id="nickName" placeholder="한글,영문 또는 특수문자">
	                    <span id="nickNameCheck"></span>
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
	                    <font color="red"><b>*&nbsp;</b></font><label>이메일<font color="#00bfff" style="font-size: 0.8em;">&nbsp;&nbsp;회원가입 후 이메일을 확인하여 인증을 완료해야 로그인이 가능합니다!</font></label>
	                    <input class="form-control form-control-lg" type="email" name="email" id="email" placeholder="이메일 형식에 맞춰 입력해주세요">
	                    <span id="emailCheck"><font color="red">&nbsp;이메일을 입력해주시기 바랍니다!</font></span>
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
	                  </div>
	                </form>
 								</div>
	            </div>
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
	      <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
	        <div class="d-table-cell align-middle">
	          <div class="card">
	            <div class="card-body">
	              <div class="m-sm-4">
	                <div class="mb-3">
	                  <font color="red">*</font> 필수 입력 항목(업체)
	                </div>
	                <form name="myform" method="post" action="/javaweb8J/JoinOk.kn_mem">
	                  <div class="form-group">
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
	                    <font color="red"><b>*&nbsp;</b></font><label>성명 (NAME)</label>
	                    <input type="text" class="form-control form-control-lg"  name="name" id="name" onchange="nameCheck()" placeholder="한글 또는 영문">
	                    <div id="nameError" class="text-primary"></div>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>닉네임 (NICKNAME)</label>
	                    <input type="text" class="form-control form-control-lg" name="nickName" id="nickName" placeholder="한글,영문 또는 특수문자">
	                    <span id="nickNameCheck"></span>
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
	                    <font color="red"><b>*&nbsp;</b></font><label>이메일<font color="#00bfff" style="font-size: 0.8em;">&nbsp;&nbsp;회원가입 후 이메일을 확인하여 인증을 완료해야 로그인이 가능합니다!</font></label>
	                    <input class="form-control form-control-lg" type="email" name="email" id="email" placeholder="이메일 형식에 맞춰 입력해주세요">
	                    <span id="emailCheck"><font color="red">&nbsp;이메일을 입력해주시기 바랍니다!</font></span>
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
	                  </div>
	                </form>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
</body>
</html>
