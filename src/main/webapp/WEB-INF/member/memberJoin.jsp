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
  
  <!-- Bootstrap 4 CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  
  <!-- jQuery, Popper.js, Bootstrap JS -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

  <style>
    body {
      background-image: url("${ctp}/images/interior/modern/mordern1/1.jpg");
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
    
    /* 선택 버튼 스타일 */
    .selection-buttons {
      text-align: center;
      margin: 20px 0;
    }
  </style>
  
  <script>
  // 정규식 검사 함수
  function validateForm() {
    var valid = true;

    // 아이디 유효성 검사 (영문, 숫자 4-12자)
    var mid = document.getElementById('mid').value;
    var midPattern = /^[a-zA-Z0-9]{4,12}$/;
    
    if (!midPattern.test(mid)) {
      document.getElementById('midCheck').style.display = 'inline';
      valid = false;
    } else {
      document.getElementById('midCheck').style.display = 'none';
    }

    // 비밀번호 유효성 검사 (8-16자, 영문 대소문자, 숫자, 특수문자 포함)
    var pwd = document.getElementById('pwd').value;
    var pwdPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,16}$/;
    if (!pwdPattern.test(pwd)) {
      document.getElementById('pwdCheck').style.display = 'inline';
      valid = false;
    } else {
      document.getElementById('pwdCheck').style.display = 'none';
    }

    // 비밀번호 재확인
    var rePwd = document.getElementById('rePwd').value;
    if (pwd !== rePwd) {
      document.getElementById('rePwdCheck').style.display = 'inline';
      valid = false;
    } else {
      document.getElementById('rePwdCheck').style.display = 'none';
    }

    // 전화번호 유효성 검사 (010-xxxx-xxxx)
    var tel2 = document.getElementById('tel2').value;
    var tel3 = document.getElementById('tel3').value;
    var telPattern = /^[0-9]{4}$/;
    if (!telPattern.test(tel2) || !telPattern.test(tel3)) {
      document.getElementById('telCheck').style.display = 'inline';
      valid = false;
    } else {
      document.getElementById('telCheck').style.display = 'none';
    }

    // 이메일 유효성 검사
    var email = document.getElementById('email').value;
    var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    if (!emailPattern.test(email)) {
      document.getElementById('emailCheck').style.display = 'inline';
      valid = false;
    } else {
      document.getElementById('emailCheck').style.display = 'none';
    }

    return valid;
  }

  function joinCheck() {
    if (validateForm()) {
      document.joinForm.submit();
    }
  }
  
  function showCustomerForm() {
	    document.getElementById('customerForm').style.display = 'block';  // 고객 폼 보이기
	    document.getElementById('companyForm').style.display = 'none';    // 업체 폼 숨기기 (추가할 경우)
	  }

	  function showCompanyForm() {
	    document.getElementById('companyForm').style.display = 'block';   // 업체 폼 보이기
	    document.getElementById('customerForm').style.display = 'none';   // 고객 폼 숨기기 (추가할 경우)
	  }
