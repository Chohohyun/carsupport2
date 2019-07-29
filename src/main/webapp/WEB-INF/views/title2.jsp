<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="checkDriver.jsp" %>

<script type="text/javascript" language="javascript">

    	function driverMainPage(){
    		location.replace("/support/driverMainPage.do");
    	}
    	function driverCarInfo(){
			location.replace("/support/driverCarInfo.do");
		}
    	function qnaListFormMain(){
    		document.qnaListFormMain.submit();
    	}    
		function driverReservationSituation(){
			document.driverReservationSituation.submit();
		}
		function driverUpDelForm2(){
			location.replace("/support/driverUpDelForm2.do");
		}
		function logout(){
			location.replace("/support/logout.do");
		}
		function driverHistory(){
			document.driveHistory.submit();
		}
      </script>
<form name="qnaListFormMain" method="post" action="/support/qnaListForm.do">
		</form>
		<form name="driveHistory" method="post" action="/support/driveHistory.do">
		</form>
		<form name="driverReservationSituation" method="post" action="/support/driverReservationSituation.do">
		</form>
		<div id="head" style="border-bottom: 1px solid #b9b9b9">
			<div class="toolbar_box">
				<div class="container">
					<ul class="toolbar">
						<c:if test="${sessionScope.name!=null}">
						<li><a href="javascript:driverMainPage();">HOME</a></li>
                        <li><a href="javascript:driverUpDelForm2();">${sessionScope.name}님 정보수정</a></li>
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
					<a href="javascript:driverMainPage();"> <img
						src="/support/resources/imagesUserMain1/banner1.jpg" alt="LOGO" />
					</a>
				</div>
				<div class="menu_box">
				
					<ul class="menu">
						<li></li>
						<li><a href="javascript:driverCarInfo();">차량정보</a></li>
						<li><a href="javascript:driverHistory();">주행기록</a></li>
						<li><a href="javascript:driverReservationSituation();">예약현황</a></li>
						<li><a href="javascript:qnaListFormMain();">공지사항</a>
						</li>
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