<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/detailCss.css?after">

<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'KOTRA_BOLD-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10-21@1.1/KOTRA_BOLD-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

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
	margin-bottom : 60px;
	font-family: 'KOTRA_BOLD-Bold';
}


</style>
</head>
<body id="listBody">
<%@include file="/submain/nav.jsp" %>
<h2 class="hTitle">Wish List</h2>
<div class="layout">
<div class="list">
<div class="row row-cols-md-2 row-cols-lg-4 g-4">
<c:if test="${not empty wImgList}">
	<c:forEach var="li" items="${wImgList }" varStatus="status">
		<div id="w${li.id }" class="col">
			<div class="jpg_wrap">
				<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }">
					<img class="posterImg" src="${li.poster_path }" style="width:200px">
				</a>
			</div>	
			<div class="text">${li.title }</div>
		</div>
	</c:forEach>	
</c:if>
</div>
</div>
</div>

</body>
</html>