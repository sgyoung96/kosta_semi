<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myListCss.css?after">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/detailCss.css?after">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body id="listBody">
<%@include file="/submain/nav.jsp" %>
<h2 class="hTitle">Comment List</h2>
<div class="layout">
<div class="list">
<div class="row row-cols-md-2 row-cols-lg-4 g-4">
<c:if test="${not empty cList}">
	<c:forEach var="li" items="${cList }" varStatus="status">
		<div id="w${li.movieNum }" class="col">
			<div class="jpg_wrap">
				<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.movieNum }">
					<img class="posterImg" src="${cImgList[status.index].poster_path }" style="width:200px">
				</a>
			</div>	
			
			<div class="text">
				<div style="display: inline-block;  width: 200px; white-space: nowrap;
    overflow: hidden; text-overflow: ellipsis; margin-top:8px; color:#FADE6D">${li.comments }</div>
				
				 
   
    
				
				
				<div style="font-size:13px">${li.w_Date }</div>
				<div>
					<img src="${pageContext.request.contextPath }/image/thumbs-up.png" style="width:16px">
					<span style="font-size:13px">${li.rate}</span>
				</div>
			</div>
		</div>
	</c:forEach>	
</c:if>
</div>
</div>
</div>
</body>
</html>