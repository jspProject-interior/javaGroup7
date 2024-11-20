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
   body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
  }
	#content-form {
		display: flex;
    flex-direction: row;
    max-width: 85%;
    margin: 0 auto;
    padding-top: 8%;
    gap: 30px;
	}
	/* 왼쪽 이미지 섹션 */
  #content-form .left-section {
      flex: 1;
      position: relative;
    }

  #content-form .left-section img {
      width: 600px;
      height: 600px;
      object-fit: cover;
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
		
			$(window).scroll(function(){
			  if($(this).scrollTop() > 300){
			     $("#mainSidebar").addClass("on");
			  }
			  else{
			     $("#mainSidebar").removeClass("on");
			  }
			});
		
			function shareContent() {
			    const shareData = {
			        title: '그린테리어',
			        text: '이 멋진 인테리어를 확인해보세요!',
			        url: window.location.href // 현재 페이지 URL
			    };

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
<body class="content">
<jsp:include page="/include/header.jsp"/>
<div id="content-form" class="container">
	 <div class="left-section">
	  <div class="main-img">
	    <div class="image-container" onmouseover="showHoverImage(this)" onmouseout="showDefaultImage(this)">
	      <!-- 기본 이미지 -->
	      <img src="${ctp}/images/furniture/upload/${vo.thumbnail}" alt="Thumbnail" class="default-img">
	      <!-- Hover 시 표시할 이미지 -->
	      <img src="${ctp}/images/furniture/upload/${vo.titleImg}" alt="Hover Image" class="hover-img" style="display: none;">
	    </div>
	  </div>
	   </div>
	    <!-- 오른쪽 섹션: 상품 정보 -->
	    <div class="right-section">
	      <div class="product-info">
	        <h2>${vo.title}</h2>
	        <p class="price">${vo.price}원</p>
	
	        <div>
	          <label for="option">옵션 선택:</label>
	          <select id="option">
	            <option value="">옵션을 선택해주세요</option>
	            <option value="옵션1">옵션 1</option>
	            <option value="옵션2">옵션 2</option>
	          </select>
	        </div>
	
	        <button type="button">구매하기</button>
	        <button type="button">장바구니 담기</button>
	
	        <div class="icon-container">
	          <i class="fa-regular fa-heart" onclick="toggleLike(${vo.idx}, this)"></i>
	          <i class="fa-solid fa-share-nodes" onclick="shareContent()"></i>
	        </div>
	      </div>
	   </div>
	   <!-- 추가 정보 -->
	      <div class="additional-info">
	        <h3>설치 및 조립 안내</h3>
	        <p>1. 서울, 경기 지역: 설치 및 조립 서비스 진행 (1-2주 소요 예정)</p>
	        <p>2. 그 외 지역: 택배 출고로 진행</p>
	        <hr>
	        <h3>안내 사항</h3>
	        <p>해당 상품은 디밍 기능으로 인해, 스위치 부문에서 미미한 발열이 발생할 수 있습니다.</p>
	      </div>
	   
	  <div class="contain">
	    <div class="title-container">
	        <div class="title">${vo.title}</div>
	    </div>
	    <div class="input-group">
	    	<div class="company input-group-prepend">${vo.company}</div>
		    <div class="trash company"> / </div>
		    <div class="category company input-group-append">${vo.category}</div>
			</div>
	    
	    <div class="sub-img">
	      <img style="width: 100%;" src="${ctp}/images/furniture/upload/${vo.subImg}" alt="보조 이미지">
	    </div>
	    <hr>
	    <div class="see-more">포트폴리오 더보기</div>
	    <div class="grid-container">
	      <c:forEach var="vo1" items="${vos}" varStatus="st">
	      	<c:if test="${vo.idx != vo1.idx}">
			      <a href="FurnitureContent.fu?idx=${vo1.idx}">
			        <div class="grid-item">
			          <img src="${ctp}/images/furniture/upload/${vo1.thumbnail}" alt="Thumbnail">
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
	    <!-- 공유 -->
	    <div class="sidebar-item">
	      <div class="icon-circle" onclick="shareContent()">
	        <i class="fa-solid fa-share-nodes"></i>
	      </div>
	    </div>
	    
	    <!-- 좋아요 -->
	    <div class="sidebar-item">
	      <div class="icon-circle" onclick="toggleLike(${vo.idx}, this)">
	        ${fn:contains(sContentGood, interior+vo.idx) ? "<i class='fa-solid fa-heart'></i>" : "<i class='fa-regular fa-heart'></i>"}
	      </div>
	    </div>
	    
	    <!-- 상담신청 -->
	    <div class="sidebar-item">
	      <div class="icon-circle">
	        <a href="#"><i class="fa-solid fa-comment-dots"></i></a>
	      </div>
	    </div>
	    
	    <!-- 신고 -->
	    <div class="sidebar-item">
	      <div class="icon-circle">
	        <a href="#"><i class="fa-solid fa-user-slash"></i></a>
	      </div>
	    </div>
	    
	    <!-- 수정 -->
	    <c:if test="${sMid == vo.mid}">
		    <div class="sidebar-item">
			    <div class="icon-circle">
			      <a href="FurnitureUpdate.in?idx=${vo.idx}"><i class="fa-solid fa-pencil"></i></a>
			    </div>
		    </div>
	    </c:if>
	    
	    <!-- 삭제 -->
	    <c:if test="${sMid == vo.mid || sLevel == 0}">
		    <div class="sidebar-item">
		      <div class="icon-circle" onclick="DeleteCheck()">
		        <a href="FurnitureDelete.in?idx=${vo.idx}"><i class="fa-regular fa-trash-can"></i></a>
		      </div>
		    </div>
	    </c:if>
		</div>
		
		<!-- 위로가기 버튼 -->
	  <h6 id="topBtn" class="text-right mr-3"><font color="#af9e84"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></font></h6>
  </div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>