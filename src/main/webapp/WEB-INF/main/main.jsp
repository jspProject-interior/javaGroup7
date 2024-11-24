<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="${ctp}/images/main/favicon.png">
<title>GRINTERIOR | PROJECT_HMSY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>
<jsp:include page="/include/bs4.jsp" />
<jsp:include page="/include/fonts.jsp" />

	<!-- Swiper CSS -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<style>
	<!-- Custom CSS for Scrollbar Position -->
	/* swiper-container에 상대 위치 설정 */
	.swiper {
	    position: relative;
	}
	
	.mainImgCrop{
		position: relative;
		transform: translate(0%, -10%);		
    overflow: hidden;
	}
	
	.swiper-interior {
    overflow-x: hidden;  /* 가로 스크롤 숨기기 */
	}
	
	.swiper-wrapper {
	    width: 100%;  /* swiper-wrapper 너비를 100%로 설정 */
	}
	
	a:hover{
		text-decoration: none;
	}
	.mainImgCrop img {
		position: relative;
		bottom: 0;
	  width: 100%;
	  height: 663;
	}
	
	.interiorImgCrop {
      background: #fff;
      overflow: hidden;
      text-align: center;
      text-decoration: none;
      position: relative;
      width: 100%;
      height: 400px; /* 원하는 높이 설정 */
      display: flex;
      align-items: center;
      justify-content: center;
  }

  .interiorImgCrop img {
      width: 100%;
      height: 100%;
      object-fit: cover; /* 이미지 크기에 따라 자르기 */
      transition: transform 0.2s ease-in-out; /* 부드러운 확대 효과 */
  }

  .interiorImgCrop img:hover {
      transform: scale(1.1); /* 마우스를 올렸을 때 확대 */
  }
	.interiorImgCrop{
		background: #fff;
      overflow: hidden;
      text-align: center;
      text-decoration: none;
	}
	.mainImgText {
		position: absolute;
		bottom: 40%;
		left: 4.5%;
		color: white;
	}
	.titleEng{
	  font-family: 'TTBookendBatangR';
	  font-size: 25px;
	}
	
	.titleKor{
	  font-family: 'Chosunilbo_myungjo';
	  font-weight: 400;
	  font-size: 40px;
	}
	
	.interior-li{
		display: inline;
	}
	
	.blank{
		height: 100px;
		width: 100%;
	}
	
	.interiorText{
		color: black;
		margin-top: 5px;
		font-size: 12px;
		font-weight: bold;
		font-family: 'EliceDigitalBaeum-Bd';
		text-decoration: none;
	}
	
	.interiorText:hover{
		text-decoration: none;
	}
	
	#MAGAZINE{
		font-family: 'GowunBatang-Regular';
		font-size: 20px;
	}
	
	
	.grid-container {
	  display: grid;
	  grid-template-columns: auto 300px;
	  gap: 30px;
	  padding: 20px;
	  margin: 0 3.5%;
	  height: 500px;
	}
	
	.grid-item {
	  background-color: rgba(255, 255, 255, 0.8);
	  text-align: center;
	  padding: 20px;
	  font-size: 30px;
	  border-radius: 30px;
	  color: white;
	  display: flex; /* 플렉스 박스 활성화 */
	  align-items: center; /* 수직 가운데 정렬 */
	  justify-content: center; /* 수평 가운데 정렬 */
	  font-family: 'GowunBatang-Regular';
	  
	}
	.grid-item a {
    text-decoration: none; /* 기본적으로 밑줄 제거 */
    color: white;
		}
	
	.item1, .item2, .item3, .item4 {
  background-image: url("${ctp}/images/main/mainF.jpg");
  background-size: 320%; /* 전체 이미지가 4개의 셀로 나뉘게 설정 */
  background-repeat: no-repeat; /* 배경 이미지 반복 제거 */
  
}

.item1 {
  grid-column: 1;
  grid-row: 1 / span 2;
  background-position: 12% 55%; /* 이미지의 왼쪽 상단 부분 */
}

.item2 {
  grid-column: 2 / span 2;
  grid-row: 1 / span 2;
  background-position: 55% 63%; /* 이미지의 중앙 상단 부분 */
}

