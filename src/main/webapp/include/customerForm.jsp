<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
</head>
<body>
  <div class="container h-100">
			<div class="card" style="width: 72%;">
			  <div class="card-body">
			    <div class="m-sm-4 p-3">
			      <div class="mb-3"> <font color="red">*</font> 필수 입력 항목(고객)</div>  
			      <div class="form-group">
			        <font color="red"><b>*&nbsp;</b></font><label for="mid" class="m-0 p-0">아이디 (ID)</label>
			        <input type="button" value="아이디 중복체크" id="idCheckBtn" class="btn text-right float-right mb-1" onclick="idCheck()"/>
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
	            <font color="red"><b>*&nbsp;</b></font><label>주민등록번호 (RESIDENT)</label>
	             <div class="input-group">
	              <div class="input-group-append" style="display: flex; width: 100%;">
			            <input type="text" class="form-control form-control-lg" name="birthday" id="birthday" maxlength="6" onkeyup="birthdayCheck()"  placeholder="주민등록번호 앞 6자리만">
			            <input type="text" class="form-control form-control-lg" name="gender" id="gender" maxlength="1" onkeyup="genderCheck()"  placeholder="주민등록번호 뒤 1자리만">
									<input type="hidden" name="resident" id="resident"/>	  
								</div> 
	            	<div id="residentError" class="text-primary"></div>
							</div>         
	          </div>
	          <div class="form-group">
	            <font color="red"><b>*&nbsp;</b></font><label>전화번호</label>
	            <div class="input-group">
	              <div class="input-group-append" style="display: flex; width: 100%;">
	                <select name="tel1" name="tel1" id="tel1" class="form-control" style="flex: 2;">
			              <option value="010" selected>010</option>
			              <option value="02">02</option>
					          <option value="032">032</option>
					          <option value="033">033</option>
					          <option value="041">041</option>
					          <option value="042">042</option>
					          <option value="043">043</option>
			            </select>
	                <input type="text" class="form-control form-control-lg" name="tel2" id="tel2" maxlength="4" onkeyup="telCheck()" placeholder="가운데 자리" style="flex: 4;"/>
	                <input type="text" class="form-control form-control-lg" name="tel3" id="tel3" maxlength="4" onkeyup="telCheck()" placeholder="마지막 자리" style="flex: 4;"/>
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
</body>
</html>