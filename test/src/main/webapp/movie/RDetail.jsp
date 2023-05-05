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
<link rel="stylesheet" href="RDetailcss.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<title>Insert title here</title>

<style>
</style>
</head>


<body class="yess">
	<%@include file="/submain/nav.jsp"%>


	<!-- 코멘트 팝업 -->
	<div class="write_popup" style="display: none;">
		<div class="dimmed">
			<div class="addpopup">
				<div class="addtitle" id="popupInput" style="color: black;"
					align="center">관람한 영화에 조각별을 남겨주세요.</div>
				<div class="content">
					<textarea id="comment_popup" class="commentpop initial_comment" cols="20" rows="5"
						maxlength="100" autofocus></textarea>
				</div>
				<div class="cmd">
					<label class="checkbox-wrap">스포일러인가요? 클릭! <input
						type="checkbox" name="spoiler_check2" value=""> <img
						class="check-icon" src="../image/spoiler.png"></img></label> <input
						type="button" id="btnsave" class="popbutton" value="저장"
						onclick="save();"> <input type="button" id="btncancel"
						class="popbutton" value="닫기" onclick="cancel();"> 
						<input
						type="button" id="btndel" class="popbutton" value="삭제"
						onclick="del();"> 
						<input type="button" id="btnedit"
						class="popbutton" value="수정" onclick="edit();">
				</div>
			</div>
		</div>
	</div>



	<!-- ajax 통신 때 필요한 값 임의로 선언, 히든처리 -->
	<span id="movieNum" style="display: none;">${movieId}</span>



		<div style="height: 100%; position: relative; margin-top: -5%;">
			<img align="right" class="tmp_img"
				src="https://image.tmdb.org/t/p/original${file_path }">
		</div>

		<span class="title"> <input type="checkbox" id="popup">
			${title} <label for="popup"><img
				src="${pageContext.request.contextPath }/image/info.png" style="cursor:pointer;"></label>
			<div>
				<div>
					<label for="popup" class="info"> 제목 : ${title}<br /> <br />
						장르 : ${name } <br /> <br /> 런타임 : ${runtime}분<br /> <br /> 요약
						: ${overview}<br /> <br /> 제작사 : ${production } <br /> <br />
						개봉일 : ${release_date} <br /> <br /></label>
						

				</div>
				<label for="popup"></label>
			</div>
		</span>

	</div>
	<div>
		<div style="width: 600px; margin-left: 100px;">
			<span class="tagline">${tagline}</span><br />
		</div>
		<span class="basicinfo">${name} · ${runtime}분</span><br /> <span
			class="average">평점: ${vote_average} | 조각별 평점 : ${avg }</span><br />
	</div>

	<!-- heart 좋아요 클릭시!  -->

	<div class="check">


		<!-- 하트이모지 -->

		<div class="right_area">
			<div class="icon heart">
				<img class="emptyheart" style="cursor:pointer;"
					src="${pageContext.request.contextPath}/image/heart.png" alt="텅빈하트">
				<span class="watch"> 보고싶어요 </span>
			</div>


			<!-- 		  예고편  -->
			<span> <img
				src="${pageContext.request.contextPath}/image/play.png"
				onclick="Trailer(${movieId})"
				style="position: relative; cursor:pointer; bottom: 3px;"> <span
				class="watch">예고편 보러가기 | </span>

			</span>


			<script>
function Trailer(movieId) {
var url = '${pageContext.request.contextPath}/movie/video.do?movieId=' + movieId;
window.location.href = url;
}
</script>


			<!-- 별점 구현하기  -->
			<span>
				<div class="star-rating">
					<input type="radio" id="5-stars" name="rating" value="5" /> <label
						for="5-stars" class="star">★</label> <input type="radio"
						id="4-stars" name="rating" value="4" /> <label for="4-stars"
						class="star">★</label> <input type="radio" id="3-stars"
						name="rating" value="3" /> <label for="3-stars" class="star">★</label>
					<input type="radio" id="2-stars" name="rating" value="2" /> <label
						for="2-stars" class="star">★</label> <input type="radio"
						id="1-star" name="rating" value="1" /> <label for="1-star"
						class="star">★</label>
				</div>
			</span>

			<script type="text/javascript">
//별점 평가 

//별점 클릭하면 데이터베이스에 들어갈 거임.. 
$('.star-rating input').click(function() {
	 
    var value = $(this).val();
    console.log(value);
    
    let userId = "${sessionScope.userId}"
    console.log(userId);
    
    let movieId = "${movieId}";
    console.log(movieId);
    
    if("${sessionScope.userId}" == "" || "${sessionScope.userId}" == null) {
        swal.fire({
            icon: 'warning',
            title: '로그인 후 사용해주세요',
            confirmButtonColor : '#FADE6D',           
            confirmButtonText : '확인',
        });
        $('.star-rating input:checked').prop('checked', false);         
    } else {
    $.ajax ({
    	
        url : '${pageContext.request.contextPath }/movie/starAdd.do',
        type : "GET",
        data : {"userId" : userId, "movieId" : movieId , "value" : value},
        
       success : function(result) {
    	   console.log("성공");
       }
    });
    }
});