.item3 {
  grid-column: 4;
  grid-row: 1;
  background-position: 100% 20%; /* 이미지의 오른쪽 상단 부분 */
}

.item4 {
  grid-column: 4;
  grid-row: 2;
  background-position: 100% 70%; /* 이미지의 오른쪽 하단 부분 */
}
	/*tobBtn*/
	h6 {
			position: fixed;
			right: 1rem;
			bottom: -50px;
			transition: 0.7s ease;
		}
		h6.on {
			opacity: 0.8;
			cursor: pointer;
			bottom: 0;
		}
		#mainBtnContainer{
			font-family: "Playfair Display", serif;
			position: absolute;
			bottom: 30%;
			left: 4.5%;
			z-index: 10;
			font-weight: 500;
		}
		#mainBtnContainer a{
		 text-decoration: none;
		}
		.mainBtn{
			color: white;
			padding: 0 50px;
		}
		.mainBtnBack{
			background-color: #af9e84;
			padding: 12px 0;
		}
		.mainBtnBack i{
			padding-left: 10px; 
		}
		.swiper-slide:hover{
			text-decoration: none;
		}
		.swiper-slide a {
    text-decoration: none; /* 기본적으로 밑줄 제거 */
		}
		
		.swiper-slide a:hover {
		    text-decoration: none; /* 마우스를 올려도 밑줄 제거 */
		}
		
		.interiorTextSub{
	    color: #95a5a6;
		}
		
		/* Fixed Sidebar */
	.fixed-sidebar {
      position: fixed;
      top: 40%;
      right: -160px;;
      width: 130px;
      background-color: #fff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
      z-index: 1000;
      text-align: center;
      transition: 0.7s ease;
    }
    .fixed-sidebar.on {
    	right: 10px; /* 화면 안쪽으로 이동 */
		}

    .sidebar-item {
      padding: 20px 10px ;
      border-bottom: 1px solid #eee;
      cursor: pointer;
    }

    .sidebar-item:last-child {
      border-bottom: none;
    }

    .sidebar-item:hover {
      background-color: #f9f9f9;
      border-radius: 8px;
    }

    .sidebar-item h4 {
      font-size: 14px;
      color: #333;
      margin: 5px 0 0 0;
    }

    .sidebar-item p {
      font-size: 12px;
      color: #888;
    }

    .menu-arrow {
		    position: fixed;
		    top: 80px;
		    right: 3.9%;
		    font-size: 24px;
		    color: white;
		    animation: bounce 1.5s infinite; /* 애니메이션 */
		    z-index: 1000;
		    font-family: 'EliceDigitalBaeum-Bd';
		}
		
		/* 화살표 점프 애니메이션 */
		@keyframes bounce {
		    0%, 100% {
		        transform: translateY(0);
		    }
		    50% {
		        transform: translateY(-10px);
		    }
		}
</style>
<script>
	'use strict'
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
		     $("#mainSidevar").addClass("on");
		  }
		  else{
		     $("#mainSidevar").removeClass("on");
		  }
		});
	
	
		document.addEventListener('DOMContentLoaded', () => {
		    const menuArrow = document.getElementById('menuArrow');
		    if (menuArrow) {
		        menuArrow.addEventListener('click', () => {
		            menuArrow.style.display = 'none';
		        });
		    }
		});
	
</script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<div>
<!-- header -->
<jsp:include page="/include/mainHeader.jsp"/>

<c:if test="${empty sMid}">
    <div id="menuArrow" class="menu-arrow">
        로그인
        <i class="fa-solid fa-arrow-up"></i>
    </div>
</c:if>
	<!-- 본문 영역 -->
