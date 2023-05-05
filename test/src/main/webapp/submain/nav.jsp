<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap demo</title>
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet"
   integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
   crossorigin="anonymous">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../submain/navcss.css">
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
   integrity="sha512-qEan5nS02+Q5oN58dmG9N9Z4f4MT4yaNzFw/iRkRJzMA8+CDGt90E3l3J9Pm+Z8lCGYIda3Cw0V7dA8W8Kvztg=="
   crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>

<body>


<!-- 왼쪽에 로고  -->
   <nav class="navbar navbar-expand-lg navbar-dark"
      style="background-color: black;" aria-label="Fifth navbar example">
      <div class="container-fluid">
         <div class="home-btn" onclick="location.href='${pageContext.request.contextPath }/main/page.jsp';">
         <img class="logo" src="${pageContext.request.contextPath}/image/logo.png">
         <div class="logo_name_area" align="left" ><span class="logo_name">조각별</span></div>
         </div>


<!-- 햄버거 메뉴 보여주는거 -->
         <button class="navbar-toggler" type="button"
            data-bs-toggle="collapse" data-bs-target="#navbarsExample05"
            aria-controls="navbarsExample05" aria-expanded="false"
            aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
         </button>

         <div class="collapse navbar-collapse justify-content-end"
            id="navbarsExample05" align="right">

			<!--     검색하기 -->
			<form id="search_form" action="${pageContext.request.contextPath}/submain/nav.do" method="GET">
			<div class="search_area" align="right">
				<input id="input_search" class="form-control iptfind" type="search" name="query"
					placeholder="작품으로 검색하시오." maxlength="8" aria-label="Search"> 

				<div class="icon_area">
					<div id="search_icon" class="bi bi-search fs-3 icon"></div>
				</div>
			</div>
			</form>

               <div class="icon_area">
                  <div class="bi bi-search fs-3 icon"></div>
               </div>
            </div>
            

            <ul class="navbar-nav mb-2 mb-lg-0">


    <li class="nav-item dropdown" style="cursor:pointer;">
    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" >
        <i class="bi bi-film fs-3"></i>
    </a>
    <ul class="dropdown-menu row">
        <div class="col-3">
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=10751" style="color : white;">가족</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=27" style="color : white;">공포</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=99" style="color : white;">다큐멘터리</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=18" style="color : white;">드라마</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=10749" style="color : white;">로맨스</a>
        </div>
        <div class="col-3">
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=12" style="color : white;">모험</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=9648" style="color : white;">미스터리</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=80" style="color : white;">범죄</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=37" style="color : white;">서부</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=53" style="color : white;">스릴러</a>
        </div>
        <div class="col-3">
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=16" style="color : white;">애니메이션</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=28" style="color : white;">액션</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=36" style="color : white;">역사</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=10402" style="color : white;">음악</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=10752" style="color : white;">전쟁</a>
        </div>
        <div class="col-3">
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=35" style="color : white;">코미디</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=14" style="color : white;">판타지</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=878" style="color : white;">SF</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=10770" style="color : white;">TV영화</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath }/movie/findgenre.do?id=" style="color : white;">모든장르</a>
        </div>
    </ul>
</li>


<!-- 마이페이지가는거 -->
               <li class="nav-item" id="personCircle">
                  <a class="nav-link" href="${pageContext.request.contextPath}/member/mypage.do?userId=${sessionScope.userId}">
                  <i class="bi bi-person-circle fs-3"></i>
                  </a>
               </li>

<!-- 로그아웃버튼 -->
               <label id="logoutLabel"> <input class="ipt_logout" role="switch"
                  type="checkbox" id="logoutBtn" name="logoutBtn" style="cursor:pointer;"
                  onclick="lBtn()" />
               </label>
            </ul>

         </div>
      </div>
   </nav>
   
   <div id="popUpParent">
<!--       <div id="popUp"></div> -->
   </div>
   
   
   
   <script>

   // 토글버튼 클릭시 로그인 or 로그아웃 
   function lBtn(){
       let flag=document.getElementById("logoutBtn").checked;
       let popUp = document.createElement("div");
       popUp.setAttribute("id","popUp");
       document.querySelector("#popUpParent").append(popUp);
       
       if(flag){
          $.ajax({
             type : "GET",
             url : "${pageContext.request.contextPath}/member/login.do",
             dataType : "text",
             error : function(){
                console.log("에러");
             },
             success : function(data){
            	$("#popUpParent").css("position","absolute");
             	$("#popUpParent").css("top","0%");
             	$("#popUpParent").css("left","0%");
             	$("#popUpParent").css("width","100%");
             	$("#popUpParent").css("height","100%");
             	$("#popUpParent").css("background","rgba(169 ,169, 169,.9)");
             	$("#popUpParent").css("z-index","3");
             	$("#popUpParent").css("backdrop-filter","blur(10px)");
             	$("body").css("-webkit-backdrop-filter","blur(5px)");
             	 
             	$(".scrollLock").css("overflow","hidden");  
            	 
                $("#popUp").html(data);
             }
          })
          
       } else {
          location.href="${pageContext.request.contextPath}/member/logout.do?userId=${sessionScope.userId}";
       }
    }
    
   // 로그인 여부에 따른 토글 버튼 on/off
    window.onload = function(){
       let userId = "${sessionScope.userId}";
       console.log("현재 로그인중인 userId :"+userId);
       if(userId.length > 0){
          document.getElementById("logoutBtn").checked=true;
       } else {
          document.getElementById("logoutBtn").checked=false;
          document.getElementById("personCircle").style="display:none";
       }
    }
    
    // 회원가입 창 보여주기
   function joinDo(){
      // ${pageContext.request.contextPath }/member/join.do
      $.ajax({
          type : "GET",
          url : "${pageContext.request.contextPath}/member/join.do",
          dataType : "text",
          error : function(){
             console.log("에러");
          },
          success : function(data){
             $("#popUp").html(data);
          }
       })
   }
   
    // 회원가입 하기 
   function idJoin(){
      var pattern = /\s/g;
      // 공백 검사를 해주는 정규표현식
      let userId = joinInfo.userId.value;
      let password = joinInfo.password.value;
      let checkpwd = joinInfo.checkpwd.value;
      let nickname = joinInfo.nickname.value;
      
      $.ajax({
         type : "POST",
         url : "${pageContext.request.contextPath}/member/join.do",
         dataType : "text",
         error : function(){
               console.log("에러");
         },
         success : function(data){
            $("#popUp").html(data);
         }
      });
      
      if(password != checkpwd){
         alert("비밀번호가 일치하지 않습니다.");
      } else if (userId.length==0){
         alert("아이디를 입력해주세요");
      } else if (password.length==0){
         alert("비밀번호를 입력해주세요");
      } else if(nickname.length==0){
         alert("닉네임을 입력해주세요");
      }
      
      if(userId.match(pattern) || password.match(pattern)){
         alert("공백을 없애주세요.");
      } else {
         form.submit();
      }
   }
</script>
   
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	
	<script>
		const input_search = document.getElementById('input_search');
	
		input_search.addEventListener('focus', () => {
			input_search.placeholder = '';
		});
	
		input_search.addEventListener('blur', () => {
			input_search.placeholder = '작품으로 검색하시오.';
		});
		
		const search_icon = document.getElementById('search_icon');
		const search_form = document.getElementById('search_form');
		search_icon.addEventListener('click', () => {
			search_form.submit();
		});
		
	</script>
</body>
</html>