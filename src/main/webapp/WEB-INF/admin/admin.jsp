<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>관리자 | 그린테리어</title>
	<jsp:include page="/include/bs4.jsp"/>
	<jsp:include page="/include/fonts.jsp"/>
	<style>
		 /* 기본 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow-y: hidden; 
        }
        main {
            
        }
        section {
            background: #fff;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .section-header {
            font-size: 18px;
            margin-bottom: 15px;
            border-bottom: 2px solid #a8dadc;
            padding-bottom: 5px;
            color: #457b9d;
        }
        button {
            background-color: #a8dadc;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            color: #fff;
            cursor: pointer;
        }
        button:hover {
            background-color: #457b9d;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }
        table th, table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        table th {
            background-color: #f1faee;
            color: #333;
        }
	</style>
  <script type="text/javascript">
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
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<p><br/></p>
  <div class="container-fluid">
    <main>
      <section id="user-list">
		    <div style="display: flex; justify-content: space-between; align-items: center;">
		        <h2 class="section-header">회원 리스트</h2>
		        <a href="userList.ad" style="font-size: 14px; color: #457b9d; text-decoration: none; font-weight: bold;">더보기 &raquo;</a>
		    </div>
		    <table>
		        <thead>
		            <tr>
		                <th>번호</th>
		                <th>이름</th>
		                <th>이메일</th>
		                <th>가입일</th>
		                <th>관리</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="customerVO" items="${customerVOS}" varStatus="st">
		                <c:if test="${st.index >= 3}">
		                    <c:set var="stop" value="true" />
		                </c:if>
		                <c:if test="${stop != true}">
		                    <tr>
		                        <td>${st.count}</td>
		                        <td>${customerVO.name}</td>
		                        <td>${customerVO.email}</td>
		                        <td>${fn:substring(customerVO.birthday, 0, 10)}</td>
		                        <td><button onclick="MemberDelete()">회원탈퇴</button></td>
		                    </tr>
		                </c:if>
		            </c:forEach>
		        </tbody>
		    </table>
		</section>
		<c:set var="stop" value="false" />
		<section id="business-list">
		    <div style="display: flex; justify-content: space-between; align-items: center;">
		        <h2 class="section-header">업체 리스트</h2>
		        <a href="businessList.ad" style="font-size: 14px; color: #457b9d; text-decoration: none; font-weight: bold;">더보기 &raquo;</a>
		    </div>
		    <table>
		        <thead>
		            <tr>
		                <th>번호</th>
		                <th>업체명</th>
		                <th>연락처</th>
		                <th>등록일</th>
		                <th>관리</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="companyVO" items="${companyVOS}" varStatus="st">
		                <c:if test="${st.index >= 3}">
		                    <c:set var="stop" value="true" />
		                </c:if>
		                <c:if test="${stop != true}">
		                    <tr>
		                        <td>${st.count}</td>
		                        <td>${companyVO.company}</td>
		                        <td>${companyVO.tel}</td>
		                        <td>${companyVO.joinDay}</td>
		                        <td><button onclick="MemberDelete()">회원탈퇴</button></td>
		                    </tr>
		                </c:if>
		            </c:forEach>
		        </tbody>
		    </table>
			</section>
      <section id="consultation-list">
          <h2 class="section-header">상담 신청 리스트</h2>
          <p>처리해야하는 리스트가 <a href="CounselList.ad"><font color="red"><b>${fn: length(ApplicationVOS)}</b></font></a>개 있습니다.</p>
      </section>
    </main>
  </div>
<p><br/></p>
</body>
</html>