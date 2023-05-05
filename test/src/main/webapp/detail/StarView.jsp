<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/detailCss.css?after">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'KOTRA_BOLD-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.starbtn:hover{
	transform:scale(1.1);
  	transition: transform .2s;
}
.starbtn{
	cursor : pointer;
}
 /* 별점주기 */
.star-rating {
  display: inline-block;
  
  font-size: 0;
  margin: 0;
  padding: 0;
  
  /*거꾸로 별점 다시잡기*/
  display: inline-block;
  direction: rtl;
}

.star-rating input {
  display: none;
}

.star-rating label {
  color: #ddd;
  font-size: 2rem;
  margin: 0 0.2rem;
  cursor: pointer;
}

.star-rating label:hover,
.star-rating label:hover ~ label,
.star-rating input:checked ~ label {
  color: #FADE6D;
}

.star-rating input:checked ~ label {
  color: #FADE6D;
} 

/* 리스트 css */
#listBody{
	background-color: #212121;
	color:white;
	text-align : center;
}

.posterImg:hover{
	transform:scale(1.03);
  	transition: transform .3s;
}

.posterImg{
	align-items:center;
	text-align:center;
	border-radius : 10px; 
}

.list {
	margin-left: auto;
	margin-right: auto;
	max-width: 1200px;
}

.col{
	margin: auto;
	margin-bottom : 50px;
	float:left;
}

.jpg_wrap{
	width: 273px;
	position: relative;
	text-align:center;
}

.text{
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff') format('woff');
	color: white;
	text-align: center;
	font-family: 'KOTRA_BOLD-Bold';
	font-size : 15px;
    white-space: nowrap;
	text-overflow: ellipsis;
	margin-top:8px;
}

.hTitle{
	margin-top : 30px;
	margin-bottom : 20px;
	font-family: 'KOTRA_BOLD-Bold';
}

.layout{
	margin-top:40px;
}
</style>
</head>

<body id="listBody">
<%@include file="/submain/nav.jsp" %>
<h2 class="hTitle">Star List</h2>
<span>
	<div class="star-rating">
		<input type="radio" id="5-stars" name="rating" value="5" /> 
		<label for="5-stars" class="star">★</label> 
		<input type="radio" id="4-stars" name="rating" value="4" /> 
		<label for="4-stars" class="star">★</label> 
		<input type="radio" id="3-stars"name="rating" value="3" />
		<label for="3-stars" class="star">★</label> 
		<input type="radio" id="2-stars"name="rating" value="2" /> 
		<label for="2-stars" class="star">★</label> 
		<input type="radio" id="1-star" name="rating" value="1" /> 
		<label for="1-star" class="star">★</label>
	</div>
</span>


<div id="msg" style="margin-top:30px">
	💫 보고싶은 별점 개수를 클릭하세욤 💫
</div>

<div class="layout">
<div class="list">
<c:if test="${not empty sList}">
	<div id="star1" style="display:none" class="row row-cols-md-2 row-cols-lg-4 g-4">
		<c:forEach var="li" items="${s1ImgList }">
			<div class="col">
				<div class="jpg_wrap">
					<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }">
						<img class="posterImg" src="${li.poster_path }" style="width:200px">
					</a>
				</div>
				<div class="text">${li.title }</div>
			</div>
		</c:forEach>
	</div>
	
	<div id="star2" style="display:none" class="row row-cols-md-2 row-cols-lg-4 g-4">
		<c:forEach var="li" items="${s2ImgList }">
			<div class="col">
				<div class="jpg_wrap">
					<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }">
						<img class="posterImg" src="${li.poster_path }" style="width:200px">
					</a>
				</div>
				<div class="text">${li.title }</div>
			</div>
		</c:forEach>
	</div>
	
	<div id="star3" style="display:none" class="row row-cols-md-2 row-cols-lg-4 g-4">
		<c:forEach var="li" items="${s3ImgList }">
			<div class="col">
				<div class="jpg_wrap">
					<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }">
						<img class="posterImg" src="${li.poster_path }" style="width:200px">
					</a>
				</div>
				<div class="text">${li.title }</div>
			</div>
		</c:forEach>	
	</div>
	
	<div id="star4"  style="display:none"  class="row row-cols-md-2 row-cols-lg-4 g-4">
		<c:forEach var="li" items="${s4ImgList }">
			<div class="col">
				<div class="jpg_wrap">
					<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }">
						<img class="posterImg" src="${li.poster_path }" style="width:200px">
					</a>
				</div>
				<div class="text">${li.title }</div>
			</div>
		</c:forEach>
	</div>
	
	<div id="star5" style="display:none" class="row row-cols-md-2 row-cols-lg-4 g-4" >
		<c:forEach var="li" items="${s5ImgList }">
			<div class="col">
				<div class="jpg_wrap">
					<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }">
						<img class="posterImg" src="${li.poster_path }" style="width:200px">
					</a>
				</div>
				<div class="text">${li.title }</div>
			</div>
		</c:forEach>
	</div>
</c:if>
</div>
</div>


<script>

$('.star-rating input').click(function() {
	 
    var value = $(this).val();
    console.log(value);
    
    let star='star'+value;
	document.getElementById("msg").style="display:none";
	
	for(let i=1; i<=5; i++){		
		var a = document.getElementById("star"+i);
		if(a.style.display === ''){
			a.style.display = 'none';
		}
	}
	document.getElementById(star).style="display:";
    
});
</script>
</body>
</html>