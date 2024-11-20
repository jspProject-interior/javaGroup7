<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <title>application.jsp</title>
	<style>
	body {
      font-family: Arial, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }
    #consultation-form {
      max-width: 800px;
      margin: 60px auto;
      background: #fff;
      padding: 50px 20px 20px 20px;
      
      
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    #consultation-form h2 {
      text-align: center;
      color: #007bff;
      margin-bottom: 20px;
    }
    #consultation-form .form-group {
      margin-bottom: 15px;
    }
    #consultation-form .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
      color: #333;
    }
    #consultation-form input,
    #consultation-form select,
    #consultation-form textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      font-size: 1rem;
      color: #333;
    }
    #consultation-form input[type="date"] {
      padding: 5px 10px;
    }
    #consultation-form input[type="submit"] {
      background-color: #007bff;
      color: white;
      border: none;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }
    #consultation-form input[type="submit"]:hover {
      background-color: #0056b3;
    }
    #consultation-form .sub-text {
      font-size: 0.85rem;
      color: #666;
    }
    
    h1 {
			text-align: center;
			color: #2c3e50;
			font-size: 28px;
			margin-bottom: 30px;
		}
	</style>
	<script>
	
	
		
	</script>

</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div id="consultation-form" class="container">
	<h1 style="font-family: 'EliceDigitalBaeum-Bd';">상담 신청서</h1>
	 <form method="POST" action="ApplicationOk.ap"> <!-- 제출 경로 설정 -->
      <!-- 회원 아이디 -->
      <div class="form-group">
        <label for="mid">회원 아이디</label>
        <input type="text" id="mid" name="mid" value="${sMid}" maxlength="20" readonly/>
      </div>
      <!-- 회원 성명 -->
      <div class="form-group">
        <label for="name">회원 성명</label>
        <input type="text" id="name" name="name" maxlength="10" value="${MemberVO.name}" >
      </div>
      <!-- 시공 주소 -->
      <div class="form-group">
      <label for="conAddress">시공 주소</label>
	      <div class="input-group-append mb-1">
	        <input type="text" name="postcode" id="sample6_postcode"  placeholder="우편번호" value="${address1}" class="form-control" style="width: 150px;" onclick="sample6_execDaumPostcode()" readonly>
	      </div>
	     	<div class="input-group">
	     		<input type="text" name="roadAddress" id="sample6_address" placeholder="   						===시공 받을 주소를 입력하시려면 이곳을 클릭하세요.=== " value="${address2}" class="form-control mb-1" onclick="sample6_execDaumPostcode()" readonly>
	     	</div>
	      <div class="input-group">
	        <div class="input-group-append" style="display: flex; width: 100%;">
	          <input type="text" name="extraAddress" id="sample6_extraAddress" placeholder="참고항목" value="${address4}" class="form-control" style="flex: 4;" onclick="sample6_execDaumPostcode()" readonly>
	        	<input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소" value="${address3}" class="form-control" style="flex: 6;">
	        </div>
	        <input type="hidden" id="conAddress" name="conAddress"/>
	      </div>
	    </div>
      <!-- 전화번호 -->
      <div class="form-group">
        <label for="tel">전화번호</label>
        <input type="tel" id="tel" name="tel" maxlength="15" value="${MemberVO.tel}" required placeholder="전화번호를 입력하세요 (예: 010-1234-5678)">
      </div>
      <!-- 컨설팅 희망 공간 -->
      <div class="form-group">
        <label for="area">컨설팅 희망 공간</label>
        <select id="area" name="area">
          <option value="N">선택안함</option>
          <option value="거실" ${vo.area == '거실' ? 'selected' : ''}>거실</option>
          <option value="침실" ${vo.area == '침실' ? 'selected' : ''}>침실</option>
          <option value="주방" ${vo.area == '주방' ? 'selected' : ''}>주방</option>
          <option value="서재" ${vo.area == '서재' ? 'selected' : ''}>서재</option>
        </select>
      </div>
      <!-- 선호하는 분위기 -->
      <div class="form-group">
        <label for="category">선호하는 분위기</label>
        <select id="category" name="category">
          <option value="">선택해주세요</option>
          <option value="모던">모던</option>
          <option value="클래식">클래식</option>
          <option value="빈티지">빈티지</option>
          <option value="북유럽">북유럽</option>
        </select>
      </div>
      <!-- 견적 가격 -->
      <div class="form-group">
        <label for="price">견적 가격</label>
        <input type="number" id="price" name="price" value="${vo.price}">
      </div>
      <!-- 예산 -->
      <div class="form-group">
        <label for="budget">예산</label>
        <input type="number" id="budget" name="budget" required placeholder="예산을 입력하세요 (만원 단위)">
      </div>
      <!-- 평수 -->
      <div class="form-group">
        <label for="size">평수</label>
        <input type="number" id="size" name="size" value="${vo.size}" required placeholder="평수를 입력하세요">
      </div>
      <!-- 시공 시작 희망일 -->
      <div class="form-group">
        <label for="conStartDay">시공 시작 희망일</label>
        <input type="date" id="conStartDay" name="conStartDay">
      </div>
      <!-- 제출 버튼 -->
      <div class="form-group">
        <input type="submit" value="상담 신청하기">
      </div>
    </form>
</div>	    
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>