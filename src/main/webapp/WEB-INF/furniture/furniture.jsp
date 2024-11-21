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
  <title>가구 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
    /* 기본 스타일 */
		body {
		  font-family: Arial, sans-serif;
		  margin: 0;
		  padding: 0;
		  background-color: #f4f4f9;
		}
		
		.furniture img {
		  width: 100%;
		  height: 500px;
		  object-fit: cover; /* 비율 유지하며 컨테이너 채움 */
		  object-position: center 65%; /* 이미지의 하단부 우선 보여줌 */
		}
		
		.main {
		  font-family: 'GowunBatang-Regular';
		  font-size: 50px;
		  position: absolute;
		  color: white;
		  top: 30%;
		  left: 50%;
		  transform: translate(-50%, -50%);
		  text-align: center;
		}
		
		/* 그리드 스타일 */
		.grid-container {
		  display: grid;
		  grid-template-columns: repeat(5, 1fr);
		  gap: 20px;
		  padding: 30px 4.5%;
		}
		
		@media (max-width: 1200px) {
		  .grid-container {
		    grid-template-columns: repeat(3, 1fr);
		    gap: 15px; /* 간격 조정 */
		  }
		}
		
		@media (max-width: 900px) {
		  .grid-container {
		    grid-template-columns: repeat(2, 1fr);
		    gap: 10px; /* 간격 조정 */
		  }
		}
		
		@media (max-width: 600px) {
		  .grid-container {
		    grid-template-columns: 1fr;
		    gap: 5px; /* 간격 조정 */
		  }
		}
		
		/* 그리드 아이템 */
		.grid-item {
		  text-align: left;
		  position: relative;
		  overflow: hidden;
		  text-decoration: none;
		  transition: box-shadow 0.3s ease; /* 부드러운 그림자 효과 */
		}
		
		.grid-item img {
		  width: 100%;
		  height: 400px;
		  object-fit: cover;
		}
		
		.grid-item .title {
		  font-size: 18px;
		  font-weight: bold;
		  margin-top: 10px;
		  padding-left: 10px;
		  color: #333;
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  display: block;
		}
		
		.grid-item .company-category {
		  font-size: 14px;
		  color: #777;
		  padding-left: 10px;
		  padding-bottom: 10px;
		  text-decoration: none;
		}
		.company-category:hover {
			text-decoration: none;
		}
		.grid-item .price {
		  font-size: 16px;
		  color: #777;
		  padding-left: 10px;
		  padding-bottom: 20px;
		  text-decoration: none;
		}
		.price:hover {
		  text-decoration: none;
		}
		
		/* 좋아요 버튼 */
		.grid-item .like-container {
		  position: absolute;
		  top: 350px;
		  right: 10px;
		  display: flex;
		  align-items: center;
		  gap: 5px;
		  background-color: transparent;
		  border-radius: 20px;
		  padding: 5px 10px;
		  z-index: 1;
		}
		
		.grid-item .like-container i {
		  color: gray;
		  font-size: 16px;
		}
		
		.grid-item .like-container span {
		  color: gray;
		  font-weight: bold;
		  font-size: 14px;
		}
		
		/* 이미지 전환 효과 */
		.image-container {
		  position: relative; /* 이미지를 겹칠 컨테이너 설정 */
		  width: 100%;
		  height: 400px; /* 이미지 높이 */
		  overflow: hidden; /* 이미지가 영역을 넘지 않도록 설정 */
		}
		
		.image-container img {
		  width: 100%;
		  height: 100%;
		  object-fit: cover; /* 이미지를 컨테이너에 맞게 조정 */
		  z-index: 0;
		}
		
		/* 기타 스타일 */
		.contain {
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

  </style>
  <script type="text/javascript">
  	'use strict';
  	
  	function choice(category) {
  	  location.href = "Furniture.fu?category=" + category;
  	}
  	
  	function showHoverImage(container) {
  	  const defaultImg = container.querySelector('.default-img');
  	  const hoverImg = container.querySelector('.hover-img');
  	  
  	  defaultImg.style.display = 'none'; // 기본 이미지 숨기기
  	  hoverImg.style.display = 'block'; // Hover 이미지 표시
  	}

  	function showDefaultImage(container) {
  	  const defaultImg = container.querySelector('.default-img');
  	  const hoverImg = container.querySelector('.hover-img');
  	  
  	  defaultImg.style.display = 'block'; // 기본 이미지 표시
  	  hoverImg.style.display = 'none'; // Hover 이미지 숨기기
  	}
  </script>
</head>
<jsp:include page="/include/mainHeader.jsp"/>
<body>
  <form name="myform">
    <div class="furniture">
      <img src="${ctp}/images/furniture/furnitureMain.jpg"/>
      <div class="main">GRINTERIOR</div>
      <input type="button" onclick="location.href='FurnitureInput.fu'" class="btn btn-success" value="게시물 등록"/>
    </div>
    <div class="contain">
    	<div class="input-group">
			  <button type="button" onclick="choice('ALL')" class="<c:if test='${param.category eq "ALL"}'>act</c:if>">전체</button>
			  <button type="button" onclick="choice('SOFA')" class="<c:if test='${param.category eq "SOFA"}'>act</c:if>">소파</button>
			  <button type="button" onclick="choice('TABLE')" class="<c:if test='${param.category eq "TABLE"}'>act</c:if>">테이블</button>
			  <button type="button" onclick="choice('CHAIR')" class="<c:if test='${param.category eq "CHAIR"}'>act</c:if>">의자</button>
			  <button type="button" onclick="choice('CABINET')" class="<c:if test='${param.category eq "CABINET"}'>act</c:if>">수납·선반장</button>
			  <button type="button" onclick="choice('LEMP')" class="<c:if test='${param.category eq "LEMP"}'>act</c:if>">조명</button>
			  <button type="button" onclick="choice('BED')" class="<c:if test='${param.category eq "BED"}'>act</c:if>">침대</button>
			</div>
    </div>    
    <div class="grid-container">
      <c:forEach var="vo" items="${vos}" varStatus="st">
		    <div class="grid-item">
	        <div class="like-container">
				    <i class="fa-solid fa-heart"></i>
				    <span>${vo.interest}</span>
				  </div>
	        <a class="moveContent" href="FurnitureContent.fu?idx=${vo.idx}">
             <div class="image-container" onmouseover="showHoverImage(this)" onmouseout="showDefaultImage(this)">
				      <!-- 기본 이미지 -->
				      <img src="${ctp}/images/furniture/upload/${vo.thumbnail}" alt="Thumbnail" class="default-img">
				      <!-- Hover 시 표시할 이미지 -->
				      <img src="${ctp}/images/furniture/upload/${vo.titleImg}" alt="Hover Image" class="hover-img" style="display: none;">
				    </div>
            <div class="title">${vo.title}</div>
            <div class="company-category">${vo.company} | ${fn:toUpperCase(vo.category)}</div>
     				<div class="price"><fmt:formatNumber value="${vo.price}" pattern="#,##0"/> 원</div>
	        </a>
		    </div>
		</c:forEach>
    </div>
  </form>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>