<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>calculator.jsp</title>
	<style>
	  body.calculator {
	    margin: 0;
	    padding: 0;
	    width: 100%;
	    font-family: 'Arial', sans-serif;
	    background-color: #f9f9f9;
	    color: #333;
	  }
	
	  body.calculator .container {
	    padding-top: 3%;
	    width: 100%;
	    margin: 0 auto;
	  }
	  
	  body.calculator  .step-title {
	    font-size: 1.2rem;
	    font-weight: bold;
	    margin: 10px 0;
	    color: #555;
	  }
	 
	  body.calculator .button-group {
		  margin-bottom: 10px;
		}
		body.calculator .button-group div {
	    margin-bottom: 10px;
	    font-weight: bold;
	    color: #444;
	  }
	  
	  body.calculator .container .row {
		  margin-bottom: 20px; /* Step1, Step2와 계산기 사이 간격 조정 */
		}
		
		body.calculator .btn {
	    padding: 12px 20px;
	    border: none;
	    background-color: #e9ecef;
	    color: #333;
	    cursor: pointer;
	    transition: all 0.3s ease;
	    border-radius: 5px;
	    margin-right: 10px;
	  }
		body.calculator .btn:hover {
	    background-color: #ced4da;
	  }
	  body.calculator .btn.active {
	    background-color: #007bff;
	    color: white;
	  }
	  body.calculator .estimate-sidebar {
	    background: #ffffff;
	    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	    padding: 20px;
	    border-radius: 8px;
	    margin-top: 20px;
	  }
	  body.calculator .estimate-sidebar h4 {
	    color: #007bff;
	    font-weight: bold;
	  }
	  body.calculator .btn-estimate {
	    background-color: #007bff;
	    color: white;
	    border: none;
	    padding: 15px;
	    border-radius: 5px;
	    font-size: 1rem;
	    cursor: pointer;
	  }
	  body.calculator .btn-estimate:hover {
	    background-color: #0056b3;
	  }
	  body.calculator hr {
	    border: 0;
	    border-top: 1px solid #e0e0e0;
	    margin: 20px 0;
	  }
		
		body.calculator .i {
		  display: inline-flex; /* 아이콘을 가운데 정렬 */
		  justify-content: center;
		  align-items: center;
		  width: 60px; /* 박스 너비 */
		  height: 60px; /* 박스 높이 */
		  border: 1px solid #ddd; /* 테두리 색상 */
		  border-radius: 8px; /* 둥근 모서리 */
		  background-color: #fff; /* 배경색 */
		  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* 약간의 그림자 */
		  font-size: 24px; /* 아이콘 크기 */
		  color: #007bff; /* 아이콘 색상 */
		}
		
	</style>
<script>
  let totalPrice = 0; // 총 가격 변수

  document.addEventListener('DOMContentLoaded', () => {
    const buttonGroups = document.querySelectorAll('.button-group');

    let lastSelectedValues = {}; // 각 그룹의 마지막 선택 값을 저장
    let sizeMul = 0; // 초기 sizeMul 값
    let basePrice = 0; // sizeMul 적용 전의 기본 총합
    let selectedArea = "";
    let selectedSize = "";

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
            selectedSize = value1;
            // sizeMul 값 설정
            if (value1 === "20") sizeMul = 0;
            else if (value1 === "30") sizeMul = 0.3;
            else if (value1 === "40") sizeMul = 0.5;
            else if (value1 === "50") sizeMul = 0.7;

            // size는 basePrice에 직접 영향을 주지 않음
            lastSelectedValues[groupName] = 0; // size는 금액이 없으므로 0으로 저장
          } else if (groupName === "area") {
            selectedArea = value1;
          } else {
            // 다른 그룹은 basePrice에 값을 추가
            basePrice += value2; // 새 값을 추가
            lastSelectedValues[groupName] = value2; // 새 값을 저장
          }

          // totalPrice 재계산: sizeMul을 적용
          totalPrice = basePrice + (basePrice * sizeMul);

          // 버튼 상태 업데이트
          group.querySelectorAll('button').forEach(button => {
            button.classList.remove('active', 'disabled');
          });
          clickedButton.classList.add('active', 'disabled');

          // 총 가격 업데이트
          document.getElementById('price').innerText = totalPrice.toFixed(0);
          document.getElementById('totprice').value = totalPrice.toFixed(0);
        }
        document.getElementById('selectArea').value = selectedArea;
        document.getElementById('selectSize').value = selectedSize;
      });
    });
  });

  // 전역 범위에서 fCheck 정의
  window.fCheck = () => {
    const selectedSize = document.getElementById('selectSize').value;
    if (selectedSize === "" || selectedSize === null) {
      alert("평수를 선택해주세요.");
      return false;
    }
    document.getElementById('selectSize').value = selectedSize;
    document.forms['myform'].submit(); // 폼 제출
  };
