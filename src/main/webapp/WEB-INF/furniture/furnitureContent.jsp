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
    .content {
      font-family: 'Arial', sans-serif;
      overflow-x: hidden;
    }
    
    .main-img {
      width: 100%;
      height: 600px;
      background-color: #2f2f2f;
      display: flex;
      align-items: center;
      justify-content: center;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      margin-bottom: 30px;
    }
    .main-img img {
      width: 90%;
      height: 100%;
    }

    .contain {
    	width: 100%;
      max-width: 900px;
      margin: auto;
      background-color: #fff;
      padding: 0;
	    overflow: hidden;
    }
    .category {
	  	padding-left: 20px;
	  }
	  
    .contain .title {
      font-size: 2em;
      font-weight: bold;
      color: #333;
    }
    
    .contain .company, .container .category {
      font-size: 1.1em;
      color: #666;
      margin-bottom: 5px;
    }
    
    .sub-img {
      text-align: center;
      margin-top: 20px;
      width: 100%;
    }
    
    .grid-container {
		  display: grid;
		  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
		  gap: 10px;
		  width: 100%;
		}
		
		.grid-item {
		  width: 100%;
		  aspect-ratio: 1 / 1;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: flex-start;
		  border-radius: 5px;
		  overflow: hidden;
		}
		
		.grid-item img {
		  width: 100%;
		  height: auto;
		  object-fit: cover;
		  flex-shrink: 0;
		}
		
		.grid-item .title-grid {
		  font-size: 16px;
		  font-weight: bold;
		  margin-top: 10px;
		  color: #333;
		  text-align: center;
		  white-space: nowrap;
		  overflow: hidden;
		  text-overflow: ellipsis;
		  display: block;
	    width: 100%;
		}
		
		.grid-item .company-category {
		  font-size: 14px;
		  color: #777;
		  text-align: center;
		  margin-bottom: 10px;
		  text-decoration: none;
		}
		.grid-item {
		  width: 100%;
		  height: 250px;
		}
		.grid-item img {
		  height: 70%;
		}
		.grid-item img {
			-webkit-transform: scale(1);
			transform: scale(1);
			transition: .5s ease-in-out;
		}
		.grid-item:hover img {
			transform: scale(1.05);
		}
		.grid-container a {
		  text-decoration: none;
		  color: inherit;
		}
		
		.grid-container a:hover {
		  text-decoration: none;
	  }




	.contain .company {
    font-size: 1.2em;
    color: #95a5a6;
    margin-bottom: 20px;
    text-align: center;
    font-style: italic;
	}
	
	.contain .trash{
		padding-left: 20px;
		align-items: center;
	}

		.contain hr {
		    border: 0;
		    height: 1px;
		    background: linear-gradient(to right, #bdc3c7, #2c3e50);
		    margin: 20px 0;
		}
		.see-more{
			font-size: 23px;
		  font-weight: bold;
		  margin-top: 10px;
		  color: #333;
		  padding-bottom: 20px;
		}
		h6 {
			position: fixed;
			right: 1rem;
			bottom: -100px;
			transition: 0.7s ease;
		}
		h6.on {
			opacity: 0.8;
			cursor: pointer;
			bottom: 15px;
			z-index: 10;
		}
		
			
		
		.fixed-sidebar {
	    position: fixed;
	    top: 20%;
	    right: -120px;
	    width: 120px;
	    flex-direction: column;
	    align-items: center;
	    background: none;
	    z-index: 50;
	    gap: 20px;
	    opacity: 0;
	    transition: 0.5s ease-in-out;
		}
		
		.fixed-sidebar.on {
	    right: 10px;
	    opacity: 1;
		}
	
		
		.sidebar-item {
	    text-align: center;
	    cursor: pointer;
		}
		
		.icon-circle {
	    width: 60px;
	    height: 60px;
	    border-radius: 50%;
	    background-color: #ffffff;
	    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    transition: transform 0.3s ease, box-shadow 0.3s ease;
	    margin-bottom: 20px;
		}
		
		.icon-circle i {
		    font-size: 25px;
		    color: #333;
		}
		
		.icon-circle:hover {
	    transform: scale(1.1);
	    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.3);
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
  </script>
</head>
<body class="content">
<jsp:include page="/include/header.jsp"/>
  <div class="main-img">
    <img src="${ctp}/images/interior/upload/${vo.titleImg}" alt="${vo.title}">
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
      <img style="width: 100%;" src="${ctp}/images/interior/upload/${vo.subImg}" alt="보조 이미지">
    </div>
    <hr>
    <div class="see-more">포트폴리오 더보기</div>
    <div class="grid-container">
      <c:forEach var="vo1" items="${vos}" varStatus="st">
      	<c:if test="${vo.idx != vo1.idx}">
		      <a href="InteriorContent.in?idx=${vo1.idx}">
		        <div class="grid-item">
		          <img src="${ctp}/images/interior/upload/${vo1.thumbnail}" alt="Thumbnail">
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
		      <a href="InteriorUpdate.in?idx=${vo.idx}"><i class="fa-solid fa-pencil"></i></a>
		    </div>
	    </div>
    </c:if>
    
    <!-- 삭제 -->
    <c:if test="${sMid == vo.mid || sLevel == 0}">
	    <div class="sidebar-item">
	      <div class="icon-circle" onclick="DeleteCheck()">
	        <a href="InteriorDelete.in?idx=${vo.idx}"><i class="fa-regular fa-trash-can"></i></a>
	      </div>
	    </div>
    </c:if>
	</div>
	
	<!-- 위로가기 버튼 -->
  <h6 id="topBtn" class="text-right mr-3"><font color="#af9e84"><i class="fa-solid fa-circle-chevron-up fa-2x"></i></font></h6>
  
<jsp:include page="/include/footer.jsp"/>
</body>
</html>