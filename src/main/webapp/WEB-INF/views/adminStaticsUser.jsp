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
    	
    	userTotalCount();
    	userReserveCount();
    	
    	currentYear = new Date().getFullYear();
    	document.userStatus.reserveYear.value = currentYear; 
    	userReserveStatus();
    	
    	document.userStatus.userYear.value = currentYear; 
    	userGenderCount();
    	   	
    	document.userStatus.userReserveYear.value = currentYear; 
    	userReserveStatics();

    	statusUserList();
    	
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
            document.userStatus.selectName.value = str;
            document.userStatus.ascDsc.value = ascDesc;
            
            statusUserList();
            
        }); 
		
         
		
    }); //$(document).ready(function() {
    	
    // 유저 전체 수량
    function userTotalCount(){
      	$.ajax({
   			url:"/support/userTotalCount.do"
   			,type:"post"
   			,data : $("[name=userStatus]").serialize()
   			,datatype: "application/json"
   			,success : function(data){
   				
   				console.log(data);
   				var datalen = data.length;
				if(datalen==0){
					document.userStatus.userTot.value = "0";
					document.userStatus.userMale.value = "0";
					document.userStatus.userFeMale.value = "0";
					console.log("데이터없음");
					return;
  				} 
				else{
	   			  	document.userStatus.userTot.value=data[0].userTots;
		   			document.userStatus.userMale.value=data[0].userMales;
		   			document.userStatus.userFeMale.value=data[0].userFeMales;	
	   			 	return;
				}
   				//alert(datalen);
   				
   			}
   			,error:function(){
   				alert("서버 접속 실패!");			
   			}
   		}); 
    }
    // 유저 오늘 기준 예약신청 현황 개수
    function userReserveCount(){
      	$.ajax({
   			url:"/support/userReserveCount.do"
   			,type:"post"
   			,data : $("[name=userStatus]").serialize()
   			//,datatype: "application/json"
   			,success : function(data){
   			  	document.userStatus.reserveCount.value=data+" 명";
   			 	return;
   				//alert(datalen);
   			}
   			,error:function(){
   				alert("서버 접속 실패!");			
   			}
   		}); 
    }
    // 유저 년간 월별 유저 예약 개수
    function userReserveStatus(year){
   

    	$.ajax({
			url:"/support/userReserveStatus.do"
			,type:"post"
			,data : $("[name=userStatus]").serialize()
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
	    		            label: "월별 차량 예약 횟수",
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
    
    	
    
    // 유저 성별 인원
    function userGenderCount(year){
		//alert(3)
    	$.ajax({
			url:"/support/userGenderCount.do"
			,type:"post"
			,data : $("[name=userStatus]").serialize()
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
		    	var ctx = document.getElementById("chartGenderType").getContext('2d');
	    		new Chart(ctx, {
	    		    type: 'pie',
	    		    data: {
	    		        labels: labels,
	    		        datasets: 
	    		        [{
	    		            label: "유저 성별 비율",
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
    	
    	
    function userReserveStatics(){
    	
    	$.ajax({
			url:"/support/userReserveStatics.do"
			,type:"post"
			,data : $("[name=userStatus]").serialize()
			
			,datatype: "application/json"
			
			,success : function(resultList){
				var datalen = resultList.length;
				console.log(resultList);
				console.log(datalen);
		    	// 차트 만들기
		    	var labels = new Array();
		    	var data = new Array();
		    	
    			labels.push("예약신청");
    			data.push(resultList[0].codeCnt + resultList[1].codeCnt);
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
    function statusUserList(){
    	
    	$.ajax({
   			url:"/support/statusUserList.do"
   			,type:"post"
   			,data : $("[name=userStatus]").serialize()
   			,datatype: "application/json"
   			,success : function(data){
   				
   				var datalen = data.length;
   				//테이블 td 초기화
   				$(".table tbody:eq(0)").children().empty();

   				//테이블 td 데이터 삽입
   				
                for(var j=0; j<data.length; j++){
                	$(".table tbody:eq(0)").append("<tr>");                
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].user_name+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].user_gender+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].user_phone+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].user_reservation+"</td>" );
                    $(".table tbody tr:eq("+j+")").append( "<td class='txt_center'>"+data[j].user_cancel+"</td>" );
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
			<form name="userStatus" method="post" action="getDriverInfoList.do">
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
												<img src="resources/cssDashboard/img/total_users.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Total Users</p>
												<p class="card-title"><input type="text" name="userTot" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly>
												<p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-refresh" style="cursor:pointer" onclick="userTotalCount();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
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
												<img src="resources/cssDashboard/img/male_users.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Male</p>
												<p class="card-title"> <input type="text" name="userMale" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly> 
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
											<div class="icon-big text-center icon-warning"><!-- 
												<i class="nc-icon nc-vector text-danger"></i> -->
												<img src="resources/cssDashboard/img/female_users.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Female</p>
												<p class="card-title"><input type="text" name="userFeMale" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly>
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
												<img src="resources/cssDashboard/img/reservation.png">
											</div>
										</div>
										<div class="col-7 col-md-8">
											<div class="numbers">
												<p class="card-category">Reservation</p>
												<p class="card-title" ><input type="text" name="reserveCount" value="" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px; text-align:right;" readonly>
												<p>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer ">
									<hr>
									<div class="stats">
										<i class="fa fa-refresh" style="cursor:pointer" onclick="userReserveCount();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
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
								<h5 class="card-title">User Reservation
								
								<span style="float:right" >
									<select name="reserveYear" onchange="userReserveStatus();">
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
								<canvas id=chartMonths width="80" height="30"></canvas>
							</div>
							<div class="card-footer ">
								<hr>
								<div class="stats">
									<i class="fa fa-history" style="cursor:pointer" onclick="userReservationStatus();"> &nbsp;&nbsp;&nbsp;Update Now</i> 
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="card ">
							<div class="card-header ">
								<h5 class="card-title">User Gender Statistics
								<span style="float:right" >
									<select name="userYear" onchange="userGenderCount();">
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
									<select name="userReserveYear" onchange="userReserveStatics();">
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
								<h4 class="card-title">Users Imformation</h4>
								<p class="card-category">Users Imformation Of Admin Table </p>
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
												<th class="txt_center" scope="col" style="cursor:pointer">name</th>
												<th class="txt_center" scope="col" style="cursor:pointer;">gender</th >
												<th class="txt_center" scope="col" style="cursor:pointer;">phone</th >
												<th class="txt_center" scope="col" style="cursor:pointer">reservation</th>
												<th class="txt_center" scope="col" style="cursor:pointer">cancel</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td class="txt_center" ></td>
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