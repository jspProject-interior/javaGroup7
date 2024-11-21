<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${vo.name} 님의 상세정보 | 그린테리어</title>
<jsp:include page="/include/bs4.jsp"/>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
<p><br/></p>
<<div class="container">
    <h1 class="my-4">${vo.name}님의 상담 상세 정보</h1>
    <ul class="list-group">
        <li class="list-group-item"><strong>아이디:</strong> ${vo.mid}</li>
        <li class="list-group-item"><strong>이름:</strong> ${vo.name}</li>
        <li class="list-group-item"><strong>주소:</strong> ${vo.conAddress}</li>
        <li class="list-group-item"><strong>전화번호:</strong> ${vo.tel}</li>
        <li class="list-group-item"><strong>카테고리:</strong> ${vo.category}</li>
        <li class="list-group-item"><strong>가격:</strong> ${vo.price}</li>
        <li class="list-group-item"><strong>예산:</strong> ${vo.budget}</li>
        <li class="list-group-item"><strong>크기:</strong> ${vo.size}</li>
        <li class="list-group-item"><strong>시작 날짜:</strong> ${vo.conStartDay}</li>
        <li class="list-group-item"><strong>지역:</strong> ${vo.area}</li>
    </ul>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>