</script>
</head>
<body>
  <p><br/></p>
  <div><a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a></div>
  <!-- 업체와 고객 선택 버튼 -->
  <div class="selection-buttons">
    <button class="btn btn-primary" onclick="showCustomerForm()">고객</button>
    <button class="btn btn-secondary" onclick="showCompanyForm()">업체</button>
  </div>

  <!-- 고객 회원가입 폼 (초기에는 숨김) -->
  <div id="customerForm" style="display:none;">
	  <div class="container h-100">
	    <div class="row h-100">
	      <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
	        <div class="d-table-cell align-middle">
	          <div class="card">
	            <div class="card-body">
	              <div class="m-sm-4">
	                <div class="mb-3">
	                  <font color="red">*</font> 필수 입력 항목(고객)
	                </div>
	                <form name="joinForm" method="post">
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>아이디 (ID)</label>
	                    <input class="form-control form-control-lg" type="text" name="mid" id="mid" placeholder="영문과 숫자를 포함한 4-12자 이내">
	                    <span id="midCheck"><font color="red">&nbsp;아이디 형식을 확인해주시기 바랍니다!</font></span>
	                  </div>
	                  <div class="form-group password">
	                    <font color="red"><b>*&nbsp;</b></font><label class="password">비밀번호 (PASSWORD)</label> &nbsp; <span class="pwdEyes"><i class="fa fa-eye fa-lg"></i></span>
	                    <input class="form-control form-control-lg" type="password" name="pwd" id="pwd" placeholder="특수문자, 영문 대소문자, 숫자를 포함한 8-16자 이내">
	                    <span id="pwdCheck"><font color="red">&nbsp;8~16자 영문 대 소문자, 숫자, 특수문자 (키보드 0~9)를 사용하세요.</font></span>
	                  </div>
	                  <div class="form-group passwordCheck">
	                    <font color="red"><b>*&nbsp;</b></font><label>비밀번호 재확인 (PASSWORD CHECK)</label> &nbsp; <span class="rePwdEyes"><i class="fa fa-eye fa-lg"></i></span>
	                    <input class="form-control form-control-lg" type="password" name="rePwd" id="rePwd" placeholder="비밀번호 재확인">
	                    <span id="rePwdCheck"><font color="red">&nbsp;입력하신 비밀번호와 일치하지 않습니다!</font></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>성명 (NAME)</label>
	                    <input class="form-control form-control-lg" type="text" name="name" id="name" placeholder="한글 또는 영문">
	                    <span id="nameCheck"></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>닉네임 (NICKNAME)</label>
	                    <input class="form-control form-control-lg" type="text" name="nickName" id="nickName" placeholder="한글,영문 또는 특수문자">
	                    <span id="nickNameCheck"></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
	                    <div class="input-group">
	                      <div class="input-group-append">
	                        <input class="form-control form-control-lg" type="text" name="tel1" id="tel1" value="010" readonly=""/>
	                        <input class="form-control form-control-lg" type="text" name="tel2" id="tel2" placeholder="가운데 4자리"/>
	                        <input class="form-control form-control-lg" type="text" name="tel3" id="tel3" placeholder="마지막 4자리"/>
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
	                <form name="joinForm" method="post">
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>아이디 (ID)</label>
	                    <input class="form-control form-control-lg" type="text" name="mid" id="mid" placeholder="영문과 숫자를 포함한 4-12자 이내">
	                    <span id="midCheck"><font color="red">&nbsp;아이디 형식을 확인해주시기 바랍니다!</font></span>
	                  </div>
	                  <div class="form-group password">
	                    <font color="red"><b>*&nbsp;</b></font><label class="password">비밀번호 (PASSWORD)</label> &nbsp; <span class="pwdEyes"><i class="fa fa-eye fa-lg"></i></span>
	                    <input class="form-control form-control-lg" type="password" name="pwd" id="pwd" placeholder="특수문자, 영문 대소문자, 숫자를 포함한 8-16자 이내">
	                    <span id="pwdCheck"><font color="red">&nbsp;8~16자 영문 대 소문자, 숫자, 특수문자 (키보드 0~9)를 사용하세요.</font></span>
	                  </div>
	                  <div class="form-group passwordCheck">
	                    <font color="red"><b>*&nbsp;</b></font><label>비밀번호 재확인 (PASSWORD CHECK)</label> &nbsp; <span class="rePwdEyes"><i class="fa fa-eye fa-lg"></i></span>
	                    <input class="form-control form-control-lg" type="password" name="rePwd" id="rePwd" placeholder="비밀번호 재확인">
	                    <span id="rePwdCheck"><font color="red">&nbsp;입력하신 비밀번호와 일치하지 않습니다!</font></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>성명 (NAME)</label>
	                    <input class="form-control form-control-lg" type="text" name="name" id="name" placeholder="한글 또는 영문">
	                    <span id="nameCheck"></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>닉네임 (NICKNAME)</label>
	                    <input class="form-control form-control-lg" type="text" name="nickName" id="nickName" placeholder="한글,영문 또는 특수문자">
	                    <span id="nickNameCheck"></span>
	                  </div>
	                  <div class="form-group">
	                    <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
	                    <div class="input-group">
	                      <div class="input-group-append">
	                        <input class="form-control form-control-lg" type="text" name="tel1" id="tel1" value="010" readonly=""/>
	                        <input class="form-control form-control-lg" type="text" name="tel2" id="tel2" placeholder="가운데 4자리"/>
	                        <input class="form-control form-control-lg" type="text" name="tel3" id="tel3" placeholder="마지막 4자리"/>
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
