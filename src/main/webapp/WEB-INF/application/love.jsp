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
			left: 4.5%;
			margin-bottom: 20px;
			padding-top: 5%;
			font-weight: bold;
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
    	margin: 50px 4.5%;
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
		  position: relative; /* 하트 버튼 배치를 위해 relative 설정 */
		  transition: box-shadow 0.3s ease;
		  text-decoration: none;
		}
		
		.like-button {
		  background: transparent;
		  border: none;
		  cursor: pointer;
		  font-size: 30px;
		  color: red;
		  position: absolute; /* 위치를 조정하기 위해 absolute */
		  bottom: 40px;
		  right: 20px; /* 오른쪽 끝으로 정렬 */
		  z-index: 2; /* 겹치는 요소보다 위로 */
		}
		
		.like-button i {
		  font-size: 30px;
		  transition: transform 0.2s ease; /* 클릭 시 애니메이션 */
		}
		
		.like-button:hover i {
		  transform: scale(1.2); /* 클릭 시 크기 확대 효과 */
		}
				
		
  </style>
  <script type="text/javascript">
  	'use strict';
  	
  	function choice(industry) {
  	  location.href = "Love.ap?industry=" + industry;
  	}
  	
  	function toggleLike(idx, btn) {
  		const icon = btn.querySelector('i');
  	  $.ajax({
  	    type: "post",
  	    url: "interestCheck.in",
  	    data: { idx: idx },
  	    success: function (res) {
  	      if (res == "1") {
  	        icon.classList.remove('fa-regular');
  	        icon.classList.add('fa-solid');
  	      } else if (res == "2") {
  	        icon.classList.remove('fa-solid');
  	        icon.classList.add('fa-regular');
  	      }
  	    },
  	    error: function () {
  	      alert("안됨");
  	    }
  	  });
  	}
  	function toggleLikef(idx, btn) {
  		const icon = btn.querySelector('i');
  	  $.ajax({
  	    type: "post",
  	    url: "interestCheck.fu",
  	    data: { idx: idx },
  	    success: function (res) {
  	      if (res == "1") {
  	        icon.classList.remove('fa-regular');
  	        icon.classList.add('fa-solid');
  	      } else if (res == "2") {
  	        icon.classList.remove('fa-solid');
  	        icon.classList.add('fa-regular');
  	      }
  	    },
  	    error: function () {
  	      alert("안됨");
  	    }
  	  });
  	}

  </script>
