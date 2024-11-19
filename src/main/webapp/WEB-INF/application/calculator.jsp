<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>calculator.jsp</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
  <script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
	  body {
	    margin: 0;
	    padding: 0;
	    width: 100%;
	    font-family: 'Arial', sans-serif;
	    background-color: #f8f9fa;
	    color: #333;
	  }
	
	  .container {
	    padding-top: 3%;
	    width: 100%;
	    max-width: 1200px;
	    margin: 0 auto;
	  }
	
	  .step-title {
	    font-size: 24px;
	    font-weight: bold;
	    color: black;
	    margin-top: 30px;
	    margin-bottom: 15px;
	  }
	
	  .option-group {
	    margin-top: 20px;
	    padding: 15px;
	    background: #fff;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.05);
	  }
	
	  .option-group label {
	    font-size: 18px;
	    font-weight: bold;
	    color: #555;
	    display: block;
	    margin-bottom: 10px;
	  }
	
	  .btn-outline-primary {
	    border: 2px solid #007bff;
	    color: #007bff;
	    padding: 10px 20px;
	    font-size: 16px;
	    border-radius: 8px;
	    transition: all 0.3s ease;
	    font-weight: bold;
	  }
	
	  .btn-outline-primary:hover {
	    background-color: #007bff;
	    color: #fff;
	    border-color: #007bff;
	  }
	
	  .btn-outline-primary.active {
	    background-color: #0056b3;
	    color: #fff;
	    border-color: #0056b3;
	  }
	
	  .btn-estimate {
	    background-color: #007bff;
	    color: #fff;
	    border: none;
	    padding: 12px 20px;
	    font-size: 16px;
	    border-radius: 8px;
	    width: 100%;
	    font-weight: bold;
	    transition: background-color 0.3s ease;
	  }
	
	  .btn-estimate:hover {
	    background-color: #0056b3;
	  }
	
	  .estimate-sidebar {
	    border: 1px solid #ddd;
	    background: #fff;
	    padding: 20px;
	    margin-top: 80px;
	    border-radius: 8px;
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	    position: sticky;
	    top: 20px;
	  }
	
	  .estimate-sidebar h4 {
	    font-size: 22px;
	    font-weight: bold;
	    color: #333;
	  }
	
	  .estimate-sidebar p {
	    font-size: 16px;
	    color: #555;
	  }
	
	  .estimate-sidebar hr {
	    border-top: 1px solid #ddd;
	  }
	
	  .estimate-sidebar h5 {
	    font-size: 20px;
	    font-weight: bold;
	    color: #007bff;
	  }
	</style>
	<script>
	  let totalPrice = 0; // 총 가격 변수
	
	  document.addEventListener("DOMContentLoaded", () => {
	  const priceElement = document.getElementById("price");
	  let sizeMultiplier = 0; // 평수에 따른 곱하기 값
	  const groupButtons = document.querySelectorAll(".option-group button");
	  const totpriceField = document.getElementById("totprice");
	  const selectArea = document.getElementById("selectArea");
	  const form = document.getElementById("myform");
	
	  // 선택된 옵션 관리 객체
	  const selectedOptions = {};
	  
	  // 1. 모든 버튼에 이벤트 리스너 추가
	  groupButtons.forEach((button) => {
	    button.addEventListener("click", () => {
	    	event.preventDefault();
	    	
	      const groupName = button.getAttribute("name"); // 그룹명 가져오기
	      const buttonPrice = parseInt(button.getAttribute("data-price")) || 0;
	      const value = parseInt(button.getAttribute("value")) || 0;
	      
	      // 같은 그룹의 다른 버튼이 활성화되어 있다면 비활성화
	      document.querySelectorAll(`button[name="${groupName}"]`).forEach((btn) => btn.classList.remove("active"));
	      
	      // 버튼이 이미 선택된 경우
	      if (button.classList.contains("active")) {
	        // 1. 버튼 비활성화
	        button.classList.remove("active");
	
	        // 2. 선택된 옵션에서 제거
	        if (groupName === "size") {
	          sizeMultiplier = 0; // 평수 초기화
	        } else if (groupName in selectedOptions) {
	          totalPrice -= selectedOptions[groupName]+(selectedOptions[groupName] * sizeMultiplier);
	          delete selectedOptions[groupName];
	        }
	
	      } else {
	        // 현재 버튼 활성화
	        button.classList.add("active");
					
	        // 값 추가 또는 업데이트
	        if (groupName === "size") {
	          // 평수 계산
	          if (value === 20) sizeMultiplier = 0;
	          else if (value === 30) sizeMultiplier = 0.2;
	          else if (value === 40) sizeMultiplier = 0.5;
	          else if (value === 50) sizeMultiplier = 0.7;
	        } else {
	          // 다른 옵션 가격 업데이트
	          if (groupName in selectedOptions) {
	            totalPrice -= selectedOptions[groupName]+(selectedOptions[groupName] * sizeMultiplier);
	          }
	          selectedOptions[groupName] = buttonPrice;
	          totalPrice += buttonPrice+(buttonPrice * sizeMultiplier);
	        }
	      }
	
	      updatePrice(); // 총 가격 업데이트
	    });
	  });
	
	  // 3. 총 가격 업데이트
	  function updatePrice() {
	    priceElement.textContent = totalPrice.toFixed(0);
	    totpriceField.value = totalPrice.toFixed(0);
	    selectArea = myform.area.value;
	  }
	  
	  window.fCheck = () => {
	        form.submit(); // 폼 제출
	    };
	});
	  
	</script>
