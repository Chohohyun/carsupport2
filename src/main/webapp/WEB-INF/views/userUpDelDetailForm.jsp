<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>
<html>
<head>
<title>KOSMO 교통약자 이동지원센터</title>
</head>
<script>
	
		
	$(document).ready(function(){
		
		$("#userEmailBtn").attr("disabled",true); 
		$("#userEmailBtn").hide();
		$("#userEmailTr").hide();
		inputData("id","${userDTO.id}");
		inputData("pwd1","${userDTO.pwd1}");
		inputData("pwd2","${userDTO.pwd1}");
		inputData("name","${userDTO.name}");
		inputData("gender","${userDTO.gender}");
		inputData("jumin_num1","${userDTO.jumin_num1}");
		inputData("jumin_num2","${userDTO.jumin_num2}");
		inputData("postal_code","${userDTO.postal_code}");
		inputData("detail_addr","${userDTO.detail_addr}");
		inputData("road_addr","${userDTO.road_addr}");
		inputData("jibun_addr","${userDTO.jibun_addr}");
		inputData("email","${userDTO.email}");
		inputData("phone","${userDTO.phone}");
		inputData("disability_grade","${userDTO.disability_grade}");
		inputData("disability_type","${userDTO.disability_type}");
		inputData("wheelchair","${userDTO.wheelchair}");
		inputData("user_no","${userDTO.user_no}");
	});

	function checkSameEmail(){
		var email = $("[name=userUpDelForm] [name=email]").val();
		var value = $("[name=userUpDelForm] [name=emailCheck]").val();
		if(value==2){
			return;
		}
		else if(email=="${userDTO.email}"){
			$("#userEmailTr").hide();
			$("#userEmailBtn").hide();
			$("[name=userUpDelForm] [name=emailCheck]").val(1);
		}
		else{
			$("#userEmailBtn").show();
			$("#userEmailBtn").attr("disabled",false); 
			$("[name=userUpDelForm] [name=emailCheck]").val(0);
		}
	}
	
	function acceptEmail(type){
		var email = $("[name="+type+"UpDelForm] [name=email]").val();
		if(email_check(email)==false){
			alert("올바른 이메일 형식이 아닙니다.");
			$("[name="+type+"RegForm] [name=email]").focus();
			return;
		}
		$.ajax({
			url:"/support/checkEmail.do",
			type:"post",
			data: $("[name="+type+"UpDelForm] [name=email]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("인증번호 전송 완료");
					
					if(type=='user'){

						$("#userEmailTr").show();
						
						var elem = document.getElementById("userEmailBtn"); 
						elem.value = "재전송";
						return;
					}
					if(type=='driver'){
						
						$("#driverEmail").show();
						var elem = document.getElementById("driverEmailBtn"); 
						elem.value = "재전송";
						return;
					}
				}
				else if(data==0){
					alert("인증번호 db 문제실패");
				}
				else{

					alert("인증번호 전송실패");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 
	}
		
	function goUpDelPage(){
		location.replace("/support/adminMainPage.do");

	}
	
	function goUpDelProc(upDel) {
		if(upDel=="del"){
			document.userUpDelForm.upDel.value="del";
			if(confirm("정말 삭제 하시겠습니까?")==false){ 
				 			return; 
			} 

		}
		
		else{
	
			
			var driverPwd = $("[name=userUpDelForm] [name=pwd1]").val(); 
			if(pwd_check(driverPwd)==false){
				alert("올바른 암호형식이 아닙니다.");
				$("[name=userUpDelForm] [name=pwd]").focus();
				return;
			}
			
			var pwd1 = $("[name=userUpDelForm] [name=pwd1]").val();
			var pwd2 = $("[name=userUpDelForm] [name=pwd2]").val();
			if(pwd2_check(pwd1,pwd2)==false){
				$("[name=userUpDelForm] [name=pwd2]").val("");
				$("[name=userUpDelForm] [name=pwd2]").focus();
				return;
			}

			var name = $("[name=userUpDelForm] [name=name]").val();
			if(name_check(name)==false){
				alert("올바른 이름형식이 아닙니다.");
				$("[name=userUpDelForm] [name=name]").val("");
				$("[name=userUpDelForm] [name=name]").focus();
				return;
			}
			

			var jumin_num1 = $("[name=userUpDelForm] [name=jumin_num1]").val();
			var jumin_num2 = $("[name=userUpDelForm] [name=jumin_num2]").val();
		
			if(jumin_num_check(jumin_num1,jumin_num2)==false){
				$("[name=userUpDelForm] [name=jumin_num1]").focus();
				return;
			}
			var gender=$("[name=userUpDelForm] [name=gender]:checked").length;
			if(gender_check(gender)==false){
				$("[name=userUpDelForm] [name=gender]").focus();
				return;
			}
			var gender_val = $("[name=userUpDelForm] [name=gender]:checked").val();
			
	  		if (gender_jumin_check(gender_val,jumin_num2)==false){
	  			$("[name=userUpDelForm] [name=jumin_num2]").focus();
	  			return;
	  	  	}
	  		
			
			var phone = $("[name=userUpDelForm] [name=phone]").val();
			if(phone_check(phone)==false){
				alert("올바른 핸드폰 번호 형식이 아닙니다.");
				$("[name=userUpDelForm] [name=phone]").focus();
				return;
			}
			
			var email = $("[name=userUpDelForm] [name=email]").val();
			if(email_check(email)==false){
				alert("올바른 이메일 형식이 아닙니다.");
				$("[name=userUpDelForm] [name=email]").focus();
				return;
			}
			var value = $("[name=userUpDelForm] [name=emailCheck]").val();
			if(value==0){
				alert("이메일이 변경되었습니다. 인증해주세요.");
				return;
			}
			var disability_grade = $("[name=userUpDelForm] [name=disability_grade]").val();
			if(is_empty2(disability_grade)==false){
				alert("장애 등급을 선택해주세요.");
				$("[name=userUpDelForm] [name=disability_grade]").focus();
				return;
			}
			var disability_type = $("[name=userUpDelForm] [name=disability_type]").val();
			if(is_empty2(disability_type)==false){
				alert("장애 종류를 선택해주세요.");
				$("[name=userUpDelForm] [name=disability_type]").focus();
				return;
			}
			var postal_code = $("[name=userUpDelForm] [name=postal_code]").val();
			if(is_empty2(postal_code)==false){
				alert("주소를 검색해주세요.");
				return;
			}
			
			if(confirm("정말 수정 하시겠습니까?")==false){ 
	 			return; 
	 		}
		}
		
		$.ajax({
			url:"/support/adminUserUpDelProc.do",
			type:"post",
			data: $("[name=userUpDelForm]").serialize(),
			datatype:"html",
			success:function(data){
				if(upDel=="del")
				{
					if(data==1){
						alert("회원삭제 성공!");
						

						document.userUpDelFormMain.submit();
					}
					else{
						alert("회원삭제 실패!");
					}
				}
				else{
					if(data==1){
						alert("회원수정 성공!");


						document.userUpDelFormMain.submit();
					}
					else{
						alert("회원수정 실패!");
					}
				}
				
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
	function checkAuthenticationNumber(type){
		var email = $("[name="+type+"UpDelForm] [name=email]").val();
		
		var authenticationNumber = $("[name="+type+"UpDelForm] [name=AuthenticationNumber]").val();
		var map = {'email':email,'authenticationNumber':authenticationNumber};
		$.ajax({
			url:"/support/checkEmailAuth.do",
			type:"post",
			data: map,
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("인증번호 확인 완료");
					if(type=='user'){
						$("#userEmailTr").hide();
						$("#userEmailText").attr("readonly",true); 
						$("#userEmailBtn").attr("disabled",true); 
						$("#userEmailBtn").removeClass("btn--red");
						$("#userEmailBtn").addClass("btn--gray");
						document.userUpDelForm.emailCheck.value="2";
						var elem = document.getElementById("userEmailBtn"); 
						elem.value = "변경완료";
						return;
					}
					else{
						$("#driverEmail").hide();
						$("#driverEmailText").attr("readonly",true); 
						$("#driverEmailBtn").attr("disabled",true);
						 
						$("#driverEmailBtn").attr("disabled",true);
						$("#driverEmailBtn").removeClass("btn--red");
						$("#driverEmailBtn").addClass("btn--gray");
						document.driverUpDelForm.emailCheck.value="2";
						return;
					}
				}
				else if(data==0){
					alert("인증번호가 틀립니다. 다시확인해주세요.");
					return;
				}
				else{

					alert("인증번호 전송실패");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 
	
		
	}
	

</script> <!-- Jquery JS-->

<body>
	<div id="wrap">
		<!--head-->
		
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
		<form name="userUpDelForm" method="POST" onsubmit="return false;" >
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<span class="h2tit bg_service">회원정보</span> <span
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
								<input  type="text" name="id" id="userId" placeholder="아이디" style="width: 170px;" readonly/> 
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">비밀번호<em class="color-or"> *</em></div></th>
						<td><input  type="password" name="pwd1" placeholder="비밀번호" style="width: 170px;" maxlength="15" /> <br />
							<span class="txt">*영문,숫자 6자리이상</span>
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">비밀번호 확인<em class="color-or"> *</em></div></th>
						<td><input  type="password" name="pwd2" placeholder="비밀번호확인" style="width: 170px;" maxlength="15"/></td>
					</tr>
					<tr>
						<th scope="row"><div class="name">이름<em class="color-or"> *</em></div></th>
						<td><input  type="text" name="name" placeholder="이름" style="width: 170px;"maxlength="10" /> </td>
					</tr>
					<tr>
						<th scope="row"><div class="name">주민번호<em class="color-or"> *</em></div></th>
						<td><input class="input100" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" name="jumin_num1" placeholder="앞주민번호" maxlength="6" >
							<span>_</span>
							<input class="input100" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="password" name="jumin_num2" placeholder="뒷주민번호" maxlength="7">				
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">휴대폰번호<em class="color-or"> *</em></div></th>
						<td><input class="input100 input--style-5" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" type="text" name="phone" placeholder="숫자만 입력해주세요"maxlength="11"></br>
						
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
						<td><input class="input100" id="userEmailText" type="text" name="email" placeholder="이메일주소" onkeyup="checkSameEmail();">
							<a><input type="button" name="checkEmailBtn" id="userEmailBtn" class="btn small grey" onclick="acceptEmail('user')" value="인증번호받기" maxlength="30"></a>
						</td>
					</tr>
                        
					<tr id="userEmailTr">
						<th scope="row"><div class="name" id="userEmail">인증번호 입력<em class="color-or"> *</em></div></th>
						<td><input class="input100 input--style-5" type="text" name="AuthenticationNumber" placeholder="인증번호입력">
							<a><input type="button" name="AuthenticationNumberBtn" class="btn small grey" onclick="checkAuthenticationNumber('user')" value="확인" maxlength="8"></a>
							<input type="hidden" name="emailCheck" value="1">
						</td>
						
					</tr>
					<tr>
						<th scope="row"><div class="name">장애구분<em class="color-or"> *</em></div></th>
						<td class="">
							<select name="disability_type">
								<option disabled="disabled" selected="selected" value="">Choose option</option>
								<option value="1">신장</option>
								<option value="2">지체</option>
								<option value="3">뇌병변</option>
								<option value="4">지적</option>
								<option value="5">시각</option>
								<option value="6">호흡기</option>
								<option value="7">자폐</option>
								<option value="8">간질</option>
								<option value="9">정신</option>
								<option value="10">청각</option>
								<option value="11">언어</option>
								<option value="12">척추</option>
								<option value="13">장애</option>
								<option value="14">발달</option>
								<option value="15">노인</option>
							</select>
							<div class="select-dropdown"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">장애등급<em class="color-or"> *</em></div></th>
						<td>
							<select name="disability_grade">
								<option disabled="disabled" selected="selected" value="">Choose
									option</option>
								<option value="1">1급</option>
								<option value="2">2급</option>
								<option value="3">등급외</option>
								<option value="4">3급</option>
								<option value="5">중증</option>
								<option value="6">경증(등급 외)</option>
							</select>
														<div class="select-dropdown"></div>
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">휠체어<em class="color-or"> *</em></div></th>
						<td><label class="radio-container"> 
								<input type="radio" checked="checked" name="wheelchair" value="1">사용<span class="checkmark"></span>
							</label>	
							<label class="radio-container">
								<input type="radio" checked="checked" name="wheelchair" value="2">미사용<span class="checkmark"></span>
							</label>	
						</td>
					</tr>
					<tr>
						<th scope="row"><div class="name">주소</div></th>
						<td>
							<div class="value">
								<div class="row row-refine">
									<div class="wrap-input40 input-group-desc">
										<input class="input100" id="userpostal_code" onfocus="this.blur();" type="text" name="postal_code" placeholder="주소검색을 눌러주세요." readonly>
										<a><input type="button" style="width:100px;"class="btn small grey" onclick="searchPostal_code('user')" value="주소검색"></a>
									</div>
									
									<div class="wrap-input40 input-group-desc">
										<input class="input100" style="width:400px;" id="userroad_addr" onfocus="this.blur();" type="text" name="road_addr" placeholder="주소검색을 눌러주세요." readonly> 
									</div>
									&nbsp;&nbsp;
									<div class="wrap-input50 input-group-desc">
										<input class="input100" style="width:400px;" id="userjibun_addr" onfocus="this.blur();" type="text" name="jibun_addr"	placeholder="주소검색을 눌러주세요." readonly> 
											<span id="guide" style="color: #999; display: none"></span>
									</div>
									
									<div class="wrap-input100 input-group-desc">
										<input class="input100" style="width:400px;" id="userdetail_addr" type="text" name="detail_addr" placeholder="상세주소를 입력해주세요." maxlength="20">
									</div>
								</div>
							</div>
						</td>
					</tr>
				</table>


			
			<div class="btn_box">
				<a href="javascript:goUpDelProc('up');" onclick="return submitcheck()"  class="btn large blue radius-5">수정</a>
                <a href="javascript:goUpDelProc('del');" class="btn large white radius-5">삭제</a> 
                <a href="javascript:goUserUpDelForm();" class="btn large white radius-5">취소</a> 
			</div>
		</div></div>
			
		<input type="hidden" name="user_no">
        <input type="hidden" name="upDel" value="up"> 
		</form>
	</div>
	<!--container end-->
	
	<!--foot-->
	<!--foot end-->
	</div>
	
</body>
</html>
