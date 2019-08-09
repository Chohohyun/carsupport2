<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="checkAdmin.jsp" %>

<html>

<head>
<title>KOSMO 교통약자 이동지원센터</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css); 



/*
style 소스의 type = text를 제어하는 css로 한다.
a:link : 클릭하지 않은 링크
a:visited : 한번 클릭했던 혹은 다녀갔던 링크
a:hover : 링크를 클릭하려고 마우스를 가져갔을 때
decoration : 밑줄
none : 없는 상태
underline : 있는 상태
a:active : 링크부분에서 마우스를 누르고 있는 동안의 상태*/

a:link { color: #474040; text-decoration: none; font-weight: bold;}
a:visited { color: #474040; text-decoration: none;   font-weight: bold;}
a:hover { color: #474040; text-decoration: underline;   font-weight: bold;}

/*네비게이션 색상*/

.navi_bg{
   background: #fafafa;
}

/*네비게이션 전체 영역 제어*/

.nav {
   height:95px;
   list-style: none;
   width:1100px;
   margin:auto;
   background: #fafafa;
   font-size: 14px;
   color:#000000;
}

/*주메뉴 영역 제어*/

.topnav{
   text-align:center;
   width:100px;
   height:15px;
   cursor:pointer;
   font-weight:bold;
}

/*주메뉴 마우스 오버시*/

.topnav:hover{
   color:#aeb0b3;
}

/*주메뉴,서브메뉴 한묶음 제어*/

.navi_set{
   float: left;
   padding:10px;
   position: relative;
   padding-top: 50px;
}


.jy{
   float: left;
   padding:10px;
   position: relative;
   padding-top: 30px;
}


/*서브메뉴 전체영역 제어*/

.subnav{
   position: absolute;
   left: 0; top: 75px;
   background: #ffffff;
   display: none;
   z-index:4;
   border: 1px solid #ceccd4;
   box-shadow: 8px 5px 8px 1px rgba(0,10,18,.1), 0 0 0 1px rgba(0,10,18,.1);
}

/*서브메뉴 한칸 제어*/

.subnav li{
   padding:0px;
   width:120px;
   height:35px;
   line-height: 200%;
   text-align:center;
   /*border-bottom:1px solid #4a4a4a;
   border-top:1px solid #4a4a4a;*/
   cursor:pointer;
}

/*서브메뉴 마우스 오버시*/

.subnav li:hover{
   background:#f5f5f5;
}

</style>


<link type="text/css" href="resources/css/style.css" rel="stylesheet" />
<script>

function adminMainPage(){
	location.replace("/support/adminHomePage.do")
}
	function goDriverAcceptForm(){
		document.driverAcceptForm.submit();
	}

	function driverRegForm(){
		location.replace("/support/driverRegForm2.do");
	}
	function goDriverUpDelForm(){
		document.driverUpDelFormMain.submit();
	}
	// 차량관리
	function carRegForm(){
		location.replace("/support/adminCarRegForm.do");
	}
	function goCarUpDelForm(){
		
		document.carUpDelForm.submit();
	}
	function goCarListInfoForm(){
		document.carListInfoFormMain.submit();
	}
	function goCarMaintanceListForm(){
		document.carMaintanceListMain.submit();
	}
	
	
	function userRegForm(){
		location.replace("/support/userRegForm2.do");
	}
	function goUserUpDelForm(){
		document.userUpDelFormMain.submit();
	}
	
	// 불만 게시판으로 이동하는 함수(관리자)
	function goAdminDiscontentListForm() {
		document.adminDiscontentListFormMain.submit();
	}
	// QnA 게시판으로 이동하는 함수
	function qnaListForm() {
		document.qnaListFormMain.submit();
	}
	
	function logout(){
		location.replace("/support/logout.do");
		
	}
	  function adminStaticsCar(){
	      location.replace("/support/adminStaticsCar.do");
	   }
	   function adminStaticsDriver(){
	      location.replace("/support/adminStaticsDriver.do");
	   }
	   function adminStaticsUser(){
	      location.replace("/support/adminStaticsUser.do");
	   }
</script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function(){  
	  
		$(".topnav").hover(function() { //마우스를 topnav에 오버시
			$(this).parent().find(".subnav").slideDown('fast').show(); //subnav가 내려옴.
			$(this).parent().hover(function() {  
			}, function(){  
				$(this).parent().find(".subnav").slideUp('fast'); //subnav에서 마우스 벗어났을 시 원위치시킴  
			});  
		});  
	  
	});  
</script>

</head>

<body>
<div id="wrap">
	<div id="header">	
			<div class="navi_bg">
				<div class="nav">  
					<li class="jy">
					<a href="javascript:adminMainPage();"> <img
					src="/support/resources/imagesUserMain1/adminLogo1.png" />
					</a>
					</li>
					
					<li class="navi_set">  
						<div class="topnav" onclick="adminMainPage();">HOME</div>
					</li>  

					<li class="navi_set">  
						<div class="topnav">차량관리</div>
						<ul class="subnav">  
							<li><a href="javascript:carRegForm();">차량 등록</a></li>  
							<li><a href="javascript:goCarUpDelForm();">차량 수정/삭제</a></li> 
							<li><a href="javascript:goCarListInfoForm();">차량 정보</a></li>  
							<li><a href="javascript:goCarMaintanceListForm();">차량별 정비내역</a></li> 
						</ul>  
					</li> 
					
					<li class="navi_set">  
						<div class="topnav">운전자관리</div>
						<ul class="subnav">  
								 <li>
							<a href="javascript:goDriverAcceptForm();">운전자 승인</a></li>
							 <li>
					      <a href="javascript:driverRegForm();">운전자 등록</a></li>
							 <li>
					      <a href="javascript:goDriverUpDelForm();">운전자 수정/삭제</a></li>  
											</ul>  
					</li> 

					<li class="navi_set">  
						<div class="topnav">회원관리</div>
						<ul class="subnav">  
							<li><a href="javascript:userRegForm();">회원 등록</a></li>  
							<li><a href="javascript:goUserUpDelForm();">회원 수정/삭제</a></li>  
						</ul>  
					</li>

					<li class="navi_set">  
						<div class="topnav">게시판관리</div>
						<ul class="subnav">  
							<li><a href="javascript:qnaListForm();">Q/A 게시판</a></li>  
							<li><a href="javascript:goAdminDiscontentListForm();">불만게시판</a></li>  
						</ul>  
					</li> 

					<li class="navi_set">  
						<div class="topnav">통계관리</div>
						<ul class="subnav">  
							   <li><a href="javascript:adminStaticsCar();">차량 통계</a></li>  
                    			 <li><a href="javascript:adminStaticsDriver();">운전자 통계</a></li> 
                    			 <li><a href="javascript:adminStaticsUser();">회원 통계</a></li>  
						</ul>  
					</li>
				
					<li class="navi_set">  
						<div class="topnav" onclick="logout();">로그아웃</div> 
					</li>

				</div>
			</div>
	</div>
</div>  
<table>
			<tr height=20>
			<td>
		</table>
<%-- <%@include file="titleadmin.jsp" %> --%>

<form name="carMaintanceListMain" method="post" action="/support/carMaintanceListForm.do">

</form>

<form name="carUpDelForm" method="post" action="/support/adminCarUpDelForm.do">
</form>

<form name="carListInfoFormMain" method="post" action="/support/carListInfoForm.do">
</form>

<form name="driverAcceptForm" method="post" action="/support/driverAcceptForm.do">
</form>

<form name="driverUpDelFormMain" method="post" action="/support/driverUpDelForm.do">
</form>


<form name="userUpDelFormMain" method="post" action="/support/userUpDelForm.do">
</form>

<form name="adminDiscontentListFormMain" method="post" action="/support/adminDiscontentListForm.do">
</form>


<form name="qnaListFormMain" method="post" action="/support/qnaListForm.do">
</form>

</body>
</html>
