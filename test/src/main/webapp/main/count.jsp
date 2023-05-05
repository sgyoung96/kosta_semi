<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>상영시작 5초전</title>
<style>
body{
	background-color: #212121;
}

.cnt{
	text-aline:center;
	padding-left:460px;
	padding-top: 200px;
}
</style>



</head>
<body>

<div class="cnt">
<img src="${pageContext.request.contextPath }/image/count.gif">
</div>

<script>
window.onload = function() { 
      
         setTimeout(function(){
           location.href = "${pageContext.request.contextPath }/main/page.jsp";
         }, 4830); // 5초 후에 이동할 페이지 주소를 입력하세요.
    
}
</script>
</body>
</html>