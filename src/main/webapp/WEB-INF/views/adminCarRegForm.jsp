<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>

<html>

	<head>
    <meta charset="UTF-8"> 
   
    <script>            
        $(document).ready(function() {
        	var driverList = [];
        	$.ajax({
				url:"/support/driverList.do"
				,type:"post"
				,datatype: "application/json"
				,success : function(data){
					
					var datalen = data.length;
					alert(datalen);
					for(var i=0; i<datalen; i++){
						driverList[i] = data[i].driver_name;
						var option = $("<option value="+data[i].driver_no+">"+driverList[i]+"</option>");
						$('[name=car_driver]').append(option);
					}
				}
				,error:function(){
					alert("서버 접속 실패!");			
				}
			});
        });  // $(document).ready(function() {
        
        
        function goCarRegProc(){
        	
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
    		
    		if(confirm("차량 등록 하시겠습니까?")==false){ 
     			return; 
    		} 
    		$.ajax({
    			url:"/support/adminCarRegProc.do",
    			type:"post",
    			data: $("[name=carRegForm]").serialize(),
    			datatype:"html",
    			
    			success:function(data){
    				if(data==1){
    					alert("차량등록 성공!");
    					document.adminMainPage.submit();
    					//location.replace("/support/adminMainPage.do");
    				}
    				else if(data==-2){
    					alert("이미 등록되있는 차량입니다.");
    					return;
    				}
    				else{
    					alert("차량등록 실패!");
    				}
    			},
    			error : function(){
    				alert("서버 접속 실패!");
    			}
    			
    		}); 
        }
        
        function goAdminMainPage(){
        	document.adminMainPage.submit();
        	//location.replace("/support/adminMainPage.do");
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
						<h2 class="h2tit bg_service">차량 등록</h2>
					</div>
					
         <br>
         <form name = "carRegForm" method="POST" onsubmit="return false;" >
            <table class="tbl tbl_form">
            <colgroup>
				<col style="width: 20%;" />
				<col style="width: 60%;" />
			</colgroup>
                <tr>
                    <th scope="row">차량번호
                    <td><input type="text" name="car_number" placeholder="차량번호" style="width: 300px;">
                </tr>
                <tr>
                    <th  scope="row">차량연식
                    <td>
                        <select name="car_year" style="width:150px;" >
                            <option value="">연식선택
                            <script>
                                for(var i = 2010; i <= new Date().getFullYear(); i++) {
                                    document.write("<option value=" + i + ">" + i);
                                }
                            </script>
                        </select>
                </tr>
                <tr>
                    <th  scope="row">주행거리
                    <td><input type="text" name="car_distance"  onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"  placeholder="주행거리(KM)" style="width: 300px;" >
                </tr>
                <tr>
                    <th  scope="row">차량종류
                    <td><label class="radio-container" for="car_code1"> 
                    		<input type="radio" name="car_code" checked="checked" id="car_code1" style="vertical-align:middle;" value="1"> 슬로프 <span class="checkmark"></span>
                    	</label> <br><br>
                    	<label class="radio-container" for="car_code2"> 
                        	<input type="radio" name="car_code" id="car_code2" style="vertical-align:middle;"  value="2">리프트 <span class="checkmark"></span>
                        </label> 
                </tr>
                <tr>
                    <th  scope="row">운전자
                    <td>
                        <select name="car_driver"  style="width:150px;" >
                            <option value="0">운전자미등록
                            
                        </select>
                </tr>
      
            </table><br>

            <a href="javascript:goCarRegProc();" class="btn middle white radius-5">등록</a> &nbsp; &nbsp;
            <a href="javascript:goAdminMainPage();" class="btn middle white radius-5">취소</a> 
            
        </form>
        </div>
     </div>
    </center></body>
    
    <form name="adminMainPage" method="post" action="adminMainPage.do">
         </form>
</html>

