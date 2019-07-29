<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>



<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>

<script>
        $(document).ready(function() {
        	
        	inputData("car_number", "${carDTO.car_number}" );
        	inputData("car_distance", "${carDTO.car_distance}" );
        });  // $(document).ready(function() {        
        </script>


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


<script>
        function goCarMaintanceRegProc(){   
        	if(is_empty("car_maintance_date")){
        		alert("날짜를 선택해주세요.");
        		return;
        	}
        	if(is_empty("car_maintance_code")){
        		alert("정비내용을 선택해주세요.");
        		return;
        	}
        	if(is_empty("car_distance")){
        		alert("주행거리를 입력해주세요.");
        		return;
        	}
        
       		$.ajax({
       			url:"/support/carMaintanceRegProc.do",
       			type:"post",
       			data: $("[name=carMaintanceRegProc]").serialize(),
       			datatype:"html",
       			
       			success:function(data){
       				if(data==1){
       					alert("차량 정비 내용 등록 성공!");
       					document.carListInfoFormMain.submit();
       				}
       				else{
       					alert("차량 정비 내용 등록 실패!");
       				}
       			},
       			error : function(){
       				alert("서버 접속 실패!");
       			}
       			
       		});        
        }
        function checkDate(){
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
        	var regDate = $("[name=car_maintance_date]").val();
        	if(regDate>sysdate){
        		alert("미래 날짜를 선택할 수 없습니다.");
        		$("[name=car_maintance_date]").val("");
        	}
        
        }
        
        function goAdminMainPage(){
        	document.carListInfoFormMain.submit();
        }
        </script>
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



		<form  method="post" name="carMaintanceRegProc" onsubmit="return false;" >
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<span class="h2tit bg_service">차량정비등록</span>
					</div>
					<table class="tbl tbl_form">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>	
	
						<tbody>
							<tr>
								<th scope="row">차량번호</th>
								<td><input type="text" 	size="40" maxlength="50" name="car_number" readonly></td>
							</tr>
						
							<tr>
								<th scope="row">정비일시</th>
								<td colspan="3"><input type="text" id="datepicker" onchange="checkDate();" placeholder="날짜선택▼" name="car_maintance_date"></td>
							</tr>
							<tr>
								<th scope="row">정비내용</th>
								<td>
									<select name="car_maintance_code">
										<option value="">정비내역선택
											<option value="1">정기점검</option>
											<option value="2">엔진오일교체</option>
											<option value="3">타이어교체</option>
											<option value="4">연료휠터교환</option>
											<option value="5">부동액충전</option>
											<option value="6">하부점검</option>
											<option value="7">범퍼교체</option>
											<option value="8">기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">주행거리</th>
								<td><input type="text" name="car_distance" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placehoder="KM"></td>
							</tr>
							<tr>
								<th scope="row">세부내용</th>
								<td><textarea name="car_maintance_content" cols="50" rows="7"></textarea></td>
							</tr>
						</tbody>
					</table>
					<div class="btn_box">
					
							<a href="javascript:goCarMaintanceRegProc();" class="btn middle white radius-5">등록</a>
							<a href="javascript:goAdminMainPage();" class="btn middle white radius-5">취소</a>
					</div>
				</div>
			</div>
			
			  
			
			</form>
		</div>
		<!--container end-->

		<!--foot-->
		<!--foot end-->
	</div>

	<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 저장한 hidden 태그 출력하고 [게시판 목록]  화면으로 이동하는 form태그 선언-->
	<form name="discontentListForm" method="post" action="/support/discontentListForm.do"></form>


	
</body>
</html>
