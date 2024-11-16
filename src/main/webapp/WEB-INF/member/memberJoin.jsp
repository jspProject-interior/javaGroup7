<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>회원가입 | 그린테리어</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <jsp:include page="/include/bs4.jsp"/>
  <jsp:include page="/include/fonts.jsp"/>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${ctp}/js/woo.js"></script>
  <%-- <link rel="stylesheet" type="text/css" href="${ctp}/css/memberJoin.css"> --%>
  <style>
		body,html {
			height:100%;
			margin:0;
			padding:0;
			font-family:'EliceDigitalBaeum-Bd';
      background-image: url("${ctp}/images/interior/modern/mordern1/1.jpg");
      background-size: cover;
 			background-position: center;
		}
		
		.container {
		  display: flex;
		  justify-content: center; /* 수평 중앙 정렬 */
		  align-items: center; /* 수직 중앙 정렬 */
		  padding-bottom: 3%; /* 폼 아래에 여백을 줘서 배경 이미지가 5% 정도 보이게 함 */
		}
		
    .Logo {
      font-family: "Playfair Display", serif;
      font-size: 30px;
      color: white;
      text-decoration: none;
    }
    
    
    .Logo:hover {
      color: white;
      text-decoration: none;
    }
    
    span {
    display: none;
    }
    
    /* 라디오버튼 css */
		ul, li, dl, dt, dd, p, span {
			margin:0;
			padding:0
		}
		
		a {
			text-decoration:none;
			color:#777
		}
		
		li {
			list-style:none
		}
		
		*, :after, :before {
		-webkit-box-sizing:border-box;
		-moz-box-sizing:border-box;
		box-sizing:border-box
		}
		
		.wrap {
		display:flex;
		align-items: center;
		justify-content: center;
		gap: 10%;
		margin-top: 20%;
		margin-bottom: 1%;
		  }
		
		.wrap .radio_area label {
		cursor:pointer;
		display:flex;
		align-items:center;
		gap:20px;
		height:50px;
		padding:0 30px 0 20px;
		border-radius:30px;
		font-size:25px;
		font-weight:500;
		color:#999;
		background:#f2f2f2;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label span {
		opacity:.3;
		display:flex;
		width:20px;
		height:20px;
		border:2px solid #111;
		border-radius:50%;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label span:before {
		content:"";
		width:6px;
		height:6px;
		margin:auto;
		border-radius:50%;
		background:#111;
		transition:all .3s ease;
		}
		
		.wrap .radio_area label:hover {
		background:#e1e1e1;
		}
		
		.radio_area input[type=radio] {
		display:none;
		}
		
		.radio_area input[type=radio]:checked + label {
		color:#fff;
		background:#111;
		}
		
		.radio_area input[type=radio]:checked + label span {
		opacity:1;
		border-color:#fff;
		}
		
		.radio_area input[type=radio]:checked + label span:before {
		background:#fff;
		}    
		
		 /* 애니메이션 효과 */
     /* 라디오 버튼 선택 시 상단으로 이동하는 효과 */
    .wrap.move-up {
      margin-top: 50px; /* 두 버튼을 상단으로 이동시킴 */
    }

    .wrap .radio_area input[type=radio] + label ,.wrap.move-up {
      position: relative;
      margin-top: 0%; /* 선택된 라디오 버튼을 위로 밀기 */
      transition: all .5s ease-in-out;
    }
    
    #customerForm, #companyForm {
      display: none;
      transition: all .5s ease-in-out; /* 부드러운 전환 */
    }

    #customerForm.show, #companyForm.show {
      display: block;
      animation: slideUp 0.5s forwards; /* 폼이 올라오는 애니메이션 */
    }

    @keyframes slideUp {
      0% {
        transform: translateY(20%);
        opacity: 0;
      }
      100% {
        transform: translateY(0);
        opacity: 1;
      }
    }
    
  </style>
  <script>
		/* 회원가입폼 */  
  function showCustomerForm() {
			let level = document.getElementById("level1").value;
			$.ajax({
			    type: "POST",
			    url: "AjaxLevel.mem",
			    data: { level: level },
			    success: function (data) {
            $('#customerForm').html(data);
			    },
			    error: function () {
			        alert("Ajax 호출 오류 발생");
			    }
			});
			
	    document.getElementById('customerForm').style.display = 'block';  // 고객 폼 보이기
 	    document.getElementById('customerForm').classList.add('show'); 		// 애니메이션 효과 추가
	    document.getElementById('companyForm').style.display = 'none';    // 업체 폼 숨기기
	    document.querySelector('.wrap').classList.add('move-up'); // 라디오 버튼 위치 위로 이동
	  }

	  function showCompanyForm() {
		  let level = document.getElementById("level0").value;
			$.ajax({
			    type: "POST",
			    url: "AjaxLevel.mem",
			    data: { level: level },
			    success: function (data) {
          $('#companyForm').html(data);
			    },
			    error: function () {
			        alert("Ajax 호출 오류 발생");
			    }
			});
	    document.getElementById('companyForm').style.display = 'block';   // 업체 폼 보이기
	    document.getElementById('companyForm').classList.add('show'); // 애니메이션 효과 추가
	    document.getElementById('customerForm').style.display = 'none';   // 고객 폼 숨기기
	    document.querySelector('.wrap').classList.add('move-up');
	  }

</script>
</head>
<body>
  <p><br/></p>
  <div><a href="main.main" class="Logo" style="padding-left: 3.6%; padding-right: 0">GRINTERIOR</a></div>
	<form name="myform1" method="post" action="MemberJoinOk.mem">
	  <!--Customer(1)/Company()  -->
	  <div class="wrap">
		  <div class="radio_area">
		    <input type="radio" name="level" id="level1" value="1" onclick="showCustomerForm()">
		    <label for="level1"><span></span>고객 ${vo.level}</label>  
		  </div>
		  <div class="radio_area">
		    <input type="radio" name="level" id="level0" value="" onclick="showCompanyForm()">
		    <label for="level0"><span></span>업체 ${param.level}</label>  
		  </div>   
		</div>
	</form>
	  <!-- 고객 회원가입 폼 (초기에는 숨김) -->
	  <div id="customerForm" style="display:none;"></div>
    <!-- 업체 회원가입 폼 (초기에는 숨김) -->
	  <div id="companyForm" style="display:none;"></div>
</body>
</html>
