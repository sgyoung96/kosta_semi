<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="../submain/navcss.css">
<title>장르별</title>
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
<%@include file="../submain/nav.jsp" %>

<!-- 무슨장르 선택했나 보여주는 코드 -->
<div class="bgcolor">
<div class="title">
<c:forEach var="genrename" items="${genrename}">
  <c:if test="${genrename.id.equals(genrenum)}">
    <h2>[${genrename.video_path}]</h2>
  </c:if>
</c:forEach>
</div>
</div>

<!-- 선택한 장르 리스트 보여주는 코드 -->
<div class="layout">
<div class="list">
<div class="row row-cols-md-2 row-cols-lg-4 g-4">
  <c:forEach var="vo" items="${movielist }">
  <br/>
    <div class="col">
        <a href="${pageContext.request.contextPath }/movie/detail.do?id=${vo.id }">
          <img src="https://image.tmdb.org/t/p/original${vo.poster_path}" class="card-img-top" alt="인기순">
        </a>
          <div class="text">${vo.title }</div>
       </div>
  </c:forEach>
</div>
</div>
</div>
</body>
</html>