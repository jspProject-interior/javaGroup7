<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  max-width: 70%;
  margin: 5% auto;
  padding: 3%;
  background-color: #fff;
}

h1 {
	font-family: 'Dovemayo_gothic';
  font-size: 24px;
  
  margin-bottom: 20px;
}

.cart-tabs {
  display: flex;
  margin-bottom: 20px;
}

.tab {
  flex: 1;
  padding: 10px;
  text-align: center;
  border: 1px solid #ddd;
  background-color: #f0f0f0;
  cursor: pointer;
}

.tab.selected {
  background-color: #fff;
  border-bottom: none;
  font-weight: bold;
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
  width: 80px;
  height: 80px;
  margin-right: 20px;
}

.item-details {
  flex: 1;
}

.item-details h3 {
  margin: 0;
  font-size: 16px;
}

.item-details .original-price {
  text-decoration: line-through;
  color: #999;
  font-size: 14px;
}

.item-details .discounted-price {
  color: #e60023;
  font-weight: bold;
  font-size: 16px;
}

.shipping-info {
  font-size: 12px;
  color: #666;
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
  padding: 20px;
  background-color: #f7f7f7;
  border-radius: 8px;
}

.summary h3 {
  margin: 0 0 10px;
}

.summary p {
  margin: 5px 0;
  font-size: 14px;
}

.summary .total {
  font-size: 18px;
  font-weight: bold;
}

.order-button {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #e60023;
  color: #fff;
  border: none;
  border-radius: 4px;
  font-size: 16px;
  cursor: pointer;
}

.order-button:hover {
  background-color: #cc0020;
}
	
	</style>
	<script>
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<form action="">
	<div class="cart-container">
    <h1>장바구니</h1>
    <div class="cart-items">
      	<c:forEach var="vo" items="${vos}" varStatus="st">
      <div class="cart-item">
        <input type="checkbox" checked>
        <img src="${ctp}/images/furniture/upload/${vo.thumbnail}" alt="Thumbnail" class="default-img">
        <div class="item-details">
	        <div class="input-group" style="text-align: center;">
	          <div class="company input-group-prepend">${vo.company}</div>
	          <div class="trash company"> / </div>
	          <div class="category input-group-append">${vo.category}</div>
	        </div>
          <p class="original-price">${vo.pay}</p>
          <p class="discounted-price">${vo.discount} ${vo.saleUnit}</p>
          <p class="shipping-info">${vo.price}</p>
        </div>
        <div class="quantity">
          <button>-</button>
          <span>1</span>
          <button>+</button>
        </div>
      </div>
      </c:forEach>
    </div>
    <div class="summary">
      <h3>선택된 2개 제품의 결제 정보</h3>
      <p>주문금액: <span>4,866,000원</span></p>
      <p>할인금액: <span>-830,700원</span></p>
      <p>배송비: <span>60,000원</span></p>
      <p class="total">총 결제 금액: <span>4,095,300원</span></p>
      <button class="order-button">주문하기</button>
    </div>
  </div>
</form>
<p><br/></p>
</html>