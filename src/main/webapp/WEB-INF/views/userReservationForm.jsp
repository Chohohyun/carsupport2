
<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<html>
<script>
	$(document).ready(function(){
		
});
		
	function goMainPage(){
		location.replace("/support/userMainPage.do");
	}
	function checkDate(){
		alert(1);
    	var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 
		var sysdate = year + "" + month + "" + day;
    	var regDate = $("[name=car_reservation_date]").val();
    	alert(sysdate);
    	alert(regDate);
    	if(regDate<sysdate){
    		alert("과거 날짜를 선택할 수 없습니다.");
    		$("[name=car_reservation_date]").val("");
    		return;
    	}
    }   
   	function checkHour(){
   		if(is_empty("car_reservation_date")){
    		alert("날짜를 먼저선택해주세요.");
    		$("[name=car_reservation_hour]").val("");
    		return;
    	}
   
   		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 
		var hour = new String(date.getHours());
		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 
		if(hour.length==1){
			hour = "0" + hour;
		}
		var sysdate = year + "" + month + "" + day ;
    	var regDate = $("[name=car_reservation_date]").val();
    	var regHour = $("[name=car_reservation_hour]").val();
    	if(regDate==sysdate){
    		if(hour>=regHour){
    			alert("과거 시간을 선택할 수 없습니다.");
    			$("[name=car_reservation_hour]").val("");
    			return;
    		}
    	}
    		
   		
   		
   	}
