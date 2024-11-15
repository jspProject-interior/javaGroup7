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
      overflow-x: hidden;
    }
    
    /* 메인 이미지 스타일 */
    .main-img {
      width: 100%;
      height: 600px;
      background-color: #2f2f2f;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      margin-bottom: 30px;
    }
    .main-img img {
      width: 90%;
      height: 100%;
    }

    /* 컨테이너와 카드 스타일 */
    .contain {
    	width: 100%;
      max-width: 900px;
      margin: auto;
      background-color: #fff;
      padding: 0;
	    overflow: hidden;
    }
    .category {
	  	padding-left: 20px;
	  }
    /* 제목 스타일 */
    .contain .title {
      font-size: 2em;
      font-weight: bold;
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
      width: 100%;
    }
    
    .grid-container {
		  display: grid;
		  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		  gap: 10px;
		  width: 100%;
		}
		
		.grid-item {
		  width: 100%;
		  aspect-ratio: 1 / 1;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: flex-start;
		  border-radius: 5px;
		  overflow: hidden;
		}
		
		.grid-item img {
		  width: 100%;
		  height: auto;
		  object-fit: cover;
		  flex-shrink: 0;
		}
		
		.grid-item .title-grid {
		  font-size: 16px;
		  font-weight: bold;
		  margin-top: 10px;
		  color: #333;
		  text-align: center;
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  display: block;
	    width: 100%;
		}
		
		.grid-item .company-category {
		  font-size: 14px;
		  color: #777;
		  text-align: center;
		  margin-bottom: 10px;
		  text-decoration: none;
		}
		.grid-item {
		  width: 100%;
		  height: 250px; /* 고정된 높이 */
		}
		.grid-item img {
		  height: 70%; /* 이미지 높이를 비율로 설정 */
		}
		.grid-item img {
			-webkit-transform: scale(1);
			transform: scale(1);
			transition: .5s ease-in-out;
		}
		.grid-item:hover img {
			transform: scale(1.05);
		}
		.grid-container a {
		  text-decoration: none;
		  color: inherit;
		}
		
		.grid-container a:hover {
		  text-decoration: none;
	  }



/* 제목 스타일 */
	.contain .title, .contain .category, .contain .trash{
    font-size: 25px;
    font-weight: bold;
    color: #2c3e50;
    margin-bottom: 10px;
    text-align: center;
    letter-spacing: 0.5px;
	}

/* 회사명 및 카테고리 */
	.contain .company {
    font-size: 1.2em;
    color: #95a5a6;
    margin-bottom: 20px;
    text-align: center;
    font-style: italic;
	}
	
	.contain .trash{
		padding-left: 20px;
		align-items: center;
	}

/* "포트폴리오 더보기" 섹션 제목 */
	.contain hr {
	    border: 0;
	    height: 1px;
	    background: linear-gradient(to right, #bdc3c7, #2c3e50);
	    margin: 20px 0;
	}
	.see-more{
		font-size: 23px;
	  font-weight: bold;
	  margin-top: 10px;
	  color: #333;
	  padding-bottom: 20px;
	}
	h6 {
			position: fixed;
			right: 1rem;
			bottom: -50px;
			transition: 0.7s ease;
		}
		.on {
			opacity: 0.8;
			cursor: pointer;
			bottom: 0;
		}
  </style>
</head>
<jsp:include page="/include/header.jsp"/>
<body>
  <div class="main-img">
    <img src="${ctp}/images/interior/upload/${vo.titleImg}" alt="${vo.title}">
  </div>
  <div class="contain">
    <div class="input-group">
	    <div class="title">${vo.title}</div>
	    <div class="trash"> | </div>
	    <div class="category input-group-append">${vo.category}</div>
    </div>
	    <div class="company input-group-prepend">${vo.company}</div>
    
    <div class="sub-img">
      <img style="width: 100%;" src="${ctp}/images/interior/upload/${vo.subImg}" alt="보조 이미지">
    </div>
    <hr>
    <div class="see-more">포트폴리오 더보기</div>
    <div class="grid-container">
      <c:forEach var="vo1" items="${vos}" varStatus="st">
      	<c:if test="${vo.idx != vo1.idx}">
		      <a href="InteriorContent.in?idx=${vo1.idx}">
		        <div class="grid-item">
		          <img src="${ctp}/images/interior/upload/${vo1.thumbnail}" alt="Thumbnail">
		          <div class="title-grid">${vo1.title}</div>
		          <div class="company-category">${vo1.company} | ${fn:toUpperCase(vo1.category)}</div>
		        </div>
		      </a>
	      </c:if>
      </c:forEach>
    </div>
  </div>
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>
