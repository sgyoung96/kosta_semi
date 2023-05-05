<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>
@font-face {
	font-family: 'SUIT-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#pwd, #nickName{
	outline: 0;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 3px solid black;
	width: 100px;
	height: 24px;
	background-color: #696969;
	color: black;
	margin-bottom:10px;
}



.editBtn, .cancelBtn{
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

.to-right-underline{
  position: relative;
}
.to-right-underline:after{
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
.to-right-underline:hover:after{
  width: 100%;
  opacity: 1;
}

.editBtn:hover{
	transform:scale(1.05);
	transition: transform .2s;
}

body{
	font-family: 'SUIT-Regular';
}

#editTitle{
	margin-top:5px;
}

#editContent{
	margin-top:70px;
	margin-bottom:50px;
}

#box{
	width:100%;
	height:90%;
}

input::placeholder{
	color:#999999;
}

#editEndJJin{
  position: relative;
  color:black;
  text-decoration: none;
}
#editEndJJin:after{
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
  background-color: #EF7953;
  z-index:-1;
}
#editEndJJin:hover:after{
  width: 100%;
  opacity: 1;
}

#editResult{
	color: #EF7953;
	margin-bottom:10px;
}
</style>
</head>
<body>
	<div id="box">
		<h2 id="editTitle">정보 수정</h2>
		<div id="editContent">
 			<form name="editForm" action="${pageContext.request.contextPath }/member/edit.do?userId=${sessionScope.userId}" method="post">
				<div style="margin-right:10px">
					&nbsp;비밀번호 수정 &nbsp; <input id="pwd" name="pwd" placeholder="비밀번호 입력">
				</div>
				<div style="margin-right:10px">
					&nbsp;&nbsp;닉네임 수정&nbsp;&nbsp;&nbsp; <input id="nickName" name="nickname" placeholder="${vo.nickname }">
				</div>
				<br/>
				<div id="editResult"></div>
				<span class="to-right-underline"><input class="editBtn" type="button" value="수정하기"></span>
<!--  				<span class="to-right-underline"><input class="cancelBtn" type="button" value="취소하기"></span>  -->
			</form>
		</div>
		<a id="editEndJJin" href="${pageContext.request.contextPath }/member/out.do?userId=${sessionScope.userId}">탈퇴하기</a>
	</div>

	<script>
		$(".editBtn").click(function(){
			let pwd = document.getElementById("pwd").value;
			let nickname = document.getElementById("nickName").value;
			let addImg= '<img src="${pageContext.request.contextPath }/image/user.png" style="width:20px">';
			
			if(pwd.length>0 && nickname.length>0){
				$.ajax({
					url : '${pageContext.request.contextPath }/member/edit.do',
					type : "post",
					dataType : 'JSON',
					data : {"userId": '${sessionScope.userId}', "password":pwd, "nickname":nickname},
					success : function(result){
						document.getElementById("pwd").value="";
						document.getElementById("nickName").value="";
						document.getElementById("pwd").placeholder="비밀번호 입력";
						document.getElementById("nickName").placeholder=result.nickname;
						$("#editResult").html("수정 완료 !_!");
						$("#editResult").css("color","#FEDD54");
						$("#nickname2").html(nickname);
						
					},
					error : function(req, status, error){
						console.log(status);
					}
				})	;	
			} else{
				$("#editResult").html("빈 값이 입력되었습니다.");
				$("#editResult").css("color","#EF7953");
			}
				
		});
		
		$(".cancelBtn").click(function(){
			console.log("클릭 펑션");
			
			$("input[id='popup2'] + label + div").css("display",'none');
			$("input[id='popup2']").css("display",'none');
			$("input[id='popup2'] + label + div").css("z-index",'0');
		});
		
	</script>
</body>
</html>