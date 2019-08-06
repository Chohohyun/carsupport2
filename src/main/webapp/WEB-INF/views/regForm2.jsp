<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>

<html>

<script type="text/javascript">
      $(document).ready(function(){
	  
	      $("#driverEmailTr").css("display","none");
		 
      
      });
		
      // 유저 메인 페이지로 이동
      function goMainPage() {
  		location.replace("/support/userMainPage.do");
  	  }
      //가입 이메일 인증받기
      function acceptEmail(type) {
  		var email = $("[name=" + type + "RegForm] [name=email]").val();
  		if (email_check(email) == false) {
  			alert("올바른 이메일 형식이 아닙니다.");
  			$("[name=" + type + "RegForm] [name=email]").focus();
  			return;
  		}
  		$.ajax({
			url : "/support/checkEmail.do",
			type : "post",
			data : $("[name=" + type + "RegForm] [name=email]")
					.serialize(),
			datatype : "html",

			success : function(data) {
				if (data == 1) {
					alert("인증번호 전송 완료");

					if (type == 'driver') {
							
						 $("#driverEmailTr").css("display","");
						
						var elem = document.getElementById("driverEmailBtn");
						elem.value = "재전송";
						return;
					}
				} else if (data == 0) {
					alert("인증번호 db 문제실패");
				} else {
					alert("인증번호 전송실패");
				}
			},
			error : function() {
				alert("서버 접속 실패!");
			}

		});
  	}
      
      function checkAuthenticationNumber(type) {
  		var email = $("[name=" + type + "RegForm] [name=email]").val();

  		var authenticationNumber = $(
  				"[name=" + type + "RegForm] [name=AuthenticationNumber]").val();
  		var map = {
  			'email' : email,
  			'authenticationNumber' : authenticationNumber
  		};
  		$.ajax({
  			url : "/support/checkEmailAuth.do",
  			type : "post",
  			data : map,
  			datatype : "html",

  			success : function(data) {
  				if (data == 1) {
  					alert("인증번호 확인 완료");
  					if (type == 'user') {
  						 $("#userEmailTr").css("display","none");
  						$("#userEmailText").attr("readonly", true);
  						$("#userEmailBtn").attr("disabled", true);
  						$("#userEmailBtn").removeClass("btn--red");
  						$("#userEmailBtn").addClass("btn--gray");
  						document.userRegForm.emailCheck.value = "1";
  						return;
  					} else {
  						 $("#driverEmailTr").css("display","none");
   						$("#driverEmailText").attr("readonly", true);
   						$("#driverEmailBtn").attr("disabled", true);
   						$("#driverEmailBtn").removeClass("btn--red");
   						$("#driverEmailBtn").addClass("btn--gray");
   						document.driverRegForm.emailCheck.value = "1";
   						return;
  					}
  				} else if (data == 0) {
  					alert("인증번호가 틀립니다. 다시확인해주세요.");
  					return;
  				} else {

  					alert("인증번호 전송실패");
  				}
  			},
  			error : function() {
  				alert("서버 접속 실패!");
  			}

  		});

  	}
  	function godriverRegForm() {
  		

  		var driverId = $("[name=driverRegForm] [name=id]").val();
  		if (id_check(driverId) == false) {
  			alert("올바른 아이디형식이 아닙니다.");
  			$("[name=driverRegForm] [name=id]").focus();
  			return;
  		}
  		var driverIdChk = $("[name=driverRegForm] [name=idChk]").val();
  		if (driverIdChk== 0) {
  			alert("아이디 중복확인을 먼저 해주세요.");
  			$("[name=driverRegForm] [name=id]").focus();
  			return;
  		}
  		
  		var driverPwd = $("[name=driverRegForm] [name=pwd1]").val();
  		if (pwd_check(driverPwd) == false) {
  			alert("올바른 암호형식이 아닙니다.");
  			$("[name=driverRegForm] [name=pwd]").focus();
  			return;
  		}

  		var pwd1 = $("[name=driverRegForm] [name=pwd1]").val();
  		var pwd2 = $("[name=driverRegForm] [name=pwd2]").val();
  		if (pwd2_check(pwd1, pwd2) == false) {
  			$("[name=driverRegForm] [name=pwd2]").val("");
  			$("[name=driverRegForm] [name=pwd2]").focus();
  			return;
  		}

  		var name = $("[name=driverRegForm] [name=name]").val();
  		if (name_check(name) == false) {
  			alert("올바른 이름형식이 아닙니다.");
  			$("[name=driverRegForm] [name=name]").val("");
  			$("[name=driverRegForm] [name=name]").focus();
  			return;
  		}
  		
  		var jumin_num1 = $("[name=driverRegForm] [name=jumin_num1]").val();
  		var jumin_num2 = $("[name=driverRegForm] [name=jumin_num2]").val();

  		
  		if (jumin_num_check(jumin_num1, jumin_num2) == false) {
  			$("[name=driverRegForm] [name=jumin_num1]").focus();
  			return;
  		}
  		var gender = $("[name=driverRegForm] [name=gender]:checked").length;
  		if (gender_check(gender) == false) {
  			$("[name=driverRegForm] [name=gender]").focus();
  			return;
  		}
  		var gender_val = $("[name=driverRegForm] [name=gender]:checked").val();
		
  		if (gender_jumin_check(gender_val,jumin_num2)==false){
  			$("[name=driverRegForm] [name=jumin_num2]").focus();
  			return;
  	  	}
  		
  		
  	
  		var phone = $("[name=driverRegForm] [name=phone]").val();
  		if (phone_check(phone) == false) {
  			alert("올바른 핸드폰 번호 형식이 아닙니다.");
  			$("[name=driverRegForm] [name=phone]").focus();
  			return;
  		}

  		var email = $("[name=driverRegForm] [name=email]").val();
  		if (email_check(email) == false) {
  			alert("올바른 이메일 형식이 아닙니다.");
  			$("[name=driverRegForm] [name=email]").focus();
  			return;
  		}
  		var emailCheck = $("[name=driverRegForm] [name=emailCheck]").val();
  		if (emailCheck == 0) {
  			alert("이메일 인증을 먼저 받으세요.");
  			return;
  		}
  		var driver_license_number = $("[name=driverRegForm] [name=driver_license_number]").val();
			if (driver_license_check(driver_license_number) == false) {
			alert("올바른 운전면허 형식이 아닙니다.");
			$("[name=driverRegForm] [name=driver_license_number]").focus();
			return;
		}
			var postal_code = $("[name=driverRegForm] [name=postal_code]").val();
	  		if (is_empty2(postal_code) == false) {
	  			alert("주소를 검색해주세요.");
	  			return;
	  		}
  		if (confirm("가입하시겠습니까?") == false) {
  			return;
  		}
  		alert(1);
  		$.ajax({
  			url : "/support/driverRegForm.do",
  			type : "post",
  			data : $("[name=driverRegForm]").serialize(),
  			datatype : "html",

  			success : function(data) {
  				if (data == 1) {
  					alert("회원신청 성공! 관리자의 승인이 필요합니다.");
  					location.replace("/support/userMainPage.do");

  				} else {
  					alert("회원가입 실패!");
  				}
  			},
  			error : function() {
  				alert("서버 접속 실패!");
  			}

  		});

  	}
  	
    //**********************************
  	// 아이디 중복 체크 시도
  	//**********************************
  	function duplicationId(type) {
  		var id = $("[name=" + type + "RegForm] [name=id]").val();
  		if (id_check(id) == false) {
  			alert("올바른 아이디형식이 아닙니다.");
  			$("[name=" + type + "RegForm] [name=id]").focus();
  			return;
  		}
  		$.ajax({
  			url : "/support/idCheck.do",
  			type : "post",
  			data : $("[name=" + type + "RegForm] [name=id]").serialize(),
  			datatype : "html",

  			success : function(data) {
  				if (data == 1) {
  					alert("아이디가 이미 존재합니다! 다른 아이디를 적어주세요.");
					
  					return;

  				} else {
  					if (confirm("사용가능한 아이디입니다. 사용하시겠습니까?") == false) {
  						return;
  					}
  					$("#" + type + "Id").attr("readonly", true);
  					$("#" + type + "IdBtn").attr("disabled", true);
  					$("[name=" + type + "RegForm] [name=idChk]").val(1);
  				}
  			},
  			error : function() {
  				alert("에러다 이새끼야");
  			}
  		});
  	}

    </script>
	


	