</script>
<script>
function reservationCheck() {
			var start_postal_code = $("[name=start_postal_code]").val();
			if (is_empty2(start_postal_code) == false) {
			alert("출발지를 검색해주세요.");
			return;
			}
			var end_postal_code = $("[name=end_postal_code]").val();
			if (is_empty2(end_postal_code) == false) {
			alert("도착지 검색해주세요.");
			return;
			}
			
			if(is_empty("car_reservation_date")){
        		alert("날짜를 선택해주세요.");
        	return;
        	}
			if(is_empty("car_reservation_hour")){
				alert("시간을 선택해주세요.");
			return;
			}
		alert(1);
		alert($("[name=carReservationForm]").serialize());
		$.ajax({
			url:"/support/reservationCheck.do",
			type:"post",
			data: $("[name=carReservationForm]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data>=1){
					alert("예약신청 성공!");
					location.replace("/support/userMainPage.do");
					
				}
				else if(data==0){
					alert("예약신청 도중 오류발생.");
				}
				else if(data==-1){
					alert("해당 날짜에 이미 예약을 하셨습니다. 예약은 하루에 한건만 가능합니다.");
				}
				else if(data==-2){
					alert("예약가능한 차량이 없습니다. 날짜나 차량종류를 변경해주세요.");
				}
				else{
					alert("예약실패");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 
	}
</script>
<!-- Jquery JS-->

<head>

<!-- Title Page-->
<title>회원가입</title>

<!-- 신청 날짜 달력 코드 -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css" />

<script type="text/javascript">
            $(function() { 
            $("#datepicker").datepicker({
            dateFormat: 'yymmdd',
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNamesMin: ['일','월','화','수','목','금','토'],
                changeMonth: true, //월변경가능
                changeYear: true, //년변경가능
                showMonthAfterYear: true, //년 뒤에 월 표시
            });
            });
    	</script>



<!-- Vendor CSS-->
<link href="/support/resources/vendor2/select2/select2.min.css"
	rel="stylesheet" media="all">
<link href="/support/resources/vendor2/datepicker/daterangepicker.css"
	rel="stylesheet" media="all">




</head>
<body>
	<div id="wrap">
		<!--head-->
		<script type="text/javascript" language="javascript">

    	function userMainPage(){
    		location.replace("/support/userMainPage.do");
    	}
    	function loginForm(){
    		location.replace("/support/loginForm.do");
    	}
    	function regTypeForm(){
    		location.replace("/support/regTypeForm.do");
    	}
    	function userUseProcedure(){
    		location.replace("/support/userUseProcedure.do");
    	}
    	function userReservationForm(){
    		location.replace("/support/userReservationForm.do");
    	}
    	function userReservationSituation(){
    		location.replace("/support/userReservationSituation.do");
    	}
    	function qnaListFormMain(){
    		document.qnaListFormMain.submit();
    	}    

		function userUpDelForm(){
			location.replace("/support/userUpDelForm2.do");
		}
		function logout(){
			location.replace("/support/loginForm.do");
		}
		function discontentListFormMain(){
			document.discontentListFormMain.submit();
		}
		function userUtilizationDetailsMain(){
			document.userUtilizationDetailsMain.submit();
		}
      </script>
		<form name="discontentListFormMain" method="post"
			action="/support/discontentListForm.do"></form>
		<form name="userUtilizationDetailsMain" method="post"
			action="/support/userUtilizationDetails.do"></form>
		<form name="qnaListFormMain" method="post"
			action="/support/qnaListForm.do"></form>
		<div id="head" style="border-bottom: 1px solid #b9b9b9">
			<div class="toolbar_box">
				<div class="container">
					<ul class="toolbar">
						<c:if test="${sessionScope.name!=null}">
							<li><a href="javascript:userMainPage();">HOME</a></li>
							<li><a href="javascript:userUpDelForm();">${sessionScope.name}님
									정보수정</a></li>
							<li><a href="javascript:logout();">로그아웃</a></li>
						</c:if>
						<c:if test="${sessionScope.name==null}">
							<li><a href="javascript:userMainPage();">HOME</a></li>
							<li><a href="javascript:loginForm();">로그인</a></li>
							<li><a href="javascript:regTypeForm();">회원가입</a></li>
						</c:if>


						<!--관리자 메뉴 -->


						<!--관리자 메뉴 -->
					</ul>
				</div>
			</div>
			<div class="head_box container">
				<div class="logo_box">
					<a href="javascript:userMainPage();"> <img
						src="/support/resources/imagesUserMain1/banner1.jpg" alt="LOGO" />
					</a>
				</div>
				<div class="menu_box">

					<ul class="menu">
						<li></li>
						<li><a href="javascript:userUseProcedure();">예약안내</a></li>
						<li><a href="javascript:userReservationForm();">예약신청</a></li>
						<li><a href="javascript:userReservationSituation();">예약확인</a></li>
						<li><a href="javascript:userUtilizationDetailsMain();">이용내역</a>
						</li>
						<li><a href="javascript:qnaListFormMain();">공지사항</a></li>
						<li><a href="javascript:discontentListFormMain();">불만게시판</a></li>
					</ul>
				</div>
			</div>
			<a href="#" class="btn_menu"> <img
				src="https://www.gurihappycall.or.kr/images/btn/btn_menu.png"
				alt="menu" />
			</a>
			<div class="nav_wrap">
				<div class="left_menu">
					<a href="#" class="btn_leftMenu_close"> <img
						src="https://www.gurihappycall.or.kr/images/btn/btn_menu_close.png"
						alt="close" />
					</a>
					<ul class="menu">
						<li></li>
						<li><a href="https://www.gurihappycall.or.kr/service.aspx"
							class="link01">예약안내</a></li>
						<li><a
							href="https://www.gurihappycall.or.kr/reserv_request.aspx"
							class="link02">예약신청</a></li>
						<li><a
							href="https://www.gurihappycall.or.kr/reserv_list.aspx"
							class="link03">예약 확인/취소</a></li>
					</ul>
				</div>
				<div class="nav_mask"></div>
			</div>
		</div>

		<!--head end-->
		<!--container-->
		<form name="carReservationForm" method="post"
			onsubmit="return false;" >
		<div id="container">
			<div class="banner_box">
				<center>
					<div class="img">
						<center>
							<img src="/support/resources/imagesUserMain1/banner2.png"
								alt="banner" />
						</center>
					</div>
				</center>
			</div>
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<span class="h2tit bg_service">예약신청</span> <span
							class="txt_notice float-r"> <em class="color-or">*</em> 는
							필수입력항목입니다.정확한 정보를 입력해주세요.
						</span>
					</div>
					<table class="tbl tbl_form">
						<colgroup>
							<col style="width: 21%;" />
							<col style="width: 79%;" />
						</colgroup>

						<tr>
							<th scope="row"><div class="name">출발지</div></th>
							<td>
								<div class="value">
									<div class="row row-refine">
										<div class="wrap-input40 input-group-desc">
											<input class="input100" id="startpostal_code"
												onfocus="this.blur();" type="text" name="start_postal_code"
												placeholder="주소검색을 눌러주세요." readonly> <a><input
												type="button" style="width: 100px;" class="btn small grey"
												onclick="searchPostal_code('start')" value="주소검색"></a>
										</div>

										<div class="wrap-input40 input-group-desc">
											<input class="input100" style="width: 400px;"
												id="startroad_addr" onfocus="this.blur();" type="text"
												name="start_road_addr" placeholder="주소검색을 눌러주세요." readonly>
										</div>
										&nbsp;&nbsp;
										<div class="wrap-input50 input-group-desc">
											<input class="input100" style="width: 400px;"
												id="startjibun_addr" onfocus="this.blur();" type="text"
												name="start_jibun_addr" placeholder="주소검색을 눌러주세요." readonly>
											<span id="guide" style="color: #999; display: none"></span>
										</div>

										<div class="wrap-input100 input-group-desc">
											<input class="input100" style="width: 400px;"
												id="startdetail_addr" type="text" name="start_detail_addr"
												placeholder="상세주소를 입력해주세요.">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row"><div class="name">도착지</div></th>
							<td>
								<div class="value">
									<div class="row row-refine">
										<div class="wrap-input40 input-group-desc">
											<input class="input100" id="endpostal_code"
												onfocus="this.blur();" type="text" name="end_postal_code"
												placeholder="주소검색을 눌러주세요." readonly> <a><input
												type="button" style="width: 100px;" class="btn small grey"
												onclick="searchPostal_code('end')" value="주소검색"></a>
										</div>

										<div class="wrap-input40 input-group-desc">
											<input class="input100" style="width: 400px;"
												id="endroad_addr" onfocus="this.blur();" type="text"
												name="end_road_addr" placeholder="주소검색을 눌러주세요." readonly>
										</div>
										&nbsp;&nbsp;
										<div class="wrap-input50 input-group-desc">
											<input class="input100" style="width: 400px;"
												id="endjibun_addr" onfocus="this.blur();" type="text"
												name="end_jibun_addr" placeholder="주소검색을 눌러주세요." readonly>
											<span id="guide" style="color: #999; display: none"></span>
										</div>

										<div class="wrap-input100 input-group-desc">
											<input class="input100" style="width: 400px;"
												id="enddetail_addr" type="text" name="end_detail_addr"
												placeholder="상세주소를 입력해주세요.">
										</div>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th scope="row">예약날짜<em class="color-or"> *</em></th>
							<td><input class="input100 input--style-5" type="text"
								onchange="checkDate();" id="datepicker"
								name="car_reservation_date" placeholder="날짜선택▼"
								style="width: 170px"></td>
						</tr>
						<tr>
							<th scope="row">예약시간<em class="color-or"> *</em></th>
							<td><select name="car_reservation_hour"
								onchange="checkHour();">
									<option disabled="disabled" selected="selected" value="">시간을
										선택해주세요</option>
									<option value="08">오전8시</option>
									<option value="10">오전10시</option>
									<option value="12">오후12시</option>
									<option value="14">오후2시</option>
									<option value="16">오후4시</option>
									<option value="18">오후6시</option>
							</select></td>
						</tr>
						<tr>
							<th scope="row">차량종류<em class="color-or"> *</em></th>
							<td><input type="radio" checked="checked" name="car_code" value="1">슬로프
								<input type="radio" name="car_code" value="2">리프트
							</td>
						</tr>

						
					</table>
					
						<input type="hidden" name="startLatitude" id="startLatitude">
						<input type="hidden" name="startLongitude" id="startLongitude">
						
						<input type="hidden" name="endLatitude" id="endLatitude">
						<input type="hidden" name="endLongitude" id="endLongitude">
						
							


								
					<div class="btn_box">
						<a onclick="reservationCheck();" id="ctl00_ContentPlaceHolder1_LinkOk" class="btn large blue radius-5">예약완료 </a> 
						<a onclick="goMainPage();" class="btn large white radius-5">취소</a>
					</div>
				</div>
			</div>
		</div>
		</form>
		<!--container end-->


	</div>


	<!--foot-->
	<div id="term">
		<div class="term_box container">
			<div
				style="margin-top: 20px; text-align: center; color: #777777; font-family: Dotum; font-size: 15px;">
				<a href='https://www.gurihappycall.or.kr/term.aspx'>이용약관</a>&nbsp;
				|&nbsp; <a href='https://www.gurihappycall.or.kr/private.aspx'>개인정보
					처리방침</a>&nbsp; |&nbsp; <a
					href='https://www.gurihappycall.or.kr/media.aspx'>영상정보처리기
					운영관리방침</a>&nbsp; |&nbsp; <a
					href='https://www.gurihappycall.or.kr/email.aspx'>이메일집단수집거부</a>
			</div>
		</div>
	</div>

	<div id="foot">
		<div class="foot_box container">
			<p class="copyright">
				경기도 구리시 안골로 40(교문동, 교문동주차빌딩 3층)&nbsp;㉾ 11934&nbsp;&nbsp;&nbsp;전화 :
				1577-3659&nbsp;&nbsp;&nbsp;팩스 : 070-4275-1080 <br />Copyright ©
				Guri Support For Moving Center All Right Reserved.
			</p>
		</div>
	</div>

	<!--foot end-->

</body>
</html>
