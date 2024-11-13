<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/favicon.png">
  <title>인테리어 | 그린테리어</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">
	.interior{
		position: relative;
	}
	
	.interior img{
		width: 100%;
		height: 500px;
	}
	
	.main{
		font-family: 'GowunBatang-Regular';
		font-size: 50px;
		position: absolute;
		color: white;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		text-align: center;
	}
	
	.grid-container {
	  display: grid;
	  margin: 0;
	  padding: 0;
	  gap: 10px;
	  
	}
	
	.grid-item img{
		width: auto;
		height: 300px;
	}
	
	.item1 {
	  grid-column: 1;
	}
	
	.item2 {
	  grid-column: 2;
	}
	
	.item3 {
	  grid-column: 3;
	}
	.item4 {
	  grid-column: 4;
	}
	
	.item5 {
	  grid-column: 5;
	}
</style>
</head>
<jsp:include page="/include/mainHeader.jsp"/>
<body>
<div class="interior">
	<img src="${ctp}/images/interior/interiorMain.jpg"/>
	<div class="main"><a href="InteriorInput.in">GRINTERIOR</a></div>
</div>

	<%-- <c:forEach var="" items="" varStatus="st"> --%>
		<div class="grid-container">
			<div class="grid-item item1">
				<img src="${ctp}/images/interior/modern/mordern1/1.jpg">
				
			</div>
			<div class="grid-item item2">
				<img src="${ctp}/images/interior/modern/mordern1/1.jpg">
				
			</div>
			<div class="grid-item item3">
				<img src="${ctp}/images/interior/modern/mordern1/1.jpg">
				
			</div>
			<div class="grid-item item4">
				<img src="${ctp}/images/interior/modern/mordern1/1.jpg">
				
			</div>
			<div class="grid-item item5">
				<img src="${ctp}/images/interior/modern/mordern1/1.jpg">
				
			</div>
			
	<%-- </c:forEach> --%>
</div>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>