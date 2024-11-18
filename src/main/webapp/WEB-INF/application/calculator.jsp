<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>calculator.jsp</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
  <script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
	<jsp:include page="/include/bs4.jsp"/>
	<style>
		body {
			margin: 0;
			padding: 0;
			width: 100%;
			font-family: Arial, sans-serif;
	    background-color: #f8f9fa;
		}
		.container{
			padding-top: 3%;
			width: 100%;
		}
		.step-title {
	      font-size: 20px;
	      font-weight: bold;
	      margin-top: 30px;
	    }
	
	    .option-group {
	      margin-top: 15px;
	    }
	
	    .estimate-sidebar {
	      border: 1px solid #ddd;
	      background: #fff;
	      padding: 15px;
	      border-radius: 8px;
	      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
	      position: sticky;
	      top: 20px;
	    }
	
	    .btn-estimate {
	      background-color: #007bff;
	      color: #fff;
	      border: none;
	      padding: 10px 20px;
	      border-radius: 5px;
	    }
	
	    .btn-estimate:hover {
	      background-color: #0056b3;
	    }
	
	    .form-group {
	      margin-bottom: 20px;
	    }
	    
	    /*평수*/
	        .unit-converter {
	      display: flex;
	      align-items: center;
	      font-size: 16px;
	    }
	
	    .unit-converter input {
	      width: 80px;
	      margin-right: 10px;
	      text-align: center;
	    }
	
	    .unit-converter span {
	      margin-left: 10px;
	      font-size: 16px;
	    }
	
	    .unit-buttons {
	      margin-left: 10px;
	    }
	
	    .unit-buttons button {
	      border: 1px solid #ccc;
	      background: #f8f9fa;
	      color: #000;
	      padding: 5px 10px;
	      font-size: 14px;
	      cursor: pointer;
	      border-radius: 5px;
	      transition: background-color 0.3s ease;
	    }
	
	    .unit-buttons button.active {
	      background: #007bff;
	      color: #fff;
	      border-color: #007bff;
	    }
	
	    .unit-buttons button:hover {
	      background: #0056b3;
	      color: #fff;
	      border-color: #0056b3;
	    }
	</style>
	<script>
	  
</script>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<p><br/></p>
	<div class="container">
    <!-- Main Content -->
    <div class="row">
      <!-- Left Section -->
      <div class="col-md-8">
        <!-- Step 1 -->
        <div class="step-title">Step 1: 기본 정보를 입력해주세요.</div>
        <div class="option-group">
          <label for="area">컨설팅 희망 공간</label>
          <div class="d-flex">
            <button name="area" id="area1" value="거실" class="btn btn-outline-primary me-2">거실</button>
            <button name="area" id="area2" value="침실" class="btn btn-outline-primary me-2">침실</button>
            <button name="area" id="area3" value="주방" class="btn btn-outline-primary me-2">주방</button>
            <button name="area" id="area4" value="서재" class="btn btn-outline-primary me-2">서재</button>
          </div>
        </div>
        <div class="option-group">
          <label for="size" class="form-label">평수 (공급면적)</label>
			    <div class="d-flex">
            <button name="size" id="size1" value="20" class="btn btn-outline-primary me-2">20평</button>
          	<button name="size" id="size2" value="30" class="btn btn-outline-primary me-2">30평</button>
            <button name="size" id="size3" value="40" class="btn btn-outline-primary me-2">40평</button>
            <button name="size" id="size4" value="50" class="btn btn-outline-primary me-2">50평 이상</button>
          </div>
			  </div>

        <!-- Step 2 -->
        <div class="step-title">Step 2: 상세 공사 항목을 선택해주세요.</div>
        <div class="option-group">
          <label for="porch"><i class="fa-solid fa-door-open fa-xl" style="color: #74C0FC;"></i>현관</label>
          <div class="d-flex">
            <button name="porch" id="porch1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="porch" id="porch2" value="Y" class="btn btn-outline-primary me-2" data-price="286">선택함</button>
          </div>
        </div>
        <div class="option-group">
          <label for="papering">도배</label>
          <div class="d-flex">
            <button name="papering" id="papering1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="papering" id="papering2" value="Y" class="btn btn-outline-primary me-2" data-price="191">실크</button>
            <button name="papering" id="papering3" value="Y" class="btn btn-outline-primary me-2" data-price="136">합지</button>
          </div>
        </div>
        <div class="option-group">
          <label for="floor">바닥</label>
          <div class="d-flex">
            <button name="floor" id="floor1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="floor" id="floor2" value="Y" class="btn btn-outline-primary me-2" data-price="247">강마루</button>
            <button name="floor" id="floor3" value="Y" class="btn btn-outline-primary me-2" data-price="100">장판</button>
          </div>
        </div>
        <div class="option-group">
          <label for="molding">몰딩</label>
          <div class="d-flex">
            <button name="molding" id="molding1" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="molding" id="molding2" value="Y" class="btn btn-outline-primary me-2" data-price="70">선택함</button>
          </div>
        </div>
        <div class="option-group">
          <label for="balcony">발코니</label>
          <div class="d-flex">
            <button name="balcony" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="balcony" value="Y" class="btn btn-outline-primary me-2" data-price="632">전체</button>
            <button name="balcony" value="Y" class="btn btn-outline-primary me-2" data-price="752">전체+확장</button>
          </div>
        </div>
        <div class="option-group">
          <label for="kitchen">주방</label>
          <div class="d-flex">
            <button name="kitchen" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="kitchen" value="Y" class="btn btn-outline-primary me-2" data-price="331">선택함</button>
          </div>
        </div>
        <div class="option-group">
          <label for="bathroom">욕실</label>
          <div class="d-flex">
            <button name="bathroom" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="bathroom" value="Y" class="btn btn-outline-primary me-2" data-price="321">1개</button>
            <button name="bathroom" value="Y" class="btn btn-outline-primary me-2" data-price="580">2개</button>
            <button name="bathroom" value="Y" class="btn btn-outline-primary me-2" data-price="839">3개</button>
          </div>
        </div>
        <div class="option-group">
          <label for="door">문</label>
          <div class="d-flex">
            <button name="door" value="N" class="btn btn-outline-primary me-2" data-price="0">선택안함</button>
            <button name="door" value="Y" class="btn btn-outline-primary me-2" data-price="127">선택함</button>
          </div>
        </div>
       

        <!-- Add more sections as needed -->
      </div>

      <!-- Right Sidebar -->
      <div class="col-md-4">
        <div class="estimate-sidebar">
          <h4>견적 계산기</h4>
          <p>선택된 항목을 기준으로 견적을 계산합니다.</p>
          <hr>
          <h5>총 예상 견적: <span name="price" id="price">0</span> 만원</h5>
          <button class="btn-estimate w-100 mt-3">견적 신청</button>
        </div>
      </div>
      
    </div>
  </div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>