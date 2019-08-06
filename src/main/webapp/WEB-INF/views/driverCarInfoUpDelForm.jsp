<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>


<!-- 게시판에 보이는 글이 내가 클릭하기 직전에 삭제되었으면 경고를 띄우고  게시판 목록보기 화면으로 이동하기-->
<c:if test="${empty carDTO}">
	<script>
      alert("배정된 차량이 없습니다");
      location.replace("/support/driverMainPage.do");
   </script>
</c:if>

<html>
<head>
<title>게시판</title>
<script>
      
      
</script>
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
						<span class="h2tit bg_service">차량정보</span>
					</div>
					<table class="tbl tbl_form">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">차량 번호</th>
								<td>${carDTO.car_number}</td>
								<th scope="row">차량 연식</th>
								<td>${carDTO.car_year}년</td>
					     
							</tr>
						
							
							<tr>
							<th scope="row">정비까지 남은 KM</th>
							<c:choose>
							
								<c:when test="${carDTO.car_distance<0}">
									<td>차량정기점검필요</td>
								</c:when>
								<c:otherwise>
									
									<td>${carDTO.car_distance}km</td>
							
								</c:otherwise>
							</c:choose>
							
							<th scope="row">차량 종류</th>
							<td>${carDTO.car_code}
							</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn_box">
					
							<a href="javascript:location.replace('/support/driverMainPage.do');" class="btn middle white radius-5">돌아가기</a>
					
					</div> 
				</div>
			</div>
		</div>
		<!--container end-->

		<!--foot-->
		<%@include file="foot.jsp"%>
		<!--foot end-->
	</div>

	
</body>