<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="userMainPage.jsp" %>
<html>
<script>
$(document).ready(function() {

	
}); //$(document).ready(function() {
	//----------------------------------------
	// 운전자 리뷰 화면이으로 이동
	//----------------------------------------
	function goReviewRegForm(reserve_apply_car_number){
		
		document.reviewRegForm.reserve_apply_car_number.value = reserve_apply_car_number;
		//$("[name=reviewRegForm] [name=reserve_apply_car_number]").val( reserve_apply_car_number );
		document.reviewRegForm.submit();
	}
	
</script>
<head>

</head>
    <body>
    <center><br><h3>운전자 평가 UI</h3><br>
    <!-- ----------------------[리스트 검색/요청]----------------------------- -->
    <!-- 
    <form name="carListForm" method="post" action="/support/carListForm.do">
    	검색 :  <input type="text" name="carsearch" size="20">	
    </form>
     -->
    <!-- ----------------------[리스트 출력 화면]----------------------------- -->
		<table border=0>
			
			<tr><td align=right> 검색 총 개수 : ${requestScope.driveListAllCnt} 개
	
			<tr><th align=center><span class="pagingNumber"></span>
			<tr><td>
			
				<table class="tbcss2 driveList" border="0" cellspacing="0" cellpadding="5" rules="rows" frame="hsides" width=700px>	
				<tr><th>번호<th>날짜<th>출발지<th>목적지<th>출발시간<th>도착시간<th>주행거리<th>리뷰

				<c:forEach items="${requestScope.driveList}" var="drive" varStatus="loopTagStatus">
					<tr style="cursor:pointer" >
						<td>${selectPageNo*rowCntPerPage-rowCntPerPage+1+loopTagStatus.index}   <!-- 1증가일련번호-->						
						<td>${drive.RESERVATION_DATE}
						<td>${drive.START_ROAD_ADDR}
						<td>${drive.END_ROAD_ADDR}
						<td>${drive.DRIVE_START_TIME}
						<td>${drive.DRIVE_FINISH_TIME}
						<td>${drive.DRIVE_DISTANCE}
						<td><input type="button" value="리뷰" onClick="goReviewRegForm(${drive.RESERVE_APPLY_CAR_NUMBER})">	
						
													
				</c:forEach>
				
			</table>
		</table>
		<br>
		${requestScope.driveListAllCnt==0? '  검색된 글이 없습니다.  ':''}
	
		
	<!-- 	
		<input type="hidden" name="keyword" value="${keyword}">
	-->
		<form name="reviewRegForm" method="post" action="/support/reviewRegForm.do">
			<input type="text" name="reserve_apply_car_number">
		</form>
	 
	</center>
    </body>
</html>