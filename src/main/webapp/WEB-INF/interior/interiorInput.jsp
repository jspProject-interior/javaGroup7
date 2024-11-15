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
  function fCheck() {
	    let titleImg = document.getElementById("image-upload-main").value;
	    let subImg = document.getElementById("image-upload-detail").value;
	    let thumbnail = document.getElementById("image-upload-thumbnail").value;
	    let titleImgExt = titleImg.substring(titleImg.lastIndexOf(".") + 1).toLowerCase();
	    let subImgExt = subImg.substring(subImg.lastIndexOf(".") + 1).toLowerCase();
	    let thumbnailExt = thumbnail.substring(thumbnail.lastIndexOf(".") + 1).toLowerCase();
	    let maxSize = 1024 * 1024 * 50;
	    let validExtensions = ['jpg', 'gif', 'png'];
			let title = document.getElementById("title").value;
			let category = document.getElementById("category").value;
	    
	    if (title.trim() == "") {
	        alert("제목을 입력해주세요");
	        myform.title.focus();
	        return false;
	    }
	    
	    if (category.trim() == "null") {
	        alert("카테고리를 선택해주세요");
	        myform.category.focus();
	        return false;
	    }
	    
	    if (titleImg.trim() === "" || subImg.trim() === "" || thumbnail.trim() === "") {
	        alert("업로드할 파일을 선택하세요");
	        myform.title.focus();
	        return false;
	    }

	    // 파일 크기 확인
	    let titleImgSize = document.getElementById("image-upload-main").files[0].size;
	    let subImgSize = document.getElementById("image-upload-detail").files[0].size;
	    let thumbnailSize = document.getElementById("image-upload-thumbnail").files[0].size;
	    if (titleImgSize > maxSize || subImgSize > maxSize || thumbnailSize > maxSize) {
	        alert("업로드할 1개 파일의 최대용량은 50MByte 입니다.");
	        myform.title.focus();
	        return false;
	    }

	    if (!validExtensions.includes(titleImgExt)) {
	        alert("대표 이미지 업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.");
	        myform.title.focus();
	        return false;
	    }
	    if (!validExtensions.includes(subImgExt)) {
	        alert("상세 페이지 업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.");
	        myform.title.focus();
	        return false;
	    }
	    if (!validExtensions.includes(thumbnailExt)) {
	        alert("썸네일 이미지 업로드 가능한 파일은 'jpg/gif/png'만 가능합니다.");
	        myform.title.focus();
	        return false;
	    }
	    myform.submit();
	}

  
  $(function() {
	    $('select[name="category"]').change(function() {
	      if ($(this).val() === 'ETC') {
	        $('#etc').show();
	      } else {
	        $('#etc').hide();
	      }
	    });

	    if ($('select[name="category"]').val() === 'ETC') {
	      $('#etc').show();
	    } else {
	      $('#etc').hide();
	    }
	  });
    
		  function handleImageChange(event, previewId) {
		    const file = event.target.files[0];
		    if (file) {
		      const reader = new FileReader();
		      
		      reader.onload = function(e) {
		        const imageUrl = e.target.result;
		        const imagePreview = document.getElementById(previewId);
		        
		        imagePreview.src = imageUrl;
		        imagePreview.style.display = 'block';
		      };
		      
		      reader.readAsDataURL(file);
		    }
		  }
  </script>
</head>
<body>
  <jsp:include page="/include/header.jsp"/>
  <div class="contain">
    <h1 style="font-family: 'EliceDigitalBaeum-Bd';">게시물 등록</h1>
    <form name="myform" method="post" enctype="multipart/form-data" action="InteriorInputOk.in">

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
        <select class="form-control" id="category" name="category">
          <option value="null">카테고리</option>
          <option value="MODERN">모던</option>
          <option value="NATURAL">네츄럴</option>
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
			        <div class="plus-icon" id="titleImg"><i class="fa-solid fa-plus"></i></div>
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
			        <div class="plus-icon" id="subImg"><i class="fa-solid fa-plus"></i></div>
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
			        <div class="plus-icon" id="thumbnail"><i class="fa-solid fa-plus"></i></div>
			        <img id="image-preview-thumbnail" class="image-preview" style="display: none;" />
			      </label>
			      <input type="file" id="image-upload-thumbnail" name="thumbnail" accept="image/*" onchange="handleImageChange(event, 'image-preview-thumbnail')" />
			    </div>
			  </div>
			  
			  <hr>
			</div>

      <!-- 제출 버튼 -->
      <button class="learn-more" type="button" onclick="fCheck()">게시물 등록</button>
      <input type="hidden" name="fSize"/>
    </form>
  </div>
  
  <jsp:include page="/include/footer.jsp"/>
</body>
</html>
