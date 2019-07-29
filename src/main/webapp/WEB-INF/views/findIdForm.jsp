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
	function goFindIdProc() {
		
		
		var name = $("[name=findIdForm] [name=name]").val();
		if(name_check(name)==false){
			alert("올바른 이름형식이 아닙니다.");
			$("[name=findIdForm] [name=name]").val("");
			$("[name=findIdForm] [name=name]").focus();
			return;
		}

		var phone = $("[name=findIdForm] [name=phone]").val();
		if(phone_check(phone)==false){
			alert("올바른 핸드폰 번호 형식이 아닙니다.");
			$("[name=findIdForm] [name=phone]").focus();
			return;
		}
		alert( $("[name=findIdForm]").serialize());
		 $.ajax({
			url:"/support/findIdProc.do",
			type:"post",
			data: $("[name=findIdForm]").serialize(),
			dataType : 'json' ,
			
			success:function(result){
				var data = JSON.stringify(result.id);

				if(data!="null" && data.length!=0){
					alert("찾으시는 아이디는  "+data+"  입니다.");
				}
				else{
					alert("일치하는 아이디가 존재하지 않습니다.");
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

</head>

<body>
	<div id="wrap">
		<!--head-->

		<%@include file="title.jsp"%>
		<!--head end-->






		<form name="findIdForm" id="aspnetForm" class="form-horizontal " onsubmit="return false;" >

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
							<h2 class="h2tit">아이디찾기</h2>
						</div>

						<div id="ctl00_ContentPlaceHolder1_UpdatePanel1">
							<div class="login_box">
								<div class="login-s-box">
									<dl>
										<dt>이름</dt>
										<dd>

											<input name="name"
												type="text" class="name" id="name" style="width: 100%;" />
										</dd>
									</dl>
									<dl>
										<dt>폰번호</dt>
										<dd>
											<input name="phone" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
												type="text" class="phone"  id="phone" style="width: 100%;" />
										</dd>
									</dl>
									

									<div class="btn_box login-btn-s">

										<a onclick="goFindIdProc();"
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