<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="${ctp}/images/favicon.png">
	<title>회원가입 | 그린테리어</title>
	<jsp:include page="/include/bs4.jsp"/>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/font-applesdgothicneo@1.0.3/css/all.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <style>
	  body{
	      background-image: url("${ctp}/images/interior/modern/mordern1/1.jpg");
	  }
	  .card {
	      margin-bottom: 1.5rem;
	      box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
	  }
	
	  .card {
	      position: relative;
	      display: -ms-flexbox;
	      display: flex;
	      -ms-flex-direction: column;
	      flex-direction: column;
	      min-width: 0;
	      /*word-wrap: break-word;*/
	      background-color: #fff;
	      background-clip: border-box;
	      border: 1px solid #e5e9f2;
	      border-radius: .2rem;
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
        color: white; /* 기본 글자 색상 */
        text-decoration: none; /* 기본 밑줄 제거 */
      }
    .Logo:hover {
     	color: white; /* 기본 글자 색상 */
      text-decoration: none; /* 기본 밑줄 제거 */
    }
	</style>
</head>
<body>
<p><br/></p>
	<div><a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a></div>
	<div class="container h-100">
		<div class="row h-100">
		  <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
			  <div class="d-table-cell align-middle">
		      <div class="card">
			      <div class="card-body">
			        <div class="m-sm-4">
			          <div class="mb-3">
			            <font color="red">*</font> 필수 입력 항목
		            </div>
		            <form name="joinForm" method="post">
			            <div class="form-group">
			              <font color="red"><b>*&nbsp;</b></font><label>아이디 (ID)</label>
		                <input class="form-control form-control-lg" type="text" name="mid" id="mid">
		                <span id="midCheck"></span>
		          		</div>
                  <div class="form-group password">
                      <font color="red"><b>*&nbsp;</b></font><label class="password">비밀번호 (PASSWORD)</label> &nbsp; <span class="pwdEyes"><i class="fa fa-eye fa-lg"></i></span>
                      <input class="form-control form-control-lg" type="password" name="pwd" id="pwd">
                      <span id="pwdCheck"></span>
                  </div>
                  <div class="form-group passwordCheck">
                      <font color="red"><b>*&nbsp;</b></font><label>비밀번호 재확인 (PASSWORD CHECK)</label> &nbsp; <span class="rePwdEyes"><i class="fa fa-eye fa-lg"></i></span>
                      <input class="form-control form-control-lg" type="password" name="rePwd" id="rePwd">
                      <span id="rePwdCheck"></span>
                  </div>
                  <div class="form-group">
                      <font color="red"><b>*&nbsp;</b></font><label>닉네임 (NICKNAME)</label>
                      <input class="form-control form-control-lg" type="text" name="nickName" id="nickName">
                      <span id="nickNameCheck"></span>
                  </div>
                  <div class="form-group">
                      <font color="red"><b>*&nbsp;</b></font><label>성명 (NAME)</label>
                      <input class="form-control form-control-lg" type="text" name="name" id="name">
                      <span id="nameCheck"></span>
                  </div>
                  <div class="form-group">
                    <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
		                  <div class="input-group">
		                    <div class="input-group-append">
		                   		<input class="form-control form-control-lg" type="text" name="tel1" id="tel1" value="010" readonly="">
		                      <input class="form-control form-control-lg" type="text" name="tel2" id="tel2">
		                      <input class="form-control form-control-lg" type="text" name="tel3" id="tel3">
		                    </div>
		                  </div>
                    <span id="telCheck"></span>
                  </div>
                  <div class="form-group">
                  	<font color="red"><b>*&nbsp;</b></font><label>이메일<font color="#00bfff" style="font-size: 0.8em;">&nbsp;&nbsp;회원가입 후 이메일을 확인하여 인증을 완료해야 로그인이 가능합니다!</font></label>
						        <input class="form-control form-control-lg" type="email" name="email" id="email">
   								  <span id="emailCheck"></span>
									</div>
									<div class="form-group">
									    <label>주소</label>
									    <input class="btn btn-primary text-right float-right" type="button" value="주소 찾기" onclick="sample6_execDaumPostcode()">
									</div>
									<div id="homeAddressInput">
									    <div class="form-group">
									        <label>우편번호</label>
									        <div class="input-group">
									            <input class="form-control form-control-lg" type="text" name="postcode" id="sample6_postcode" readonly="">
									        </div>
									    </div>
									    <div class="form-group">
									        <label>도로명 주소 / 지번 주소</label>
									        <input class="form-control form-control-lg" type="text" name="roadAddress" id="sample6_address" readonly="">
									        <div class="valid-feedback"></div>
									        <div class="invalid-feedback">필수 입력 항목입니다.</div>
									    </div>
									    <div class="form-group">
									        <label>상세 주소</label>
									        <input class="form-control form-control-lg" type="text" name="detailAddress" id="sample6_detailAddress">
									    </div>
									    <div class="form-group">
									        <label>참고 항목</label>
									        <input class="form-control form-control-lg" type="text" name="extraAddress" id="sample6_extraAddress" readonly="">
									    </div>
									</div>
											<p><br></p>
											<div class="text-center mt-3">
											    <input type="button" value="회원가입" class="form-control btn btn-lg btn-primary" onclick="joinCheck()">
											<!-- <button type="submit" class="btn btn-lg btn-primary">Sign up</button> -->
	                    </div>
	                    <input type="hidden" name="address" id="address">
	                    <input type="hidden" name="phoneNum" id="phoneNum">
                    </form>
                </div>
            </div>
        </div>
    </div>
  </div>
</div>
</div>
<p><br/></p>
</body>
</html>