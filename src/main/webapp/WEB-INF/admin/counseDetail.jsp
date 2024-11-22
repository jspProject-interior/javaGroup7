<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs4.jsp"/>
  <style type="text/css">
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #eef2f5;
      margin: 0;
      padding: 0;
    }
    .container-fluid {
      max-width: 1000px;
      margin: 30px auto;
      background-color: #ffffff;
      border-radius: 12px;
      box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }
    .leftContainer {
      background: #f9fbfc;
      padding: 30px;
      border-right: 1px solid #e4e9ed;
    }
    .leftContainer h1 {
      font-size: 24px;
      color: #2c3e50;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
    }
    .leftContainer h1::before {
      content: "👤";
      font-size: 1.5em;
      margin-right: 10px;
    }
    .leftContainer p {
      font-size: 16px;
      color: #576574;
      line-height: 1.6;
    }
    .RightContainer {
      padding: 30px;
    }
    .RightContainer h2 {
      font-size: 22px;
      color: #34495e;
      margin-bottom: 15px;
      display: flex;
      align-items: center;
    }
    .RightContainer h2::before {
      content: "📋";
      font-size: 1.5em;
      margin-right: 10px;
    }
    .RightContainer textarea {
      width: 100%;
      border: 1px solid #ced6e0;
      border-radius: 8px;
      padding: 10px;
      font-size: 14px;
      resize: none;
      background-color: #f4f8fc;
      margin-bottom: 20px;
    }
    .RightContainer textarea:focus {
      outline: none;
      border-color: #3498db;
      background-color: #ffffff;
      box-shadow: 0 0 5px rgba(52, 152, 219, 0.5);
    }
    select {
      width: 100%;
      padding: 10px;
      border: 1px solid #dfe4ea;
      border-radius: 8px;
      font-size: 16px;
      background-color: #f4f8fc;
      transition: all 0.3s;
    }
    select:hover {
      background-color: #ffffff;
    }
    select:focus {
      outline: none;
      border-color: #3498db;
    }
    .btn-danger {
        background-color: #e74c3c;
        border: none;
        color: #fff;
        padding: 12px 20px;
        font-size: 16px;
        border-radius: 8px;
        cursor: pointer;
        text-align: center;
        width: 100%;
        transition: all 0.3s ease-in-out;
    }
    .btn-danger:hover {
        background-color: #c0392b;
        box-shadow: 0 4px 12px rgba(231, 76, 60, 0.4);
        transform: translateY(-2px);
    }
    .btn-danger:active {
        background-color: #a93226;
        transform: translateY(1px);
    }
    .row {
      display: flex;
      flex-wrap: wrap;
    }
    .col {
      flex: 1;
      margin: 10px;
    }
    hr {
      border: none;
      border-top: 1px solid #dfe6e9;
      margin: 20px 0;
    }
  </style>
  <script type="text/javascript">
    function MemberDelete() {
      let ans = confirm("회원을 탈퇴시키겠습니까?");
      if (ans) {
        location.href = "MemberDelete.mem?idx=${vo.idx}";
      } else {
        return false;
      }
    }
    function ChangeCompany(e) {
    	let company = e.value.split("/");
			let ans = confirm("업체를 " + company[1] + "로 매칭시키시겠습니까?");
			if(ans){
				$.ajax({
					type : "post",
					url : "MatchCompany.ad",
					data : {
						mid : '${vo.mid}',
						companyId : company[0],
						companyName : company[1]
					},
					success: function(res) {
						if(res != "0"){
							alert(company + "로 담당 업체를 변경하였습니다.");
							location.href='CounseDetail.ad?mid=${vo.mid}';
						}
						else{
							alert("매칭되지 않았습니다.");
						}
					},
					error: function() {
							alert("전송 실패.");
					}
				});
			}
			else{
				location.reload();
			}
		}
  </script>
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <!-- 좌측 컨테이너 -->
    <div class="leftContainer col">
      <h1>개인정보</h1>
      <hr>
      <p><strong>아이디 :</strong> ${vo.mid}</p>
      <p><strong>신청자 :</strong> ${vo.name}</p>
      <p><strong>시공지 :</strong> ${fn:replace(vo.conAddress, "/", "")}</p>
      <p><strong>연락받을 번호 :</strong> ${vo.tel}</p>
    </div>
    <!-- 우측 컨테이너 -->
    <div class="RightContainer col">
      <h2>${vo.name}</h2>
      <hr>
      <p><strong>예산 :</strong> ${vo.budget}</p>
      <p><strong>평수 :</strong> ${vo.size}</p>
      <hr>
      <textarea class="form-control" rows="5" placeholder="메모를 입력하세요"></textarea>
      <h2>처리내역</h2>
      <hr>
      <p><strong>처리현황 :</strong> ${vo.treatment}</p>
      <strong>담당 업체 :</strong>
      <div>
        <select name="companyName" id="companyName" onchange="ChangeCompany(this)">
        	<option>선택</option>
          <c:forEach var="company" items="${companyList}" varStatus="i">
          	${company.company}
            <option value="${company.mid}/${company.company}" ${vo.companyName eq company.company ? 'selected' : ''}>${company.company}</option>
          </c:forEach>
        </select>
      </div>
    </div>
  </div>
</div>
</body>
</html>
