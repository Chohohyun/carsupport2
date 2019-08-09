<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<html>
<script>
	$(document).ready(function() {
		

	

	});
		
	
	function goLoginForm(){
		location.replace("/support/loginForm.do");

	}
	function goFindPwdProc() {

		
		var id = $("[name=findPwdForm] [name=id]").val();
		if(id_check(id)==false){
			alert("올바른 아이디형식이 아닙니다.");
			$("[name=findPwdForm] [name=id]").focus();
			return;
		}

		var email = $("[name=findPwdForm] [name=email]").val();
		if(email_check(email)==false){
			alert("올바른 이메일 형식이 아닙니다.");
			$("[name=findPwdForm] [name=email]").focus();
			return;
		}
		alert($("[name=findPwdForm]").serialize());
		 $.ajax({
			url:"/support/findPwdProc.do",
			type:"post",
			data: $("[name=findPwdForm]").serialize(),
			dataType : 'html' ,
			
			success:function(data){
				if(data==1){
					alert("임시비밀번호를 해당 이메일로 전송하였습니다.");
					location.replace("/support/loginForm.do");
				}
				else{
					alert("일치하는 아이디가 없습니다.");
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
<title>KOSMO 교통약자 이동지원센터</title>
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

</head>

<body>
	<div id="wrap">
		<!--head-->

		<%@include file="title.jsp"%>
		<!--head end-->






		<form name="findPwdForm" id="aspnetForm" class="form-horizontal " onsubmit="return false;" >

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
							<h2 class="h2tit">비밀번호찾기</h2>
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
										<dt>이메일</dt>
										<dd>
											<input name="email" 
												type="text" class="email"  id="email" style="width: 100%;" />
										</dd>
									</dl>
									

									<div class="btn_box login-btn-s">

										<a onclick="goFindPwdProc();"
											id="ctl00_ContentPlaceHolder1_LinkOk"
											class="btn large blue radius-5"> 찾기 </a>
											
										
										<a onclick="goLoginForm();"
											id="ctl00_ContentPlaceHolder1_LinkOk"
											class="btn large white radius-5"> 취소 </a>
										

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

</body>
</html>