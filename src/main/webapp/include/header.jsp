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
      position: fixed;
      width: 100%;
      z-index: 100;
      top: 0;
      left: 0;
      color: var(--color-dark-gray);
      background: linear-gradient(to top, rgba(255, 255, 255, 0) 0%, rgba(0, 0, 0, 0.3) 100%);
      transition: background-color 0.5s ease-in-out, color 0.5s ease-in-out;
      padding: 1%;
    }

    .nav {
      list-style: none;
      display: flex;
    }

    .Logo {
		  font-family: "Playfair Display", serif;
		  font-size: 30px;
		  color: white; /* 기본 글자 색상 */
		  text-decoration: none; /* 기본 밑줄 제거 */
		}
		
		.Logo:hover {
		  color: white; /* 마우스를 올려도 색상 변화 없음 */
		  text-decoration: none; /* 밑줄 제거 */
		}
		
    .menu {
      cursor: pointer;
      width: 25px;
      height: 30px;
      position: relative;
    }

    .menu .bar {
      width: 25px;
      height: 3px;
      background-color: white;
      margin: 6px 0;
      transition: 0.3s ease-in-out;
    }
    .nav a {
      text-decoration: none;
      color: white;
      transition: color 0.5s ease-in-out;
      font-family: 'EliceDigitalBaeum-Bd';
      font-size: 20px;
    }

    .nav a:hover {
      color: white;
      text-decoration: none;
    }
    #navbar.fixed {
      background: white;
      color: black;
    }
    #navbar.fixed a {
      color: black;
    }
    #navbar.fixed .nav a {
      color: black;
    }
    #navbar.fixed .menu .bar {
      background-color: black;
    }

    .menu.active .bar:nth-child(2) {
      opacity: 0;
    }

    .menu.active .bar:first-child {
      transform: rotate(45deg);
      position: absolute;
      top: 3px;
      left: 0;
    }

    .menu.active .bar:last-child {
      transform: rotate(-45deg);
      position: absolute;
      top: 3px;
      left: 0;
    }

    .side-menu {
      position: fixed;
      right: -1100px;
      height: calc(100%);
      width: 1100px;
      background-color: white;
      overflow-x: hidden;
      transition: right 0.3s ease-in-out;
      z-index: 99;
      opacity: 70%;
    }

    .side-menu.open {
      right: 0;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0, 0, 0, 0.5);
      display: none;
      z-index: 98;
    }

    .overlay.active {
      display: block;
    }
    
    
  </style>
  <script type="text/javascript">
  document.addEventListener("DOMContentLoaded", function() {
	  // 햄버거 버튼 클릭 시 메뉴와 배경 토글
	  function toggleSidebar() {
	    const menu = document.querySelector(".menu");
	    const sideMenu = document.querySelector(".side-menu");
	    const overlay = document.querySelector(".overlay");

	    // 햄버거 아이콘과 메뉴 상태를 토글
	    menu.classList.toggle("active");
	    sideMenu.classList.toggle("open");
	    overlay.classList.toggle("active");
	  }

	  // 배경 클릭 시 메뉴 닫기
	  document.querySelector(".overlay").addEventListener("click", function() {
	    const menu = document.querySelector(".menu");
	    const sideMenu = document.querySelector(".side-menu");
	    const overlay = document.querySelector(".overlay");

	    // 메뉴와 배경 숨기기
	    menu.classList.remove("active");
	    sideMenu.classList.remove("open");
	    overlay.classList.remove("active");
	  });

	  // 네비게이션바 고정 처리 (스크롤에 따라)
	  const navbar = document.querySelector("#navbar");
	  document.addEventListener("scroll", () => {
	    const scrollY = window.scrollY;
	    if (scrollY > 40) {
	      navbar.classList.add("fixed");
	    } else {
	      navbar.classList.remove("fixed");
	    }
	  });

	  // 햄버거 버튼 클릭 시 메뉴 열고 닫기
	  const menuButton = document.querySelector(".menu");
	  if (menuButton) {
	    menuButton.addEventListener("click", toggleSidebar);
	  }
	});

</script>

</head>
<body>
  <header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="row">
      <nav class="main-nav" id="navbar">
        <a href="#" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a>
        <ul class="nav" style="padding-top:0.5%; padding-left:5%; padding-right: 30%;">
          <li class="nav_menu"><a href="#" class="active">인테리어</a></li>
          <li class="nav_menu" style="padding: 0 50px;"><a href="#">가구</a></li>
          <li class="nav_menu"><a href="#">컨설팅 사례</a></li>
        </ul>
        <ul class="nav" style="padding-top:0.5%; padding-right: 3%;">
          <li><a href="#"><i class="fa-solid fa-magnifying-glass fa-lg"></i></a></li>
          <li><a href="#" style="padding: 0 20px;"><i class="fa-solid fa-cart-shopping fa-lg"></i></a></li>
          <li><a href="#" style="padding-right:20px;"><i class="fa-regular fa-heart fa-lg"></i></a></li>
          <li>
            <div class="pv-box">
              <div class="container" style="padding-left: 5px;">
                <div class="menu menu-icon" onclick="toggleSidebar()">
                  <div class="bar"></div>
                  <div class="bar"></div>
                  <div class="bar"></div>
                </div>
              </div>
            </div>
          </li>
        </ul>
      </nav>
    </div>
  </header>

  <div class="overlay"></div>

  <div class="side-menu">
  
  
  </div>

</body>
</html>