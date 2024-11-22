<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>${sMid}님의 신청 현황 | 그린테리어</title>
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
<body>
<jsp:include page="/include/header.jsp"/>
<div class="blank"></div>
<div class="container">
    <h1 class="text-center my-4">상담 신청 현황</h1>
    <table class="table table-striped table-bordered text-center">
        <thead>
            <tr>
                <th><input type="checkbox" id="allCheck" onclick="reverseCheck()"/></th>
                <th>순번</th>
                <th>업체</th>
                <th>신청자</th>
                <th>시공지</th>
                <th>연락받을 번호</th>
                <th>카테고리</th>
                <th>예산</th>
                <th>크기</th>
                <th>시작 날짜</th>
                <th>공간</th>
                <th>처리현황</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vo" items="${vos}" varStatus="st">
                <tr class="table-row">
                    <td><input type="checkbox" name="index" id="index${st.index}"/></td>
                    <td>${st.count}</td>
                    <td>${vo.companyMid}</td>
                    <td>${vo.name}</td>
                    <td>${vo.conAddress}</td>
                    <td>${vo.tel}</td>
                    <td>${vo.category}</td>
                    <td>${vo.budget} 만원</td>
                    <td>${vo.size} 평</td>
                    <td>${vo.conStartDay}</td>
                    <td>${vo.area}</td>
                    <td>${vo.treatment}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>