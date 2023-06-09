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
html, body {
	width: 100%;
	height: 100%;
	padding: 0;
	margin: 0;
}

body {
	background-image: url('./bg.jpg'); /* 배경이미지 */
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
}

body.dimmed::before {
	content: '';
	position: fixed;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	background-color: rgba(255, 255, 255, 0.75);
	-webkit-backdrop-filter: blur(5px);
	backdrop-filter: blur(5px);
}

.popup {
	z-index: 1;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	min-width: 300px;
	max-width: 600px;
	background-color: #fff;
	border-radius: 15px;
	box-shadow: 0 2px 55px -25px rgb(0 0 0/ 100%);
}

.popup>.title {
	border-radius: 15px 15px 0 0;
	min-height: 40px;
	color: #fff;
	background-color: #b66;
	padding: 10px 15px;
	box-sizing: border-box;
	font-weight: bold;
}

.popup>.content {
	padding: 20px;
	box-sizing: border-box;
}

.popup>.cmd {
	bottom: 0;
	min-height: 40px;
	padding: 15px 15px;
	box-sizing: border-box;
	border-radius: 0 0 15px 15px;
	min-height: 40px;
	text-align: right;
}

.popup>.cmd .button {
	border-radius: 8px;
	padding: 5px 10px;
	border: 1px solid #aaa;
}

.popup>.cmd .button:hover {
	color: #fff;
	background-color: #000;
	border-color: #000;
}
</style>

</head>
<body class="dimmed">
	<div class="popup">
		<div class="title">하계 휴가로 인한 휴무 안내</div>
		<div class="content">
			<p>7월 27일 ~ 7월 31일까지는 당사 하계 휴가기간입니다.</p>
			<p>
				휴가 기간동안 고객지원센터 전화 문의와 이메일 및 게시판 지원이 중지됩니다.<br> 7월 27일 오후 1시 이후
				주문 제품은 8월 2일(월) 일괄 발송됩니다.<br> 휴가기간 동안 반품 수령건은 정상 수령이 가능하며 이
				기간동안 수령된 반품건 또한 8월 2일(월) 일괄 처리됩니다.
			</p>
			<p>감사합니다.</p>
		</div>
		<div class="cmd">
			<input type="button" name="btnclose" class="button" value="닫기">
		</div>
	</div>
</body>
</html>