</head>
<body class="calculator">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div class="container">
		<form name="myform" id="myform" method="post" action="Application.ap">
	    <div class="row">
	      <div class="col-md-8">
	        <div class="step-title">Step 1: 기본 정보를 입력해주세요.</div>
	        <div class="option-group">
	          <label for="area">컨설팅 희망 공간</label>
	          <div class="d-flex">
	            <button name="area" id="area1" value="거실" class="btn btn-outline-primary me-2">거실</button>
	            <button name="area" id="area2" value="침실" class="btn btn-outline-primary me-2">침실</button>
	            <button name="area" id="area3" value="주방" class="btn btn-outline-primary me-2">주방</button>
	            <button name="area" id="area4" value="서재" class="btn btn-outline-primary me-2">서재</button>
	            <input type="hidden" name="selectArea" id="selectArea"/>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="size" class="form-label">평수 (공급면적)</label>
				    <div class="d-flex">
	            <button name="size" id="size2" value="20" class="btn btn-outline-primary me-2" data-price="0">20평</button>
	          	<button name="size" id="size3" value="30" class="btn btn-outline-primary me-2" data-price="0.2">30평</button>
	            <button name="size" id="size4" value="40" class="btn btn-outline-primary me-2" data-price="0.5">40평</button>
	            <button name="size" id="size5" value="50" class="btn btn-outline-primary me-2" data-price="0.7">50평 이상</button>
	          </div>
				  </div>
	        <div class="step-title">Step 2: 상세 공사 항목을 선택해주세요.</div>
	        <div class="option-group">
	          <label for="porch"><i class="fa-solid fa-door-open"></i>현관</label>
	          <div class="d-flex">
	            <button name="porch" id="porch1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="porch" id="porch2" value="Y" class="btn btn-outline-primary me-2" data-price="286">선택함</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="papering"><i class="fa-solid fa-paint-roller"></i>도배</label>
	          <div class="d-flex">
	            <button name="papering" id="papering1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="papering" id="papering2" value="Y" class="btn btn-outline-primary me-2" data-price="191">실크</button>
	            <button name="papering" id="papering3" value="Y" class="btn btn-outline-primary me-2" data-price="136">합지</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="floor"><i class="fa-regular fa-square"></i>바닥</label>
	          <div class="d-flex">
	            <button name="floor" id="floor1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="floor" id="floor2" value="Y" class="btn btn-outline-primary me-2" data-price="247">강마루</button>
	            <button name="floor" id="floor3" value="Y" class="btn btn-outline-primary me-2" data-price="100">장판</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="molding"><i class="fa-brands fa-codepen"></i>몰딩</label>
	          <div class="d-flex">
	            <button name="molding" id="molding1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="molding" id="molding2" value="Y" class="btn btn-outline-primary me-2" data-price="70">선택함</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="balcony"><i class="fa-solid fa-table-columns"></i>발코니</label>
	          <div class="d-flex">
	            <button name="balcony" id="balcony1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="balcony" id="balcony2" value="Y" class="btn btn-outline-primary me-2" data-price="632">전체</button>
	            <button name="balcony" id="balcony3" value="Y" class="btn btn-outline-primary me-2" data-price="752">전체+확장</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="kitchen"><i class="material-icons">kitchen</i>주방</label>
	          <div class="d-flex">
	            <button name="kitchen" id="kitchen1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="kitchen" id="kitchen2" value="Y" class="btn btn-outline-primary me-2" data-price="331">선택함</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="bathroom"><i class="fa-solid fa-bath"></i>욕실</label>
	          <div class="d-flex">
	            <button name="bathroom" id="bathroom1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="bathroom" id="bathroom2" value="Y" class="btn btn-outline-primary me-2" data-price="321">1개</button>
	            <button name="bathroom" id="bathroom3" value="Y" class="btn btn-outline-primary me-2" data-price="580">2개</button>
	            <button name="bathroom" id="bathroom4" value="Y" class="btn btn-outline-primary me-2" data-price="839">3개</button>
	          </div>
	        </div>
	        <div class="option-group">
	          <label for="door"><i class="fa-solid fa-door-closed fa-xl"></i>문</label>
	          <div class="d-flex">
	            <button name="door" value="N" id="door1" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
	            <button name="door" value="Y" id="door2" class="btn btn-outline-primary me-2" data-price="127">선택함</button>
	          </div>
	        </div>
	      </div>
	      <div class="col-md-4">
	        <div class="estimate-sidebar">
	          <h4>견적 계산기</h4>
	          <p>선택된 항목을 기준으로 견적을 계산합니다.</p>
	          <hr>
	          <h5>총 예상 견적: <span data-name="price" id="price">0</span> 만원</h5>
	          <input type="hidden" name="totprice" id="totprice"/>
	          <button class="btn-estimate w-100 mt-3" onclick="fCheck()">견적 신청</button>
	        </div>
	      </div>
	    </div>
    </form>
  </div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>