<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main/main1.jpg" alt="Slide 1" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">HOME STYLING</div>
					<div class="titleKor">전문가가 제안하는<br>최고의 가구 경험</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main/main2.jpg" alt="Slide 2" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">HIGH-END STYLING</div>
					<div class="titleKor">프리미엄 공간<br>나만의 고요한 안식처</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main/main3.jpg" alt="Slide 3" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">PREMIUM STYLING</div>
					<div class="titleKor">한남더힐<br>꿈의 집 미리보기</div>
				</div>
			</div>
		</div>
		<div id="mainBtnContainer" class="input-group">
			<a href="Interior.in?category=ALL">
				<div class="mainBtnBack" style="border-radius: 0 0 0 10px;">
					<span class="mainBtn">INTERIOR<i class="fa-solid fa-circle-arrow-right"></i></span>
				</div>
			</a>
			<a href="Furniture.fu?category=ALL" style="padding-left: 5px;">
				<div class="mainBtnBack" style="border-radius: 0 10px 0 0;">
					<span class="mainBtn">FURNITURE<i class="fa-solid fa-cart-arrow-down"></i></span>
				</div>
			</a>
		</div>
	</div>


		<!-- Swiper 초기화 스크립트 -->
		<script>
			var swiper = new Swiper('.swiper', {
				  slidesPerView: 1,  // 한 번에 보일 슬라이드 개수
				  spaceBetween: 0,   // 슬라이드 간격
				  centeredSlides: true, // 슬라이드가 중앙에 오지 않도록 설정
				  loop: true,         // 무한 루프
				  loopAdditionalSlides: 1,
				  autoplay: {
				    delay: 2500,      // 자동으로 슬라이드 전환 (밀리초 단위)
				    disableOnInteraction: false
				  }
				});
  </script>
	
	<!-- 가구 -->
	<div class="grid-container">
	  <div class="grid-item item1"><a href="Furniture.fu?category=SOFA"><b>SOFA</b></a></div>
	  <div class="grid-item item2"><a href="Furniture.fu?category=ALL"><b>FURNITURE</b></a></div>
	  <div class="grid-item item3"><a href="Furniture.fu?category=LAMP"><b>LAMP</b></a></div>  
	  <div class="grid-item item4"><a href="Furniture.fu?category=BED"><b>BED</b></a></div>
	</div>
	
	<div class="blank"></div>
	
	<!-- 인테리어 -->
	<div style="padding-left: 4.5%">
		<div id="MAGAZINE" style="padding-bottom: 10px; font-size: 30px;"><b>GRINTERIOR MAGAZINE</b></div>
	
		<div class="swiper-interior">
    <div class="swiper-wrapper">
        <c:forEach var="inVO" items="${inVOS}" varStatus="st">
            <div class="swiper-slide">
                <a href="InteriorContent.in?idx=${inVO.idx}">
                    <div class="interiorImgCrop">
                        <img src="${ctp}/images/interior/upload/${inVO.thumbnail}" alt="Slide ${st.count}" />
                    </div>
                    <div class="interiorText">${inVO.title}</div>
                    <div class="input-group">
                        <div class="interiorText interiorTextSub input-group-prepend">${inVO.company} |</div>
                        <div class="interiorText interiorTextSub input-group-append ml-1"> ${inVO.category}</div>
                    </div>
                </a>
            </div>
        </c:forEach>
    	</div>
		</div>
	</div>
</div>
<!-- <!-- Swiper 초기화 스크립트 -->
<script>
	var swiper = new Swiper('.swiper-interior', {
		  slidesPerView: 5,  // 한 번에 보일 슬라이드 개수
		  spaceBetween : 20,
		  loopAdditionalSlides : 1,
		  loop: true,         // 무한 루프
		  autoplay: {
		    delay: 2000,      // 자동으로 슬라이드 전환 (밀리초 단위)
		    disableOnInteraction: false
		  }
		});
</script>
	
	<div class="blank"></div>
	
	<!-- Fixed Sidebar -->
	<div class="fixed-sidebar" id="mainSidevar">
		<div class="sidebar-item" onclick="location.href='Calculator.ap'">
			<font color="#af9e84" size="6em"><i class="fa-solid fa-calculator"></i></font>
			<h4>견적 계산기</h4>
		</div>
		<div class="sidebar-item">
			<h4>최근 본 공간</h4>
			<p>최근 본 공간이 없습니다.</p>
		</div>
	</div>
	
	<!-- 위로가기 버튼 -->
  <h6 id="topBtn" class="text-right mr-3"><font color="#af9e84"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></font></h6>					




<!-- footer -->
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
