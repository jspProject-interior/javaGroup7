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
  <title>구매하기 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
}

.cart-container {
    max-width: 800px;
    margin: 50px auto;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #333;
}

.cart-table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

.cart-table th, .cart-table td {
    text-align: left;
    padding: 10px;
    border-bottom: 1px solid #ddd;
}

.cart-table th {
    background-color: #f4f4f4;
    font-weight: bold;
}

.cart-table td {
    vertical-align: middle;
}

.product-quantity {
    width: 60px;
    padding: 5px;
    text-align: center;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.cart-summary {
    text-align: right;
    margin-top: 20px;
}

#cart-total {
    font-weight: bold;
    color: #e74c3c;
}

.checkout-button {
    display: block;
    width: 100%;
    padding: 15px;
    background-color: #3498db;
    color: #fff;
    font-size: 16px;
    text-align: center;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.checkout-button:hover {
    background-color: #2980b9;
}
</style>
<script type="text/javascript">


</script>  
  
</head>
<body>
구매
${vo}
<body>
<jsp:include page="/include/mainHeader.jsp"/>
  <form name="myform" action="#">
    <div class="cart-container">
        <h1>장바구니</h1>
        <table class="cart-table">
            <thead>
                <tr>
                    <th>상품</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="product-name">상품 A</td>
                    <td class="product-price">₩10,000</td>
                    <td>
                        <input type="number" class="product-quantity" value="1" min="1">
                    </td>
                    <td class="product-total">₩10,000</td>
                </tr>
                <tr>
                    <td class="product-name">상품 B</td>
                    <td class="product-price">₩20,000</td>
                    <td>
                        <input type="number" class="product-quantity" value="2" min="1">
                    </td>
                    <td class="product-total">₩40,000</td>
                </tr>
            </tbody>
        </table>
        <div class="cart-summary">
            <h2>총합계: <span id="cart-total">₩50,000</span></h2>
        </div>
        <button type="button" class="checkout-button btn btn-outline-secondary">결제하기</button>
    </div>
  </form>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>