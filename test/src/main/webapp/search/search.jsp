<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 
<link rel="stylesheet" href="/submain/navcss.css">

<title>검색(인기순)</title>
<style>

@font-face {
    font-family: 'KOTRA_BOLD-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

.card{
margin:auto;
background-color:black !important;
color: white;
}

.main_content{
padding-top: 30px;
font-family: 'SUIT-Regular';
src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
font-weight: normal;
font-style: normal;
}

.poster{
width: 150px;
margin-left : 5px;  
 margin-top :5px;  
 margin-bottom :5px;  
border-radius: 10px;
}


body{
background-color:#212121 !important;
}

.img_box{
float:left;
width: 150px !important;

}

.desc_box{
float:left;
width: 70vw !important;
height:225px !important;
margin: 0;
flex-direction: row !important;
	overflow: hidden;
}

.movie_desc{
    width: 950px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: normal;
    line-height: 1.2;
    height: 3.6em;
    text-align: left;
    word-wrap: break-word;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    font-size : 1.1em;
}

@media (max-width:800px){
}

.card_box{
	transition: all 0.2s linear;
	border-color: gold !important;
}

.card_box:hover{
	transform: scale(1.03); /* 1.1 변경하면 글씨 가려짐 */
}


.text-muted{
	color:white !important;
}

</style>
</head>
<body>
<!-- 네비바 -->
<%@include file="/submain/nav.jsp" %>


<div class="main_content">
<div style="width:100%;">
<p style="display: block; width:1200px; margin: auto; color:white;" class ="searchresult">검색 결과 : ' ${text } '</p>
</div>
<c:forEach var="vo" items="${searchlist }">
	<div class="card mb-2 card_box" style="max-width:80%; flex-direction:row; border-radius:8px; margin-top: 20px;">
	  
	    <div class="col-md-4 img_box">
	      <a href="${pageContext.request.contextPath }/movie/detail.do?id=${vo.id }">
	      <img src="https://image.tmdb.org/t/p/original${vo.poster_path}" class="poster" alt="검색결과">
	      </a>
	    </div>
	    
	    <div class="desc_box">
	    <div class="col-md-8">
	      <div class="card-body">
	        <h5 class="card-title" style="color:white;"><b>${vo.title }</b></h5>
	        
	        <p><small class="text-muted">개봉일: ${vo.release_date }</small></p>
	        <p class="movie_desc" style="color:white;">${vo.overview }</p>
	      </div>
	    </div>
	    </div>
	 
	</div>
</c:forEach>
</div>

</body>
</html>