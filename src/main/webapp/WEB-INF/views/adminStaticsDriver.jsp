<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>
<html>
<head>
<style>
 -ms-overflow-style: none; 
  ::-webkit-scrollbar { 
    display: none !important;
  }
.table>thead>tr>th {
	font-size: 14px;
	font-weight: 700;
	padding-bottom: 0;
	text-transform: uppercase;
	border: 0;
	color: #51cbce !important;
}

.table-responsive {
  overflow: scroll;
  padding-bottom: 10px;
  height:300px;
  scroll-behavior: smooth;
}



</style>
<title>KOSMO 교통약자 이동지원센터</title>

<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
<!--     Fonts and icons     -->
<!--   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"> -->
<!-- CSS Files -->
<link href="resources/cssDashboard/css/bootstrap.min.css" rel="stylesheet" />
<link href="resources/cssDashboard/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />



<!--   Core JS Files   -->
<script src="resources/cssDashboard/js/core/jquery.min.js"></script>
<script src="resources/cssDashboard/js/core/popper.min.js"></script>
<script src="resources/cssDashboard/js/core/bootstrap.min.js"></script>
<script
	src="resources/cssDashboard/js/plugins/perfect-scrollbar.jquery.min.js"></script>

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
    

<script>
	var currentYear;
	var driveList = [];
	var myLineChart;
    $(document).ready(function() {
    	
    	driverTotalCount();
    	driveCount();
    	
    	currentYear = new Date().getFullYear();
    	document.driverStatus.driveYear.value = currentYear; 
    	driveHistoryStatus();
    	
    	document.driverStatus.driverYear.value = currentYear; 
    	driverGenderCount();
    	   	
    	document.driverStatus.reserveYear.value = currentYear; 
    	driverReserveStatics();

    	statusDriverList();
    	
    	var clickObj = $(".table .thead:eq(0) tr")
    	$(".table thead:eq(0) tr:eq(0) th").click(function () {
        	
            // 클릭한 th 태그를 관리하는 jQuery 객체 메위주를 얻어 변수에 저장
            var thisThObj = $(this);
            // 내림차순 오름차순 여부를 저장할 변수선언
            var ascDesc = "";
            //------------------------------------------
            // 클린한 th 형제의 th 태그 안의 문자열에 ▲ ▼ 제거
            //------------------------------------------
            thisThObj.siblings().each(function(){
                // i 번째 형제 th 태그 안에 문자열을 얻자
                var str = $(this).text();
                // 앞뒤 공백 제거하기
                str = $.trim(str);
                // ▲ 제거하기
                str = str.split("▲").join("");
                // ▼ 제거하기
                str = str.split("▼").join("");
                $(this).html(str);
            })
            //------------------------------------------
            // 클릭한 th안의 문자열 뒤에 ▲ 또는 ▼ 붙이기
            //------------------------------------------
            
            // 클릭한 th 안의 문자열을 얻어 변수 str 저장
            var str = thisThObj.text();
            console.log(str)
            // text 변수안의 문자열에 ▼ 있으면 ▼ 을 ▲ 로 수정하고 오름차순 의미 저장
            if( str.indexOf("▼") >= 0 ){
                str = str.replace("▼","▲");
                ascDesc = "asc"
            }
            // text 변수안의 문자열에 ▲ 있으면 ▲ 을 ▼ 로 수정하고 오름차순 의미 저장
            else if( str.indexOf("▲") >= 0 ){
                str = str.replace("▲","▼");
                ascDesc = "desc";
            }
            else{
                str = str + "▲";
                ascDesc = "asc"
            }
            thisThObj.text(str);
            // ▲ 제거하기
            str = str.split("▲").join("");
            // ▼ 제거하기
            str = str.split("▼").join("");
            document.driverStatus.selectName.value = str;
            document.driverStatus.ascDsc.value = ascDesc;
            
            statusDriverList();
            
        }); 
		
         
		
    }); //$(document).ready(function() {
    	
    
    function driverTotalCount(){
      	$.ajax({
   			url:"/support/driverTotalCount.do"
   			,type:"post"
   			,data : $("[name=driverStatus]").serialize()
   			,datatype: "application/json"
   			,success : function(data){
   				
   				console.log(data);
   				var datalen = data.length;
				if(datalen==0){
					document.driverStatus.driverTot.value = "0";
					document.driverStatus.driverMale.value = "0";
					document.driverStatus.driverFeMale.value = "0";
					console.log("데이터없음");
					return;
  				} 
				else{
	   			  	document.driverStatus.driverTot.value=data[0].driverTots;
		   			document.driverStatus.driverMale.value=data[0].driverMales;
		   			document.driverStatus.driverFeMale.value=data[0].driverFeMales;	
	   			 	return;
				}
   				//alert(datalen);
   				
   			}
   			,error:function(){
   				alert("서버 접속 실패!");			
   			}
   		}); 
    }
    
    function driveCount(){
      	$.ajax({
   			url:"/support/driveCount.do"
   			,type:"post"
   			,data : $("[name=driverStatus]").serialize()
   			//,datatype: "application/json"
   			,success : function(data){
   			  	document.driverStatus.DriveCount.value=data+" 회";
   			 	return;
   				//alert(datalen);
   			}
   			,error:function(){
   				alert("서버 접속 실패!");			
   			}
   		}); 
    }
    
    function driveHistoryStatus(year){
    	// 차량리스트 가져오기

    	$.ajax({
			url:"/support/driveHistoryStatus.do"
			,type:"post"
			,data : $("[name=driverStatus]").serialize()
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	for(var i=0; i<datalen; i++){
		    		labels.push(resultList[i].MONTH);
		    		if(resultList[i].monthVal>0){
		    			data.push(resultList[i].monthVal);
		    		}
		    		else{
		    			
		    			resultList[i].monthVal=null;
		    			data.push(resultList[i].monthVal);
		    		}
		    		
    			}
		    		
		    	var ctx = document.getElementById("chartMonths").getContext('2d');
		    	
	    		myLineChart = new Chart(ctx, {
	    		    type: 'bar',
	    		    data: {
	    		        labels: labels,
	    		        datasets: [{
	    		            label: "월별 차량 정비 횟수",
	    		            data: data,
	    		            backgroundColor: 'rgba(54, 162, 235, 0.2)',
	    		            borderColor: 'rgba(54, 162, 235, 1)',
	    		            borderWidth: 1
	    		        }]
	    		    },
	    		    options: {
	    		    	events: ['null'],
	    		        scales: { yAxes: [{ ticks: { beginAtZero:true } }] }   // 데이터값 시작을 0부터시작
	    		    }
	    		});  
	    		myLineChart.clear();
	    		myLineChart.render({
	    		    duration: 800,
	    		    lazy: false,
	    		    easing: 'easeOutBounce'
	    		});
		    }
			,error:function(){
				alert("서버 접속 실패!");			
			}
		});
    } //function repairStatus(year){
    
    	
    
    // 자동차 타입별 개수
    function driverGenderCount(year){
		//alert(3)
    	$.ajax({
			url:"/support/driverGenderCount.do"
			,type:"post"
			,data : $("[name=driverStatus]").serialize()
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
		    	var ctx = document.getElementById("chartGenderType").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'pie',
	    		    data: {
	    		        labels: labels,
	    		        datasets: 
	    		        [{
	    		            label: "드라이버 성별 비율",
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
    } //function carTypeStatus(year){
    	
    	
    function driverReserveStatics(){
    	
    	$.ajax({
			url:"/support/driverReserveStatics.do"
			,type:"post"
			,data : $("[name=driverStatus]").serialize()
			
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
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
	    		            backgroundColor: ["rgba(81,188,218,0.2)",
	            				 'rgba(251, 198, 88, 0.2)',
	            				 'rgba(107, 208, 152, 0.2)'
	            				 ],
	           				borderColor: ["rgba(81,188,218,1)",
	            				'rgba(251, 198, 88, 1)',
	            				'rgba(107, 208, 152, 1)'
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
    // 운전자 정보 가져오기
    function statusDriverList(){
    	
    	$.ajax({
   			url:"/support/statusDriverList.do"
   			,type:"post"
   			,data : $("[name=driverStatus]").serialize()
   			,datatype: "application/json"
   			,success : function(data){
   				
   				var datalen = data.length;
   				//테이블 td 초기화
   				$(".table tbody:eq(0)").children().empty();

   				//테이블 td 데이터 삽입
   				
                for(var j=0; j<data.length; j++){
                	$(".table tbody:eq(0)").append("<tr>");                
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].driver_name+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].driver_gender+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].driver_phone+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].driver_reg_date+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].driver_point+"</td>" );
                    $(".table tbody:eq(0)").append("</tr>");
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
			</div>
			<form name="driverStatus" method="post" action="getDriverInfoList.do">
			<div class="wrapper ">
				<div class="content">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-body ">
									<div class="row">
										<div class="col-5 col-md-4">
											<div class="icon-big text-center icon-warning">
												<!-- <i class="nc-icon nc-globe text-warning"></i> -->
												<img src="resources/cssDashboard/img/driver_total.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Total Drivers</p>
												<p class="card-title"><input type="text" name="driverTot" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly>
												<p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-refresh" style="cursor:pointer" onclick="driverTotalCount();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
										<br>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-body ">
									<div class="row">
										<div class="col-5 col-md-4">
											<div class="icon-big text-center icon-warning">
												<!-- <i class="nc-icon nc-money-coins text-success"></i> -->
												<img src="resources/cssDashboard/img/driver_male.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Male</p>
												<p class="card-title"> <input type="text" name="driverMale" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly> 
												<p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-calendar-o"></i> Today
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-body ">
									<div class="row">
										<div class="col-5 col-md-4">
											<div class="icon-big text-center icon-warning">
											<!-- 	<i class="nc-icon nc-vector text-danger"></i> -->
												<img src="resources/cssDashboard/img/driver_female.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Female</p>
												<p class="card-title"><input type="text" name="driverFeMale" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly>
												<p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-calendar-o"></i> Today
										<!-- <i class="fa fa-clock-o"></i> In the last hour -->
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 col-sm-6">
							<div class="card card-stats">
								<div class="card-body ">
									<div class="row">
										<div class="col-5 col-md-4">
											<div class="icon-big text-center icon-warning">
												<!-- <i class="nc-icon nc-favourite-28 text-primary"></i> -->
												<img src="resources/cssDashboard/img/drive_count.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">DriveCount</p>
												<p class="card-title" ><input type="text" name="DriveCount" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly>
												<p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-refresh" style="cursor:pointer" onclick="DriveCount();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
										<br>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">
						<div class="card ">
							<div class="card-header ">
								<h5 class="card-title">Drive History
								
								<span style="float:right" >
									<select name="driveYear" onchange="driveHistoryStatus();">
						                     <script>
						                         for (var i = 2018; i <= new Date().getFullYear(); i++) {
						                             document.write("<option value=" + i + ">" + i);
						                         }
						                     </script>
									</select>
								</span>
								</h5>

								<p class="card-category">12 Months performance

								</p>
							</div>
							<div class="card-body ">
								<canvas id=chartMonths width="400" height="100"></canvas>
							</div>
							<div class="card-footer ">
								<hr>
								<div class="stats">
									<i class="fa fa-history" style="cursor:pointer" onclick="driveHistoryStatus();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="card ">
							<div class="card-header ">
								<h5 class="card-title">Driver Gender Statistics
								<span style="float:right" >
									<select name="driverYear" onchange="driverGenderCount();">
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
								<canvas id="chartGenderType"></canvas>
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
					<div class="col-md-8">
						<div class="card card-chart">
							<div class="card-header">
								<h5 class="card-title">Reservation Statics: YEAR
								<span style="float:right" >
									<select name="reserveYear" onchange="driverReserveStatics();">
						                     <script>
						                         for (var i = 2018; i <= new Date().getFullYear(); i++) {
						                             document.write("<option value=" + i + ">" + i);
						                         }
						                     </script>
									</select>
								</span>
								</h5>
								<p class="card-category">horizontalBar</p>
							</div>
							<div class="card-body">
								<canvas id="chartReserveCode" width="400" height="100"></canvas>
							</div>
							<div class="card-footer">
								<div class="chart-legend">
									<i class="fa fa-circle text-info"></i> 예약신청
									<i class="fa fa-circle text-warning"></i> 예약거절
									<i class="fa fa-circle text-success"></i> 주행완료
									<!-- <i class="fa fa-circle text-outline"></i> 주행완료 -->
								</div>
								<hr />
								<!-- <div class="card-stats">
									<i class="fa fa-check"></i> Data information certified
								</div> -->
							</div>
						</div>
					</div>
				</div>

				<div class="row">

					<div class="col-md-12">
						<div class="card card-plain">
							<div class="card-header">
								<h4 class="card-title">Drivers Imformation</h4>
								<p class="card-category">Drivers Imformation Of Admin Table </p>
							</div>
							<div class="card-body">
								<div class="table-responsive" >
									<table class="table" boarder="1" style="height:200px;" >

										<colgroup>
											<col style="width: 20%;" />
											<col style="width: 20%;" />
											<col style="width: 20%;" />
											<col style="width: 20%;" />
											<col style="width: 20%;" />
										</colgroup>

										<thead class="text-primary">
											<tr>
												<th class='txt_center'scope="col" style="cursor:pointer">name</th>
												<th class='txt_center' scope="col" style="cursor:pointer;">gender</th >
												<th class='txt_center' scope="col" style="cursor:pointer;">phone</th >
												<th class='txt_center' scope="col" style="cursor:pointer">register year</th>
												<th class='txt_center' scope="col" style="cursor:pointer">point</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td class="text-right"></td>
											</tr>
										</tbody>
									</table>
									
								</div>
							</div>
							<input type="hidden" name="selectName" value="">
							<input type="hidden" name="ascDsc" value="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 랩퍼 -->
		</form>
	</div>
	</div>
	<!-- 콘테이너 -->
	

</body>
</html>