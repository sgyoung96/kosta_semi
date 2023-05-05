<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/submain/reset.css">
<link rel="stylesheet" href="/submain/navcss.css">
<title>인기순</title>
<style>

.list {
	margin-left: auto;
	margin-right: auto;
	max-width: 1200px;
}

h2{
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
	color: white;
	background-color: #212121;
	font-family: 'KOTRA_BOLD-Bold';
}

.text{
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
	color: white;
	text-align: center;
	font-family: 'KOTRA_BOLD-Bold';
	font-size : 15px;
	overflow: hidden;
    white-space: nowrap;
	text-overflow: ellipsis;
	margin-top: 20px;
}

.col{
	margin: auto;
}


/* 버튼양식 */
.floating-leftbtn{
	position: fixed;
	bottom: 250px;
	left: 20px;
	color: black;
	font-size: 15px;
	padding: 20px;
	border: none;
	cursor: pointer;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.floating-rightbtn{
	position: fixed;
	bottom: 250px;
	right: 20px;
	color: black;
	font-size: 15px;
	padding: 20px;
	border: none;
	cursor: pointer;
	box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}

.not_s{
margin-top: 12px;
margin-left: 10px;
color: #d3d3d3;
}

.title__l{
	color: white;
	float:left;
	cursor:pointer;
	style=text-decoration:none;
}

/* .title__l.active{
 	font-size: 20px; 
 } */

.img{
	width: 273px;
	height: 26rem;
	object-fit: cover;
	transition: all 0.2s linear;
	border-radius: 10px;
}

.img:hover{
	transform: scale(1.03); /* 1.1 변경하면 글씨 가려짐 */
}

.layout{
	background-color: #212121;
}

.bgcolor{
	background-color:#212121;
	padding-top: 40px;
}

.jpg_wrap{
	width: 273px !important;
	height: 416px;
	margin-bottom: 10px;
	position: relative;
}

.title{
	margin-left: 160px;
	height: 76px;
}

a{
	color: white !important;
	text-decoration: none !important;
}
</style>

</head>
<body>
<!-- 메뉴 상당바 출력 -->
<%@include file="/submain/nav.jsp" %>

<div class="bgcolor">
<div class="title">
<h2 class="title__l"><a href="${pageContext.request.contextPath }/submain/populer.do?num=1">인기순</a></h2>
<p class="title__l not_s"><a href="${pageContext.request.contextPath }/submain/toprate.do?num=1">평점순</a></p>
<p class="title__l not_s"><a href="${pageContext.request.contextPath }/submain/upcoming.do?num=1">개봉예정작</a></p>
</div>
</div>

<div class="layout">
<div class="list">
<div class="row row-cols-md-2 row-cols-lg-4 g-4">
  <c:forEach var="vo" items="${movielist }">
    <div class="col">
        <a href="${pageContext.request.contextPath }/movie/detail.do?id=${vo.id }">
        <div class="jpg_wrap">
          <img src="https://image.tmdb.org/t/p/original${vo.poster_path}" class="img" alt="인기순">
         </div>
        </a>
          <div class="text">${vo.title }</div>
       </div>
  </c:forEach>
</div>
</div>
</div>
<a href="${pageContext.request.contextPath}/submain/nextpopuler.do?num=${prev}">
<img src="${pageContext.request.contextPath}/image/left-arrow.png" id="floatingBtn1" class="floating-leftbtn" alt="이전페이지" style="width:100px; height: 100px;">
<!-- <input type="button" id="floatingBtn1" class="floating-leftbtn" value="이전페이지">--> </a>

<a href="${pageContext.request.contextPath}/submain/nextpopuler.do?num=${next}">
<img src="${pageContext.request.contextPath}/image/right-arrow.png" id="floatingBtn2" class="floating-rightbtn" alt="다음페이지" style="width:100px; height: 100px;">
<!-- <input type="button" id="floatingBtn2" class="floating-rightbtn" value="다음페이지"> --> </a>



</body>
</html>