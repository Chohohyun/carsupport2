<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>

<html>
<script>
	$(document).ready(function() {
		inputData("review_score",${reviewDTO.review_score});
		$("input[name='review_score']").attr('disabled',true);
	});
	
</script>
<head>
<style>
div.stars {
	width: 150px;
	display: inline-block;
}

input.star {
	display: none;
}

label.star {
	float: right; 
	padding: 5px;
	font-size: 20px;
	color: #444;
	transition: all .2s;
	transform: rotate(180deg);
}


input.star:checked ~ label.star:before{
	content: '\f005';
	color: #FD4;
    transition: all .25s; 
    
}

input.star-5:checked ~ label.star:before{
	color: #FE7;
	text-shadow: 0 0 10px #952; 
}

input.star-1:checked ~ label.star:before {
	color: #F62;
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3);
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome; 
}


</style>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
</head>
<body>
<div id="wrap">
	<!--head-->

		<%@include file="title2.jsp"%>

	<!--head end-->
	<!--container-->
		<div id="container">
			<div class="banner_box">
				<center>
					<div class="img">
						<img src="/support/resources/imagesUserMain1/banner2.png"
							alt="banner" />
					</div>
				</center>
			</div>
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<h2 class="h2tit bg_service">주행리뷰</h2>
					</div>
			
	
			<br>
					<!-- [게시판 등록] 화면을 출력하는 form 태그 선언-->
					<form method="post" name="reviewRegForm"
						action="/support/reviewRegProc">
			
			
						<table class="tbl tbl_form">
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />
								
								<col style="width: 30%;" />
			
							</colgroup>
							<tr>
								<th scope="row">이용자이름
								<td>${reviewDTO.user_name}</td>
								<th scope="row">이용날짜
								<td>${reviewDTO.reservation_date}</td>
								
							</tr>
							<tr>
								<th scope="row">출발지
								<td>${reviewDTO.start_road_addr}</td>
								<th scope="row">목적지
								<td>${reviewDTO.end_road_addr}</td>
							</tr>
							
							<tr>
								<th scope="row">별점
								<td>
								
									<input class="star star-5 pull-right "  id="star-5-2" type="radio" name="review_score" value="5"/> <label class="star star-5" for="star-5-2"></label>
									<input class="star star-4"  id="star-4-2" type="radio" name="review_score" value="4"/><label class="star star-4" for="star-4-2"></label>
									<input class="star star-3"  id="star-3-2" type="radio" name="review_score" value="3"/> <label class="star star-3" for="star-3-2"></label>
									<input class="star star-2"  id="star-2-2" type="radio" name="review_score" value="2"/> <label class="star star-2" for="star-2-2"></label>
									<input class="star star-1"  id="star-1-2" type="radio" name="review_score" checked="checked"  value="1"/> <label class="star star-1" for="star-1-2"></label>	
									  
									<!--  
									<input class="star star-1" id="star-1" type="radio" name="review_score" checked="checked"  value="1"/> <label class="star star-1" for="star-1"></label>	
									<input class="star star-2" id="star-2-2" type="radio" name="review_score" value="2"/> <label class="star star-2" for="star-2-2"></label>
									<input class="star star-3" id="star-3-2" type="radio" name="review_score" value="3"/> <label class="star star-3" for="star-3-2"></label>
									<input class="star star-4" id="star-4-2" type="radio" name="review_score" value="4"/><label class="star star-4" for="star-4-2"></label>
									<input class="star star-5" id="star-5" type="radio" name="review_score" value="5"/> <label class="star star-5" for="star-5"></label>
									  -->
								</td>
								<th scope="row">리뷰등록일</th>
								<td>${reviewDTO.review_date}</td>
							</tr>
							<tr>
								<th scope="row">평가내용
								<td colspan="3"><pre>${reviewDTO.review_content}</pre></td>
							</tr>
						</table>
			
						<table border="0">
							<tr height=4>
								<td>
						</table>
						<!-- 여백을 위한 -->
				<center>
						<div class="btn_box">
							
							<a href="javascript:document.driveList.submit();" class="btn middle white radius-5">목록보기</a>
							<!-- 
							<input type="button" value="저장" onClick="checkReview()"> 
							<input type="button" value="목록보기" onClick="document.userUtilizationDetails.submit()"> 
							 -->
						</div>
					</form>
			
					<form name="driveList" method="post"
						action="/support/driveHistory.do"></form>
					<!-- 
					<input type="button" value="정보보기" onclick="print_html_info();">
					 -->
				</center>
			</div>
		</div>
	</div>
	<!--foot-->
		<%@include file="foot.jsp"%>
	<!--foot end-->
</div>
</body>
<c:if test="${empty reviewDTO}">
	<script>
      alert("리뷰가 등록되지 않았습니다.");
      document.driveList.submit();
   </script>
</c:if>
</html>