<head>
	<title>COSMO 교통약자 이동지원센터</title>

	<meta name="viewport"
		content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<link type="text/css" rel="stylesheet"
		href="https://www.gurihappycall.or.kr/css/style.css" />
	<link type="text/css" rel="stylesheet"
		href="https://www.gurihappycall.or.kr/css/pop.css" />
	<link type="text/css" rel="stylesheet"
		href="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.css" />
	<script type="text/javascript"
		src="https://www.gurihappycall.or.kr/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="https://www.gurihappycall.or.kr/js/jquery.bxslider.min.js"></script>
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


<!--container-->
		<div id="container">
			<div class="banner_box">
				<center>
					<div class="img">
						<img src="/support/resources/imagesUserMain1/banner2.png" alt="banner" />
					</div>
					<div class="container">
						<p class="tit"><br /></p>
					</div>
			</div>
		<!-- ===================================[회원등록 폼]====================================== -->	
		<form name="driverRegForm" method="POST" onsubmit="return false;" >
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<span class="h2tit bg_service">회원가입</span> <span
							class="txt_notice float-r"> <em class="color-or">*</em> 는
							필수입력항목입니다.정확한 정보를 입력해주세요.
						</span>
					</div>
	
				


			
				<table class="tbl tbl_form mt0">
					<colgroup>
						<col style="width: 21%;" />
						<col style="width: 79%;" />
					</colgroup>
					<tr>
						<th scope="row"><div class="name">아이디<em class="color-or"> *</em></div></th>
						<td>
							<div class="input_btn">
								<input  type="text" name="id" id="driverId" placeholder="아이디" style="width: 170px;" maxlength="20"/> 
								<a><input type="button" class="btn small grey" name="idBtn" id="driverIdBtn" onclick="duplicationId('driver');" value="중복확인"></a>
							</div>
							<input type="hidden" name="idChk" id="driverIdChk" value="0">
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">비밀번호<em class="color-or"> *</em></div></th>
						<td><input  type="password" name="pwd1" placeholder="비밀번호" style="width: 170px;" maxlength="15"/> <br />
							<span class="txt">*영문,숫자,특수문자(!@$%^&* 만 허용)를 사용하여 6자리이상</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">비밀번호 확인<em class="color-or"> *</em></div></th>
						<td><input  type="password" name="pwd2" placeholder="비밀번호확인" style="width: 170px;" maxlength="15"/></td>
					</tr>
					<tr>
						<th scope="row"><div class="name">이름<em class="color-or"> *</em></div></th>
						<td><input  type="text" name="name" placeholder="이름" style="width: 170px;" maxlength="10"/> </td>
					</tr>
					<tr>
						<th scope="row"><div class="name">주민번호<em class="color-or"> *</em></div></th>
						<td><input class="input100" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" name="jumin_num1" placeholder="앞주민번호" maxlength="6" >
							<span>_</span>
							<input class="input100" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="password" name="jumin_num2" placeholder="뒷주민번호" maxlength="7" >				
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">휴대폰번호<em class="color-or"> *</em></div></th>
						<td><input class="input100 input--style-5" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" name="phone" placeholder="숫자만 입력해주세요" maxlength="11" ></br>
						
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">성별<em class="color-or"> *</em></div></th>
						<td><label class="radio-container">
								<input type="radio" checked="checked" name="gender" value="1">남<span class="checkmark"></span>
							</label>	
							<label class="radio-container">
								<input type="radio" checked="checked" name="gender" value="2">여<span class="checkmark"></span>
							</label>	
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">이메일주소<em class="color-or"> *</em></div></th>
						<td><input class="input100" id="driverEmailText" type="text" name="email" placeholder="이메일주소">
							<a><input type="button" name="checkEmailBtn" id="driverEmailBtn" class="btn small grey" onclick="acceptEmail('driver')" value="인증번호받기" maxlength="30" ></a>
						</td>
					</tr>
					<tr id="driverEmailTr">
						<th scope="row"><div class="name" id="driverEmail">인증번호 입력<em class="color-or"> *</em></div></th>
						<td><input class="input100 input--style-5" type="text" name="AuthenticationNumber" placeholder="인증번호입력">
							<a><input type="button" name="AuthenticationNumberBtn" class="btn small grey" onclick="checkAuthenticationNumber('driver')" value="확인" maxlength="8" ></a>
							<input type="hidden" name="emailCheck" value="0">
						</td>
						
					</tr>
					
					<tr>
						<th scope="row"><div class="name">면허증번호<em class="color-or"> *</em></div></th>
						<td class="">
							<input type="text" name="driver_license_number" placeholder="면허증번호" maxlength="20" > 
						</td>
					</tr>
					
					<tr>
						<th scope="row"><div class="name"><em class="color-or"> *</em>주소</div></th>
						<td>
							<div class="value">
								<div class="row row-refine">
									<div class="wrap-input40 input-group-desc">
										<input class="input100" id="driverpostal_code" onfocus="this.blur();" type="text" name="postal_code" placeholder="주소검색을 눌러주세요." readonly>
										<a><input type="button" style="width:100px;"class="btn small grey" onclick="searchPostal_code('driver')" value="주소검색"></a>
									</div>
									
									<div class="wrap-input40 input-group-desc">
										<input class="input100" style="width:400px;" id="driverroad_addr" onfocus="this.blur();" type="text" name="road_addr" placeholder="주소검색을 눌러주세요." readonly> 
									</div>
									&nbsp;&nbsp;
									<div class="wrap-input50 input-group-desc">
										<input class="input100" style="width:400px;" id="driverjibun_addr" onfocus="this.blur();" type="text" name="jibun_addr"	placeholder="주소검색을 눌러주세요." readonly> 
											<span id="guide" style="color: #999; display: none"></span>
									</div>
									
									<div class="wrap-input100 input-group-desc">
										<input class="input100" style="width:400px;" id="driverdetail_addr" type="text" name="detail_addr" placeholder="상세주소를 입력해주세요." maxlength="20" >
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>


			
			
			<input type="hidden"
									name="admission_code" value="n">
			<div class="btn_box">
					<a href="javascript:godriverRegForm();" onclick="return submitcheck()"  class="btn large blue radius-5">등록</a>
                    <a href="javascript:goMainPage();" class="btn large white radius-5">취소</a> 
			</div>
			</div>
		</div>
		</form>
	</div>
	<!--container end-->
	
	<!--foot-->
	<%@include file="foot.jsp"%>
	
	<!--foot end-->
	</div>
	
</body>
</html>

<!-- ------------------------------------------------------------------------------------------------------------------------------------- -->


