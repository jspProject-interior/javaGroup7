<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>header.jsp</title>
<jsp:include page="/include/bs4.jsp"/>
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
	  background-color: transparent; /* 스크롤 전에는 투명 */
	  transition: background-color 0.5s ease-in-out; /* 배경색 전환 애니메이션 */
	  padding: 1%;
	}
	
	/* 스크롤 200px 이상일 때 배경색 흰색으로 변경 */
	#navbar.fixed {
	  background-color: white;
	}
	
	/* 네비게이션 메뉴 스타일 */
	.nav {
	  list-style: none;
	  display: flex;
	}
	
	.nav li {
	  margin: 0 15px;
	}
	
	.nav a {
	  text-decoration: none;
	  color: var(--color-dark-gray);
	}
</style>
</head>
<body>
	<!-- ***** Header Area Start ***** -->
	<header class="header-area header-sticky wow slideInDown animated" data-wow-duration="0.75s" data-wow-delay="0s">
	  <div class="row">
	    <div class="col">
	      <nav class="main-nav" id="navbar">
	        <!-- ***** 로고 ***** -->
	        <a href="#" class="Logo">GRINTERIOR</a> 
	        <!-- ***** 메뉴 ***** -->
	        <ul class="nav">
	          <li><a href="#" class="active">인테리어</a></li>
	          <li><a href="#">가구</a></li>
	          <li><a href="#">컨설팅 사례</a></li>
	          <li><a href="#">검색</a></li>
	          <li><a href="#">장바구니</a></li>
	          <li><a href="#">관심목록</a></li>
	          <li><a href="#">로그인</a></li>
	          <li><a href="#">메뉴</a></li>
	        </ul>
	      </nav>
	    </div>
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
	    if (scrollY > 200) {
	      navbar.classList.add("fixed");
	    } else {
	      navbar.classList.remove("fixed");
	    }
	  });
	</script>
</body>
</html>