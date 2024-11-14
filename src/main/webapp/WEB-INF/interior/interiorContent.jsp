<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>${vo.title} | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
    /* 전체 배경색 */
    body {
      background-color: #f8f9fa;
      font-family: 'Arial', sans-serif;
    }
    
    /* 메인 이미지 스타일 */
    .main-img {
      width: 100%;
      background-color: #2f2f2f;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      margin-bottom: 20px;
    }
    .main-img img {
      width: 90%;
      height: auto;
      border-radius: 8px;
    }

    /* 컨테이너와 카드 스타일 */
    .contain {
      max-width: 900px;
      margin: auto;
      background-color: #fff;
      padding: 0;
    }
    
    /* 제목 스타일 */
    .contain .title {
      font-size: 2em;
      font-weight: bold;
      margin-bottom: 10px;
      color: #333;
    }
    
    /* 회사명 및 카테고리 */
    .contain .company, .container .category {
      font-size: 1.1em;
      color: #666;
      margin-bottom: 5px;
    }
    
    /* 추가 이미지 스타일 */
    .sub-img {
      text-align: center;
      margin-top: 20px;
    }
  </style>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
  <div class="main-img">
    <img src="${ctp}/images/interior/upload/${vo.titleImg}" alt="${vo.title}">
  </div>
  <div class="contain">
    <div class="title">${vo.title}</div>
    <div class="company">회사명: ${vo.company}</div>
    <div class="category">카테고리: ${vo.category}</div>
    
    <div class="sub-img">
      <img style="width: 100%;" src="${ctp}/images/interior/upload/${vo.subImg}" alt="보조 이미지">
    </div>
  </div>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>
