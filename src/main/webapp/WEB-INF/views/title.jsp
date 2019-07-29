<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>


<script type="text/javascript" language="javascript">

    	function userMainPage(){
    		location.replace("/support/userMainPage.do");
    	}
    	function loginForm(){
    		location.replace("/support/loginForm.do");
    	}
    	function regTypeForm(){
    		location.replace("/support/regSelectForm.do");
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
			location.replace("/support/logout.do");
		}
		function discontentListFormMain(){
			document.discontentListFormMain.submit();
		}
		function userUtilizationDetailsMain(){
			document.userUtilizationDetailsMain.submit();
		}
      </script>
		<form name="discontentListFormMain" method="post" action="/support/discontentListForm.do">
		</form>
		<form name="userUtilizationDetailsMain" method="post" action="/support/userUtilizationDetails.do">
		</form>
		<form name="qnaListFormMain" method="post" action="/support/qnaListForm.do">
		</form>
		<div id="head" style="border-bottom: 1px solid #b9b9b9">
			<div class="toolbar_box">
				<div class="container">
					<ul class="toolbar">
						<c:if test="${sessionScope.name!=null}">
						<li><a href="javascript:userMainPage();">HOME</a></li>
                        <li><a href="javascript:userUpDelForm();">${sessionScope.name}님 정보수정</a></li>
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