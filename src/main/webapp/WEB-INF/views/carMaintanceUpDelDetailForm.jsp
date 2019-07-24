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
        	inputData("car_distance", "${carMaintanceDTO.car_distance}")
        	inputData("car_number", "${carMaintanceDTO.car_number}" );
        	inputData("car_maintance_date", "${carMaintanceDTO.car_maintance_date}" );
        	inputData("car_maintance_code", "${carMaintanceDTO.car_maintance_code}" );
        	inputData("car_maintance_content", "${carMaintanceDTO.car_maintance_content}" );
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
        // 정비내용 수정
        function goCarMaintanceUpdateProc(){
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
    			url:"/support/carMaintanceUpdateProc.do",
    			type:"post",
    			data: $("[name=carMaintanceUpDelProc]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data>=1){
    					alert("차량 정비내용 수정 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량 정비내용 수정 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
     // 정비내용 삭제
        function goCarMaintanceDeleteProc(){
    		$.ajax({
    			url:"/support/carMaintanceDeleteProc.do",
    			type:"post",
    			data: $("[name=carMaintanceUpDelProc]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data==1){
    					alert("차량 정비내용 삭제 성공!");
    					location.replace("/support/adminMainPage.do");
    				}
    				else{
    					alert("차량 정비내용 삭제 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
     // 취소 버튼(메인페이지 이동)
        function goAdminMainPage(){
        	location.replace("/support/adminMainPage.do");
        }
        </script>
</head>
<body>
<body>
	<div id="wrap">
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



		<form  method="post" name="carMaintanceUpDelProc" >
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<span class="h2tit bg_service">차량 정비 수정/삭제 UI</span>
					</div>
					<table class="tbl tbl_form">
						<colgroup>
							<col style="width: 30%;">
							<col style="width: 70%;">
						</colgroup>	
	
						<tbody>
							<tr>
								<th scope="row">차량번호</th>
								<td><input type="text" name="car_number"></td>
							</tr>
						
							<tr>
								<th scope="row">정비일시</th>
								<td><input type="text" id="datepicker" onchange="checkDate();" placeholder="날짜선택▼" name="car_maintance_date">
								</td>
							</tr>
							<tr>
								<th scope="row">정비내용</th>
								<td><select name="car_maintance_code">
										<option value="">정비내역선택
										<option value="1">엔진오일교체
										<option value="2">타이어교체
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">주행거리</th>
								<td><input type="text" name="car_distance"
										onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
										placehoder="KM">
								</td>
							</tr>
							<tr>
								<th scope="row">세부내용</th>
								<td><textarea name="car_maintance_content" cols="50" rows="7"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="btn_box">
					<input type="hidden" name="car_maintance_info_no" value="${carMaintanceDTO.car_maintance_info_no}"> 
					
						<a href="javascript:goCarMaintanceUpdateProc();" class="btn middle white radius-5">수정</a>
						<a href="javascript:goCarMaintanceDeleteProc();" class="btn middle white radius-5">삭제</a>
						<a href="javascript:goAdminMainPage();" class="btn middle white radius-5">취소</a>
					</div>
				</div>
			</div>
			
			  
			
			</form>
		</div>
	
	</div>

	
	
</body>
</html>