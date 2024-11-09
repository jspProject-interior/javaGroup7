<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>header.jsp</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/fonts.jsp"/>
	<style>
		#navbar {
		  display: flex;
		  justify-content: space-between;
		  position: fixed; /* 네비게이션 바를 고정 */
		  width: 100%;
		  z-index: 100; /* 다른 요소들보다 위에 표시 */
		  top: 0; /* 페이지 상단에 고정 */
		  left: 0; /* 좌측 끝에 고정 */
		  color: var(--color-dark-gray);
		  background: linear-gradient(to top, rgba(255, 255, 255, 0) 0%, rgba(0, 0, 0, 0.3) 100%); /* 스크롤 전에는 투명 */
		  transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out; /* 배경색과 텍스트 색 전환 애니메이션 */
		  padding: 1%;
		}
		
		.nav li {
		  margin: 0 10px;
		}
		
		/* 스크롤 200px 이상일 때 배경색 흰색으로 변경 */
		#navbar.fixed {
		  background: white;
		  color: black; /* 배경이 흰색일 때 텍스트 색상을 검정으로 변경 */
		}
		
		/* 네비게이션 메뉴 스타일 */
		.nav {
		  list-style: none;
		  display: flex;
		  padding-top: 7px;
		}

		.nav a {
		  text-decoration: none;
		  color: white;
		  transition: color 0.5s ease-in-out;
		  font-family: 'EliceDigitalBaeum-Bd';
		  font-size: 20px;
		}
		
		.Logo{
			font-family: "Playfair Display", serif;
		  font-optical-sizing: auto;
		  font-weight: 500;
		  font-style: normal;
		  font-size: 25px;
		  color: white;
		}

		/* 스크롤 시 텍스트 색상 변경 */
		#navbar.fixed a {
		  color: black; /* 배경이 흰색일 때 아이콘 색상은 검정 */
		}
		#navbar.fixed .nav a {
		  color: black; /* 배경이 흰색일 때 링크 색상은 검정 */
		}
		#navbar.fixed .nav i {
		  color: black; /* 배경이 흰색일 때 아이콘 색상은 검정 */
		}
		
	</style>
</head>
<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
	  <div class="row">
      <nav class="main-nav" id="navbar">
        <!-- ***** 로고 ***** -->
        <a href="#" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a> 
        <!-- ***** 메뉴 ***** -->
        <ul class="nav" style="padding-left:0; padding-right: 30%;">
          <li class="nav_menu"><a href="#" class="active">인테리어</a></li>
          <li class="nav_menu"><a href="#">가구</a></li>
          <li class="nav_menu"><a href="#">컨설팅 사례</a></li>
        </ul>
        <ul class="nav" style="padding-right: 4.5%;">
          <li><a href="#"><i class="fa-solid fa-magnifying-glass"></i></a></li>
          <li><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
          <li><a href="#"><i class="fa-regular fa-heart"></i></a></li>
          <li><a href="#"><i class="fa-regular fa-user"></i></a></li>
          <li><a href="#"><i class="fa-solid fa-bars"></i></a></li>
        </ul>
      </nav>
    </div>
	</header>
	<!-- ***** Header Area End ***** -->
	
	<script>
		// 네비게이션 바를 선택
	  const navbar = document.querySelector("#navbar");
	
	  // 스크롤 이벤트 리스너
	  document.addEventListener("scroll", () => {
	    const scrollY = window.scrollY; // 현재 스크롤 위치
	    // 스크롤이 200px 이상이면 'fixed' 클래스를 추가하여 배경색을 흰색으로 변경
	    if (scrollY > 40) {
	      navbar.classList.add("fixed");
	    } else {
	      navbar.classList.remove("fixed");
	    }
	  });
	</script>
</body>
</html>
