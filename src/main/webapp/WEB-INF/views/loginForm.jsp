<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>

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
      $('.slider_box .slider_main').bxSlider({loop:true, auto:true});
      inputData("id",'${cookie.id.value}');
		inputData("pwd",'${cookie.pwd.value}');
		
		<c:if test="${!empty cookie.id.value}">
			inputData("is_login","y")
		</c:if>
      });
		
     
    		

    	function goRegForm(){
    		document.goRegForm.submit();
    	}
    		

    	function goFindIdForm(){
    		document.goFindIdForm.submit();
    	}
    	function goFindPwdForm(){
    		document.goFindPwdForm.submit();
    	}
    	function checkLoginForm() {
    		// 입력된 아이디를 가져와 변수에 저장
    		var id = $(".id").val();
    		// 아이디를 입력 안했으면 경고하고 함수 중단
    		if (id.split(" ").join("") == "") {
    			$(".id").val("");
    			alert("아이디를 입력하지 않았습니다.");
    			return;
    		}

    		// 입력된 비밀번호를 가져와 변수에 저장
    		var pwd = $(".pwd").val();
    		// 비밀번호를 입력 안했으면 경고하고 함수 중단
    		if (pwd.split(" ").join("") == "") {
    			$(".pwd").val("");
    			alert("비밀번호를 입력하지 않았습니다.");
    			return;
    		}
    		alert($("[name=loginForm]").serialize());
    		$.ajax({
    			url:"/support/loginProc.do",
    			type:"post",	
    			data: $("[name=loginForm]").serialize(),
    			datatype:"html",
    			success:function(data){
    				if(data==1){
    					
    					location.replace("/support/adminHomePage.do");
    				}
    				else if(data==3){
    					
    					location.replace("/support/userMainPage.do");
    					
    				}
    				else if(data==5){
    					
    					location.replace("/support/driverMainPage.do");
    				}
    				else if(data==-2){
    					alert("승인되지 않거나 탈퇴한 회원입니다.");
    				}
    				else if(data==2||data==4||data==6){
    					alert("비밀번호가 틀렸습니다.");
    				}
    				else{
    					alert("존재하는 아이디가 없습니다");
    				}
    				
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		});

    	}
</script>
<script type="text/javascript" language="javascript">

          if (/Android/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else {
              // 그 외 디바이스
          }
     </script>


</head>
<body>
	<div id="wrap">
		<!--head-->

		<%@include file="title.jsp"%>
		<!--head end-->






		<form name="loginForm" method="post" action="/support/loginProc.do"
			id="aspnetForm" class="form-horizontal " onsubmit="return false;" >

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
							<h2 class="h2tit">회원 로그인</h2>
						</div>

						<div id="ctl00_ContentPlaceHolder1_UpdatePanel1">
							<div class="login_box">
								<div class="login-s-box">
									<dl>
										<dt>아이디</dt>
										<dd>

											<input name="id"
												type="text" class="id" id="id" style="width: 100%;" />
										</dd>
									</dl>
									<dl>
										<dt>비밀번호</dt>
										<dd>
											<input name="pwd"
												type="password" class="pwd"  id="pwd" style="width: 100%;" />
										</dd>
									</dl>
									<dl>
										<dt></dt>
										<dd>
											<input type="checkbox" name="is_login" value="y">아이디 기억하기
										</dd>
									</dl>

									<div class="btn_box login-btn-s">

										<a onclick="checkLoginForm();"
											id="ctl00_ContentPlaceHolder1_LinkOk"
											class="btn large blue radius-5"> 로그인 </a>

									</div>
									<div class="login_link txt_center">
										<!--<a id="show_pop_find" href="#pop_find">아이디/비밀번호 찾기</a>-->
										<a href="javascript:goFindIdForm();" >아이디 찾기 </a> 
										 / 
										<a href="javascript:goFindPwdForm();" >비밀번호 찾기 </a> 
										&nbsp;&nbsp; <a href="javascript:goRegForm();">회원가입하기</a>
									</div>
								</div>
							</div>

						</div>


					</div>
				</div>
			</div>
			</form>
			<!--container end-->

			<!-- modal -->
	</div>
	<script src="js/bootstrap.min.js"></script>




	<!--foot-->
	<%@include file="foot.jsp" %>
	
	<!--foot end-->
	<form name="goRegForm" method="get" action="/support/regSelectForm.do"></form>
	<form name="goFindIdForm" method="get" action="/support/findIdForm.do"></form>
	<form name="goFindPwdForm" method="get" action="/support/findPwdForm.do"></form>
	
</body>
</html>


