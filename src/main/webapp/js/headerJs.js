     document.addEventListener("DOMContentLoaded", function() {
       // 햄버거 버튼 클릭 시 메뉴와 배경 토글
       function toggleSidebar() {
       	const menu = document.querySelector(".menu");
        const sideMenu = document.querySelector(".side-menu");
        const overlay = document.querySelector(".overlay");

           // 햄버거 아이콘과 메뉴 상태를 토글
        menu.classList.toggle("active");
        sideMenu.classList.toggle("open");
        overlay.classList.toggle("active");
       }

       // 배경 클릭 시 메뉴 닫기
       document.querySelector(".overlay").addEventListener("click", function() {
        const menu = document.querySelector(".menu");
        const sideMenu = document.querySelector(".side-menu");
        const overlay = document.querySelector(".overlay");

           // 메뉴와 배경 숨기기
        menu.classList.remove("active");
        sideMenu.classList.remove("open");
        overlay.classList.remove("active");
       });

       // 네비게이션바 고정 처리 (스크롤에 따라)
       const navbar = document.querySelector("#navbar");
       document.addEventListener("scroll", () => {
        const scrollY = window.scrollY;
        if (scrollY > 40) {
           navbar.classList.add("fixed");
        } else {
          navbar.classList.remove("fixed");
        }
       });

       // 햄버거 버튼 클릭 시 메뉴 열고 닫기
       const menuButton = document.querySelector(".menu");
       if (menuButton) {
        menuButton.addEventListener("click", toggleSidebar);
       }

       // 로그인 창 내 + 버튼 클릭 시 슬라이드 메뉴 색상 변경
       window.toggleSidebarColor = function() {
        const sideMenu = document.querySelector(".side-menu");
        sideMenu.classList.toggle("pink");  // 슬라이드 메뉴 바 색상 토글
       };
   });
     
     
     /* 로그인 시 */
      document.addEventListener("DOMContentLoaded", function() {
       // 햄버거 버튼 클릭 시 메뉴와 배경 토글
       function toggleSidebar() {
        const menu = document.querySelector(".menu");
      	const sideMenuLogin = document.querySelector(".side-menu-login");
        const overlay = document.querySelector(".overlay");

           // 햄버거 아이콘과 메뉴 상태를 토글
        menu.classList.toggle("active");
        sideMenuLogin.classList.toggle("open");
        overlay.classList.toggle("active");
       }

       // 배경 클릭 시 메뉴 닫기
       document.querySelector(".overlay").addEventListener("click", function() {
        const menu = document.querySelector(".menu");
        const sideMenuLogin = document.querySelector(".side-menu-login");
        const overlay = document.querySelector(".overlay");

           // 메뉴와 배경 숨기기
        menu.classList.remove("active");
        sideMenuLogin.classList.remove("open");
        overlay.classList.remove("active");
       });

       // 네비게이션바 고정 처리 (스크롤에 따라)
       const navbar = document.querySelector("#navbar");
       document.addEventListener("scroll", () => {
        const scrollY = window.scrollY;
        if (scrollY > 40) {
           navbar.classList.add("fixed");
        } else {
          navbar.classList.remove("fixed");
        }
       });

    // 햄버거 버튼 클릭 시 메뉴 열고 닫기
       const menuButton = document.querySelector(".menu");
       if (menuButton) {
        menuButton.addEventListener("click", toggleSidebar);
       }

   	});
  
  // 로그인 창 jsp
  $(function() {
	  $(".input input").focus(function() {

	      $(this).parent(".input").each(function() {
	         $("label", this).css({
	            "line-height": "18px",
	            "font-size": "18px",
	            "font-weight": "100",
	            "top": "0px"
	         })
	         $(".spin", this).css({
	            "width": "100%"
	         })
	      });
	   }).blur(function() {
	      $(".spin").css({
	         "width": "0px"
	      })
	      if ($(this).val() == "") {
	         $(this).parent(".input").each(function() {
	            $("label", this).css({
	               "line-height": "60px",
	               "font-size": "24px",
	               "font-weight": "300",
	               "top": "10px"
	            })
	         });

	      }
	   });
      $(".button").click(function(e) {
         var pX = e.pageX,
            pY = e.pageY,
            oX = parseInt($(this).offset().left),
            oY = parseInt($(this).offset().top);

         $(this).append('<span class="click-efect x-' + oX + ' y-' + oY + '" style="margin-left:' + (pX - oX) + 'px;margin-top:' + (pY - oY) + 'px;"></span>')
         $('.x-' + oX + '.y-' + oY + '').animate({
            "width": "500px",
            "height": "500px",
            "top": "-250px",
            "left": "-250px",

         }, 600);
         $("button", this).addClass('active');
      })

      $(".alt-2").click(function() {
         if (!$(this).hasClass('material-button')) {
            $(".shape").css({
               "width": "100%",
               "height": "100%",
               "transform": "rotate(0deg)"
            })

            setTimeout(function() {
               $(".overbox").css({
                  "overflow": "initial"
               })
            }, 600)


            $(".overbox .title").fadeOut(300);
            $(".overbox .input").fadeOut(300);
            $(".overbox .button").fadeOut(300);

            $(".alt-2").addClass('material-buton');
         }

      })

      $(".material-button").click(function() {

         if ($(this).hasClass('material-button')) {
            setTimeout(function() {
               $(".overbox").css({
                  "overflow": "hidden"
               })
               $(".box").addClass("back");
            }, 200)
            $(this).addClass('active').animate({
               "width": "700px",
               "height": "700px"
            });
            setTimeout(function() {
               $(".shape").css({
                  "width": "50%",
                  "height": "50%",
                  "transform": "rotate(45deg)"
               })
                  location.href="MemberJoin.mem";
            }, 1000)
            $(this).removeClass('material-button');
         }
      });
   });
