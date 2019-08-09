<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>
<html>

<head>
<title>KOSMO 교통약자 이동지원센터</title>

<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<script type="text/javascript" src="https://www.gurihappycall.or.kr/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="https://www.gurihappycall.or.kr/js/jquery.bxslider.min.js"></script>
<link type="text/css" rel="stylesheet" href="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.css" />
<script type="text/javascript" src="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.js"></script>
<script type="text/javascript" src="https://www.gurihappycall.or.kr/js/design.js"></script>

<!--   Core JS Files   -->
<script src="resources/cssDashboard/js/core/jquery.min.js"></script>
<script src="resources/cssDashboard/js/core/popper.min.js"></script>
<script src="resources/cssDashboard/js/core/bootstrap.min.js"></script>
<script src="resources/cssDashboard/js/plugins/perfect-scrollbar.jquery.min.js"></script>

<!-- CSS Files -->
<link href="resources/cssDashboard/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/cssDashboard/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />


<!-- Chart JS -->
<script src="resources/cssDashboard/js/plugins/chartjs.min.js"></script>
<!--  Notifications Plugin    -->
<script src="resources/cssDashboard/js/plugins/bootstrap-notify.js"></script>
<!--     sTyle    -->
<link href="resources/cssDashboard/style.css" rel="stylesheet">
<!-- Icons font CSS-->
    <link href="/support/resources/vendor2/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="/support/resources/vendor2/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="/support/resources/css/main.css" rel="stylesheet" media="all">
    <link href="/support/resources/css2/main.css" rel="stylesheet" media="all">
    
    
    
	<link rel="icon" type="image/png" href="/support/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    

<style>

::-webkit-scrollbar {
	display:none;
}
.table-responsive {
  /* overflow: scroll; */
  padding-bottom: 10px;
  scroll-behavior: smooth;
  height:150px;
}

body, form, td, th, pre {
    color: black;
    line-height: 100%;
    font-family: 굴림, tahoma, 돋움, verdana;
}

