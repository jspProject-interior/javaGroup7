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
  <script type="text/javascript" src="${ctp}/js/headerJs.js"></script>
  <style>
    #navbar {
      display: flex;
      justify-content: space-between;
      position: fixed;
      width: 100%;
      z-index: 0;
      top: 0;
      left: 0;
      color: var(--color-dark-gray);
      padding: 1%;
    }

    .nav {
      list-style: none;
      display: flex;
    }

    .Logo {
        font-family: "Playfair Display", serif;
        font-size: 30px;
        color: black; /* 기본 글자 색상 */
        text-decoration: none; /* 기본 밑줄 제거 */
      }
      
    .Logo:hover {
      color: black; /* 마우스를 올려도 색상 변화 없음 */
      text-decoration: none; /* 밑줄 제거 */
    }
      
    .menu {
      cursor: pointer;
      width: 25px;
      height: 30px;
      position: relative;
    }

    .menu .bar { /*햄버거 바*/
      width: 25px;
      height: 3px;
      background-color: black;
      margin: 6px 0;
    }
    .nav a {
      text-decoration: none;
      color: black;
      transition: color 0.5s ease-in-out;
      font-family: 'EliceDigitalBaeum-Bd';
      font-size: 20px;
    }

    .nav a:hover {
      color: black;
      text-decoration: none;
    }
    .menu-icon{
    	color:black;
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

    .side-menu-login {
      position: fixed;
      right: -400px;
      height: calc(100%);
      width: 400px;
      background-color: white;
      overflow-x: hidden;
      transition: right 0.3s ease-in-out;
      z-index: 99;
    }

    
    .side-menu-login.open {
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
    
     i.fa {
       width: 100%;
       height: 100%;
       position: absolute;
       top: 0;
       left: 0;
       line-height: 60px;
       transform: scale(0) rotate(-45deg);
       -webkit-transform: scale(0) rotate(-45deg);
       -ms-transform: scale(0) rotate(-45deg);
     }
 
     &:hover {
       color: #8a7c66;
       border-color: #8a7c66;
     }
   }
     
   body {
     background-position: center;
     background-size: cover;
     background-repeat: no-repeat;
     min-height: 100vh;
     font-family: 'Roboto', sans-serif;
   }
   
   
   * {
     -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
     box-sizing: border-box;
     margin: 0;
     padding: 0;
     text-decoration: none;
     list-style-type: none;
     outline: none;
   
     &:after, &::before {
       -webkit-box-sizing: border-box;
       -moz-box-sizing: border-box;
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       text-decoration: none;
       list-style-type: none;
       outline: none;
     }
   }
   
   .menu-list {
	    display: flex;
	    flex-wrap: wrap;
		}
	
		.menu-list li {
		    width: 45%; /* 각 항목이 2개씩 한 행에 배치되도록 설정 */
		    list-style: none;
		}
		
		.menu-list a {
	    text-decoration: none;
	    display: block;
	    color: black;
		}
		
		.menu-list a:hover {
	    text-decoration: none;
	    color: black;
		}
		
		.sideTitle{
			color: gray;
			margin-bottom: 15px;
		}
		
		#ml a{
			color: black;
			text-decoration: none;
			margin-bottom: 10px;
		}
		
		.container{
			font-size: 15px;
			font-family: 'SUIT-Regular';
		}
		
		.mainMenu li{
			margin-bottom: 20px;
			font-weight: bold;
		}
		.mainMenu a{
			color: black;
			text-decoration: none;
		}
		.mainMenu a:hover{
			color: black;
			text-decoration: none;
		}
		.sideTitle a{
			color: gray;
			text-decoration: none;
		}
		.sideTitle a:hover{
			color: gray;
			text-decoration: none;
		}
  </style>
</head>
<body>
  <header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
    <div class="row">
      <nav class="main-nav" id="navbar">
        <a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a>
        <ul class="nav" style="padding-top:0.5%; padding-left:5%; padding-right: 30%;">
          <li class="nav_menu"><a href="Interior.in" class="active">인테리어</a></li>
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
  
	  <div class="side-menu-login">
	  	<div class="container" style="width: 80%; margin-top: 35%;">
	  		<div>
		  		<div class="sideTitle">GRINTERIOR</div>
		  		<ul class="mainMenu">
		  			<li><a href="">서비스 소개</a></li>
		  			<li><a href="">가구 쇼핑</a></li>
		  			<li><a href="">컨설팅 사례</a></li>
		  		</ul>
	  		</div>
	  		<hr>
	  		<div>
		  		<div class="sideTitle">마이페이지</div>
		  		<ul class="menu-list" id="ml">
		  			<li><a href="">내 정보</a></li>
		  			<li><a href="">관심목록</a></li>
		  			<li><a href="">구매내역</a></li>
		  			<li><a href="">장바구니</a></li>
		  		</ul>
	  		</div>
	  		<hr>
	  		<div>
		  		<div class="sideTitle">문의사항</div>
		  		<ul class="menu-list" id="ml">
		  			<li><a href="">배송관련</a></li>
		  			<li><a href="">비용/결제/환불</a></li>
		  			<li><a href="">취소/교환/반품</a></li>
		  			<li><a href="">서비스/일반</a></li>
		  		</ul>
	  		</div>
	  		<div>
	  		<hr>
		  		<div class="input-group" style="display: flex; justify-content: space-between; width: 100%;">
			  		<div class="sideTitle"><a href="MemberLogout.mem">로그아웃</a></div>
			  		<c:if test="${sLevel == 0}"><div class="sideTitle"><a href="admin.ad">관리자</a></div></c:if>
		  		</div>
	  		</div>
	    </div>
	  </div>
</body>
</html>