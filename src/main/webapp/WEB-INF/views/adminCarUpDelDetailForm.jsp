<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>

<html>


	<head>

   
    <script>            
        $(document).ready(function() {
        	alert(1);
        	createDriverList();
        	inputData("car_year", "${carDTO.car_year}" );
        	inputData("car_code", "${carDTO.car_code}" );
        	
			
        	
        });  // $(document).ready(function() {
    
    	function createDriverList(){
        	alert(1);
    		var driverList = [];
        	$.ajax({
    			url:"/support/driverList.do"
    			,type:"post"
    			,datatype: "application/json"
    			,success : function(data){
    				var datalen = data.length;
    				
    				for(var i=0; i<datalen; i++){
    					driverList[i] = data[i].driver_name;
    					var option = $("<option value="+data[i].driver_no+">"+driverList[i]+"</option>");
    					$('[name=car_driver]').append(option);
    				}
    				var car_driver_check = "${carDTO.driver_no}"
    				if(car_driver_check>0){
    					var driver = $("<option value="+"${carDTO.driver_no}"+">"+"${carDTO.car_driver}"+"</option>");
						$('[name=car_driver]').append(driver);
    			
    					inputData("car_driver", "${carDTO.driver_no}" );
    				}
    			}
    			,error:function(){
    				alert("서버 접속 실패!");			
    			}
    		});
    	}

        
        function goCarUpdateProc(){
        	var car_number = $("[name=car_number]").val();
        	if(car_number_check(car_number)==false){
        		alert("차량 번호 형식이 맞지 않습니다.");
        		$("[name=car_number]").focus();
        		return;
        	}
        	var car_year = $("[name=car_year]").val();
    		if(is_empty2(car_year)==false){
    			alert("차량 연식을 선택해주세요.");
    			$("[name=car_year]").focus();
    			return;
    		}
    		var car_distance =  $("[name=car_distance]").val();
    		if(car_distance_check(car_distance)==false){
    			alert("잘못된 주행거리입니다.");
    			$("[name=car_distance]").focus();
    			return;
    		}
        	if (confirm("수정하시겠습니까?") == false) {
      			return;
      		}
    		$.ajax({
    			url:"/support/carUpdateProc.do",
    			type:"post",
    			data: $("[name=carUpDelProcForm]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data>0){
    					alert("차량수정 성공!");
    					document.adminCarUpDelForm.submit();
    					//location.replace("/support/adminCarUpDelForm.do");
    				}
    				else if(data==-2){
    					alert("차량번호 중복");
    					return;
        			}
    				else{
    					alert("차량수정 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
        
        function goCarDeleteProc(){
        	if (confirm("삭제하시겠습니까?") == false) {
      			return;
      		}
    		$.ajax({
    			url:"/support/carDeleteProc.do",
    			type:"post",
    			data: $("[name=carUpDelProcForm]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data==1){
    					alert("차량삭제 성공!");
    					document.adminCarUpDelForm.submit();
    					//location.replace("/support/adminCarUpDelForm.do");
    				}
    				else{
    					alert("차량삭제 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
        
        function goUpDelForm(){
       
        	document.adminCarUpDelForm.submit();
        	//location.replace("/support/adminCarUpDelForm.do");
        }
    </script>
    </head>
    
    
    
    <body><center>
    	
         <br>
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
						<h2 class="h2tit bg_service">차량 수정/삭제</h2>
					</div>
					
         <br>
         <form name = "carUpDelProcForm" method="POST" onsubmit="return false;" >
         
            <table class="tbl tbl_form">
             <colgroup>
				<col style="width: 20%;" />
				<col style="width: 60%;" />
			</colgroup>
                <tr>
                    <th scope="row">차량번호
                    <td><input type="text" name="car_number" placeholder="차량번호" style="width: 300px;" value="${carDTO.car_number}"> 
                </tr>
                <tr>
                    <th scope="row">차량연식
                    <td> 
                        <select name="car_year" style="width:150px;" >
                            <option value="">연식선택
                            <script>
                                for(var i = 2010; i <= new Date().getFullYear(); i++) {
                                    document.write("<option value=" + i + ">" + i);
                                }
                            </script>
                        </select>년식
                </tr>
                <tr>
                    <th scope="row">주행거리
                    <td><input type="text" name="car_distance"  placeholder="주행거리(KM)" style="width: 300px;" value="${carDTO.car_distance}"> 
                </tr>
                <tr>
                    <th scope="row">차량종류
                    <td><label class="radio-container" for="car_code1"> 
                    		<input type="radio" name="car_code" checked="checked" id="car_code1" style="vertical-align:middle;" value="1"> 슬로프 <span class="checkmark"></span>
                    	</label> <br><br>
                    	<label class="radio-container" for="car_code2"> 
                        	<input type="radio" name="car_code" id="car_code2" style="vertical-align:middle;"  value="2">리프트 <span class="checkmark"></span>
                        </label> 
                </tr>
                <tr>
                    <th scope="row">운전자
                    <td>
                        <select name="car_driver" class="car_driver" style="width:150px;">
                            <option value="0">운전자미지정
                            
                        </select>
                </tr>
	
            </table><br>
	
			<input type="hidden" name="car_info_no" value="${carDTO.car_info_no}">
			
            <a href="javascript:goCarUpdateProc()" class="btn middle white radius-5">수정</a>
            <a href="javascript:goCarDeleteProc();" class="btn middle white radius-5">삭제</a>
            <a href="javascript:goUpDelForm();" class="btn middle white radius-5">취소</a> 
        </form>	     
       
    </center></body>
        
         <form name="adminCarUpDelForm" method="post" action="adminCarUpDelForm.do">
         </form>
        
        <!-- ==================================업데이트==================================
        <form action="adminCarUpdate.do">
        	<input type="hidden" name="car_info_no"> 
        </form>
         -->
        <!-- ==================================삭    제================================== 
         <form action="adminCarDelete.do">
        	<input type="hidden" name="car_info_no"> 
        </form>
        -->
   
</html>

