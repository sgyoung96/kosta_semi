<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 코멘트</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="../submain/navcss.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css"
	integrity="sha512-qEan5nS02+Q5oN58dmG9N9Z4f4MT4yaNzFw/iRkRJzMA8+CDGt90E3l3J9Pm+Z8lCGYIda3Cw0V7dA8W8Kvztg=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	
<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css" rel="stylesheet">

	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style>
/* 	@font-face {
	    font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
	    font-weight: normal;
	    font-style: normal;
	    color: white;
	} */
	@font-face {
	    font-family: 'GangwonEduHyeonokT_OTFMediumA';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduHyeonokT_OTFMediumA.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	.main { width: 100%; height: 100%; position: absolute; background-color: #212121; overflow: auto; margin-boddom: 50px; }
	.contents { width: 100%; height: 100%; background: #212121; font-family: 'SUIT Variable';
			    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
			    font-weight: normal;
			    font-style: normal;
			    color: black;
			    position: absolute;
			    z-index: 1;
			    align: center; 
			    margin-bottom: 50px; }
	.all { width: 50%; height: 79%; margin-top: 5%; background: #212121; position: relative; display: inline-block;}
	
	.my_no_data { height: 100px; border-radius: 10px; border: 2px solid rgb(249, 222, 109); background: rgb(55, 55, 55); font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
	    color: #FFFFFF; font-size: 0.8em; padding-top: 10px; cursor: pointer; }
	.go_write:hover { color: rgb(249, 222, 109); cursor: pointer; }
	
	.my { background-color: rgb(22, 22, 22); border-radius: 10px; border: 2px solid rgb(249, 222, 109); color : white; }
	/* .my_comment { height: 100px; width: 100%; background: rgb(40,40,40); padding-left: 10px; margin-top: 50px; radius: 10px; } */
	.name { padding-left: 10px; }
	/* .good_num::before { color: #eeeeee; content: "|"; width: 1px; heignt: 5px; margin-left: 5px;} */
	.name_area { cursor: pointer; display: flex; align-items: center; padding-left: 20px; }
	.good_area { width: 110px; display: flex; align-items: center; float: right; margin-right: 20px; font-size: 0.7em; background: rgb(55, 55, 55); border-radius: 10px; }
	.good_name { padding-top: 5px; padding-bottom: 5px; padding-left: 10px; font-size: 0.5em; }
	.good_num { width: 40px; display: flex; align-items: center; padding-left: 5px;}
/* 	.good { padding-left: 5px; } */
	.slash { color: rgb(77, 77, 77); } 
	.img_name { width: 40px; height: 40px; }
	.img_good { width: 15px; height: 15px; margin-left: 5px;}
	.comment_area { padding-left: 20px; width: 80%; height: auto; box-sizing: border-box; }
	.comment { background-color: rgb(22, 22, 22); height: 100%; width: 100%; border: 0; overflow-y: hidden; resize: none; font-family: 'GangwonEduHyeonokT_OTFMediumA'; font-size: 1.5em; color: #ffffff; }
	.date { margin-left: 20px; font-size: 0.85em; color: #AFAFAF; }
	.icon_edit, .icon_delete { cursor: pointer; width: 20px; height: 20px; margin-right: 20px; }
	.spoiler_txt { font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
	    color: #AFAFAF; font-size: 0.8em; margin-right: 20px; }
	.spoiler_yn_txt { margin-right: 5px; }
	.spoiler_yn_img { width: 25px; height: 25px; }
		
	.tabs { margin-left: -3%; margin-top: 50px; }
	ul { list-style: none; cursor: pointer; color: white; }
	li { float: left; margin-right: 20px; }
	li:hover { color: rgb(249, 222, 109); }
	#tab1 { color: rgb(249, 222, 109); }
	.line { margin-top: 5px; margin-left: 3%; height: 1px; width: 95%; background-color: #AFAFAF; }
	
	.other_item { margin-top: 10px; display: flex; background-color: rgb(22, 22, 22); border-radius: 10px; border: 2px solid #AFAFAF; }
	.other .date { margin-right: 20px; }
	.other .name { color: white; }
	.other .good_area { cursor: pointer; color: white; }
	.spoiler_y_icon { margin-right: 20px; }
	
	#spoiler_blind { color: #FFFFFF; cursor: pointer; }
	.confirm_popup_spoiler { width:100%; height: 100px; display: inline-block; position: relative; }
	.btn_yes { cursor: pointer; font-size: 1em; background: #AFAFAF; border-radius: 5px; color: white; width: 50%; }
	.btn_no { cursor: pointer; font-size: 1em; background: #AFAFAF; border-radius: 5px; color: white; width: 50%; }
	.btn_yes:hover { background-color: rgb(249, 222, 109); }
	.btn_no:hover { background-color: rgb(249, 222, 109); }
	.popup_spoiler { 
		position: relative;
		width: 30%;
		height: 250px;
		background-color: #fff;
		border-radius: 15px;
		z-index:22;
	}
	.title_spoiler { 
		border-radius: 15px 15px 0 0;
		min-height: 40px;
		color: #fff;
		background-color: #FADE6D;
		padding: 10px 15px;
		box-sizing: border-box;
		font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
	    font-weight: bold;
	    font-style: bold;
	    font-size: 1em;
	}
	
	.content {
		padding: 20px;
		box-sizing: border-box;
		color: black; 
		font-family: 'GangwonEduHyeonokT_OTFMediumA'; 
		font-size: 1.5em;
	}
	
	.dimmed_spoiler_popup { 		
		background-color: #99999900;
		background-repeat: no-repeat;
		background-size: cover;
		background-position: center; 
		z-index: 21;
	}
	
	.dimmed_spoiler_popup::before {
		content: '';
		position: fixed;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		background-color: rgba(255, 255, 255, 0.55);
		-webkit-backdrop-filter: blur(5px);
		backdrop-filter: blur(5px);
		z-index: 20;
	}
	
	.write_popup {
		display: inline-block;
		width: 100%;
		height: 100%;
		padding: 0;
		margin: 0;
		position: relative;
		z-index: 2;
	}
	
	.wrap_popup {
		display: inline-block;
		width: 100%;
		height: 100%;
		padding: 0;
		margin: 0;
		position: relative;
		z-index: 2;
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
		-webkit-backdrop-filter: blur(5px);
		backdrop-filter: blur(5px);
	}
	
	.popup {
		z-index: 3;
		position: relative;
		min-width: 300px;
		max-width: 600px;
		background-color: #fff;
		border-radius: 15px;
		box-shadow: 0 2px 55px -25px rgb(0 0 0/ 100%);
	}
	
	.popup>.title {
		border-radius: 15px 15px 0 0;
		min-height: 40px;
		color: #fff;
		background-color: #FADE6D;
		padding: 10px 15px;
		box-sizing: border-box;
		font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
	    font-weight: bold;
	    font-style: bold;
	    font-size: 1em;
	}
	
	.popup>.content {
		padding: 20px;
		box-sizing: border-box;
		color: black; 
		font-family: 'GangwonEduHyeonokT_OTFMediumA'; 
		font-size: 1.5em;
	}
	
	.commentpop { 
		background-color: #FFFFFF; 
		outline-color: #FFFFFF;
		height: 50%; 
		width: 100%; 
		border: 0; 
		overflow-y: hidden; 
		resize: none; 
	}
	
	.popup>.cmd {
		bottom: 0;
		min-height: 40px;
		padding: 15px 15px;
		box-sizing: border-box;
		border-radius: 0 0 15px 15px;
		min-height: 40px;
		text-align: right;
	}
	
	.popup>.cmd .popbutton {
		border-radius: 8px;
		padding: 5px 10px;
		border: 1px solid #aaa;
	}
	
	.popup>.cmd .popbutton:hover {
		color: #fff;
		background-color: #000;
		border-color: #000;
	}
	
	
	.checkbox-wrap { cursor: pointer; font-family: 'SUIT Variable';
	    src: url('https://cdn.jsdelivr.net/gh/sunn-us/SUIT/fonts/variable/woff2/SUIT-Variable.css' format('sans-serif'));
	    color: black; font-size: 0.8em; }
	.checkbox-wrap .check-icon  { display: inline-block; width: 25px; height: 25px; /* color: #AFAFAF;  content: url(../image/spoiler_gray.png); */ center no-repeat; vertical-align: middle; transition-duration: .3s; }
	.checkbox-wrap input[type=checkbox] { display: none; }
	.checkbox-wrap input[type=checkbox]:checked + .check-icon { /* color: #FADE6D; content: url(../image/spoiler.png); */ }
</style>

</head>
<body>
	<!--  헤더 -->
	<jsp:include page="../submain/nav.jsp" flush="true"/>
	<div class="main">
	<div class="contents" align="center">
	
	
	<!-- ajax 통신 때 필요한 값 임의로 선언, 히든처리 -->
	<span id="movieNum" style="display: none;">${movieNum}</span>
	
		<!-- edit popup -->
		<div class="wrap_popup" style="display: none;">	  
			<div class="dimmed">
				<div class="popup">
					<div class="title" style="color: black;">관람한 영화에 조각별을 남겨주세요.</div>
					<div class="content">
						<c:if test="${not empty mine}">
						<textarea class="commentpop" cols="20" rows="5" maxlength="100" autofocus>${ mine.comments }</textarea>
						</c:if>	
					</div>
					<div class="cmd">
						<label class="checkbox-wrap">스포일러인가요? 클릭! <input type="checkbox" name="spoiler_check" value=""><img id="edit_spoiler_icon" class="check-icon"></img></label>
						<input type="button" id="btnedit" class="popbutton" value="수정">
						<input type="button" id="btnclose" class="popbutton" value="닫기">
					</div>
				</div>
			</div>
		</div> 
		
		<!-- write popup -->
		<div class="write_popup" style="display: none;">	  
			<div class="dimmed">
				<div class="popup">
					<div class="title" style="color: black;">관람한 영화에 조각별을 남겨주세요.</div>
					<div class="content">
						<textarea class="commentpop initial_comment" cols="20" rows="5" autofocus></textarea>
					</div>
					<div class="cmd">
						<label class="checkbox-wrap">스포일러인가요? 클릭! <input type="checkbox" name="spoiler_check2" value=""><img class="check-icon"></img></label>
						<input type="button" id="btnsave" class="popbutton" value="저장">
						<input type="button" id="btncancel" class="popbutton" value="닫기">
					</div>
				</div>
			</div>
		</div> 
		
		<!-- deltete 확인 popup -->
		<div class="confirm_popup_del" style="display: none;">
			
		</div>
		
		<!-- spoiler 보기 확인 popup -->
		<div class="confirm_popup_spoiler" align="center" style="display: none;"> <!-- style="display: none;" --> 
			<div class="dimmed_spoiler_popup">
				<div class="popup_spoiler" align="center">
				<div class="title_spoiler" style="color: black;">Warning!</div>
					<div class="content">
						<p>스포일러가 있는 조각글입니다.</p>
						<p>확인하시겠습니까?</p>
					</div>
					<div class="yn_btn_area">
						<table width="100%">
							<tr>
								<td style="padding-left: 20px;" width="50%" align="right">
									<div class="btn_yes" align="center">
										<span>확인</span>
									</div>
								</td>
								<td style="padding-right: 20px;" width="50%" align="left">
									<div class="btn_no" align="center">
										<span>닫기</span>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	
		<!-- 내용 -->
		<div class="all" align="center"> 
			
			<div class="my_no_data" align="center" style="align-items: center;">
				<span>아직 남긴 조각글이 없습니다.<br>클릭하여 조각글을 남겨주세요!<br><br><label class="go_write">남기러 가기</label><br></span>
				<c:if test="${not empty mine}">
				<span id="my_name" style="display: none;">${mine.userName}</span>
				</c:if>
			</div>
			
			
			<div class="my">
			
				<table style="width: 100%;">
						<tr>
							<td width="50%">
								<br>
								<div class="name_area" align="left">								
									<img class="img_name" src="../image/icon_profile.png" /><span class="name"><c:if test="${not empty mine}"><b>${ mine.userName }</b></c:if></span>						
								</div>
							</td>
							<td width="50%">
								<div align="right">
									<div class="good_area" align="right"> 
										<span class="good_name">좋아요</span><img class="img_good" src="../image/thumbs-up.png" />
										<div class="good_num" align="right">
											<div class="slash">|</div>
											<div style="width: 40px;">
												<c:if test="${not empty mine}"><span class="good">${ mine.rate }</span></c:if>
											</div>
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="comment_area">
									<br>
									<c:if test="${not empty mine}"><textarea class="comment" cols="20" rows="5" disabled>${ mine.comments }</textarea></c:if>
									<br>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2" width="100%" align="right">
								<img class="icon_edit" src="../image/edit.png" >
								<br>
								<img class="icon_delete" src="../image/delete.png" >
							</td>
						</tr>
						<tr>
							<td height="25px" width="50%" align="left">
								<c:if test="${not empty mine}"><span class="date">${ mine.w_Date }</span></c:if>
							</td>
							<td height="25px" width="50%" align="right">
								<span class="spoiler_txt"><span class="spoiler_yn_txt"></span><img class="spoiler_yn_img" src="../image/spoiler_gray.png" ><c:if test="${not empty mine}"><label class="spoiler_yn">${mine.spoiler}</label></c:if></span>
							</td>
						</tr>
						
						<tr><td><br></td></tr>
					</table>
			</div>
			
			
			
			
			<div class="tabs">
				<ul>
					<li id="tab1"><b>BEST</b></li>
					<li id="tab2"><b>RECENT</b></li>
					<li id="tab3"><b>SPOILER</b></li>
				</ul>
				<br>
				<div class="line"></div>
			</div>
		
		
			<!-- 다른 사람이 쓴 코멘트 리스트 -->
		
			
			<div class="other">
			
			<div id="best_comments">
			<c:forEach var="best" items="${best}" varStatus="status">
				
					<br>
					<div class="other_item">
						<table style="width: 100%;">
							<tr>
								<td width="50%">
									<br>
									<div class="name_area" align="left"> 
										<a href="${pageContext.request.contextPath }/member/otherUser.do?userId=${sessionScope.userId }&followedId=${best.userId}">
										<img class="img_name" src="../image/icon_profile_gray.png" /><span class="name"><b>${ best.userName }</b></span>
										</a>
									</div>
								</td>
								<td width="50%">
									<div align="right">
										<div id="good_area_best" class="good_area" align="right" onclick="setRateGood(this);"> 
											<span class="good_name">좋아요</span><img class="img_good" src="../image/thumbs-up.png" />
											<div class="good_num" align="right">
												<div class="slash">|</div>
												<div style="width: 40px;">
														<span id="good_best" class="good">${ best.rate }</span>
														<span id="good_best_rate_userId" style="display: none;">${best.userId}:${status.index}</span>
														<%-- <span id="best_num" class="best_${best.num}" style="display: none;">"best_${best.num}"</span> --%>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="comment_area">
											<br>
											<textarea class="comment mycomment" cols="20" rows="5" disabled>${ best.comments }</textarea>
											<br>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" width="100%;" align="left">
										<span class="date">${ best.w_Date }</span>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</table>
						</div>
						<br>
					</c:forEach>
					</div>
					
					
					
					<div id="recent_comments">
					<c:forEach var="recent" items="${recent}" varStatus="status">
					
					<br>
					<div class="other_item">
						<table style="width: 100%;">
							<tr>
								<td width="50%">
									<br>
									<div class="name_area" align="left"> 
										<a href="${pageContext.request.contextPath }/member/otherUser.do?userId=${sessionScope.userId }&followedId=${recent.userId}">
										<img class="img_name" src="../image/icon_profile_gray.png" /><span class="name"><b>${ recent.userName }</b></span>
										</a>
									</div>
								</td>
								<td width="50%">
									<div align="right">
										<div id="good_area_recent" class="good_area" align="right" onclick="setRateRecent(this);"> 
											<span class="good_name">좋아요</span><img class="img_good" src="../image/thumbs-up.png" />
											<div class="good_num" align="right">
												<div class="slash">|</div>
												<div style="width: 40px;">
														<span id="good_recent" class="good">${ recent.rate }</span>
														<span id="good_recent_rate_userId" style="display: none;">${recent.userId}:${status.index}</span>
														<%-- <span id="recent_num" class="recent_${recent.num}" style="display: none;">${recent.num}</span> --%>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="comment_area">
											<br>
											<textarea class="comment" cols="20" rows="5" disabled>${ recent.comments }</textarea>
											<br>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" width="100%;" align="left">
										<span class="date">${ recent.w_Date }</span>
									</td>
								</tr>
								<tr><td><br></td></tr>
							</table>
						</div>
						<br>
					
					</c:forEach>
					</div>
					
					<div id="spoiler_comments">
					<c:forEach var="spoiler" items="${spoiler}" varStatus="status">
					
					<br>
					<div class="other_item">
						<table style="width: 100%;">
							<tr>
								<td width="50%">
									<br>
									<div class="name_area" align="left"> 
										<a href="${pageContext.request.contextPath }/member/otherUser.do?userId=${sessionScope.userId }&followedId=${spoiler.userId}">
										<img class="img_name" src="../image/icon_profile_gray.png" /><span class="name"><b>${ spoiler.userName }</b></span>
										</a>
									</div>
								</td>
								<td width="50%">
									<div align="right">
										<div id="good_area_spoiler" class="good_area" align="right" onclick="setRateSpoiler(this);"> 
											<span class="good_name">좋아요</span><img class="img_good" src="../image/thumbs-up.png" />
											<div class="good_num" align="right">
												<div class="slash">|</div>
												<div style="width: 40px;">
														<span id="good_spoiler" class="good">${ spoiler.rate }</span>
														<span id="good_spoiler_rate_userId" style="display: none;">${spoiler.userId}:${status.index}</span>
														<%-- <span id="spoiler_num" class="spoiler_${spoiler.num}" style="display: none;">${spoiler.num}</span> --%>
													</div>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="comment_area">
											<br>
											<span id="spoiler_blind">스포일러가 포함되어 있어요! >><u>보기 클릭</u></span>
											<textarea class="comment spoiler_comment" cols="20" rows="5" disabled>${ spoiler.comments }</textarea>
											<br>
										</div>
									</td>
								</tr>
								<tr>
									<td width="50%;" align="left">
										<span class="date">${ spoiler.w_Date }</span>
									</td>
									<td width="50%;" width="25px;" height="25px;" align="right">
										<img class="spoiler_y_icon" width="25px;" height="25px;" src="../image/spoiler.png" >
									</td>
								</tr>
								<tr><td><br></td></tr>
							</table>
						</div>
						<br>
					
					</c:forEach>
					</div>
					<br><br><br><br><br>
				</div>
			</div>
		</div>
	</div>	
		
	<script>
		
		init();
		
		function init() {
			$('.spoiler_yn').hide(); // 항상 숨김처리
			if ($('#my_name').text() == '') { // 내가 쓴 코멘트가 없을 시
				$('.my_no_data').show();	// 작성 유도 UI 숨김처리
				$('.my').hide();			// 내가 쓴 코멘트 노출
			} else {
				$('.my_no_data').hide();	// 작성 유도 UI 숨김처리
				$('.my').show();			// 내가 쓴 코멘트 노출
			}
			$('.wrap_popup').hide();		// 수정 팝업창 기본 숨김처리
			$('.write_popup').hide();		// 작성 팝업창 기본 숨김처리
			$('.spoiler_comment').hide();	// 스포일러 탭의 코멘트 가리기
			
			// 탭 3개 init -> rate가 가장 많은 순으로 정렬 (best)
			$('#best_comments').show();
			$('#recent_comments').hide();
			$('#spoiler_comments').hide();
			
			if ($('.spoiler_yn').text() == 0) { // 보이지는 않지만 값 가져오기 및 비교하기 위해 사용
				$('.spoiler_yn_img').attr("src", "../image/spoiler.png");
				$('.spoiler_yn_txt').text("스포일러가 있어요!");
				$('#edit_spoiler_icon').attr("src", "../image/spoiler.png"); // 팝업
			} else {
				$('.spoiler_yn_img').attr("src", "../image/spoiler_gray.png");
				$('.spoiler_yn_txt').text("스포일러가 없어요!");
				$('#edit_spoiler_icon').attr("src", "../image/spoiler_gray.png"); // 팝업
			}
		}
		
		// 남기러 가기
		$('.go_write').click(function() {
			$('.write_popup').show();
			$('.main').css("overflow", "hidden");
		});
		
		// 팝업창 스포일러 여부 체크박스 동작시 아이콘 변경
		$('.checkbox-wrap').click(function() {
			if ($('input:checkbox[name="spoiler_check"]').is(':checked')) {
				$('#edit_spoiler_icon').attr("src", "../image/spoiler.png"); // 팝업
			} else {
				$('#edit_spoiler_icon').attr("src", "../image/spoiler_gray.png"); // 팝업
			}
		});
	
		// BEST COMMENT TAB
		$('#tab1').click(function() {
			$('#best_comments').show();
			$('#recent_comments').hide();
			$('#spoiler_comments').hide();
			
			$('#tab1').css("color", "rgb(249, 222, 109)");
			$('#tab2').css("color", "#FFFFFF");
			$('#tab3').css("color", "#FFFFFF");
		});
		
		// RECENT COMMENT TAB
		$('#tab2').click(function() {
			$('#best_comments').hide();
			$('#recent_comments').show();
			$('#spoiler_comments').hide();
			
			$('#tab1').css("color", "#FFFFFF");
			$('#tab2').css("color", "rgb(249, 222, 109)");
			$('#tab3').css("color", "#FFFFFF");
		});
		
		// SPOILER COMMENT TAB
		$('#tab3').click(function() {
			$('#best_comments').hide();
			$('#recent_comments').hide();
			$('#spoiler_comments').show();
			
			$('#tab1').css("color", "#FFFFFF");
			$('#tab2').css("color", "#FFFFFF");
			$('#tab3').css("color", "rgb(249, 222, 109)");
		});
		
		// *** 내 글에서 수정
		$('.icon_edit').click(function() {
			$('.wrap_popup').show();
			$('.main').css("overflow", "hidden");
		});
		
		// *** 내 글에서 삭제
		$('.icon_delete').click(function() {
			del();
		})
		
		// 스포일러 보기
		$('#spoiler_blind').click(function() {
			$('.confirm_popup_spoiler').show();
			//$('.main').css("overflow", "hidden");
		});
		
		// 보기 확인
		$('.btn_yes').click(function() {
			$('.confirm_popup_spoiler').hide();
			$('.main').css("overflow", "scroll");
			$('#spoiler_blind').hide();
			$('.spoiler_comment').show();
		});
		
		// 보기 취소
		$('.btn_no').click(function() {
			$('.confirm_popup_spoiler').hide();
			$('.main').css("overflow", "scroll");
		});
		
		jQuery.fn.center = function () {
		    this.css("position","absolute");
		    this.css("top", ( jQuery(window).height() - this.height() ) / 2+jQuery(window).scrollTop() + "px");
		    this.css("left", ( jQuery(window).width() - this.width() ) / 2+jQuery(window).scrollLeft() + "px");
		    return this;
		  }
		  
		jQuery(".confirm_popup_spoiler").center();
		
		// *** 남의 글에서 좋아요 선택 ***
		// 1. good_area_best 2. good_area_recent 3. good_area_spoiler
		
		function setRateGood(args) {
			var userId = args.childNodes[3].nextElementSibling.childNodes[3].childNodes[3].innerHTML.split(':')[0];
			var movieNum = $('#movieNum').text();
			
			var param = {
					"userId" : userId,
					"movieNum" : movieNum
						};
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/comments/rateUpdate.do",
				data: param,
				dataType: "text",
				success: function(result) {
					args.childNodes[3].nextElementSibling.childNodes[3].childNodes[1].textContent = result;
					
					var items = document.querySelectorAll('#good_recent').length;
					for (var i = 0; i < items; i++) {
						if (userId == document.querySelectorAll('#good_recent_rate_userId')[i].firstChild.data.split(':')[0]) {
							document.querySelectorAll('#good_recent')[i].firstChild.data = result;
						}
				    }
				},
				error: function(req, status, error) {
					console.log("req : " + req);
					console.log("status : " + status);
					console.log("error : " + error);
				}
			});
		}
		
		// 최신글 좋아요 선택시
		function setRateRecent(args) {
			var userId = args.childNodes[3].nextElementSibling.childNodes[3].childNodes[3].innerHTML.split(':')[0];
			var movieNum = $('#movieNum').text();
			
			var param = {
					"userId" : userId,
					"movieNum" : movieNum
						};
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/comments/rateUpdate.do",
				data: param,
				dataType: "text",
				success: function(result) {
					args.childNodes[3].nextElementSibling.childNodes[3].childNodes[1].textContent = result;
					
					var items = document.querySelectorAll('#good_best').length;
					for (var i = 0; i < items; i++) {
						if (userId == document.querySelectorAll('#good_best_rate_userId')[i].firstChild.data.split(':')[0]) {
							document.querySelectorAll('#good_best')[i].firstChild.data = result;
						}
				    }
				},
				error: function(req, status, error) {
					console.log("req : " + req);
					console.log("status : " + status);
					console.log("error : " + error);
				}
			});
		}
		
		// 스포일러 좋아요 선택시
		function setRateSpoiler(args) {
			var userId = args.childNodes[3].nextElementSibling.childNodes[3].childNodes[3].innerHTML.split(':')[0];
			var movieNum = $('#movieNum').text();
			
			var param = {
					"userId" : userId,
					"movieNum" : movieNum
						};
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/comments/rateUpdate.do",
				data: param,
				dataType: "text",
				success: function(result) {
					args.childNodes[3].nextElementSibling.childNodes[3].childNodes[1].textContent = result;
				},
				error: function(req, status, error) {
					console.log("req : " + req);
					console.log("status : " + status);
					console.log("error : " + error);
				}
			});
		}

		// *** 수정 팝업
		$('#btnedit').click(function() {
			edit();
		});
		
		$('#btnclose').click(function () {
			$('.wrap_popup').hide();
			$('.main').css("overflow", "scroll");
		});
		
		
		// *** 작성 팝업
		$('#btnsave').click(function() {
			save();
		});
		
		$('#btncancel').click(function () {
			$('.write_popup').hide();
			$('.main').css("overflow", "scroll");
		});
		
		/*
			수정하기
		*/
		function edit() {
			var comment = $('.commentpop').val();
			var spoiler = '1';
			var movieNum = $('#movieNum').text();
			
			if ($('input:checkbox[name="spoiler_check"]').is(':checked')) {
				spoiler = '0';
			}
			
			// 0: 스포일러 1: 스포일러 아님
			var param = {
							"userId": "${userId}",
							"comment": comment,
							"spoiler": spoiler,
							"movieNum": movieNum,
							"num": "${mine.num}"
						};
			
			$.ajax({
				type: "POST",
				//url: "${pageContext.request.contextPath}/comments/edit.do?userId=${sessionScope.userId}",
				url: "${pageContext.request.contextPath}/comments/edit.do",
				data: param,
				dataType: "text",
				success: function(result) {
					location.href = "${pageContext.request.contextPath}/comments/allList.do?movieNum=${movieNum}&userId=${sessionScope.userId}";
				},
				error: function(req, status, error) {
					console.log("req : " + req);
					console.log("status : " + status);
					console.log("error : " + error);
				}
			});
		}
		
		function save() {
			var comment = $('.initial_comment').val();
			var spoiler = '1';
			var movieNum = $('#movieNum').text();
			
			
			if ($('input:checkbox[name="spoiler_check2"]').is(':checked')) {
				spoiler = '0';
			}
			
			// 0: 스포일러 1: 스포일러 아님
			var param = {
							"userId": "${userId}",
							"comment": comment,
							"spoiler": spoiler,
							"movieNum": movieNum,
							"num": "${mine.num}"
						};
			
			console.log(param);
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/comments/write.do",
				data: param,
				dataType: "text",
				success: function(result) {
					location.href = "${pageContext.request.contextPath}/comments/allList.do?movieNum=${movieNum}&userId=${sessionScope.userId}";
				},
				error: function(req, status, error) {
					console.log("req : " + req);
					console.log("status : " + status);
					console.log("error : " + error);
				}
			});
		}
		
		function del() {
			
			var movieNum = $('#movieNum').text();
			
			// 0: 스포일러 1: 스포일러 아님
			var param = {
							"userId": "${userId}",
							"movieNum": movieNum
						};
			
			$.ajax({
				type: "POST",
				url: "${pageContext.request.contextPath}/comments/del.do",
				data: param,
				dataType: "text",
				success: function(result) {
					location.href = "${pageContext.request.contextPath}/comments/allList.do?movieNum=${movieNum}&userId=${sessionScope.userId}";
				},
				error: function(req, status, error) {
					console.log("req : " + req);
					console.log("status : " + status);
					console.log("error : " + error);
				}
			});
		}	
	
	</script>
</body>
</html>