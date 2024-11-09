<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <title>testHeader.jsp</title> -->

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs4.jsp"/>
	<style type="text/css">
		hr {
		  border: 0;
		  height: 1.5px;
		  background-image: linear-gradient(to right, rgba(255, 255, 255, 0.75), rgba(0, 0, 0, 0), rgba(0, 0, 0, 0));
		  margin: 0;
		  margin-bottom: 10px;
		}
	</style>
</head>
<body>
	<div style="background-color: #a67d3f; padding: 1.5%;">
		<div class="row">
			<div class="col" style="text-align: left; margin-left: 3%;">
				<div><a href="" style="color: white;"><font size="6px">고객센터</font></a></div>
				<div class="input-group" style="margin-top: 10px;">
					<div class="input-group-append"><font size="4px" color="white"><b>1234-1234</b></font></div>  
					<div class="input-group-append pl-2" style="padding-top: 2px;" ><font size="3px" color="white">09:00 ~ 18:00</font></div>
				</div>
				<div class="input-group-append text-white pt-2" style="font-size: 12px;">
					<ul style="padding-left: 20px;">
						<li>평일 : 전체 문의 상담</li>
						<li>토요일, 공휴일 : 그린테리어 직접배송 주문 건 상담</li>
						<li>일요일 : 휴무</li>
					</ul>
				</div>
			</div>
			<div class="col text-left" style="padding-left: 250px;">
				<div><font size="6px" color="white">회사정보</font></div>
				<div><a href="" style="color: white; padding-left: 10px">회사소개</a></div>
				<div><a href="" style="color: white; padding-left: 10px">이용약관</a></div>
				<div><a href="" style="color: white; padding-left: 10px">공지사항</a></div>
				<div><a href="" style="color: white; padding-left: 10px">개인정보처리방침</a></div>
			</div>
			<div class="col text-left">
				<div><font size="6px" color="white">이용안내</font></div>
				<div><a href="" style="color: white; padding-left: 10px">자주 묻는 질문</a></div>
				<div><a href="" style="color: white; padding-left: 10px">입점신청</a></div>
				<div><a href="" style="color: white; padding-left: 10px">제휴/광고문의</a></div>
				<div><a href="" style="color: white; padding-left: 10px">고객의 소리</a></div>
			</div>
		</div>
		<div class="row">
			<div class="col text-left text-white" style="margin-left: 3%;">
				<hr style="width: 200%;">
				<div>주식회사 그린테리어 | 대표이사 : hm & sy | 주소: 충청북도 청주시 서원구 사직대로 109 4층 | 사업자등록번호 : 123-45-67890 | 이메일: info.grinterior.com</div>	
				<div>ⓒ 2024 grinterior. All Rights Reserved.</div>
			</div>
		</div>
	</div>
</body>
</html>