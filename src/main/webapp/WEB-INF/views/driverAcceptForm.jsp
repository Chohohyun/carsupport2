<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>
<html>
<script>
$(document).ready(function() {

});
	function acceptDriver(no){
		alert(no);
		
		var driver_no = no;
		if(confirm("정말 승인 하시겠습니까?")==false){ 
			return;
		} 
		alert(1);
		document.acceptDriverForm.driver_no.value=driver_no;
		alert($("[name=acceptDriverForm]").serialize());
		
		$.ajax({
			url:"/support/acceptDriver.do",
			type:"post",	
			data:$("[name=acceptDriverForm]").serialize(),
			datatype:"html",
			success:function(data){
				if(data==1){
					alert("승인 성공!");
					document.driverAcceptForm.submit();
				}
				
				else{
					alert("승인 실패!");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		});
	}
	function refuseDriver(no){
		alert(no);
		
		var driver_no = no;
		if(confirm("정말 거절 하시겠습니까?")==false){ 
			return;
		} 
		alert(1);
		document.acceptDriverForm.driver_no.value=driver_no;
		alert($("[name=acceptDriverForm]").serialize());
		
		$.ajax({
			url:"/support/refuseDriver.do",
			type:"post",	
			data:$("[name=acceptDriverForm]").serialize(),
			datatype:"html",
			success:function(data){
				if(data==1){
					alert("거절 성공!");
					location.replace("/support/driverAcceptForm.do");
				}
				
				else{
					alert("거절 실패!");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		});
	}
</script>
<head>

</head>

<body>
	<div id="wrap">
		<!--head-->


		<!--head end-->


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
						<h2 class="h2tit">운전자승인</h2>
					</div>
					<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
						</colgroup>
						<thead>
							<th scope="col">번호</th>
							<th scope="col">운전자 이름</th>
							<th scope="col">ID</th>
							<th scope="col">면허증 번호</th>
							<th scope="col">휴대폰</th>
							<th scope="col">등록</th>
							<th scope="col">거절</th>
						</thead>
						<tbody>
						<c:forEach items="${acceptList}" var="accept" varStatus="loopTagStatus">
						<!--boardList는 BoardListFormAction에 request.setAttribute("boardList", boardList);에서 "boardList" 요고다-->
						<!--board 는 지역변수-->
						<tr>
							<td class="txt_center">${acceptListAllCnt-(loopTagStatus.index)}</td>
							<td class="txt_center">${accept.driver_name}</td>
							<td class="txt_center">${accept.driver_id}</td>
							<td class="txt_center">${accept.driver_license_number}</td>
							<td class="txt_center">${accept.driver_phone}</td>
							<td class="txt_center"><a href="javascript:acceptDriver(${accept.driver_no});" class="btn middle white radius-5">승인</a></td>
							<td class="txt_center"><a href="javascript:refuseDriver(${accept.driver_no});" class="btn middle white radius-5">거절</a></td>
							
						
							
						</tr>
						</c:forEach>

							


						

						</tbody>
					</table>
					<center>
					${requestScope.acceptListAllCnt==0?'검색된 승인리스트가 없습니다.':''}
					</center>
					<div class="btn_box">
					
					</div>
				</div>
			</div>
		</div>
		<!--container end-->





		<!--foot-->
		<!--foot end-->
	</div>
	
		<form name="acceptDriverForm">
			<input type="hidden" name="driver_no" value="">
		</form>
	
</body>
</html>