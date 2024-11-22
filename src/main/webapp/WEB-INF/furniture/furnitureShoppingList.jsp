<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>장바구니 | 그린테리어</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/fonts.jsp"/>
	<style>
		body {
		  font-family: Arial, sans-serif;
		  margin: 0;
		  padding: 0;
		  background-color: #f9f9f9;
		}

		.cart-container {
			  max-width: 50%;
			  margin: 3% auto;
			  padding: 3%;
			  background-color: #fff;
			}
	
		h2 {
			font-family: 'Gyeonggi_Title_Medium';
		  font-size: 10px;
		  padding-bottom: 10px;
		  padding-left: 30px;
		}
		
		.cart-items {
		  margin-bottom: 30px;
		}
		
		.cart-item {
		  display: flex;
		  align-items: center;
		  border-bottom: 1px solid #eee;
		  padding: 15px 0;
		}
		
		.cart-item img {
		  width: 150px;
		  height: 170px;
		  padding-left: 20px;
		  margin-right: 30px;
		}
		
		.item-details {
		  flex: 1;
		}
		
		.item-details .input-group {
			font-size: 14px;
			margin-bottom: 3px;
		}
		.item-details .original-price {
		  text-decoration: line-through;
		  color: #999;
		  font-size: 14px;
		  margin: 0;
		}
		
		.item-details .discounted-price {
		  color: #e60023;
		  font-weight: bold;
		  font-size: 14px;
		  margin: 0;
		}
		.item-details .price {
		  font-weight: bold;
		  font-size: 16px;
		  margin: 0;
		}
		.item-details .titleName {
		  font-size: 16px;
		  margin: 0 0 50px 0;
		}
		.item-details p {
			margin: 0;
			padding: 0;
		}
		
		.quantity {
		  display: flex;
		  align-items: center;
		}
		
		.quantity button {
		  width: 30px;
		  height: 30px;
		  border: 1px solid #ddd;
		  background-color: #f7f7f7;
		  cursor: pointer;
		}
		
		.quantity span {
		  margin: 0 10px;
		}
		
		.summary {
		  padding: 30px 50px;
		  background-color: #faf9f5;
		  border-radius: 8px;
		}
		
		.summary h3 {
			font-family: 'Gyeonggi_Title_Medium';
			font-size: 30px;
		  margin-bottom: 30px;
		  
		}
		
		.summary p {
		  margin: 10px 0;
		  font-size: 14px;
		}
		
		.summary .total {
		  font-size: 18px;
			font-family: 'Gyeonggi_Title_Medium';
			padding: 20px 0;
			
		}
		
	</style>
	<script>
	document.addEventListener('DOMContentLoaded', function () {
		  // 총 금액 계산 함수
		  function calculateTotal() {
		    let totPay = 0;
		    let totPrice = 0;

		    // 모든 cartPay와 cartPrice 요소를 가져옵니다
		    const cartPayElements = document.getElementsByName('cartPay');
		    const cartPriceElements = document.getElementsByName('cartPrice');

		    // 반복문으로 총 금액 계산
		    for (let i = 0; i < cartPayElements.length; i++) {
		      totPay += parseInt(cartPayElements[i].value || 0, 10); // 값이 없으면 0으로 처리
		      totPrice += parseInt(cartPriceElements[i].value || 0, 10);
		    }

		    // 계산 결과 디버그
		    console.log("totPay:", totPay);
		    console.log("totPrice:", totPrice);

		    // 결과를 DOM에 반영
		    document.getElementById('demo1').textContent = totPay.toLocaleString(); // 주문 금액
		    document.getElementById('demo2').textContent = (totPay - totPrice).toLocaleString(); // 할인 금액
		    document.getElementById('demo3').textContent = totPrice.toLocaleString(); // 총 결제 금액
		  }

		  // 초기 계산 실행
		  calculateTotal();
		});
		
		function fCheck() {
			alert("결제페이지로 이동합니다.")
			myform.submit();
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<form name="myform" method="post" action="FurnitureBuy.fu">
	<div class="cart-container">
    <h2>장바구니</h2>
    <div class="cart-items">
    	<c:forEach var="vo" items="${vos}" varStatus="st">
	      <div class="cart-item">
	        <input type="checkbox" checked>
	        <img src="${ctp}/images/furniture/upload/${vo.thumbnail}" alt="Thumbnail" class="default-img">
	        <div class="item-details">
		        <div class="input-group" style="text-align: center;">
		          <div class="company input-group-prepend">${vo.company}</div>
		          <div class="trash company">&nbsp;/&nbsp;</div>
		          <div class="category input-group-append">${vo.category}</div>
		        </div>
		        <div class="titleName">${vo.title}</div>
		        <p>
							<span class="discounted-price"><fmt:formatNumber value="${vo.discount}" pattern="#,##0"/> ${vo.saleUnit} &nbsp;&nbsp;</span>
	          	<span class="original-price"><fmt:formatNumber value="${vo.pay}" pattern="#,##0"/> 원</span>
	          	<input type="hidden" name="cartPay" id="cartPay${st.index}" value="${vo.pay}"/>
	          <p>
	          <p class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</p>
	          <input type="hidden" name="cartPrice" id="cartPrice${st.index}" value="${vo.price}"/>
	        </div>
	        <div class="quantity">
	          <button type="button">-</button>
	          <span>1</span>
	          <button type="button">+</button>
	        </div>
	      </div>
      </c:forEach>
    </div>
    <div class="summary">
      <h3>주문 정보</h3>
      <p>● 선택 상품 금액&nbsp;  : &nbsp;<span id="demo1"></span>&nbsp; 원</p>
      <p>● 즉시 할인 금액&nbsp;  : &nbsp;<span id="demo2"></span>&nbsp; 원</p>
      <p class="total">총 주문 금액: <span id="demo3"></span>&nbsp; 원</p>
      <input type="button" value="주 문 하 기" onclick="fCheck()" class="form-control btn btn-outline-secondary" style="font-family: 'Gyeonggi_Title_Medium'; font-size: 20px;"/>
    </div>
  </div>
</form>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>