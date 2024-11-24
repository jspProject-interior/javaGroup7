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
  <title>고객 리스트 | 그린테리어</title>
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
  </script>
</head>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<div class="container-fluid">
    <div class="table-container">
        <table>
            <thead>
                <tr>
                    <th><input type="checkbox" id="allCheck" onclick="reverseCheck()"/></th>
                    <th>순번</th>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                    <th>주민등록번호</th>
                    <th>주소</th>
                    <th>성별</th>
                    <th>생일</th>
                    <th>탈퇴여부</th>
                    <th>회원가입날</th>
                    <th>마지막 접속일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="vo" items="${vos}" varStatus="st">
                    <tr onclick="location.href='UserDetail.ad?mid=${vo.mid}'">
                        <td><input type="checkbox" name="index" id="index${st.index}"/></td>
                        <td>${st.count}</td>
                        <td>${vo.mid}</td>
                        <td>${vo.name}</td>
                        <td>${vo.tel}</td>
                        <td>${vo.email}</td>
                        <td>${vo.resident}</td>
                        <td>${fn : replace(vo.address, "/" , "")}</td>
                        <td>${vo.gender}</td>
                        <td>${fn : substring(vo.birthday, 0, 10)}</td>
                        <td>${vo.userDel == 'OK' ? '<font color="red">탈퇴신청</font>' : '활동 중'}
                        <c:if test="${vo.userDel == 'OK'}"><div><button type="button" onclick='MemberDelete()' class="btn btn-sm btn-danger">회원탈퇴</button></div></c:if>
                        </td>
                        <td>${fn : substring(vo.joinDay,0,10)}</td>
	            					<td>${fn : substring(vo.lastDate,0,10)}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
