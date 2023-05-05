<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/myListCss.css?after">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body id="listBody">
<%@include file="/submain/nav.jsp" %>
<h2 class="hTitle">Wish List</h2>
<c:if test="${not empty wList}">
<div class="layout">
<div class="list">
<div class="row row-cols-md-2 row-cols-lg-4 g-4">
		<c:forEach var="li" items="${wList }" varStatus="status">
			<div id="w${li.movieNum }" class="col">
				<div class="jpg_wrap">
				<a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.movieNum }">
					<img class="posterImg" src="${wImgList[status.index].poster_path }" style="width:200px">
				</a>	
				</div>
				<div class="text">
					<div class="title">
						${wImgList[status.index].title }
					</div>
					<div>
						<div class="right_area">
							<div class="icon heart"> 	
								<img class="fullheart" src="${pageContext.request.contextPath}/image/yellowheart.png" alt="노란하트"  onclick="wish('${li.movieNum }')" style="width:20px"> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
</div>	
</div>	
</div>	
</c:if>

<script>
function wish(num){
	let divMovie = "#w"+num;
	console.log(num);
	let param = {movieNum : num, userId : '${sessionScope.userId}'};
	let get = document.getElementById("w"+num).getElementsByClassName("fullheart")[0];
	console.log(get);
	get.src="${pageContext.request.contextPath}/image/heart.png";

	
	$.ajax({
		url : "${pageContext.request.contextPath }/detail/cancelwish.do",
		type : "post",
		data : {movieNum : num, userId : '${sessionScope.userId}'},
		success : function(result){
			console.log(result);
			$(divMovie).hide(350);
		},
		error : function(req, status, error){
			console.log("에러 :"+status);
		}
	});
}



</script>
</body>
</html>