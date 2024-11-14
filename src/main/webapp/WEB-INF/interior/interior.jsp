<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>인테리어 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f9;
    }
    .interior img {
      width: 100%;
      height: 500px;
      object-fit: cover;
    }
    .main {
      font-family: 'GowunBatang-Regular';
      font-size: 50px;
      position: absolute;
      color: white;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
      text-align: center;
    }
    .grid-container {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      gap: 20px;
      padding: 30px 4.5%;
    }
    @media (max-width: 1200px) {
      .grid-container {
        grid-template-columns: repeat(3, 1fr);
      }
    }
    @media (max-width: 900px) {
      .grid-container {
        grid-template-columns: repeat(2, 1fr);
      }
    }
    @media (max-width: 600px) {
      .grid-container {
        grid-template-columns: 1fr;
      }
    }
    form a {
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      text-align: center;
      transition: box-shadow 0.3s ease;
      text-decoration: none;
  		color: inherit;
    }
    form a:hover {
      box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
      text-decoration: none;
    }
    .grid-item img {
      width: 100%;
      height: 180px;
      object-fit: cover;
    }
    .grid-item .title {
      font-size: 18px;
      font-weight: bold;
      margin-top: 10px;
      color: #333;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
      display: block;
    }
    .grid-item .company-category {
      font-size: 14px;
      color: #777;
    }
    .interior {
      position: relative;
    }
    .company-category{
    	padding-bottom: 20px;
    	font-size: 14px;
		  color: #777;
		  text-decoration: none;
    }
    
    .title{
    	padding: 0 20px;
    }
  </style>
</head>
<jsp:include page="/include/mainHeader.jsp"/>
<body>
  <form name="myform">
    <div class="interior">
      <img src="${ctp}/images/interior/interiorMain.jpg"/>
      <div class="main">GRINTERIOR</div>
      <input type="button" onclick="location.href='InteriorInput.in'" class="btn btn-success" value="게시물 등록"/>
    </div>
    <div class="grid-container">
      <c:forEach var="vo" items="${vos}" varStatus="st">
	      <a href="#">
	        <div class="grid-item">
	          <img src="${ctp}/images/interior/upload/${vo.thumbnail}" alt="Thumbnail">
	          <div class="title">${vo.title}</div>
	          <div class="company-category">${vo.company} | ${fn:toUpperCase(vo.category)}</div>
	        </div>
	      </a>
      </c:forEach>
    </div>
  </form>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>