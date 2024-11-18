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
    .content {
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
			bottom: -100px;
			transition: 0.7s ease;
		}
		h6.on {
			opacity: 0.8;
			cursor: pointer;
			bottom: 15px;
		}
		
			
			
	/* 고정 사이드바 숨김 상태 */
		.fixed-sidebar {
	    position: fixed;
	    top: 20%;
	    right: -120px;
	    width: 120px;
	    flex-direction: column;
	    align-items: center;
	    background: none;
	    z-index: 50;
	    gap: 20px;
	    opacity: 0;
	    transition: 0.5s ease-in-out;
		}
		
		/* 고정 사이드바 보임 상태 */
		.fixed-sidebar.on {
	    right: 10px; /* 화면 안쪽으로 이동 */
	    opacity: 1; /* 투명도 변경으로 보이게 */
		}
	
		
		/* 사이드바 아이템 스타일 */
		.sidebar-item {
	    text-align: center;
	    cursor: pointer;
		}
		
		/* 아이콘을 둥글게 */
		.icon-circle {
	    width: 80px;
	    height: 80px;
	    border-radius: 50%;
	    background-color: #ffffff; /* 흰색 배경 */
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    transition: transform 0.3s ease, box-shadow 0.3s ease; /* 호버 애니메이션 */
	    margin-bottom: 20px;
		}
		
		/* 아이콘 스타일 */
		.icon-circle i {
		    font-size: 30px;
		    color: #333; /* 아이콘 색상 */
		}
		
		/* 호버 효과 */
		.icon-circle:hover {
	    transform: scale(1.1); /* 크기 확대 */
	    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3); /* 그림자 강화 */
		}
  </style>
  
  <script type="text/javascript">
	  function toggleLike(idx, btn) {
	    const icon = btn.querySelector('i');
	        $.ajax({
	        	type : "post",
	        	url : "interestCheck.in",
	        	data : {idx : idx},
	        	success: function(res) {
							if(res == "1"){
								icon.classList.remove('fa-regular');
				        icon.classList.add('fa-solid');
							}
							else if(res == "2"){
				        icon.classList.remove('fa-solid');
				        icon.classList.add('fa-regular');
					    }
						},
						error: function() {
							alert("안됨");
						}
        });
	  }
	  
	//화살표클릭시 화면 상단이동(부드럽게)
		$(window).scroll(function(){
	  if($(this).scrollTop() > 100){
	     $("#topBtn").addClass("on");
	  }
	  else{
	     $("#topBtn").removeClass("on");
	  }
	  $("#topBtn").click(function() {
				window.scrollTo({top:0, behavior: "smooth"});	
			});
		});
		
		//스크롤 시 사이드바 나타나기
			$(window).scroll(function(){
			  if($(this).scrollTop() > 300){
			     $("#mainSidebar").addClass("on");
			  }
			  else{
			     $("#mainSidebar").removeClass("on");
			  }
			});
		
			function shareContent() {
			    // 공유할 데이터 정의
			    const shareData = {
			        title: '그린테리어',
			        text: '이 멋진 인테리어를 확인해보세요!',
			        url: window.location.href // 현재 페이지 URL
			    };

			    // Web Share API를 사용하여 공유
			    if (navigator.share) {
			        navigator.share(shareData)
			            .then(() => console.log('공유 성공'))
			            .catch((error) => console.error('공유 실패:', error));
			    } else {
			        alert('공유 기능이 지원되지 않는 브라우저입니다.');
			    }
			}
			
			function DeleteCheck() {
				let ans = confirm("삭제하시겠습니까?");
				if(ans){
					location.href = "InteriorDelete.in?idx=${vo.idx}";
				}
			}
  </script>
</head>
<jsp:include page="/include/header.jsp"/>
<body class="content">
  <div class="main-img">
    <img src="${ctp}/images/interior/upload/${vo.titleImg}" alt="${vo.title}">
  </div>
  <div class="contain">
    <div class="input-group">
	    <div class="title-container">
	        <div class="title">${vo.title}</div>
	    </div>
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
    
  <!-- 고정 사이드바 -->
	<div class="fixed-sidebar" id="mainSidebar">
    <div class="sidebar-item">
      <div class="icon-circle" onclick="shareContent()">
        <i class="fa-solid fa-share-nodes"></i>
      </div>
    </div>
    <div class="sidebar-item">
      <div class="icon-circle" onclick="toggleLike(${vo.idx}, this)">
        ${fn:contains(sContentGood, interior+vo.idx) ? "<i class='fa-solid fa-heart'></i>" : "<i class='fa-regular fa-heart'></i>"}
      </div>
    </div>
    <div class="sidebar-item">
      <div class="icon-circle">
        <a href="#"><i class="fa-solid fa-comment-dots"></i></a>
      </div>
    </div>
    <div class="sidebar-item">
      <div class="icon-circle">
        <a href="#"><i class="fa-solid fa-user-slash"></i></a>
      </div>
    </div>
    <c:if test="${sMid == vo.mid}">
	    <div class="sidebar-item">
		    <div class="icon-circle">
		      <a href="InteriorUpdate.in?idx=${vo.idx}"><i class="fa-solid fa-pencil"></i></a>
		    </div>
	    </div>
    </c:if>
    <c:if test="${sMid == vo.mid || sLevel == 0}">
	    <div class="sidebar-item">
	      <div class="icon-circle" onclick="DeleteCheck()">
	        <a href="InteriorDelete.in?idx=${vo.idx}"><i class="fa-regular fa-trash-can"></i></a>
	      </div>
	    </div>
    </c:if>
	</div>
	
	<!-- 위로가기 버튼 -->
  <h6 id="topBtn" class="text-right mr-3"><font color="#af9e84"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></font></h6>
  
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>