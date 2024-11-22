<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Alfa+Slab+One&family=Playfair+Display:ital,wght@0,400..900;1,400..900&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/0c69fdf2c0.js" crossorigin="anonymous"></script>

	<style type="text/css">
		
		/* 메인 타이틀 */
		@font-face {
	    font-family: 'GowunBatang-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Regular.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
		/* nav 한글, 인테리어텍스트 */
		@font-face {
	    font-family: 'EliceDigitalBaeum-Bd';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_elice@1.0/EliceDigitalBaeum-Bd.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
		
		/* footer */
		@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		
		/* titleEng */
		@font-face {
	    font-family: 'TTBookendBatangR';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-2@1.0/TTBookendBatangR.woff2') format('woff2');
	    font-weight: 400;
	    font-style: normal;
		}
		
		/* titleKor */
		@font-face {
	    font-family: 'Chosunilbo_myungjo';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Chosunilbo_myungjo.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
		/* 인테리어 메뉴바 */
		@font-face {
		    font-family: 'ChosunGu';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
		/* 관리자 nav */
		@font-face {
	    font-family: 'Dovemayo_gothic'; /* 둘기마요고딕 : 동글 얇 */
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.1/Dovemayo_gothic.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		@font-face {
    font-family: 'Gyeonggi_Title_Medium'; /* 경기천년제목 */ 
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-3@1.0/Title_Medium.woff') format('woff');
    font-weight: 500;
    font-style: normal;
		}
		@font-face {
	    font-family: 'GeekbleMalang2WOFF2'; /* 긱블 말랑이체 : 동글 두껍 */
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/GeekbleMalang2WOFF2.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}

		@font-face {
	    font-family: 'SDSamliphopangche_Outline'; /* 삼립호빵체 */
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}	
		
		@font-face {
	    font-family: 'SUIT-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
		@font-face {
	    font-family: 'NoonnuBasicGothicRegular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
		@font-face {
		    font-family: 'Danjo-bold-Regular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Danjo-bold-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		
		

		@font-face {
		    font-family: 'Danjo-bold-Regular';
		    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/Danjo-bold-Regular.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		
		
		@font-face {
	    font-family: 'ghanachoco';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ghanachoco.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
		
		
		@font-face {
	    font-family: 'kdg_Medium';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/kdg_Medium.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
		
		@font-face {
	    font-family: 'BookkMyungjo-Bd';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/BookkMyungjo-Bd.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
		}
		
		
		
		@font-face {
	    font-family: 'PartialSansKR-Regular';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-1@1.1/PartialSansKR-Regular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
		}
		
		
	</style>