//시작되자마자 별점 보여줄껀데 
$(document).ready(function() {
	  var star = "${star}"; 
	  
	  $('.star-rating input:checked').prop('checked', false); 
	  
	  if (star >= 1) {
	    $('.star-rating input:eq(4)').prop('checked', true);
	  }
	  if (star >= 2) {
	    $('.star-rating input:eq(3)').prop('checked', true);
	  }
	  if (star >= 3) {
	    $('.star-rating input:eq(2)').prop('checked', true);
	  }
	  if (star >= 4) {
	    $('.star-rating input:eq(1)').prop('checked', true);
	  }
	  if (star >= 5) {
	    $('.star-rating input:eq(0)').prop('checked', true);
	  }
	});


</script>

<script>
function block(){
	if("${sessionScope.userId}" == "" || "${sessionScope.userId}" == null) {
        swal.fire({
            icon: 'warning',
            title: '로그인 후 사용해주세요',
            confirmButtonColor : '#FADE6D',           
            confirmButtonText : '확인',
        }); 
       
	} else {	
		document.querySelector('.write_popup').style.display = 'block'
	}
}

</script>


			<!-- 댓글 보여주기 -->
			<div align="left">
				<br/><span class="go_write">다른 조각별 보러가기</span>
				<div class="comment_area"
					onclick="block();">
					<textarea class="comment" cols="20" rows="2" maxlength="100"
						style="text-align: center; padding-top: 18px;" readonly>내 조각별 남기기</textarea>
				</div>

			</div>

			<script>
	// initCommentArea();
	
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


