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
  <title>구매페이지 | 그린테리어</title>
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
		  width: 70px;
		  height: 30px;
		  font-size: 14px;
		  border: 1px solid #ddd;
		  background-color: #f7f7f7;
		  cursor: pointer;
		}
		
		.quantity span {
		  margin: 0 10px;
		}
		
		.summary {
		  padding: 30px 50px;
		  border: 1px solid #eee;
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
		.information {
      display: flex;
      align-items: center;
      border-top: 1px solid #eee;
      border-bottom: 1px solid #eee;
      padding-top: 20px;
      padding-bottom: 20px;
      margin-top: 30px;
      margin-bottom: 30px;
  }
  .information div {
      font-size: 24px;
      margin-right: 20px;
  }
  .user-information {
      display: flex;
      margin-bottom: 30px;
  }
  .user {
    border: 1px solid #eee;
    padding: 20px;
    text-align: left;
    display: flex;
  	flex-direction: column;
  }
  .Name{
  	font-size: 28px;
  	font-family: 'Gyeonggi_Title_Medium';
  }
  .Id{
  	font-size: 15px;
  	color: gray;
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


		    // 결과를 DOM에 반영
		    document.getElementById('demo1').textContent = totPay.toLocaleString(); // 주문 금액
		    document.getElementById('demo2').textContent = (totPay - totPrice).toLocaleString(); // 할인 금액
		    document.getElementById('demo3').textContent = totPrice.toLocaleString(); // 총 결제 금액
		  }

		  // 초기 계산 실행
		  calculateTotal();
		});
		
		function fCheck() {
			let thumbnail = document.getElementsByName('thumbnailArr');
			
			let thumbnailArr = "";
			let cartPayArr = "";
			let cartPriceArr = "";
			let titleArr = "";
			let categoryArr = "";
			let companyArr = "";
			let comMidArr = "";
			
			
			for(let i = 0 ; i < thumbnail.length; i++){
				thumbnailArr += document.getElementById("thumbnail" + i).value + ",";
				cartPayArr += document.getElementById("cartPay" + i).value + ",";
				cartPriceArr += document.getElementById("cartPrice" + i).value + ",";
				titleArr += document.getElementById("title" + i).value + ",";
				categoryArr += document.getElementById("category" + i).value + ",";
				companyArr += document.getElementById("company" + i).value + ",";
				comMidArr += document.getElementById("comMid" + i).value + ",";
			}
			
			thumbnailArr = thumbnailArr.substring(0, thumbnailArr.length-1);
			cartPayArr = cartPayArr.substring(0, cartPayArr.length-1);
			cartPriceArr = cartPriceArr.substring(0, cartPriceArr.length-1);
			titleArr = titleArr.substring(0, titleArr.length-1);
			categoryArr = categoryArr.substring(0, categoryArr.length-1);
			companyArr = companyArr.substring(0, companyArr.length-1);
			comMidArr = comMidArr.substring(0, comMidArr.length-1);
			
			document.getElementById('thumbnail').value = thumbnailArr;
			document.getElementById('cartPay').value = cartPayArr;
			document.getElementById('cartPrice').value = cartPriceArr;
			document.getElementById('title').value = titleArr;
			document.getElementById('category').value = categoryArr;
			document.getElementById('company').value = companyArr;
			document.getElementById('comMid').value = comMidArr;
			
			myform.submit();
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<form name="myform" method="post" action="FurnitureBuyOk.fu">
	<div class="cart-container">
    <h2>구매페이지</h2>
    <div class="cart-items">
	    <div class="summary">
	      <!-- <h3>주문 정보</h3> -->
		    <div class="information">
			    <div class="user-details">
			        <span class="Name">${mVO.name}</span>
			        <input type="hidden" name="name" id="name" value="${mVO.name}"/>
			        <span class="Id">${mVO.mid}</span>
			        <input type="hidden" name="cusMid" id="cusMid" value="${mVO.mid}"/>
			    </div>
		    </div>
		    <div class="user-information">
					<div class="user" style="width: 60%;">
				  	<div class="user-title">주소</div>
				  	<div class="user-info">${fn : replace(mVO.address, '/', ' ')}</div>
				  	<input type="hidden" name="address" id="address" value="${mVO.address}"/>
				  </div>
					<div class="user" style="width: 40%; position: relative;">
				    <div class="user-title">연락처</div>
				    <div class="user-info">${mVO.tel}</div>
				    <input type="hidden" name="tel" id="tel" value="${mVO.tel}" />
				  </div>
		    </div>
	      <p>● 선택 상품 금액&nbsp;  : &nbsp;<span id="demo1"></span>&nbsp; 원</p>
	      <p>● 즉시 할인 금액&nbsp;  : &nbsp;<span id="demo2"></span>&nbsp; 원</p>
	      <p class="total">총 주문 금액: <span id="demo3"></span>&nbsp; 원</p>
	    </div>
    	<c:forEach var="vo" items="${vos}" varStatus="st">
	      <div class="cart-item">
	        <img src="${ctp}/images/furniture/upload/${vo.thumbnail}" alt="Thumbnail" class="default-img">
	        <input type="hidden" name="thumbnailArr" id="thumbnail${st.index}" value="${vo.thumbnail}"/>
	        <input type="hidden" name="thumbnail" id="thumbnail" value=""/>
	        <div class="item-details">
		        <div class="input-group" style="text-align: center;">
		          <div class="company input-group-prepend">${vo.company}</div>
		          <input type="hidden" id="company${st.index}" value="${vo.company}"/>
		          <input type="hidden" name="company" id="company" value=""/>
		          
		          <input type="hidden" id="comMid${st.index}" value="${vo.mid}"/>
		          <input type="hidden" name="comMid" id="comMid" value=""/>
		          <div class="trash company">&nbsp;/&nbsp;</div>
		          <div class="category input-group-append">${vo.category}</div>
		          <input type="hidden" id="category${st.index}" value="${vo.category}"/>
		          <input type="hidden" name="category" id="category" value=""/>
		        </div>
		        <div class="titleName">${vo.title}</div>
		        <input type="hidden" id="title${st.index}" value="${vo.title}"/>
		        <input type="hidden" name="title" id="title" value=""/>
		        <p>
							<span class="discounted-price"><fmt:formatNumber value="${vo.discount}" pattern="#,##0"/> ${vo.saleUnit} &nbsp;&nbsp;</span>
	          	<span class="original-price"><fmt:formatNumber value="${vo.pay}" pattern="#,##0"/> 원</span>
	          	<input type="hidden" name="cartPay" id="cartPay${st.index}" value="${vo.pay}"/>
	          	<input type="hidden" name="cartPayArr" id="cartPay" value=""/>
	          <p>
	          <p class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</p>
	          <input type="hidden" name="cartPrice" id="cartPrice${st.index}" value="${vo.price}"/>
	          <input type="hidden" name="cartPriceArr" id="cartPrice" value=""/>
	        </div>
	        <div class="quantity">
	          <button type="button">수량 1</button>
	          <input type="hidden" name="cnt" id="cnt" value="1"/>
	        </div>
	      </div>
      </c:forEach>
    </div>
      <input type="button" value="결 제 하 기" onclick="fCheck()" class="form-control btn btn-outline-secondary" style="font-family: 'Gyeonggi_Title_Medium'; font-size: 20px;"/>
  </div>
</form>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>