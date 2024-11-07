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
    /* left: 10px; */
    top: 60%;
    transform: translateY(-20%);
    width: 5px;
    /* height: 50%;  /* 화면 높이의 30%로 설정 */ */
    /* background-color: rgba(0, 0, 0, 0.5); */
    border-radius: 10px;
	}
</style>
</head>
<body>
		<!-- 본문 영역 -->
		<div class="container-fluid">
				<div class="swiper">
						<div class="swiper-wrapper">
								<div class="swiper-slide">
										<img src="${ctp}/images/11.jpg" alt="Slide 1" />
								</div>
								<div class="swiper-slide">
										<img src="${ctp}/images/12.jpg" alt="Slide 2" />
								</div>
								<div class="swiper-slide">
										<img src="${ctp}/images/13.jpg" alt="Slide 3" />
								</div>
						</div>



						<div class="swiper-scrollbar"></div>
				</div>
		</div>

	<script>
    var swiper = new Swiper('.swiper', {
      slidesPerView: 1,  // 한 번에 보일 슬라이드 개수
      spaceBetween: 10,   // 슬라이드 간격
      scrollbar: {
        el: '.swiper-scrollbar',
        hide: true
      },
      loop: true,         // 무한 루프
      autoplay: {
        delay: 2500,      // 자동으로 슬라이드 전환 (밀리초 단위)
        disableOnInteraction: false
      }
    });
	</script>
</body>
</html>
