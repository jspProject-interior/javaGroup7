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
<jsp:include page="/include/fonts.jsp" />

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
		margin-top: 5px;
		font-size: 12px;
		font-weight: bold;
		font-family: 'EliceDigitalBaeum-Bd';
	}
	
	#MAGAZINE{
		font-family: 'GowunBatang-Regular';
		font-size: 20px;
	}
	.grid-container {
	  display: grid;
	  gap: 10px;
	  background-color: #2196F3;
	  padding: 10px;
	  margin: 4%;
	}
	
	.grid-item {
	  background-color: rgba(255, 255, 255, 0.8);
	  text-align: center;
	  padding: 20px;
	  font-size: 30px;
	}
	
	.item1 {
	  grid-column: 1;
	  grid-row: 1 / span 2;
	}
	
	.item2 {
	  grid-column: 2 / span 2;
	  grid-row: 1 / span 2;
	}
	
	.item3 {
	  grid-column: 4;
	  grid-row: 1;
	}
	.item4 {
	  grid-column: 4;
	  grid-row: 2;
	}
	
	.item5 {
	  grid-column: 1 / span 3;
	  grid-row: 3;
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
					<div class="titleEng">HOME STYLING</div>
					<div class="titleKor">전문가가 제안하는<br>최고의 가구 경험</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main2.jpg" alt="Slide 2" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">HIGH-END STYLING</div>
					<div class="titleKor">프리미엄 공간<br>나만의 고요한 안식처</div>
				</div>
			</div>
			<div class="swiper-slide">
				<div class="mainImgCrop">
					<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
				</div>
				<div class="mainImgText">
					<div class="titleEng">PREMIUM STYLING</div>
					<div class="titleKor">한남더힐<br>꿈의 집 미리보기</div>
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
	<div class="grid-container">
	  <div class="grid-item item1">11</div>
	  <div class="grid-item item2">2</div>
	  <div class="grid-item item3">3</div>  
	  <div class="grid-item item4">4</div>
	</div>
	
	<div class="blank"></div>
	
	<!-- 인테리어 -->
	<div style="padding-left: 4.5%">
		<div id="MAGAZINE" style="padding-bottom: 10px; font-size: 30px;"><b>GRINTERIOR MAGAZINE</b></div>
	
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
