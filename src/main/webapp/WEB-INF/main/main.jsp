<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="${ctp}/images/favicon.png">
<title>GRINTERIOR | PROJECT_HMSY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<jsp:include page="/include/bs4.jsp" />

	<!-- Swiper CSS -->
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

	<!-- Swiper JS -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

<!-- Custom CSS for Scrollbar Position -->
<style>
	/* swiper-container에 상대 위치 설정 */
	.swiper {
	    position: relative;
	}
	
	.swiper-scrollbar {
	    position: absolute;
	    left: 10px;
	    top: 60%;
	    background-color: white;
	    border-radius: 10px;
	    height: 1px;
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
	
	.mainImgCrop img {
		position: relative;
		bottom: 0;
	  width: 100%;
	  height: 663;
	}
	
	.interiorImgCrop img {
	  width: 300px;
	  height: 400px;
	}
	
	.mainImgText{
		position: absolute;
		bottom: 40%;
		left: 5%;
	}
	
	.interior-li{
		display: inline;
	}
	.blank{
		height: 100px;
		width: 100%;
	}
	
	.interiorText{
		margin-top: 5px;
		font-size: 12px;
		font-weight: bold;
	}
</style>
</head>
<body>
<div>
<!-- header -->
<jsp:include page="/include/header.jsp"/>
	<!-- 본문 영역 -->
<div class="swiper">
		<div class="swiper-wrapper">
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main1.jpg" alt="Slide 1" />
				</div>
				<div class="mainImgText">
					<p class="text-2xl font-normal text-white">HOME STYLING</p>
					<h2 class="text-5xl font-normal css-1iydhhf text-white">전문가가 제안하는<br>최고의 가구 경험</h2>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main2.jpg" alt="Slide 2" />
				</div>
				<div class="mainImgText">
					<p class="text-2xl font-normal text-white">HIGH-END STYLING</p>
					<h2 class="text-5xl font-normal css-1iydhhf text-white">프리미엄 공간<br>나만의 고요한 안식처</h2>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
				</div>
				<div class="mainImgText">
					<p class="text-2xl font-normal text-white">PREMIUM STYLING</p>
					<h2 class="text-5xl font-normal css-1iydhhf text-white">한남더힐<br>꿈의 집 미리보기</h2>
				</div>
			</div>
		
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
	<div>
		
	</div>
	
	<div class="blank"></div>
	
	<!-- 인테리어 -->
	<div style="padding-left: 4.5%">
		<div style="padding-bottom: 10px; font-size: 30px;"><b>GRINTERIOR MAGAZINE</b></div>
	
		<div class="swiper-interior">
			<div class="swiper-wrapper">
				<div class="swiper-slide">
					<div class="interiorImgCrop">
						<img src="${ctp}/images/main1.jpg" alt="Slide 1" />
					</div>
					<div class="interiorText">2024년도 인테리어 트렌드 4가지</div>
				</div>
				<div class="swiper-slide">
					<div class="interiorImgCrop">
						<img src="${ctp}/images/main2.jpg" alt="Slide 2" />
					</div>
					<div class="interiorText">2024년도 인테리어 트렌드 4가지</div>
				</div>
				<div class="swiper-slide">
					<div class="interiorImgCrop">
						<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
					</div>
					<div class="interiorText">2024년도 인테리어 트렌드 4가지</div>
				</div>
				<div class="swiper-slide">
					<div class="interiorImgCrop">
						<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
					</div>
					<div class="interiorText">2024년도 인테리어 트렌드 4가지</div>
				</div>
				<div class="swiper-slide">
					<div class="interiorImgCrop">
						<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
					</div>
					<div class="interiorText">2024년도 인테리어 트렌드 4가지</div>
				</div>
				<div class="swiper-slide">
					<div class="interiorImgCrop">
						<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
					</div>
						<div class="interiorText">2024년도 인테리어 트렌드 4가지</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="blank"></div>
	
						


<!-- <!-- Swiper 초기화 스크립트 -->
<script>
	var swiper = new Swiper('.swiper-interior', {
		  slidesPerView: 5,  // 한 번에 보일 슬라이드 개수
		  spaceBetween : 0,
		  loopAdditionalSlides : 1,
		  loop: false,         // 무한 루프
		  autoplay: {
		    delay: 2500,      // 자동으로 슬라이드 전환 (밀리초 단위)
		    disableOnInteraction: false
		  }
		});
</script>


<!-- footer -->
<jsp:include page="/include/footer.jsp"/>
</body>
</html>
