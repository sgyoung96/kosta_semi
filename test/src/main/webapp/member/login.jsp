<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginJoinCss.css"> --%>

<style>
@charset "UTF-8";

@font-face {
	font-family: 'SUIT-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

body {
	background-color: black;
	color: white;
}


#a {
	margin-top: 30px;
}


#b, #c, #userId, #password, #checkpwd, #nickname {
	outline: 0;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid gray;
	width: 150px;
	height: 24px;
	background-color: #3d3d3d;
	text-align : center;
	color: white;
}


input::-webkit-input-placeholder {
	text-align: center
}


#b {
	margin-top: 60px;
	margin-bottom: 20px;
}


#c {
	margin-bottom: 40px;
}


#f {
	margin-top : 30px;
}


#d {
	margin-top : 20px;
}


#password {
	margin-top : 30px;
}


#nickname, #userId {
	margin-top : 15px;
}


.button {
	font-family: 'SUIT-Regular';
	font-weight: 700;
	background: none;
	text-align: center;
	cursor: pointer;
	color: white;
	border: 0;
	outline: 0;
	top: 300px;
}


#chek {
	background : #FADE6D;
}

#pop {
	z-index:100;
	width: 400px;
	height: 500px;
/* 	top: ; */
	

	background: #3d3d3d;
	color: #fff;
	position: absolute;
	left : 0;
	right : 0;
	top : 0;
	bottom : 0;
	margin : auto;
	text-align: center;
	border-radius: 10px;
	/* 		display : flex;  화면 크기에 따라 크기가 달라지게 하는 것*/
}


#popUp{
	align-items:center;
	
}


#log2 {
	color : white;
}

.yesMan{
  position: relative;
  font-weight: 700;
  padding-right:5px;
  cursor:pointer;
}
.yesMan:after{
  content: "";
  position: absolute;
  left: 0;
  bottom: -3px;
  width: 0px;
  height: 10px;
  margin: 5px 0 0;
  transition: all 0.2s ease-in-out;
  transition-duration: 0.3s;
  opacity: 0;
  background-color: #FEDD54;
  z-index:-1;
}
.yesMan:hover:after{
  width: 100%;
  opacity: 1;
}

.yesMan:hover{
 transform: scale(1.05);
  transition: transform .3s;
}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">

	function frameclose() {
		document.getElementById("popUp").remove();
		document.getElementById("logoutBtn").checked=false;
		document.getElementById("popUpParent").style.backdropFilter = "blue(0px)";
		document.getElementById("popUpParent").style="background : rgba(169 ,169, 169,0)";
	}

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
					//location.href='${pageContext.request.contextPath }/member/login.do?userId='+userId+'&password='+password;
					
					var form=document.createElement('form');
					var objs;
					objs = document.createElement('form');
					objs.setAttribute('userId',userId);
					objs.setAttribute('password',password);
					form.appendChild(objs);
					form.setAttribute('method','post');
					form.setAttribute('action','${pageContext.request.contextPath }/member/login.do');
					document.body.appendChild(form);
					form.submit();
					
					$("#popUp").hide();
					$("#popUpParent").css("backdrop-filter","blur(0px)");
					$("#popUpParent").css("background","rgba(169 ,169, 169,0)");
					$("#personCircle").show();
// 					$.ajax({
// 						url : '${pageContext.request.contextPath }/member/login.do',
// 						type : "post",
// 						data : {"userId": userId, "password" : password},
// 						success : function(result) {
// 							$("#popUp").hide();
// 							$("#popUpParent").css("backdrop-filter","blur(0px)");
// 							$("#popUpParent").css("background","rgba(169 ,169, 169,0)");
// 							$("#personCircle").show();
// 						},
// 						error : function(req, status, error){
// 							console.log(status);
// 						}
// 					});
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
	
</script>
</head>

<body>
<!-- <div class="login_popup" align="center"> -->
   <div id="pop">
      <div id="a"><img src="/test/image/logo4.png" width="100" ></div>
      <form action="${pageContext.request.contextPath }/member/join.do" method="post">
         <div><input id="b" type="text" name="userId" placeholder="아이디"></div>
         <div><input id="c" type="password" name="password" placeholder="비밀번호"></div>
         <div>
         <div id="log"></div>
         
<!--          밑줄 효과주려고 새로 만든 버튼 -->
         <span class="yesMan" id="log2" style="cursor:pointer;" onclick="loginDo()">로그인</span>
         <span class="yesMan" id="e" style="cursor:pointer;" onclick="joinDo()">회원가입</span>
         
<!--          원래 있던 버튼 -->
<!--          <input id="log2" type="button" class="button" value="로그인" onclick="loginDo()"> -->
<!--          <input id="e" type="button" class="button" value="회원가입" onclick="joinDo()"> -->
         
         </div>
      	 <div id="f" style="cursor:pointer;">
      	 <img src="../image/close.png" style="width:30px; margin:30px" onclick="frameclose()">
      	 </div>
      </form>
      </div>
<!-- </div> -->

<script>

jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", ( jQuery(window).height() - this.height() ) / 2+jQuery(window).scrollTop() + "px");
    this.css("left", ( jQuery(window).width() - this.width() ) / 2+jQuery(window).scrollLeft() + "px");
    return this;
  }
  
jQuery(".login_popup").center();

</script>
</body>

</html>