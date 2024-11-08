<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
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
	    left: 10px; /* 왼쪽에 위치 (슬라이드 이미지에서 왼쪽 10px) */
	    top: 80%; /* 세로로 3등분 중 1/3 지점으로 위치 */
	    transform: translateY(-20%); /* 정확히 수직으로 가운데로 위치 */
	    background-color: white; /* 스크롤바 색상 */
	    border-radius: 10px; /* 스크롤바 모서리 둥글게 */
	}
	
	/* swiper-slide에 이미지 배경을 채우도록 설정 */
	.swiper-slide img {
	    width: 100%;
	    height: 700px;
	}

</style>
</head>
<body>
		<!-- 본문 영역 -->
		
				<div class="swiper">
						<!-- Additional required wrapper -->
						<div class="swiper-wrapper">
								<!-- Slides -->
								<div class="swiper-slide">
										<img src="${ctp}/images/main1.jpg" alt="Slide 1" />
								</div>
								<div class="swiper-slide">
										<img src="${ctp}/images/main2.jpg" alt="Slide 2" />
								</div>
								<div class="swiper-slide">
										<img src="${ctp}/images/main3.jpg" alt="Slide 3" />
								</div>
								<!-- 추가 슬라이드 -->
						</div>



						<!-- If we need scrollbar -->
						<div class="swiper-scrollbar" style="width: 500px"></div>
				</div>

		<!-- Swiper 초기화 스크립트 -->
		<script>
    var swiper = new Swiper('.swiper', {
      slidesPerView: 1,  // 한 번에 보일 슬라이드 개수
      spaceBetween: 0,   // 슬라이드 간격
      centeredSlides: false,
      scrollbar: {
        el: '.swiper-scrollbar',
        hide: true
      },
      loop: false,         // 무한 루프
      /* effect: 'fade', */
      loopAdditionalSlides: 1,
      autoplay: {
        delay: 2500,      // 자동으로 슬라이드 전환 (밀리초 단위)
        disableOnInteraction: false
      }
    });
  </script>
</body>
</html>
