<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>

<%@include file="checkUser.jsp" %>

<html xmlns="https://www.w3.org/1999/xhtml">
<head>
<title>COSMO 교통약자 이동지원센터</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<link type="text/css" rel="stylesheet"
	href="https://www.gurihappycall.or.kr/css/style.css" />
<link type="text/css" rel="stylesheet"
	href="https://www.gurihappycall.or.kr/css/pop.css" />
<script type="text/javascript"
	src="https://www.gurihappycall.or.kr/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript"
	src="https://www.gurihappycall.or.kr/js/jquery.bxslider.min.js"></script>
<link type="text/css" rel="stylesheet"
	href="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.css" />
<script type="text/javascript"
	src="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.js"></script>
<script type="text/javascript"
	src="https://www.gurihappycall.or.kr/js/design.js"></script>
<script type="text/javascript">
      $(document).ready(function(){
      });


    </script>
<script type="text/javascript" language="javascript">

function userCancelReservation(number){
	
	var num = {"reserve_apply_car_number":number};
	 $.ajax({
		url:"/support/cancelReservation.do",
		type:"post",
		data: num,
		dataType : 'html' ,
		
		success:function(data){
			if(data==1){
				alert("예약이 취소되었습니다.");
				location.replace("/support/userReservationSituation.do");
			}
			else{
				alert("예약을 취소하던 중 오류 발생");
			}
		},
		error : function(){
			alert("서버 접속 실패!");
		}
		
	}); 
}
     </script>


</head>
<body>
	<div id="wrap">
		<!--head-->
		<%@include file="title.jsp"%>
		<!--head end-->






		<form name="aspnetForm" method="post" action="./reserv_list.aspx"
			id="aspnetForm" class="form-horizontal ">
			<div>
				<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET"
					value="" /> <input type="hidden" name="__EVENTARGUMENT"
					id="__EVENTARGUMENT" value="" /> <input type="hidden"
					name="__VIEWSTATE" id="__VIEWSTATE"
					value="/wEPDwULLTEzNzQwNTcxMDAPFgIeB3RvdHBhZ2UCARYCZg9kFgJmD2QWAgIBD2QWCgIDD2QWAmYPZBYCAgEPFgIeC18hSXRlbUNvdW50ZmQCBQ8PFgIeB0VuYWJsZWRoZGQCBw8PFgIfAmhkZAIJDxYCHwECARYCZg9kFgICAQ8PFggeD0NvbW1hbmRBcmd1bWVudAUBMB4EVGV4dAUBMR4JRm9udF9Cb2xkZx4EXyFTQgKAEGRkAgsPDxYCHwJoZGRkzCk5/lfUZQpxVMkWmcReH+3Tr5U6geOZnP54F+z94Rg=" />
			</div>

			<!--container-->
			<div id="container">
				<div class="banner_box">
					<center>
						<div class="img">
							<img src="/support/resources/imagesUserMain1/banner2.png"
								alt="banner" />
						</div>
				</div>

				<div class="sub_cont container">
					<div class="cont_box">
						<div class="tit_box">
							<h2 class="h2tit">예약 확인/취소</h2>
						</div>


						<div id="ctl00_ContentPlaceHolder1_UpdatePanel1">


							<table class="tbl tbl_list">
								<colgroup>
									<col style="width: 20%;" />
									<col style="width: 10%;" />
									<col style="width: 30%;" />
									<col style="width: 30%;" />
									<col style="width: 10%;" />
								</colgroup>
								<thead>
									<th scope="col">접수일시<br />예약일시
									</th>
									<th scope="col">상태</th>
									<th scope="col">출발지</th>
									<th scope="col">도착지</th>
									
									<th scope="col">취소</th>
								</thead>
								<tbody>

									<c:forEach items="${userRevList}" var="user"
										varStatus="loopTagStatus">
										<tr>
											<td>${user.apply_date}<br>${user.reservation_date}
											<td>${user.reserve_status_name}
											<td>${user.start_road_addr}
											<td>${user.end_road_addr}
											<c:choose>
													<c:when
														test="${user.reserve_status_code==1 || user.reserve_status_code==2}">
														<td><a onclick="userCancelReservation(${user.reserve_apply_car_number});" class="btn middle white radius-5">취소</a>
															
													</c:when>
													<c:otherwise>

														<td>취소된예약
													</c:otherwise>
												</c:choose>
									</c:forEach>





								</tbody>
							</table>

							
						
						</div>


					</div>
				</div>
			</div>

			<!--container end-->




		</form>

		<!--foot-->
		<%@include file="foot.jsp"%>
		<!--foot end-->
	</div>
</body>
</html>