</style>
<script>
	var currentYear;
	var carList = [];
	var myLineChart;
	
    $(document).ready(function() {
    	
    	carRepairInfoList();
    	driverAcceptList();
    	reservationStatus();
    	
    	currentYear = new Date().getFullYear();
    	document.dashBoardStatus.userCarTypeYear.value = currentYear; 
    	userCarTypeStatus();
    	
    	document.dashBoardStatus.regCarTypeYear.value = currentYear; 
    	regCarTypeStatus();
    	   
    	document.dashBoardStatus.userGenderYear.value = currentYear; 
    	userGenderStatus();
  
    	document.dashBoardStatus.driverGenderYear.value = currentYear; 
    	driverGenderStatus();
             

    }); //$(document).ready(function() {
    	
   	function carRepairInfoList(){
   		
   		$.ajax({
   			url:"/support/carRepairInfoList.do"
   			,type:"post"
   			//,data : $("[name=dashBoardStatus]").serialize()
   			,datatype: "application/json"
   			,success : function(data){
   				console.log(data)
   				var datalen = data.length;
   				//테이블 td 초기화
   				$(".tbl_form:eq(0) tbody:eq(0)").children().empty();

   				//테이블 td 데이터 삽입
   				
                for(var j=0; j<data.length; j++){
                	$(".tbl_form:eq(0) tbody:eq(0)").append("<tr>");                
                    $(".tbl_form:eq(0) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].CAR_NUMBER+"</td>" );
                    $(".tbl_form:eq(0) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].MAINTANCE_DISTANCE+"</td>" );
                    $(".tbl_form:eq(0) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].PHONE+"</td>" );
                    $(".tbl_form:eq(0) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].CARTYPE+"</td>" );
                    $(".tbl_form:eq(0) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].DRIVERNAME+"</td>" );
                    $(".tbl_form:eq(0) tbody:eq(0)").append("</tr>");
                }
   			}
   			,error:function(){
   				alert("서버 접속 실패!");			
   			}
   		}); 
   	}
   	
   	function driverAcceptList(){
   		
   		$.ajax({
   			url:"/support/driverAcceptList.do"
   			,type:"post"
   			//,data : $("[name=dashBoardStatus]").serialize()
   			,datatype: "application/json"
   			,success : function(data){
   				
   				var datalen = data.length;
   				//테이블 td 초기화
   				$(".tbl_form:eq(1) tbody:eq(0)").children().empty();

   				//테이블 td 데이터 삽입
   				
                for(var j=0; j<data.length; j++){
                	$(".tbl_form:eq(1) tbody:eq(0)").append("<tr>");                
                    $(".tbl_form:eq(1) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].driver_name+"</td>" );
                    $(".tbl_form:eq(1) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].driver_phone+"</td>" );
                    $(".tbl_form:eq(1) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].driver_gender+"</td>" );
                    $(".tbl_form:eq(1) tbody tr:eq("+j+")").append( "<td style='font-size:15px; height:40px;'>"+data[j].driver_license_number+"</td>" );
                    $(".tbl_form:eq(1) tbody tr:eq("+j+")").append( "<td class=''><a href='javascript:goAcceptDriver("+data[j].driver_no+")' class='btn middle white radius-5' style='height:40px; float:right;' >승인</a></td>" );
                    $(".tbl_form:eq(1) tbody:eq(0)").append("</tr>");
                }
   			}
   			,error:function(){
   				alert("서버 접속 실패!");			
   			}
   		}); 
   	}
   	
   	function reservationStatus(){
    	$.ajax({
			url:"/support/reservationStatus.do"
			,type:"post"
			//,data : $("[name=userStatus]").serialize()
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	
    			/* labels.push("예약신청");
    			data.push(resultList[0].codeCnt + resultList[1].codeCnt); */
		    	//var data1 = new Array();
		    	for(var i=0; i<datalen; i++){
		    		labels.push(resultList[i].codeName);
		    		data.push(resultList[i].codeCnt);		    			
    			}
		    		
		    	var ctx = document.getElementById("chartReserveCode").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'horizontalBar',
	    		    data: {
	    		        labels: labels,
	    		        datasets: [{
	    		            label: "코드별 예약",
	    		            data: data,
	    		            backgroundColor: ["rgba(151,187,205,0.2)",
	    		            				 'rgba(75, 192, 192, 0.2)',
	    		            				 'rgba(255, 99, 132, 0.2)'
	    		            				 ],
	    		            borderColor: ["rgba(151,187,205,1)",
	    		            				'rgba(75, 192, 192, 1)',
	    		            				'rgba(255, 99, 132, 1)'
	    		            			],
	    		            //pointColor: "rgba(151,187,205,1)",
	    		            borderWidth: 1
	    		        }]
	    		    },
	    		    options: {
	    		    	events: ['null'],
	    		        scales: { xAxes: [{ ticks: { beginAtZero:true } }] }   // 데이터값 시작을 0부터시작
	    		    }
	    		});      
		    }
			,error:function(){
				alert("서버 접속 실패!");			
			}
		}); 
   	}
   	
   	function userCarTypeStatus(){
   		$.ajax({
			url:"/support/userCarTypeStatus.do"
			,type:"post"
			,data : $("[name=dashBoardStatus]").serialize()
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
				
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	for(var i=0; i<datalen; i++){
		    		labels.push(resultList[i].carType);
		    		data.push(resultList[i].carCnt);
    			}		
		    	var ctx = document.getElementById("chartUserCarType").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'pie',
	    		    data: {
	    		        labels: labels,
	    		        datasets: 
	    		        [{
	    		            label: "유저 차량 비율",
	    		            data: data,
	    		            backgroundColor: [
	    		            	'rgba(54, 162, 235, 0.2)',
	    		            	'rgba(255, 99, 132, 0.2)'
	    		            ],
	    		            borderColor: [
	    		            	'rgba(54, 162, 235, 1)',
	    		            	'rgba(255, 99, 132, 1)'
	    		            ],
	    		            borderWidth: 1
		    		    }],
		    		},
	    		    options: {
	    		    	responsive: true  
	    		    }
	    		});      
		    }
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
   	}
   	
   	function regCarTypeStatus(){
   		$.ajax({
			url:"/support/regCarTypeStatus.do"
			,type:"post"
			,data : $("[name=dashBoardStatus]").serialize()
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
				
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	for(var i=0; i<datalen; i++){
		    		labels.push(resultList[i].carType);
		    		data.push(resultList[i].carCnt);
    			}		
		    	var ctx = document.getElementById("chartRegCarType").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'pie',
	    		    data: {
	    		        labels: labels,
	    		        datasets: 
	    		        [{
	    		            label: "유저 차량 비율",
	    		            data: data,
	    		            backgroundColor: [
	    		            	'rgba(54, 162, 235, 0.2)',
	    		            	'rgba(255, 99, 132, 0.2)'
	    		            ],
	    		            borderColor: [
	    		            	'rgba(54, 162, 235, 1)',
	    		            	'rgba(255, 99, 132, 1)'
	    		            ],
	    		            borderWidth: 1
		    		    }],
		    		},
	    		    options: {
	    		    	responsive: true  
	    		    }
	    		});      
		    }
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
   	}
   	
	function userGenderStatus(){
   		$.ajax({
			url:"/support/userGenderStatus.do"
			,type:"post"
			,data : $("[name=dashBoardStatus]").serialize()
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
				
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	for(var i=0; i<datalen; i++){
		    		labels.push(resultList[i].gender);
		    		data.push(resultList[i].userGenderCnt);
    			}		
		    	var ctx = document.getElementById("chartUserGender").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'pie',
	    		    data: {
	    		        labels: labels,
	    		        datasets: 
	    		        [{
	    		            label: "유저 차량 비율",
	    		            data: data,
	    		            backgroundColor: [
	    		            	'rgba(54, 162, 235, 0.2)',
	    		            	'rgba(255, 99, 132, 0.2)'
	    		            ],
	    		            borderColor: [
	    		            	'rgba(54, 162, 235, 1)',
	    		            	'rgba(255, 99, 132, 1)'
	    		            ],
	    		            borderWidth: 1
		    		    }],
		    		},
	    		    options: {
	    		    	responsive: true  
	    		    }
	    		});      
		    }
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
   	}
	
	function driverGenderStatus(){
   		$.ajax({
			url:"/support/driverGenderStatus.do"
			,type:"post"
			,data : $("[name=dashBoardStatus]").serialize()
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
				
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	for(var i=0; i<datalen; i++){
		    		labels.push(resultList[i].gender);
		    		data.push(resultList[i].driverGenderCnt);
    			}		
		    	var ctx = document.getElementById("chartDriverGender").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'pie',
	    		    data: {
	    		        labels: labels,
	    		        datasets: 
	    		        [{
	    		            label: "유저 차량 비율",
	    		            data: data,
	    		            backgroundColor: [
	    		            	'rgba(54, 162, 235, 0.2)',
	    		            	'rgba(255, 99, 132, 0.2)'
	    		            ],
	    		            borderColor: [
	    		            	'rgba(54, 162, 235, 1)',
	    		            	'rgba(255, 99, 132, 1)'
	    		            ],
	    		            borderWidth: 1
		    		    }],
		    		},
	    		    options: {
	    		    	responsive: true  
	    		    }
	    		});      
		    }
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
   	}
	
	function goDashCarListForm(){
		document.carListInfoFormMain.submit();
	}
	
	function goDashDriverAcceptForm(){
		document.driverAcceptForm.submit();
	}
	
	function goAcceptDriver(driver_no){
		document.acceptDriver.driver_no.value = driver_no;
	
		$.ajax({
			url:"/support/acceptDriver.do"
			,type:"post"
			,data : $("[name=acceptDriver]").serialize()
			,datatype: "application/json"
			,success : function(data){
				if(data=1){
					alert("등록 성공");
					driverAcceptList();
					return;
				}
				else{
					alert("등록 실패")
					return;
				}
				
			}
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
		
		
	
	}
    
</script>

</head>
<body>
	<br>

	<!--container-->
	<div id="container">

		<div class="main_cont container">
			<div class="top_box">


				<div class="banner_box">
					<center>
						<div class="img">
							<img src="/support/resources/imagesUserMain1/banner2.png"
								alt="banner" />
						</div>
					</center>
				</div>
				<br>
			
		<!-- wrapper -->
		<!-- <div class="wrapper "> -->
			<div class="content">
					

			
			<div class="row" >
			
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<div class="item2 l2 radius-5 m-l-15 m-t-10 ">
										<p class="m-notice">
											<span class="notice-tit">정기점검 차정보</span> 
											<a href="javascript:goDashCarListForm();"><span class="notice-view">+더보기</span></a>
										
										</p>
									</div>
								</div>
								<div class="card-body ">
									<div class="table-responsive"  style="-ms-overflow-style: none;">
									<table class="tbl tbl_form">	
										<colgroup>
					                        <col style="width:25%;"/>
					                        <col style="width:28%;"/>
					                        <col style="width:25%;"/>
					                        <col style="width:12%;"/>
					                        <col style="width:10%;"/>
					                    </colgroup>

										<thead>
											<tr>
												<th scope="col"> 
												<th scope="col"> 
												<th scope="col"> 
												<th scope="col"> 
												<th scope="col"> 
											</tr>
										</thead>
										<tbody>
											<tr>
												<!-- <td style="font-size:15px; height:40px;">&nbsp;&nbsp;80바2022</td>
												<td style="font-size:15px; height:40px;">&nbsp;&nbsp;차량정비필요</td>
												<td style="font-size:15px; height:40px;">&nbsp;&nbsp;01088888888</td>
												<td style="font-size:15px; height:40px;">&nbsp;&nbsp;슬로프</td>
												<td style="font-size:15px; height:40px;">&nbsp;&nbsp;홍길동</td> -->
											</tr>
										</tbody>
									</table>
								</div>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-history" style="cursor:pointer" onclick="carRepairInfoList();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
										
									</div>
									<hr>
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<div class="item2 l2 radius-5 m-l-15 m-t-10 ">
										<p class="m-notice">
											<span class="notice-tit">운전자 승인</span> 
											<a href="javascript:goDashDriverAcceptForm();"><span class="notice-view">+더보기</span></a>
										
										</p>
									</div>
								</div>
								<div class="card-body ">
									<div class="table-responsive"  style="-ms-overflow-style: none;">
									<table class="tbl tbl_form">	
										<colgroup>
					                        <col style="width:20%;"/>
					                        <col style="width:25%;"/>
					                        <col style="width:8%;"/>
					                        <col style="width:28%;"/>
					                        <col style="width:20%;"/>
					                    </colgroup>

										<thead>
											<tr>
												<th scope="col"> 
												<th scope="col"> 
												<th scope="col"> 
												<th scope="col"> 
												<th scope="col"> 
											</tr>
										</thead>
										<tbody>
											<tr>
											<%-- <c:forEach items="${acceptList}" var="accept" varStatus="loopTagStatus">
												<tr style="cursor: pointer">
													<td>${accept.driver_name}
													<td>${accept.driver_id}
													<td>${accept.driver_license_number}
													<td>${accept.driver_phone}
													<td><input type="button" value="승인" onclick="acceptDriver(${accept.driver_no})">
											</c:forEach> --%>
												<!-- <td style="font-size:15px">&nbsp;&nbsp;홍길동</td>
												<td style="font-size:15px">&nbsp;&nbsp;0103537060</td>
												<td style="font-size:15px">&nbsp;&nbsp;남</td>
												<td style="font-size:15px">&nbsp;&nbsp;xx-xx-xxxxxx-xx</td>
												<td class=""><a href="javascript:goAcceptDriver()" class="btn middle white radius-5" style="height:40px; float:right;" >승인</a></td> -->
											</tr>
										</tbody>
									</table>
								</div>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-history" style="cursor:pointer" onclick="driverAcceptList();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
										
									</div>
									<hr>
								</div>
							</div>
						</div>
					</div> <!-- row -->	
					
					
					<div class="row"> 
					<div class="col-md-12">
						<div class="card  " >
							<div class="card-header ">
								<h5 class="card-title">Reservation Statics </h5>

								<p class="card-category">bar chart

								</p>
							</div>
							<div class="card-body ">
								<canvas id=chartReserveCode width="400" height="100"></canvas>
							</div>
							<div class="card-footer ">
								<hr>
								<div class="stats">
									<i class="fa fa-history" style="cursor:pointer" onclick="reservationStatus();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
								</div>
							</div>
						</div>
					</div>

				</div> <!-- row -->
				<form name="dashBoardStatus" method="post" action="getBoardInfoList.do">
				<div class="row"> 
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<h5 class="card-title">Uses Cars Statistics
									<span style="float:right" >
										<select name="userCarTypeYear" onchange="userCarTypeStatus();">
							                     <script>
							                         for (var i = 2018; i <= new Date().getFullYear(); i++) {
							                             document.write("<option value=" + i + ">" + i);
							                         }
							                     </script>
										</select>
									</span>
									
									</h5>
									<p class="card-category">Year Performance</p>
								</div>
								<div class="card-body ">
									<canvas id="chartUserCarType"></canvas>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-circle text-primary"></i> SLOPE 
										<i class="fa fa-circle text-danger"></i> LIFT
										<i class="fa fa-calendar" style="float:right;">Year</i> 
									</div>
									<hr>
							   <!-- <div class="stats">
										<i class="fa fa-calendar"></i> Today
									</div> -->
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<h5 class="card-title">Register Cars Statistics
									<span style="float:right" >
										<select name="regCarTypeYear" onchange="regCarTypeStatus();">
							                     <script>
							                         for (var i = 2018; i <= new Date().getFullYear(); i++) {
							                             document.write("<option value=" + i + ">" + i);
							                         }
							                     </script>
										</select>
									</span>
									
									</h5>
									<p class="card-category">Year Performance</p>
								</div>
								<div class="card-body ">
									<canvas id="chartRegCarType"></canvas>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-circle text-primary"></i> SLOPE 
										<i class="fa fa-circle text-danger"></i> LIFT
										<i class="fa fa-calendar" style="float:right;">Year</i> 
									</div>
									<hr>
							   <!-- <div class="stats">
										<i class="fa fa-calendar"></i> Today
									</div> -->
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<h5 class="card-title">User Gender Statistics
									<span style="float:right" >
										<select name="userGenderYear" onchange="userGenderStatus();">
							                     <script>
							                         for (var i = 2018; i <= new Date().getFullYear(); i++) {
							                             document.write("<option value=" + i + ">" + i);
							                         }
							                     </script>
										</select>
									</span>
									
									</h5>
									<p class="card-category">Year Performance</p>
								</div>
								<div class="card-body ">
									<canvas id="chartUserGender"></canvas>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-circle text-primary"></i> Male 
										<i class="fa fa-circle text-danger"></i> FeMale
										<i class="fa fa-calendar" style="float:right;">Year</i> 
									</div>
									<hr>
							   <!-- <div class="stats">
										<i class="fa fa-calendar"></i> Today
									</div> -->
								</div>
							</div>
						</div>
						
						<div class="col-md-6">
							<div class="card ">
								<div class="card-header ">
									<h5 class="card-title">Driver Gender Statistics
									<span style="float:right" >
										<select name="driverGenderYear" onchange="driverGenderStatus();">
							                     <script>
							                         for (var i = 2018; i <= new Date().getFullYear(); i++) {
							                             document.write("<option value=" + i + ">" + i);
							                         }
							                     </script>
										</select>
									</span>
									
									</h5>
									<p class="card-category">Year Performance</p>
								</div>
								<div class="card-body ">
									<canvas id="chartDriverGender"></canvas>
								</div>
								<div class="card-footer ">
									<div class="legend">
										<i class="fa fa-circle text-primary"></i> Male 
										<i class="fa fa-circle text-danger"></i> FeMale
										<i class="fa fa-calendar" style="float:right;">Year</i> 
									</div>
									<hr>
							   <!-- <div class="stats">
										<i class="fa fa-calendar"></i> Today
									</div> -->
								</div>
							</div>
						</div>
						
					</div> <!-- row -->
				</form>
				</div>
			</div>
		</div>
	
	</div>	<!-- con -->
	<!-- 차량정보 폼으로 이동 -->
	<!-- <form name="carDashListInfoForm" metho="post" action="carListInfoForm.do">
	</form>
	운전자 승인 폼으로 이동
	<form name="driverDashAcceptForm" metho="post" action="driverAcceptForm.do">
	</form>
	운전자 승인-->
	<form name="acceptDriver" method="post" action="acceptDriver.do">
		<input type="hidden" name="driver_no" value="">
	</form> 
</body>
</html>
