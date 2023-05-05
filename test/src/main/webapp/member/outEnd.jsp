<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	#b {
		font-family: 'KOTRA_BOLD-Bold';
	}
	
	.button {
		margin-top : 15px;
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
	
	#pop {
	width: 400px;
	height: 500px;
	margin-left: -100px;
	margin-top: -150px;
	left: 50%;
	top: 50%;
	background: #3d3d3d;
	color: #fff;
	position: absolute;
	text-align: center;
	border-radius: 10px;
	/* 		display : flex;  화면 크기에 따라 크기가 달라지게 하는 것*/
}
</style>
</head>

<center>
<body>
	<div id="pop">
	<div id="a"><img src="/test/image/logo4.png" width="140"></div>
    <form action="${pageContext.request.contextPath }/main/page.do" method="post">
	<div id="b" style="font-size:54pt">Bye!</div>
	<input type="submit" class="button" value="로그인전메인이동">
	</form>
	</div>
</body>
</center>
</html>