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
    .grid-item {
      text-align: center;
      overflow: hidden;
		  position: relative;
		  border: 1px solid #ddd;
		  border-radius: 10px;
		  overflow: hidden;
		  transition: box-shadow 0.3s ease; /* 애니메이션 추가 */
		  text-decoration: none;
		}
		
		.grid-item:hover {
		  box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
		  text-decoration: none;
		}
		.grid-item a:hover {
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
    .contain{
    	border: 1px solid #eee;
    	margin: 1% 4.5%;
    }
    
		.contain button {
		  color: gray;
		  border: none;
		  background: transparent;
		  padding: 16px;
		  font-size: 16px;
		  border-bottom: 3px solid transparent;
		}
		
    button.act {
		  font-weight: bold;
		  color: black;
		  border-bottom: 3px solid black;
		}
		
		.input-group {
		  display: flex;
		  justify-content: flex-start;
		  gap: 10px;
		  font-family: 'ChosunGu';
		  font-weight: light;
		}
		
		
		.grid-item {
		  text-align: center;
		  overflow: hidden;
		  position: relative;
		  border: 1px solid #ddd;
		  border-radius: 10px;
		  overflow: hidden;
		  transition: box-shadow 0.3s ease;
		  text-decoration: none;
		}
		
		.grid-item .like-container {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  display: flex;
		  align-items: center;
		  gap: 5px;
		  background-color: rgba(255, 255, 255, 0.8); /* 배경 추가 */
		  border-radius: 20px;
		  padding: 5px 10px;
		}
		
		.grid-item .like-container i {
		  color: red;
		  font-size: 16px;
		}
		
		.grid-item .like-container span {
		  color: red;
		  font-weight: bold;
		  font-size: 14px;
		}
		
  </style>
  <script type="text/javascript">
  	'use strict';
  	
  	function choice(category) {
  	  location.href = "Interior.in?category=" + category;
  	}
  </script>
</head>
<jsp:include page="/include/mainHeader.jsp"/>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
  <form name="myform">
    <div class="interior">
      <img src="${ctp}/images/interior/interiorMain.jpg"/>
      <div class="main">GRINTERIOR</div>
    </div>
    <div class="contain">
    	<div class="input-group">
			  <button type="button" onclick="choice('ALL')" class="<c:if test='${param.category eq "ALL"}'>act</c:if>">전체</button>
			  <button type="button" onclick="choice('MODERN')" class="<c:if test='${param.category eq "MODERN"}'>act</c:if>">모던</button>
			  <button type="button" onclick="choice('NATURAL')" class="<c:if test='${param.category eq "NATURAL"}'>act</c:if>">네츄럴</button>
			  <button type="button" onclick="choice('VINTAGE')" class="<c:if test='${param.category eq "VINTAGE"}'>act</c:if>">빈티지</button>
			  <button type="button" onclick="choice('UNIQUE')" class="<c:if test='${param.category eq "UNIQUE"}'>act</c:if>">유니크</button>
			</div>
    </div>
    <div class="grid-container">
      <c:forEach var="vo" items="${vos}" varStatus="st">
		    <div class="grid-item">
	        <div class="like-container">
				    <i class="fa-solid fa-heart"></i>
				    <span>${vo.interest}</span>
				  </div>
	        <a class="moveContent" href="InteriorContent.in?idx=${vo.idx}">
            <img src="${ctp}/images/interior/upload/${vo.thumbnail}" alt="Thumbnail">
            <div class="title">${vo.title}</div>
            <div class="company-category">${vo.company} | ${fn:toUpperCase(vo.category)}</div>
	        </a>
		    </div>
			</c:forEach>
    </div>
  </form>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>