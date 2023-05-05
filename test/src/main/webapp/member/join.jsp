<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#spanPwd, #spanId{
color : #FFDD55;
}

#password, #checkpwd{
	outline: 0;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid gray;
	width: 170px;
	height: 24px;
	background-color: black;
	color: white;
	margin-bottom : 5px;
}


/*loginJoinCss.css*/
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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/loginJoinCss.css"> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		$("#checkpwd").change(function(){
			let pwd = $("#password").val();
			let check = $("#checkpwd").val();
			
			if(pwd==check){
				$("#spanPwd").html("비밀번호 일치");
			} else {
				$("#spanPwd").html("비밀번호 불일치");
			}
		});
	});

	
	function idcheck(){
		const xhttp = new XMLHttpRequest();
		let txt=" ";
		
		xhttp.onload = function(){
			let val = xhttp.responseText;
			let obj = JSON.parse(val);
			if(obj.flag){
				txt = "사용 가능한 아이디";
				console.log(txt);
			} else{
				txt = "사용 불가능한 아이디";
				console.log(txt);
			}
			
			document.getElementById("spanId").innerHTML = txt;
		}
		
		let param = "?userId=" + joinInfo.userId.value;
		xhttp.open("GET", "${pageContext.request.contextPath}/member/idcheck.do" + param);
		xhttp.send();
	}

	
	function frameclose() {
		document.getElementById("popUp").remove();
		document.getElementById("logoutBtn").checked=false;
		document.getElementById("popUpParent").style.backdropFilter = "blue(0px)";
		document.getElementById("popUpParent").style="background : rgba(169 ,169, 169,0)";
		//$("#popUpParent").css("backdrop-filter","blur(0px)");
		//$("#popUpParent").css("background","rgba(169 ,169, 169,0)");
	}
	
	function idJoin() {
		var pattern = /\s/g;
		if($('#password').val() != $('#checkpwd').val()){
			alert("비밀번호가 일치하지 않습니다.");
		} else if ($('#userId').val().length==0){
			alert("아이디를 입력해주세요");
		} else if ($('#password').val().length==0){
			alert("비밀번호를 입력해주세요");
		} else if($('#nickname').val().length==0){
			alert("닉네임을 입력해주세요");
		} else if($('#userId').val().match(pattern) || $('#password').val().match(pattern)){
			alert("공백을 없애주세요.");
		} else {
			var param = {
					userId: $('#userId').val(),
					password: $('#password').val(),
					nickname: $('#nickname').val()
						};
			
			$.ajax({
				type : "POST",
				url : "${pageContext.request.contextPath}/member/join.do",
				data: param,
				dataType : "text",
				error : function(){
					console.log("에러");
				},
				success : function(data){
					$("#popUp").html(data);
				}
			});
		}
	}
</script>
</head>
<body>
	<div id="pop">
	<form name="joinInfo" action="${pageContext.request.contextPath }/member/join.do" action="post">
		<div id="a"><img src="/test/image/logo4.png" width="100"></div>
		<input id="userId" type="text" name="userId" placeholder="아이디">
		<div><input id="chek" class="button"  type="button" value="중복확인" onclick="idcheck()"></div>
		<div><span id="spanId"></span></div>
		<div><input id="nickname" type="text" name="nickname" placeholder="닉네임"></div>
		<div><input type="password" name="password" id="password" placeholder="비밀번호"></div>
		<div><input type="password" name="checkpwd" id="checkpwd" placeholder="비밀번호 확인"></div>
		<div ><span id="spanPwd"></span></div>
<!--          밑줄 효과주려고 새로 만든 버튼 -->
		<span class="yesMan" id="d" style="cursor:pointer;" onclick="idJoin()">가입완료</span>
<!--          원래 있던 버튼 -->		
<!-- 		<input class="button"  id="d" type="button" value="가입완료" onclick="idJoin()"> -->
		
		<div id="f">
      	<img src="../image/close.png" style="width:30px; cursor:pointer" onclick="frameclose()">
      	</div>
	</form>
	</div>
</body>
</html>