</head>
<jsp:include page="/include/mainHeader.jsp"/>
<body>
  <form name="myform">
 	 <div class="main">관심목록</div>
    	<div class="contain">
    	<div class="input-group">
			  <button type="button" onclick="choice('ALL')" class="<c:if test='${param.industry eq "ALL"}'>act</c:if>">전체</button>
			  <c:if test="${fn: length(FurnitureVOS) != 0}"><button type="button" onclick="choice('FURNITURE')" class="<c:if test='${param.industry eq "FURNITURE"}'>act</c:if>">가구</button></c:if>
			  <c:if test="${fn: length(InteriorVOS) != 0}"><button type="button" onclick="choice('INTERIOR')" class="<c:if test='${param.industry eq "INTERIOR"}'>act</c:if>">인테리어</button></c:if>
			</div>
    </div>
    
    
    <div class="content">
    	<!-- 가구 -->
    	<c:if test="${param.industry eq 'ALL' && fn: length(FurnitureVOS) != 0}">
	    	<div class="industry">가구 <font color="red"><b>${fn: length(FurnitureVOS)}</b></font></div>
		    <div class="grid-container">
		      <c:forEach var="FurnitureVO" items="${FurnitureVOS}" varStatus="st">
			      <!-- 조건: industry가 'ALL'이고 반복 횟수가 4를 초과한 경우 -->
				    <c:if test="${param.industry == 'ALL' && st.index >= 4}">
				        <!-- 빈 내용을 출력해 사실상 반복 종료 -->
				        <c:set var="stop" value="true" />
				    </c:if>
				
				    <!-- 반복 종료 조건 -->
				    <c:if test="${stop != true}">
					    <div class="grid-item">
  							<!-- a 태그 -->
							  <a class="moveContent" href="FurnitureContent.fu?idx=${FurnitureVO.idx}">
							    <img src="${ctp}/images/furniture/upload/${FurnitureVO.thumbnail}" alt="Thumbnail">
							    <div class="title">${FurnitureVO.title}</div>
							    <div class="company-category">${FurnitureVO.company} | ${FurnitureVO.category}</div>
							  </a>
							  
							  <!-- 하트 버튼 (a 태그 바깥) -->
							  <button type="button" class="like-button" onclick="toggleLikef(${FurnitureVO.idx}, this)">
							    <i class="${fn:contains(sContentGood, furniture+FurnitureVO.idx) ? 'fa-solid fa-heart' : 'fa-regular fa-heart'}"></i>
							  </button>
							</div>
		    		</c:if>
					</c:forEach>
		    </div>
	    </c:if>
	    
	    <c:if test="${param.industry eq 'FURNITURE'}">
	    	<div class="industry">가구 <font color="red"><b>${fn: length(FurnitureVOS)}</b></font></div>
		    <div class="grid-container">
		      <c:forEach var="FurnitureVO" items="${FurnitureVOS}" varStatus="st">
					    <div class="grid-item">
  							<!-- a 태그 -->
							  <a class="moveContent" href="FurnitureContent.fu?idx=${FurnitureVO.idx}">
							    <img src="${ctp}/images/furniture/upload/${FurnitureVO.thumbnail}" alt="Thumbnail">
							    <div class="title">${FurnitureVO.title}</div>
							    <div class="company-category">${FurnitureVO.company} | ${FurnitureVO.category}</div>
							  </a>
							  
							  <!-- 하트 버튼 (a 태그 바깥) -->
							  <button type="button" class="like-button" onclick="toggleLike(${FurnitureVO.idx}, this)">
							    <i class="${fn:contains(sContentGood, furniture+FurnitureVO.idx) ? 'fa-solid fa-heart' : 'fa-regular fa-heart'}"></i>
							  </button>
							</div>
					</c:forEach>
		    </div>
	    </c:if>
	    
	    
	    <!-- 인테리어 -->
	    <c:if test="${param.industry eq 'ALL' && fn: length(InteriorVOS) != 0}">
	    	<div class="industry">인테리어 <font color="red"><b>${fn: length(InteriorVOS)}</b></font></div>
		    <div class="grid-container">
		      <c:forEach var="InteriorVO" items="${InteriorVOS}" varStatus="st">
			      <!-- 조건: industry가 'ALL'이고 반복 횟수가 4를 초과한 경우 -->
				    <c:if test="${param.industry == 'ALL' && st.index >= 4}">
				        <!-- 빈 내용을 출력해 사실상 반복 종료 -->
				        <c:set var="stop" value="true" />
				    </c:if>
				
				    <!-- 반복 종료 조건 -->
				    <c:if test="${stop != true}">
					    <div class="grid-item">
  							<!-- a 태그 -->
							  <a class="moveContent" href="InteriorContent.in?idx=${InteriorVO.idx}">
							    <img src="${ctp}/images/interior/upload/${InteriorVO.thumbnail}" alt="Thumbnail">
							    <div class="title">${InteriorVO.title}</div>
							    <div class="company-category">${InteriorVO.company} | ${InteriorVO.category}</div>
							  </a>
							  
							  <!-- 하트 버튼 (a 태그 바깥) -->
							  <button type="button" class="like-button" onclick="toggleLike(${InteriorVO.idx}, this)">
							    <i class="${fn:contains(sContentGood, interior+InteriorVO.idx) ? 'fa-solid fa-heart' : 'fa-regular fa-heart'}"></i>
							  </button>
							</div>
		    		</c:if>
					</c:forEach>
		    </div>
	    </c:if>
	    
	    <c:if test="${param.industry eq 'INTERIOR'}">
	    	<div class="industry">인테리어 <font color="red"><b>${fn: length(InteriorVOS)}</b></font></div>
		    <div class="grid-container">
		      <c:forEach var="InteriorVO" items="${InteriorVOS}" varStatus="st">
				    <div class="grid-item">
							<!-- a 태그 -->
						  <a class="moveContent" href="InteriorContent.in?idx=${InteriorVO.idx}">
						    <img src="${ctp}/images/interior/upload/${InteriorVO.thumbnail}" alt="Thumbnail">
						    <div class="title">${InteriorVO.title}</div>
						    <div class="company-category">${InteriorVO.company} | ${InteriorVO.category}</div>
						  </a>
						  
						  <!-- 하트 버튼 (a 태그 바깥) -->
						  <button type="button" class="like-button" onclick="toggleLike(${InteriorVO.idx}, this)">
						    <i class="${fn:contains(sContentGood, interior+InteriorVO.idx) ? 'fa-solid fa-heart' : 'fa-regular fa-heart'}"></i>
						  </button>
						</div>
					</c:forEach>
		    </div>
	    </c:if>
    </div>
  </form>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>