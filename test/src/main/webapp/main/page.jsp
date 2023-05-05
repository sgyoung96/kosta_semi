<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조각조각땃땃땃</title>

<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script> -->
<link rel="stylesheet" href="../submain/navcss.css">


<style>


.main {
	position: relative;
	background: black;
	width: 100%;
	height: 100%;
	overflow: hidden;
	z-index: 1;
}

.d-block{
	height: 635px;
}

.carousel-item{
	background-color: black;
	width: 100%;
    height: 100%;
}

/* 캐러셀 안 img 크기 */
.carousel-item img{ 
 	max-width: 100%;
 	max-height: 700px;
	margin: auto;

}

.carousel-control-prev, .carousel-control-next	{
	width:10%;
	background-color: black;
}

</style>

</head>
<body>
<%-- <%@include file="/submain/nav.jsp" %> --%>
<jsp:include page="../submain/nav.jsp" flush="true"/>

<div class="main">

<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="1300">
<div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="2" aria-label="Slide 3"></button>
    <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="3" aria-label="Slide 4"></button>
    <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="4" aria-label="Slide 5"></button>
    <button type="button" data-bs-target="#carouselExampleFade" data-bs-slide-to="5" aria-label="Slide 6"></button>    
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <a href="${pageContext.request.contextPath }/submain/populer.do?num=1">
      <img src="https://img.youtube.com/vi/qEVUtrk8_B4/maxresdefault.jpg" class="d-block" alt="존윅(인기순)">
      </a>
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <a href="${pageContext.request.contextPath }/submain/populer.do?num=1">
      <img src="https://img.youtube.com/vi/zmNRHgRG3lo/maxresdefault.jpg" class="d-block" alt="분노의질주(개봉예정)">
      </a>
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <a href="${pageContext.request.contextPath }/submain/populer.do?num=1">
      <img src="https://img.youtube.com/vi/jWM0ct-OLsM/maxresdefault.jpg" class="d-block" alt="주토피아">
      </a>
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <a href="${pageContext.request.contextPath }/submain/populer.do?num=1">
      <img src="https://img.youtube.com/vi/jBdRhhSt3Bc/maxresdefault.jpg" class="d-block" alt="기생충(평점순)">
      </a>
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <a href="${pageContext.request.contextPath }/submain/populer.do?num=1">
      <img src="https://img.youtube.com/vi/aXeJ8NM7c9g/maxresdefault.jpg" class="d-block" alt="멜로">
      </a>
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
    <div class="carousel-item">
      <a href="${pageContext.request.contextPath }/submain/populer.do?num=1">
      <img src="https://img.youtube.com/vi/iwROgK94zcM/maxresdefault.jpg" class="d-block" alt="애니">
      </a>
      <div class="carousel-caption d-none d-md-block">
      </div>
    </div>
  </div>
  
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  
</div>
<br><br><br><br><br>
</div>


<script>
function loginDo() {
	let userId = document.getElementById("b").value;
	let password = document.getElementById("c").value;
	
	$.ajax({
		url : '${pageContext.request.contextPath }/member/password.do',
		type : "post",
		data : {"userId": userId, "password" : password},
		dataType : "json",
		success : function(result) {
			if(result.flag == true) {
				$.ajax({
					url : '${pageContext.request.contextPath }/member/login.do',
					type : "post",
					data : {"userId": userId, "password" : password},
					success : function(result) {
						$("#popUp").hide();
						$("#personCircle").show();
					},
					error : function(req, status, error){
						console.log(status);
					}
				});
			} else {
				console.log("비밀번호 불일치");
				$("#log").html("비밀번호 불일치");				
			}
		},
		error : function(req, status, error){
			console.log(status);
		}
	});
}

function frameclose() {
	document.getElementById("popUp").remove();
	document.getElementById("logoutBtn").checked=false;
	// $("#popUpParent").css("background","rgba(169 ,169, 169,.9)");
	document.getElementById("popUpParent").style.background="rgba(169 ,169, 169,.0)";
// 	document.getElementById("popUpParent").style.backdrop-filter="blur(10px)";
//	$("#popUpParent").css("backdrop-filter","blur(10px)");
}

</script>
</body>
</html>