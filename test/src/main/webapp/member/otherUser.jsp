f<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/member/mypageCss.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script>
   
    //시작하자마자 모든 값들을 일단 가져와    
$(document).ready(function() {    
       
        var $likeBtn =$('.followicon');
        
        let userId = "${sessionScope.userId}";
        console.log(userId);
        
        let followedId = "${followedId}";    
        console.log(followedId);
        
        let flag = "${flag}";
       console.log(flag);
       
       //팔로우 했나 안했나 페이지 로드 하자마자 이미지를 변경해줄 스트립트 
if(flag && flag === 'true'){
          
          $(this).find('.followImg').attr({
                'src': '${pageContext.request.contextPath}/image/add-friend.png',
                 alt:"팔로우 완료"
                 
             });
} 

    
            $likeBtn.click(function(){ //var $likeBtn =$('.followicon'); 버튼 클릭하면 
           $likeBtn.toggleClass('active') //토글 액티브하고 
            console.log("토글버튼까지 생성");

            if(flag && flag === 'false' && $likeBtn.hasClass('active')){         //토글이 액티브 되어 있다면   
                $(this).find('img').attr({ //이미지 변경 
                   'src': '${pageContext.request.contextPath}/image/add-friend.png',
                    alt:'찜하기 완료'
                    
                    
                });
                console.log("팔로우완료");
              } 
            
            
            else {
                $(this).find('i').removeClass('fas').addClass('far')
                $(this).find('img').attr({
                   'src': '${pageContext.request.contextPath}/image/add.png',
                   alt:"팔로우아직안함"
                
                })
                console.log("팔로취소");
              }
            
            $.ajax ({
               url : '${pageContext.request.contextPath }/follow/add.do',
               type : "post",
               data : {"userId" : userId, "followedId" : followedId},
               success : function(result) {
                  console.log("팔로우어쩌고성공");
    
               }
            });
         });
    
}); 
     
</script>

<style>
.write_popup {
		display: inline;
		width: 50%;
		height: 50%;
		padding: 0;
		margin: 0;
		position: absolute;
		z-index: 10;
	}
	
	.dimmed {
		background-color: #99999900;
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center;
	}
	
	.dimmed::before {
		content: '';
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		background-color: rgba(255, 255, 255, 0.55);
		-webkit-backdrop-filter: blur(10px);
		backdrop-filter: blur(10px);
	}
	
	.addpopup {
		z-index: 3;
		position: relative;
		width : 150px;
		heigth: 100px;
		background-color: #fff;
		box-shadow: 0 2px 55px -25px rgb(0 0 0/ 100%);
	}
	
	.addpopup>.addtitle {
		min-height: 40px;
		color: #fff;
		background-color: #FADE6D;
		padding: 10px 15px;
		box-sizing: border-box;
		font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css') format('sans-serif');
	    font-size: 1em;
	}

</style>

</head>
<body id="pBody">
   <!-- 메뉴 상당바 출력 -->
   <%@include file="/submain/nav.jsp" %>
   
   
   
   <div id="linesParent">
      <div id="lines">
      <!-- 한 줄 소개가 없다면 -->
      <c:if test="${empty vo.introLine }">
         <form name="addForm" action="${pageContext.request.contextPath }/member/introLineadd.do?userId=${sessionScope.userId}" method="post">
            <div id="addLine" style="text-align:center">아직 한 줄 소개가 없습니다.</div>
         </form>
      </c:if>
   
      <!-- 한 줄 소개가 있다면 -->
       <c:if test="${not empty vo.introLine }"> 
         <form name="editForm" action="${pageContext.request.contextPath }/member/introLineadd.do?userId=${sessionScope.userId}" method="post">
            <div id="editLine">${vo.introLine }</div>
         </form>
       </c:if> 
      </div>
   </div>
   
   <div id="allListParent">
      <div id="allList">
         <div id="follow">
         <span id="nickname">
         	<img src="${pageContext.request.contextPath }/image/user.png" style="width:20px">
            ${vo.userId }
         </span>
         
         <!-- 팔로워 이미지 -->
         <div class="right_area">
         <div class ="followicon" >
           <img class="followImg" src="${pageContext.request.contextPath}/image/add.png"
           style ="width:30px; padding-top:10px; padding-bottom:10px;" alt="찜하기" >
             </div>
             </div>
         </div>

<script>
$().ready(function () {
            $(".followImg").click(function () {
                const Toast = Swal.mixin({
                    toast: true,
                    position: 'center-center',
                    className : 'swal-wide',
                    showConfirmButton: false,
                    timer: 3000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.addEventListener('mouseenter', Swal.stopTimer)
                        toast.addEventListener('mouseleave', Swal.resumeTimer)
                    }
                })

                Toast.fire({
                    icon: 'success',
                    title: '요청이 완료 되었습니다👍'
                })
            });
        });
</script>

			

			<script> 
     	function initCommentArea() { 
    		$('.write_popup').hide();
    	}
    	
    	jQuery.fn.center = function () {
    	    this.css("position","absolute");
    	    this.css("top", ( jQuery(window).height() - this.height() ) / 2+jQuery(window).scrollTop() + "px");
    	    this.css("left", ( jQuery(window).width() - this.width() ) / 2+jQuery(window).scrollLeft() + "px");
    	    return this;
    	  }
    	  
    	jQuery(".write_popup").center();
    	
//     	function cancel(){
//      		setTimeout(function() { 
//     			$('.write_popup').hide();
//      			}, 1000);
//     	}
    	
         </script>
         
         
            <hr style="border: solid 1px #cecece; opacity:1; margin:0px"/>
               <div class="listHeight">
                  <div class="listPlus">
                     <span class="choco">Wish List</span>
                     <a href="${pageContext.request.contextPath }/detail/otherWishView.do?userId=${vo.userId}"><img class="plustImg" src="../image/plus.png"></a>
                  </div>
                  <c:if test="${not empty wishImageList }">
                     <c:forEach var="li" items="${wishImageList }">
                        
                        <a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }"><img class="pImg" src="${li.poster_path }"></a>
                     </c:forEach>
                  </c:if>
               </div>
               <hr style="border: solid 1px #cecece; opacity:1; margin:0px"/>
               <div class="listHeight">
                  <div class="listPlus">
                     <span class="choco">Star List</span>
                     <a href="${pageContext.request.contextPath }/detail/starView.do?userId=${vo.userId}"><img class="plustImg" src="../image/plus.png"></a>
                  </div>
                  <c:if test="${not empty starImageList }">
                     <c:forEach var="li" items="${starImageList }">
                        
                        <a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }"><img class="pImg" src="${li.poster_path }"></a>
                     </c:forEach>
                  </c:if>
               </div>
               <hr style="border: solid 1px #cecece; opacity:1; margin:0px"/>
               <div class="listHeight">
                  <div class="listPlus">
                     <span class="choco">Comments List</span>
                     <a href="${pageContext.request.contextPath }/comments/myList.do?userId=${vo.userId}"><img class="plustImg" src="../image/plus.png"></a>
                  </div>
                  <c:if test="${not empty commentsImageList }">
                     <c:forEach var="li" items="${commentsImageList }">
                        
                        <a href="${pageContext.request.contextPath }/movie/detail.do?id=${li.id }"><img class="pImg" src="${li.poster_path }"></a>
                     </c:forEach>
                  </c:if>
               </div>
         </div>
      </div>
</body>
</html>