</script>

</head>
<body class="calculator" oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
	<div class="calculator container">
		<form name="myform" id="myform" method="post" action="Application.ap">
	    <div class="row">
	      <div class="col-md-8">
				<hr/>  
	        <div class="step-title">Step 1 <br/> 기본 정보를 입력해주세요.</div>
				<hr/>  
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
				 </div> 
				</div>
				<div class="row">
	      	<div class="col-md-8">  
				<hr/>  
		        <div class="step-title">Step 2 <br/> 상세 공사 항목을 선택해주세요.</div>
				<hr/>  
		        <div class="button-group">
		          <div><i class="fa-solid fa-door-open fa-2x"></i><font size="4em">&nbsp;&nbsp; 현관</font></div>
		            <button type="button" class="btn" name="porch" id="porch1" data-value1="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="porch" id="porch2" data-value1="Y" data-value2="286">선택함</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-solid fa-paint-roller fa-2x"></i><font size="4em">&nbsp;&nbsp; 도배</font></div>
		            <button type="button" class="btn" name="papering" id="papering1" data-value1="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="papering" id="papering2" data-value1="실크" data-value2="191">실크</button>
		            <button type="button" class="btn" name="papering" id="papering3" data-value1="합지" data-value2="136">합지</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-regular fa-square fa-2x"></i><font size="4em">&nbsp;&nbsp; 바닥</font></div>
		            <button type="button" class="btn" name="floor" id="floor1" data-value1="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="floor" id="floor2" data-value1="강마루" data-value2="247">강마루</button>
		            <button type="button" class="btn" name="floor" id="floor3" data-value1="장판" data-value2="100">장판</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-brands fa-codepen fa-2x"></i><font size="4em">&nbsp;&nbsp; 몰딩</font></div>
		            <button type="button" class="btn" name="molding" id="molding1" data-value="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="molding" id="molding2" data-value="Y" data-value2="70">선택함</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-solid fa-table-columns fa-2x"></i><font size="4em">&nbsp;&nbsp; 발코니</font></div>
		            <button type="button" class="btn" name="balcony" id="balcony1" data-value="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="balcony" id="balcony2" data-value="전체" data-value2="632">전체</button>
		            <button type="button" class="btn" name="balcony" id="balcony3" data-value="전체+확장" data-value2="752">전체+확장</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-solid fa-utensils fa-2x"></i><font size="4em">&nbsp;&nbsp; 주방</font></div>
		            <button type="button" class="btn" name="kitchen" id="kitchen1" data-value="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="kitchen" id="kitchen2" data-value="Y" data-value2="331">선택함</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-solid fa-bath fa-2x"></i><font size="4em">&nbsp;&nbsp; 욕실</font></div>
		            <button type="button" class="btn" name="bathroom" id="bathroom1" data-value="N" data-value2="0">선택안함</button>
		            <button type="button" class="btn" name="bathroom" id="bathroom2" data-value="Y" data-value2="321">1개</button>
		            <button type="button" class="btn" name="bathroom" id="bathroom3" data-value="Y" data-value2="580">2개</button>
		            <button type="button" class="btn" name="bathroom" id="bathroom4" data-value="Y" data-value2="839">3개</button>
		        </div>
		        <div class="button-group">
		          <div><i class="fa-solid fa-door-closed fa-2x"></i><font size="4em">&nbsp;&nbsp; 문</font></div>
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
		          <button type="button" class="btn-estimate w-100 mt-3" onclick="fCheck()">견적 신청</button>
		          <input type="hidden" name="totprice" id="totprice"/>
		          <input type="hidden" name="selectArea" id="selectArea"/>
		          <input type="hidden" name="selectSize" id="selectSize"/>
		          
		        </div>
		      </div>
		   </div>
    </form>
  </div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>