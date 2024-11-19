<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String price = request.getParameter("totprice");
    String area = request.getParameter("area");
    System.out.println("price AppJsp: " + price);
    System.out.println("area AppJsp: " + area);
%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
  <title>application.jsp</title>
<style>
body {
	    margin: 0;
	    padding: 0;
	    width: 100%;
	    font-family: 'Arial', sans-serif;
	    background-color: #f8f9fa;
	    color: #333;
	  }
	
	  .container {
	    padding-top: 10%;
	    width: 100%;
	    max-width: 1200px;
	    margin: 0 auto;
	  }
	  
	  .button-group {
		  display: flex;
		  gap: 10px;
		}
		
		.btn {
		  padding: 10px 20px;
		  border: 1px solid #ccc;
		  background-color: #f0f0f0;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.btn.active {
		  background-color: #007bff;
		  color: white;
		  border-color: #007bff;
		}
		
		.btn:not(.active) {
		  opacity: 0.6;
		}
		
		.strBtn {
		  padding: 10px 20px;
		  border: 1px solid #ccc;
		  background-color: #f0f0f0;
		  cursor: pointer;
		  transition: background-color 0.3s ease;
		}
		
		.strBtn.active {
		  background-color: #007bff;
		  color: white;
		  border-color: #007bff;
		}
		
		.strBtn:not(.active) {
		  opacity: 0.6;
		}
		
		/* #reviewForm input[type=radio] {
      display: none;
    } */
</style>
<script>
document.addEventListener('DOMContentLoaded', () => {
	  const buttonGroups = document.querySelectorAll('.button-group');

	  buttonGroups.forEach(group => {
	    group.addEventListener('click', (event) => {
	      if (event.target.tagName === 'BUTTON') {
	        const value1 = event.target.dataset.value1;
	        const value2 = event.target.dataset.value2;

	        console.log("Value 1:", value1);
	        console.log("Value 2:", value2);

	        // 'active' 클래스 처리
	        group.querySelectorAll('button').forEach(button => button.classList.remove('active'));
	        event.target.classList.add('active');
	      }
	    });
	  });
	});

	
</script>

</head>
<body>
<jsp:include page="/include/header.jsp"/>

<p><br/></p>
<div class="container">
    <h2>상담 신청서</h2>
	<div class="button-group">
	  <button type="button" class="btn" data-value1="1000000" data-value2="거실">버튼 1</button>
		<button type="button" class="btn" data-value1="2000000" data-value2="침실">버튼 2</button>
		<button type="button" class="btn" data-value1="3000000" data-value2="욕실">버튼 3</button>
	</div>
	<div class="button-group">
	  <button type="button" class="btn" data-value1="20평" data-value2="optionA">버튼 1</button>
		<button type="button" class="btn" data-value1="30평" data-value2="optionB">버튼 2</button>
		<button type="button" class="btn" data-value1="40평" data-value2="optionC">버튼 3</button>
	</div>
	<div class="button-group">
	  <button type="button" class="btn" data-value1="바닥" data-value2="A">버튼 1</button>
		<button type="button" class="btn" data-value1="문" data-value2="B">버튼 2</button>
		<button type="button" class="btn" data-value1="벽" data-value2="C">버튼 3</button>
	</div>
</div>	    
    
    
    
    
    
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>