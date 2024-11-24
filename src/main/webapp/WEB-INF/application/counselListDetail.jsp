<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${vo.name} 님의 상세정보 | 그린테리어</title>
<jsp:include page="/include/bs4.jsp"/>
<style type="text/css">
    .approvalContainer {
        position: absolute; /* 위치를 더 유연하게 조정 가능 */
        padding: 20px; /* 간격 조정 */
        width: 300px; /* 너비 조정 */
        border: 1px solid #ccc; /* 테두리 추가 */
        border-radius: 10px; /* 모서리를 둥글게 */
        background-color: #f9f9f9; /* 배경색 추가 */
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        right: 25%;
        top: 40%;
    }
</style>
<script type="text/javascript">
	function ChangeApproval(e, idx) {
		let approval = e.value;
		let ans = confirm("상태를 " + approval + "로 변경합니다.");
		if(!ans) {
			location.reload();
			return false;
		}
		
		$.ajax({
			type : "post",
			url  : "approvalChange.ap",
			data : {
				idx : ${vo.idx},
				approval : approval
			},
			success:function(res) {
				if(res != 0) {
					location.reload();
				}
				else alert("실패");
			},
			error : function() {
				alert("전송오류!");
			}
		});
	}
</script>
</head>
<jsp:include page="/include/header.jsp"/>
<body oncontextmenu="return false" onselectstart="return false" ondragstart="return false" onkeydownn="return false">
<p><br/></p>
<div class="container">
    <h1 class="my-4">${vo.name}님의 상담 상세 정보</h1>
    <ul class="list-group">
        <li class="list-group-item"><strong>아이디:</strong> ${vo.mid}</li>
        <li class="list-group-item"><strong>이름:</strong> ${vo.name}</li>
        <li class="list-group-item"><strong>주소:</strong> ${vo.conAddress}</li>
        <li class="list-group-item"><strong>전화번호:</strong> ${vo.tel}</li>
        <li class="list-group-item"><strong>카테고리:</strong> ${vo.category}</li>
        <li class="list-group-item"><strong>예산:</strong> ${vo.budget} 만원</li>
        <li class="list-group-item"><strong>크기:</strong> ${vo.size} 평</li>
        <li class="list-group-item"><strong>시작 날짜:</strong> ${vo.conStartDay}</li>
        <li class="list-group-item"><strong>지역:</strong> ${vo.area}</li>
        <li class="list-group-item"><strong>처리현황:</strong> ${vo.treatment}</li>
    </ul>
    <div class="approvalContainer mx-auto">
    <label for="approval"><strong>상태 변경</strong></label>
    <select id="approval" name="approval" class="form-control mt-2" onchange="ChangeApproval(this, ${vo.idx})">
        <option value="신청대기" ${vo.treatment == '신청대기' ? 'selected' : ""}>신청대기</option>
        <option value="접수" ${vo.treatment == '접수' ? 'selected' : ""}>접수</option>
        <option value="처리 중" ${vo.treatment == '처리 중' ? 'selected' : ""}>처리 중</option>
        <option value="승인" ${vo.treatment == '승인' ? 'selected' : ""}>승인</option>
        <option value="거절" ${vo.treatment == '거절' ? 'selected' : ""}>거절</option>
    </select>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>