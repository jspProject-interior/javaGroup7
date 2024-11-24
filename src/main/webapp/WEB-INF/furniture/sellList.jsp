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
  <title>${mid} 상담신청 리스트 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
<style>
  .table {
      background-color: #fff;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      table-layout: auto; /* Allow columns to size based on content */
      width: 100%; /* Ensure table stretches fully */
  }
  .table th, .table td {
      padding: 15px;
      font-size: 14px;
      white-space: nowrap; /* Prevent wrapping */
      text-align: center;
  }
  .table-row:hover {
      background-color: #e9f5ff !important;
      transition: background-color 0.3s ease;
  }
  .text-center {
      text-align: center;
  }
  .blank {
      margin-bottom: 50px;
      height: 50px;
  }
</style>
<script type="text/javascript">
  function reverseCheck() {
	  for(let i=0; i<document.getElementsByName("index").length; i++) {
		  document.getElementsByName("index")[i].checked = !document.getElementsByName("index")[i].checked;
  	}
  }
</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<jsp:include page="/include/header.jsp"/>
<div class="blank"></div>
<div class="container">
    <h1 class="text-center my-4">판매 리스트</h1>
    <table class="table table-striped table-bordered text-center">
        <thead>
            <tr>
          		<th><input type="checkbox" id="allCheck" onclick="reverseCheck()"/></th>
              <th>순번</th>
              <th>구매자</th>
              <th>전화번호</th>
              <th>배송지</th>
              <th>카테고리</th>
              <th>제품명</th>
              <th>가격</th>
              <th>할인가격</th>
              <th>총 금액</th>
              <th>수량</th>
              <th>주문 일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vo" items="${vos}" varStatus="st">
                <tr class="table-row" onclick="">
                	<td><input type="checkbox" name="index" id="index${st.index}"/></td>
                  <td>${st.count}</td>
                  <td>${vo.name}</td>
                  <td>${vo.tel}</td>
                  <td>${vo.address}</td>
                  <td>${vo.category}</td>
                  <td>${vo.title}</td>
                  <td><fmt:formatNumber value="${vo.pay}" pattern="#,##0"/>원</td>
                  <td><fmt:formatNumber value="${vo.discount}" pattern="#,##0"/>원</td>
                  <td><fmt:formatNumber value="${vo.price}" pattern="#,##0"/>원</td>
                  <td>${vo.cnt}</td>
                  <td>${fn : substring(vo.purDate,0,10)}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
