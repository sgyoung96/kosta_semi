<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../submain/navcss.css">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'KOTRA_BOLD-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
	background-color: black !important;
}

.video-list ul li {
	position: relative;
	padding-bottom: 55%;
	overflow: hidden;
	text-align: left;
}

.video-list ul li iframe {
	
	left: -50px;
	position: absolute;
	width: 100%;
	height: 100%;
}


  .poster {
    position: relative;
  }

  .emptyvideo {
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
    font-family: 'KOTRA_BOLD-Bold';
	font-size : 1.5em;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate( -50%, -50% );
    color: yellow;
  }

.posterimg{

    background-size: cover;
}
</style>


</head>
<%@include file="../submain/nav.jsp" %>
<body>



	<c:if test="${not empty key}">


		<div class="video-list">
			<ul>
				<li><iframe
						src="https://www.youtube.com/embed/${key}?controls=0&rel=0&modestbranding=1&autoplay=1&loop=1&wmode=opaque&rel=0&disablekb=1&cc_load_policy=1"
						frameborder="0" framespacing="0" marginheight="0" marginwidth="0"
						scrolling="no" vspace="0"
						allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen> </iframe></li>
			</ul>
		</div>

	</c:if>

	<div class="poster">
		<c:if test="${empty key}">
			 <h1 class="emptyvideo" style="font-size:50px; top:300px;">준비 된 예고편이 없습니다</h1>

		</c:if>
	</div>



</body>
</html>