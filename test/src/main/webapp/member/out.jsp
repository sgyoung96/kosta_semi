<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	@font-face {
		font-family: 'KOTRA_BOLD-Bold';
   		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    	font-weight: normal;
    	font-style: normal;
	}
	
	body {
		background-color : black;
		color : white;
	}
	
	#check {
		font-family: 'KOTRA_BOLD-Bold';
	}
		
		#a {
			margin-bottom : 20px;	
		}
		
		#b {
			margin-right : 15px;
		}
</style>
	
<script type="text/javascript">
	function del() {
		console.log("찐비번 : ${m.password}");
		console.log("내가입력한 비번 : "+f.password.value);
		if('${m.password }'== f.password.value){
			f.submit();
			
		} else {
			let check = document.getElementById("check");
			check.innerHTML="Wrong!";
			console.log(check);
		}
	}
</script>
</head>
<center>
<body>
	<div id="check" style="font-size:54pt">Really?</div>
	<form action="${pageContext.request.contextPath }/member/out.do" method="post" name="f">
	<div id="a"><input type="password" name="password" placeholder="비밀번호"><span id="msg"></span></div>
	<input type="hidden" name="userId" value="${sessionScope.userId }">
	<div>
		<span id="b"><input type="button" value="탈퇴" onclick="del()"></span>
		<span><input type="button" value="취소" onclick="location.href='/main/page.do'"></span>
	</div>
	</form>
</body>
</center>
</html>