</script>

			<script> 

	$('.go_write').click(function () {
		location.href = "${pageContext.request.contextPath}/comments/allList.do?movieNum=${movieId}&userId=${sessionScope.userId}";
	});
	
	function save(){
	
	  const textarea = document.querySelector('.commentpop.initial_comment');
	  const comment = textarea.value; 
	  console.log(comment)
	
	  const checkbox = document.querySelector('input[name="spoiler_check2"]');
	  const isSpoiler = checkbox.checked ? 0 : 1; 
		console.log(isSpoiler);
	
	
		 let userId = "${sessionScope.userId}";
			 console.log(userId);
		 let movieId = "${movieId}";
		 console.log(movieId);
	
	 
	$.ajax({
	url:"${pageContext.request.contextPath}/detail/addDetailPage.do",
	type : "GET" ,
	data : {"userId" : userId, "movieId" : movieId, "comment" : comment, "isSpolier" :isSpoiler},
	success : function(result) {
	    	   console.log("성공"); 
	    	   $('.write_popup').hide();
	    	   $('.comment').text(result);
	    
	    	   $('#popupInput').text("조각별을 수정해 주세요.");
	    	   
	    	   $('#btndel').show();
	    		 $('#btnedit').show();
	    		 $('#btnsave').hide();
	       },
	error : function(req, status, error) {
		console.log("req : " + req);
		console.log("status : " + status);
		console.log("error : " + error);
		
		$('.write_popup').hide();
		$('.comment').text(comment);
		$('#popupInput').text("조각별을 수정해 주세요.");
		
		 $('#btndel').show();
		 $('#btnedit').show();
		 $('#btnsave').hide();
	       }
	       
	});
	};
	
	function cancel() {
		$('.write_popup').hide();
	}
	
	function edit(){
	      
	      const textarea = document.querySelector('.commentpop.initial_comment');
	        const comment = textarea.value; 
	        console.log(comment)
	      
	        const checkbox = document.querySelector('input[name="spoiler_check2"]');
	        const isSpoiler = checkbox.checked ? 0 : 1; 
	         console.log(isSpoiler);
	      
	      
	          let userId = "${sessionScope.userId}";
	             console.log(userId);
	          let movieId = "${movieId}";
	          console.log(movieId);
	          
	          $.ajax({
	               url:"${pageContext.request.contextPath}/detail/editdel.do",
	               type : "GET" ,
	               data : {"userId" : userId, "movieId" : movieId, "comment" : comment, "isSpolier" :isSpoiler},
	               success : function(result) {
	                         console.log("성공"); 
	                         $('.write_popup').hide();
	                         $('.comment').text(comment);
	                      },
	                  	error : function(req, status, error) {
	                		console.log("req : " + req);
	                		console.log("status : " + status);
	                		console.log("error : " + error);
	                		
	                		$('.write_popup').hide();
	                		$('.comment').text(comment);
	                		$('#popupInput').text("조각별을 수정해 주세요.");
	                		
	                		 $('#btndel').show();
	                		 $('#btnedit').show();
	                		 $('#btnsave').hide();
	                	       }
	                	       
	               });
	               };
	      
	               function del(){
	                  
	                  const textarea = document.querySelector('.commentpop.initial_comment');
	                    const comment = textarea.value; 
	                    console.log(comment)
	                  
	                    const checkbox = document.querySelector('input[name="spoiler_check2"]');
	                    const isSpoiler = checkbox.checked ? 0 : 1; 
	                     console.log(isSpoiler);
	                  
	                  
	                      let userId = "${sessionScope.userId}";
	                         console.log(userId);
	                      let movieId = "${movieId}";
	                      console.log(movieId);
	                      
	                      $.ajax({
	                           url:"${pageContext.request.contextPath}/detail/editdel.do",
	                           type : "POST" ,
	                           data : {"userId" : userId, "movieId" : movieId, "comment" : comment, "isSpolier" :isSpoiler},
	                           success : function(result) {
	                                     console.log("성공"); 
	                                     $('.write_popup').hide();
	                                     $('.comment').text("내 조각별 남기기");
	                                  },
	                              	error : function(req, status, error) {
	                            		console.log("req : " + req);
	                            		console.log("status : " + status);
	                            		console.log("error : " + error);
	                            		
	                            		$('.write_popup').hide();
	                            		$('.comment').text(comment);
	                            		$('#popupInput').text("조각별을 수정해 주세요.");
	                            		
	                            		 $('#btndel').show();
	                            		 $('#btnedit').show();
	                            		 $('#btnsave').hide();
	                            	       }
	                            	       
	                           });
	                           };
	</script>
			<script>
        	  
 $(document).ready(function() {
	 // 코멘트
	 var comments = "${comments}"; 
	 
	 $('#btndel').hide();
	 $('#btnedit').hide();
	 
	 if (comments == '') { // 코멘트가 없으면
		/* $('.go_wirte').show();
	 	$('.comment_area').hide(); */
	 } else {/*	// 코멘트가 있으면
		 $('.go_wirte').hide();
		 $('#comment').show(); */
		 $('.comment').text(comments);
		 $('.commentpop').text(comments);
		 
		 //document.getElementById('comment_area').innerHTML += comments;
		 
		 // 코멘트 팝업창 타이틀 바꾸기
		 $('#popupInput').text("조각별을 수정해 주세요.");
		 
		 $('#btnsave').hide();
		 $('#btndel').show();
		 $('#btnedit').show();
		 
	 }
	 
	
	 
// 	 else {
        		  
    var $likeBtn = $('.icon.heart');  
    let movieId = "${movieId}";
    let userId = "${sessionScope.userId}";
    console.log(movieId);     	
    let isWished = "${flag}";
    console.log(isWished);
    	
    if (isWished && isWished === 'true') {
	    
	    $likeBtn.find('img').attr({
	      'src': '${pageContext.request.contextPath}/image/yellowheart.png',
	      alt:'빨간하트'
	    });
	  } 	
	  
    
    $likeBtn.click(function() {
        $likeBtn.toggleClass('active');
        console.log("토글버튼까지 생성");

        if("${sessionScope.userId}" == "" || "${sessionScope.userId}" == null) {
            swal.fire({
            	icon: 'warning',
                title: '로그인 후 사용해주세요',
                confirmButtonColor : '#FADE6D',           
                confirmButtonText : '확인',
            });
        }  
        else {

        if (flag && flag === 'false' && $likeBtn.hasClass('active')) {          
            $(this).find('img').attr({
                'src': '${pageContext.request.contextPath}/image/yellowheart.png',
                alt: '노란하트'
            });

            console.log("찜");
            
        } else {
            $(this).find('i').removeClass('fas').addClass('far');
            $(this).find('img').attr({
                'src': '${pageContext.request.contextPath}/image/heart.png',
                alt: '텅빈하트'
            });
            console.log("찜 취소");
        }

        console.log("에이작스들어갈거임");
        $.ajax ({
        	        	
            url: '${pageContext.request.contextPath}/movie/wish.do',
            type: "GET",
            data: {"userId": userId, "movieId": movieId},
            
            success: function(result) {
                console.log("에이작스성공");
            }
        }); 
   	 }
    });
}); 
//  }
 
 </script>

<!-- 			<script -->
<!-- 				src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" -->
<!-- 				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" -->
<!-- 				crossorigin="anonymous"></script> -->
</body>
</html>