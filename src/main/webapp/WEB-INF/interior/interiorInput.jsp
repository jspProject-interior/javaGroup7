<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <link rel="icon" href="${ctp}/images/main/favicon.png">
  <title>인테리어 등록하기 | 그린테리어</title>
  <jsp:include page="/include/bs4.jsp"/>
  <link rel="stylesheet" type="text/css" href="${ctp}/css/interiorInput.css">
  <script type="text/javascript">
  $(function() {
	    // '기타'를 선택했을 때만 #etc 영역을 보이도록 설정
	    $('select[name="category"]').change(function() {
	      // 선택된 값이 'etc'일 때 #etc 영역 보이기
	      if ($(this).val() === 'etc') {
	        $('#etc').show();  // #etc 영역 보이기
	      } else {
	        $('#etc').hide();   // '기타'가 아닐 경우 #etc 영역 숨기기
	      }
	    });

	    // 페이지 로드 시 카테고리 값에 따라 #etc 영역을 초기화
	    if ($('select[name="category"]').val() === 'etc') {
	      $('#etc').show();
	    } else {
	      $('#etc').hide();
	    }
	  });
    
		//이미지 선택 시 미리보기 처리 함수
		  function handleImageChange(event, previewId) {
		    const file = event.target.files[0]; // 파일 객체 얻기
		    if (file) {
		      const reader = new FileReader(); // FileReader 객체 생성
		      
		      // 파일이 읽히면 실행되는 콜백 함수
		      reader.onload = function(e) {
		        const imageUrl = e.target.result; // 이미지 URL 얻기
		        const imagePreview = document.getElementById(previewId); // 미리보기 이미지 요소
		        
		        imagePreview.src = imageUrl; // 이미지 URL을 src에 설정
		        imagePreview.style.display = 'block'; // 이미지를 표시
		      };
		      
		      // 파일을 Data URL 형식으로 읽어들임
		      reader.readAsDataURL(file);
		    }
		  }
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <div class="contain">
    <h1 style="font-family: 'EliceDigitalBaeum-Bd';">게시물 등록</h1>
    <form name="myform" method="post" action="InteriorInputOk.in"  enctype="multipart/form-data">

      <!-- 업체명 -->
      <div class="form-group">
        <div class="section-title">업체명</div>
        <hr>
        <input type="text" name="company" id="company" class="form-control" value="GRINTERIOR" readonly>
      </div>

      <!-- 카테고리 -->
      <div class="form-group">
        <div class="section-title">카테고리</div>
        <hr>
        <select class="form-control" name="category">
          <option>카테고리</option>
          <option value="MODERN">모던</option>
          <option value="NATURALnatural">네츄럴</option>
          <option value="VINTAGE">빈티지</option>
          <option value="ETC" onclick="etcShow()">기타</option>
        </select>
        <div id="etc" class="hidden">
          <textarea rows="5" name="etc" class="form-control" placeholder="기타 카테고리 입력"></textarea>
        </div>
      </div>
      
      <div class="form-group">
        <div class="section-title">제목</div>
        <hr>
        <input type="text" name="title" id="title" class="form-control">
      </div>

      <!-- 상품 이미지 -->
			<div class="form-group">
			  <div class="section-title">상품 이미지</div>
			  <hr>
			  
			  <!-- 대표 이미지 -->
			  <div>
			    <div class="section-title">대표이미지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-main" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-main" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-main" name="titleImg" accept="image/*" onchange="handleImageChange(event, 'image-preview-main')" />
			    </div>
			  </div>
				<hr>
			  <!-- 상세페이지 이미지 -->
			  <div>
			    <div class="section-title">상세페이지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-detail" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-detail" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-detail" name="subImg" accept="image/*" onchange="handleImageChange(event, 'image-preview-detail')" />
			    </div>
			  </div>
				<hr>
			  <!-- 썸네일 이미지 -->
			  <div>
			    <div class="section-title">썸네일이미지</div>
			    <div class="image-upload-container">
			      <label for="image-upload-thumbnail" style="width: 100%; height: 100%; display: flex; justify-content: center; align-items: center;">
			        <div class="plus-icon"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-thumbnail" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-thumbnail" name="thumbnail" accept="image/*" onchange="handleImageChange(event, 'image-preview-thumbnail')" />
			    </div>
			  </div>
			  
			  <hr>
			</div>

      <!-- 제출 버튼 -->
      <button class="learn-more" type="submit">상품 등록</button>
      <input type="hidden" name="fSize" value="10"/>
    </form>
  </div>
  
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>
