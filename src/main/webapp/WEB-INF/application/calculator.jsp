<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
  <title>calculator.jsp</title>
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
	    padding-top: 10%;
	    width: 100%;
	    max-width: 1200px;
	    margin: 0 auto;
	  }
	  
	  .button-group {
		  display: flex;
		  gap: 10px;
		}
		
		.btn {
		  padding: 10px 20px;
		  border: 1px solid #ccc;
		  background-color: #f0f0f0;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.btn.active {
		  background-color: #007bff;
		  color: white;
		  border-color: #007bff;
		}
		
		.btn:not(.active) {
		  opacity: 0.6;
		}
		
		.strBtn {
		  padding: 10px 20px;
		  border: 1px solid #ccc;
		  background-color: #f0f0f0;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.strBtn.active {
		  background-color: #007bff;
		  color: white;
		  border-color: #007bff;
		}
		
		.strBtn:not(.active) {
		  opacity: 0.6;
		}
	</style>
	<script>
	  let totalPrice = 0; // 총 가격 변수
	
	  document.addEventListener('DOMContentLoaded', () => {
		  const buttonGroups = document.querySelectorAll('.button-group');

		  let lastSelectedValues = {}; // 각 그룹의 마지막 선택 값을 저장
		  let sizeMul = 0; // 초기 sizeMul 값
		  let basePrice = 0; // sizeMul 적용 전의 기본 총합

		  buttonGroups.forEach(group => {
		    group.addEventListener('click', (event) => {
		      if (event.target.tagName === 'BUTTON') {
		        const clickedButton = event.target;
		        const groupName = clickedButton.getAttribute("name");
		        const value1 = clickedButton.dataset.value1;
		        const value2 = Number(clickedButton.dataset.value2);

		        // 중복 클릭 방지
		        if (clickedButton.classList.contains('disabled')) {
		          return; // 이미 선택된 버튼은 무시
		        }

		        // 기존 선택 값을 basePrice에서 제거
		        if (lastSelectedValues[groupName]) {
		          basePrice -= lastSelectedValues[groupName];
		        }

		        // 그룹별 로직
		        if (groupName === "size") {
		          // sizeMul 값 설정
		          if (value1 === "20") sizeMul = 0;
		          else if (value1 === "30") sizeMul = 0.3;
		          else if (value1 === "40") sizeMul = 0.5;
		          else if (value1 === "50") sizeMul = 0.7;

		          // size는 basePrice에 직접 영향을 주지 않음
		          lastSelectedValues[groupName] = 0; // size는 금액이 없으므로 0으로 저장
		        } else {
		          // 다른 그룹은 basePrice에 값을 추가
		          basePrice += value2; // 새 값을 추가
		          lastSelectedValues[groupName] = value2; // 새 값을 저장
		        }

		        // totalPrice 재계산: sizeMul을 적용
		        totalPrice = basePrice + (basePrice * sizeMul);

		        console.log("groupName:", groupName);
		        console.log("sizeMul:", sizeMul);
		        console.log("value2:", value2);
		        console.log("basePrice:", basePrice);
		        console.log("totalPrice:", totalPrice);

		        // 버튼 상태 업데이트
		        group.querySelectorAll('button').forEach(button => {
		          button.classList.remove('active', 'disabled');
		        });
		        clickedButton.classList.add('active', 'disabled');

		        // 총 가격 업데이트
		        document.getElementById('price').innerText = totalPrice.toFixed(0);
		        document.getElementById('totprice').value = totalPrice.toFixed(0);
		      }
		    });
		  });
		});
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div class="container">
		<form name="myform" id="myform" method="post" action="Application.ap">
	    <div class="row">
	      <div class="col-md-8">
	        <div class="step-title">Step 1: 기본 정보를 입력해주세요.</div>
	        <div class="button-group">
	          <div>컨설팅 희망 공간</div>
	            <button type="button" class="btn" name="area" id="area1" data-value1="거실" data-value2="0">거실</button>
	            <button type="button" class="btn" name="area" id="area2" data-value1="침실" data-value2="0">침실</button>
	            <button type="button" class="btn" name="area" id="area3" data-value1="주방" data-value2="0">주방</button>
	            <button type="button" class="btn" name="area" id="area4" data-value1="서재" data-value2="0">서재</button>
	        </div>
	        <div class="button-group">
	          <div>평수 (공급면적)</div>
	            <button type="button" class="btn" name="size" id="size2" data-value1="20" data-value2="0">20평</button>
	          	<button type="button" class="btn" name="size" id="size3" data-value1="30" data-value2="0">30평</button>
	            <button type="button" class="btn" name="size" id="size4" data-value1="40" data-value2="0">40평</button>
	            <button type="button" class="btn" name="size" id="size5" data-value1="50" data-value2="0">50평</button>
				  </div>
	        <div class="step-title">Step 2: 상세 공사 항목을 선택해주세요.</div>
	        <div class="button-group">
	          <div><i class="fa-solid fa-door-open"></i>현관</div>
	            <button type="button" class="btn" name="porch" id="porch1" data-value1="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="porch" id="porch2" data-value1="Y" data-value2="286">선택함</button>
	        </div>
	        <div class="button-group">
	          <div><i class="fa-solid fa-paint-roller"></i>도배</div>
	            <button type="button" class="btn" name="papering" id="papering1" data-value1="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="papering" id="papering2" data-value1="실크" data-value2="191">실크</button>
	            <button type="button" class="btn" name="papering" id="papering3" data-value1="합지" data-value2="136">합지</button>
	        </div>
	        <div class="button-group">
	          <div><i class="fa-regular fa-square"></i>바닥</div>
	            <button type="button" class="btn" name="floor" id="floor1" data-value1="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="floor" id="floor2" data-value1="강마루" data-value2="247">강마루</button>
	            <button type="button" class="btn" name="floor" id="floor3" data-value1="장판" data-value2="100">장판</button>
	        </div>
	        <div class="button-group">
	          <div><i class="fa-brands fa-codepen"></i>몰딩</div>
	            <button type="button" class="btn" name="molding" id="molding1" data-value="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="molding" id="molding2" data-value="Y" data-value2="70">선택함</button>
	        </div>
	        <div class="button-group">
	          <div><i class="fa-solid fa-table-columns"></i>발코니</div>
	            <button type="button" class="btn" name="balcony" id="balcony1" data-value="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="balcony" id="balcony2" data-value="전체" data-value2="632">전체</button>
	            <button type="button" class="btn" name="balcony" id="balcony3" data-value="전체+확장" data-value2="752">전체+확장</button>
	        </div>
	        <div class="button-group">
	          <div><i class="material-icons">kitchen</i>주방</div>
	            <button type="button" class="btn" name="kitchen" id="kitchen1" data-value="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="kitchen" id="kitchen2" data-value="Y" data-value2="331">선택함</button>
	        </div>
	        <div class="button-group">
	          <div><i class="fa-solid fa-bath"></i>욕실</div>
	            <button type="button" class="btn" name="bathroom" id="bathroom1" data-value="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="bathroom" id="bathroom2" data-value="Y" data-value2="321">1개</button>
	            <button type="button" class="btn" name="bathroom" id="bathroom3" data-value="Y" data-value2="580">2개</button>
	            <button type="button" class="btn" name="bathroom" id="bathroom4" data-value="Y" data-value2="839">3개</button>
	        </div>
	        <div class="button-group">
	          <div><i class="fa-solid fa-door-closed fa-xl"></i>문</div>
	            <button type="button" class="btn" name="door" id="door1" data-value="N" data-value2="0">선택안함</button>
	            <button type="button" class="btn" name="door" id="door2" data-value="Y" data-value2="127">선택함</button>
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