<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</head>
<body>
<p><br/></p>
  <div class="container-fluid">
    <main>
        <section id="user-list">
            <h2 class="section-header">회원 리스트</h2>
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
                    <tr>
                        <td>1</td>
                        <td>홍길동</td>
                        <td>hong@gmail.com</td>
                        <td>2024-01-01</td>
                        <td><button>삭제</button></td>
                    </tr>
                </tbody>
            </table>
        </section>
        <section id="business-list">
            <h2 class="section-header">업체 리스트</h2>
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
                    <tr>
                        <td>1</td>
                        <td>ABC 업체</td>
                        <td>010-1234-5678</td>
                        <td>2024-01-05</td>
                        <td><button>삭제</button></td>
                    </tr>
                </tbody>
            </table>
        </section>
        <section id="consultation-list">
            <h2 class="section-header">상담 신청 리스트</h2>
            <p>여기에 상담 신청 내역이 표시됩니다.</p>
        </section>
    </main>
  </div>
<p><br/></p>
</body>
</html>