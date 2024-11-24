<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>업체 리스트 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <style>
    /* 기본 스타일 */
    body {
        font-family: '맑은 고딕', 'Noto Sans', Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .table-container {
        padding: 10px 0;
        overflow-x: auto;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 0 auto;
        font-size: 14px;
        color: #333;
    }
    table th {
        background-color: #f1faee;
        color: #457b9d;
        padding: 12px;
        font-weight: bold;
        text-align: center;
        border-bottom: 2px solid #a8dadc;
        white-space: nowrap;
    }
    table td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        white-space: nowrap;       /* 줄바꿈 방지 */
        overflow: hidden;          /* 넘치는 텍스트 숨김 */
        text-overflow: ellipsis;   /* 말줄임표(...) 표시 */
        max-width: 150px;          /* 최대 셀 너비 설정 */
    }
    table tr:hover {
        background-color: #f1f5fa;
    }
  </style>
  <script type="text/javascript">
	  function reverseCheck() {
		  for(let i=0; i<document.getElementsByName("index").length; i++) {
			  document.getElementsByName("index")[i].checked = !document.getElementsByName("index")[i].checked;
	  	}
	  }
	  function MemberDelete() {
			let ans = confirm("회원을 탈퇴시키겠습니까?");
			if(ans){
				location.href="MemberDelete.mem?idx=${vo.idx}"			
			}
			else{
				return false;
			}
		}
  </script>
</head>
<body>
	<div class="container-fluid">
	  <div class="table-container">
		  <table>
	      <thead>
	        <tr>
	        	<th><input type="checkbox" id="allCheck" onclick="reverseCheck()"/></th>
            <th>순번</th>
            <th>고객명</th>
            <th>업체명</th>
            <th>카테고리</th>
            <th>제품명</th>
            <th>판매금액</th>
            <th>수수료</th>
            <th>정산금액</th>
            <th>주문 일</th>
	        </tr>
	      </thead>
	      <tbody>
		      <c:forEach var="vo" items="${vos}" varStatus="st">
	          <tr onclick="">
	          	<td><input type="checkbox" name="index" id="index${st.index}"/></td>
	            <td>${st.count}</td>
	            <td>${vo.name}</td>
	            <td>${vo.company}</td>
	            <td>${vo.category}</td>
	            <td>${vo.title}</td>
	            <td><fmt:formatNumber value="${vo.price}" pattern="#,##0"/>원</td>
	            <td><fmt:formatNumber value="${vo.price * 0.1}" pattern="#,##0"/>원</td>
	            <td><font color="red"><b><fmt:formatNumber value="${vo.price * 0.9}" pattern="#,##0"/>원</b></font></td>
	            <td>${fn : substring(vo.purDate,0,10)}</td>
	          </tr>
		      </c:forEach>
	      </tbody>
		  </table>
	  </div>
  </div>
</body>
</html>
