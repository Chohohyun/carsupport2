<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="checkDriver.jsp" %>
<html>


<link rel="stylesheet" href="resources/dist/wickedpicker.min.css">
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />

    
    
    
<script>

	$(document).ready(function() {
		inputData("drive_start_time","${driveHistoryDTO.drive_start_time}");
		inputData("drive_finish_time","${driveHistoryDTO.drive_finish_time}");
	});
	function checkDriveHistory() {
		if(is_empty("drive_distance")){
    		alert("거리를 입력해주세요.");
    		$("[name=drive_distance]").val("");
    		return;
    	}
		$.ajax({
			url : "/support/driveHistoryRegProc.do",
			type : "post",
			data : $("[name=driveRegForm]").serialize(),
			datatype : "html",

			success : function(data) {
				if (data == 1) {
					alert("주행기록 등록 성공!");
					document.driveHistory.submit();
					//location.replace("/support/userUtilizationDetails.do");

				} else {
					alert("주행기록 등록 실패!");
				}
			},
			error : function() {
				alert("서버 접속 실패!");
			}

		});

	}
</script>
<head>
<title>KOSMO 교통약자 이동지원센터</title>
</head>
<body>
<div id="wrap">
	<!--head-->

		<%@include file="title2.jsp" %>

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
						<h2 class="h2tit bg_service">주행기록등록</h2>
					</div>
			
	
			<br>
					<!-- [게시판 등록] 화면을 출력하는 form 태그 선언-->
					<form method="post" name="driveRegForm"
						onsubmit="return false;"  >
			
			
						<table class="tbl tbl_form">
							<colgroup>
								<col style="width: 20%;" />
								<col style="width: 30%;" />
								<col style="width: 20%;" />
								
								<col style="width: 30%;" />
						
			
							</colgroup>
							<tr>
								<th scope="row">출발지
								<td>${driveHistoryDTO.start_road_addr}</td>
								<th scope="row">목적지
								<td>${driveHistoryDTO.end_road_addr}</td>
							</tr>
							<tr>
								<th scope="row">예약날짜
								<td>${driveHistoryDTO.reservation_date}</td>
								<th scope="row">예약자
								<td>${driveHistoryDTO.user_name}</td>
							</tr>
							<tr>
								<th scope="row">출발시각
								<td><input name="drive_start_time" id="starttimepicker" ></td>
								<th scope="row">도착시각
								<td><input name="drive_finish_time" id="finishtimepicker" ></td>
								
							</tr>
							<tr>
								<th scope="row">거리
								<td colspan="3"><input type="text" name="drive_distance" value="${driveHistoryDTO.drive_distance}" placeholder="m단위로 입력해주세요."></td>
								
							</tr>
							
						</table>
			
						<table border="0">
							<tr height=4>
								<td>
						</table>
						<!-- 여백을 위한 -->
					<center>
						
					<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
					    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
						 <script>
        					$('#starttimepicker').timepicker();
        					$('#finishtimepicker').timepicker();
    					</script>
    
    
						<div class="btn_box">
							<input type="hidden" name="reserve_apply_car_number" value="${driveHistoryDTO.reserve_apply_car_number}"> 
							<a href="javascript:checkDriveHistory();" class="btn middle blue radius-5">저장</a>
							<a href="javascript:document.driveHistory.submit();" class="btn middle white radius-5">취소</a>
							<!-- 
							<input type="button" value="저장" onClick="checkReview()"> 
							<input type="button" value="목록보기" onClick="document.userUtilizationDetails.submit()"> 
							 -->
						</div>
					</form>
			
					
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
</html>