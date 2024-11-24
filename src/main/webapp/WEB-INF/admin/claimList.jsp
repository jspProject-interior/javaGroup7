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
      overflow-x: hidden; 
    }
    .industry{
    	font-family: 'ChosunGu';
    	font-size: 20px;
    	font-weight: light;
    	margin-bottom: 30px;
    }
    .main {
			font-family: 'EliceDigitalBaeum-Bd';
			font-size: 30px;
			color: black;
			position: relative; /* 상대 위치 설정 */
			font-weight: bold;
			text-align: center;
		}

    .grid-container {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
      margin-bottom: 50px;
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
    .grid-item {
      text-align: center;
      overflow: hidden;
		  position: relative;
		  overflow: hidden;
		  transition: box-shadow 0.3s ease; /* 애니메이션 추가 */
		  text-decoration: none;
		}
		
		.grid-item:hover {
		  text-decoration: none;
		}
		.grid-item a:hover {
		  text-decoration: none;
		}
    .grid-item img {
      width: 100%;
      height: 180px;
      object-fit: cover;
			-webkit-transform: scale(1);
			transform: scale(1);
			transition: .5s ease-in-out;
    }
		.grid-item:hover img {
			transform: scale(1.05);
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
    .contain{
    	border: 1px solid #eee;
    	margin: 1% 4.5%;
    }
    .con{
    	margin: 1% 4.5%;
    }
    .content{
    	margin: 0px 4.5% 50px 4.5%;
    }
		
		
		
		.grid-item {
		  text-align: center;
		  overflow: hidden;
		  position: relative; /* 하트 버튼 배치를 위해 relative 설정 */
		  transition: box-shadow 0.3s ease;
		  text-decoration: none;
		}
		
		
  </style>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <form name="myform">
 	 <div class="main">게시물 리스트</div>
    <div class="content">
    <hr>
    	<!-- 가구 -->
	    	<div class="industry">가구 <font color="red"><b>${fn: length(FurnitureVOS)}</b></font></div>
		    <div class="grid-container">
		      <c:forEach var="FurnitureVO" items="${FurnitureVOS}" varStatus="st">
				    <div class="grid-item">
							<!-- a 태그 -->
						  <a class="moveContent" href="FurnitureContent.fu?idx=${FurnitureVO.idx}" target="_top">
						    <img src="${ctp}/images/furniture/upload/${FurnitureVO.thumbnail}" alt="Thumbnail">
						    <div class="title">${FurnitureVO.title}</div>
						    <div class="company-category">${FurnitureVO.company} | ${FurnitureVO.category}</div>
						  </a>
						</div>
					</c:forEach>
		    </div>
	    
	    <!-- 인테리어 -->
	    	<div class="industry">인테리어 <font color="red"><b>${fn: length(InteriorVOS)}</b></font></div>
		    <div class="grid-container">
		      <c:forEach var="InteriorVO" items="${InteriorVOS}" varStatus="st">
				    <div class="grid-item">
							<!-- a 태그 -->
						  <a class="moveContent" href="InteriorContent.in?idx=${InteriorVO.idx}" target="_top">
						    <img src="${ctp}/images/interior/upload/${InteriorVO.thumbnail}" alt="Thumbnail">
						    <div class="title">${InteriorVO.title}</div>
						    <div class="company-category">${InteriorVO.company} | ${InteriorVO.category}</div>
						  </a>
						</div>
					</c:forEach>
		    </div>
    </div>
  </form>
</body>
</html>