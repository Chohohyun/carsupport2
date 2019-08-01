<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />



 <!-- Title Page-->
    <title>KOSMO 교통약자 이동지원센터</title>

   <!--  Icons font CSS
    <link href="/support/resources/vendor2/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    Font special for pages
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">

    Vendor CSS
    <link href="/support/resources/vendor2/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="/support/resources/vendor2/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    Main CSS
    <link href="/support/resources/css/main.css" rel="stylesheet" media="all">
    <link href="/support/resources/css2/main.css" rel="stylesheet" media="all">
    
    
    
	<link rel="icon" type="image/png" href="/support/resources/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/main.css"> -->
   
   
   <!--구리시에서 따온거 -->
   
        <script type="text/javascript">
      $(document).ready(function(){
      $('.slider_box .slider_main').bxSlider({loop:true, auto:true});
      /*$('.slider_box .slider_list').bxSlider({
      loop:true,
      auto:true,
      controls:false,
      onSlideBefore:function($slideElement, oldIndex, newIndex){
      $container = $('.main_cont .bot_box .item.bg_transport img');
      $container.attr('src','images/img_main_car_0'+(newIndex+1)+'.jpg');
      }
      });*/
      });
		
    
    </script>
      <script type="text/javascript" language="javascript">

          if (/Android/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else {
              // 그 외 디바이스
          }
     </script>


      <script type="text/javascript" language="javascript">
    	function userMainPage(){
    		location.replace("/support/userMainPage.do");
    	}
    	function loginForm(){
    		location.replace("/support/loginForm.do");
    	}
    	function regTypeForm(){
    		location.replace("/support/regTypeForm.do");
    	}
    	function userUseProcedure(){
    		location.replace("/support/userUseProcedure.do");
    	}
    	function userReservationForm(){
    		location.replace("/support/userReservationForm.do");
    	}
    	function userReservationSituation(){
    		location.replace("/support/userReservationSituation.do");
    	}
    	function qnaListForm(){
    		location.replace("/support/qnaListForm.do");
    	}
	          


      </script>
    
</head>

<body> 

<body>
    <div id="wrap">
      <!--head-->
      <%@include file="title.jsp" %>
      <!--head end-->






        <form name="aspnetForm" method="post" action="./service.aspx" id="aspnetForm" class="form-horizontal ">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTY3MTgwMzU3NWRktiWBxRcYEXUpAC6b6AkEmq11H34E85JY3UCShhwpSfc=" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="F20EDA95" />
</div>
           
                    
    
    <script language="javascript">
        
        function download() {
           
         
              
            window.open('http://13.125.147.190:8080/support/resources/etc/apl_use.hwp');
              
 

        }

</script>
      <!--container-->
      <div id="container">
        <div class="banner_box">
          <div class="img">
            <center><img src="/support/resources/imagesUserMain1/banner2.png" alt="banner" /></center>
          </div>
          <!--div class="container">
            <p class="tit">
              구리시 교통약자 이동지원센터</br>해피콜과 함께하세요!
            </p>
          </div-->
        </div>
        <div class="sub_cont container">
          <div class="cont_box">
            <div class="tit_box">
              <h2 class="h2tit bg_service">예약안내</h2>
            </div>

            <div class="service_txt">
              <p class="txt">
                교통약자 이동지원센터에 <strong>등록된 회원만 예약이 가능!</strong><span class="br"></span> <em class="color-or size-35">
                  행복콜 <strong>1577-3659</strong>
                </em>
              </p>
            </div>

            <div class="service_step">
              <img src="https://easy.jjss.or.kr/images/img_service_step.jpg" alt="STEP" />
            </div>

            <dl class="service_info">
              <dt class="tit tit-icon">예약시간 안내</dt>
              <dd class="info" style="padding:40px;border:1px solid #a0a0a0">
                <ul>
                  <li>
                    <h3>예약접수 : 전화, 팩스, 인터넷</h3>
                    <br/>
                    <h3>
                      
                    </h3>
                    <p>
                      - 전화(콜) : <em class="blue f-bold">1577-3659</em> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      - 팩스 : 070-4275-1080&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      - 상담 시간 : 평일 09:00~18:00
                      <span class="br"></span>
                      ※ 토·일·공휴일 예약은 평일 근무시간에 접수
                    </p>
                    <br>
                      <br>
                        <h3>사전예약 가능시간</h3>
                        <br>
                        <p>
                          이용 2일전 사전 예약제로 운영하되, 차량 미 운행 시 이용 당일 2시간 전(월~금)에 예약 할 경우 즉시 이용제(즉시 콜) 병행 운영</br>
                          - 예약시간 : 평일 09:00~18:00
                        </p>
                      </li>
                </ul>
              </dd>
              <dt class="tit tit-icon">차량이용 안내</dt>
              <dd class="info" style="padding:50px;border:1px solid #a0a0a0">
                <ul>
                  <li>
                    <h3>운영시간</h3>
                    <br/>
                    <p>
                      - 평일 07:00 ~ 22:00
                      <span class="br"></span>
                      - 토·일·공휴일  09:00 ~18:00                      
                      <span class="br"></span>
                      ※ 야간 및 토·일·공휴일 이용은 사전예약제에 한함           
                    </p>
                  </li>
                  <li>
                    <h3>운행지역</h3>
                    <br/>
                    <p>
                      <span class="br"></span>
                      - 관내 출발하는 교통약자로서 병,의원 이용자에 한해 1시간 이내 대기하여 왕복 운행
                      <span class="br"></span>
			(다만, 병·의원 진료 이외 이용자는 30분 이내 대기하여 왕복운행)
                      <span class="br"></span>
                      - 운행지역 : 서울특별시, 인천광역시, 경기도 
                      <span class="br"></span>
                      - 관내·외 1일 2회까지 운행. 다만,휠체어 이용자에 한해 1일 4회까지 운행(편도 기준)
                    </p>
                   </li>
                </ul>
              </dd>
              <dt class="tit tit-icon">이용대상자 안내</dt>
              <dd class="info" style="padding:50px;border:1px solid #a0a0a0">
                <ul>
                  <li>
                    <p>
1. 변경 사유
                      <span class="br"></span>
 1) 「교통약자의 이동편의 증진법 시행규칙」의 개정으로 「금천구 교통약자 이동편의  증진에 관한 조례」가 「금천구 특별교통수단 등의 운영에 관한 조례」로 전부 개정        됨.
                      <span class="br"></span>
 2) 개정 조례 「금천구 특별교통수단 등의 운영에 관한 조례」에 의해 금천구 교통약자 이동지원센터 운영지침 개정됨.
                      <span class="br"></span>
                      <span class="br"></span><br>
2. 주요 내용
                      <span class="br"></span>
  1) 『금천구 특별교통수단 등의 운영에 관한 조례』 제10조제1항, 제2항에  따른 이용대상자의 범위는 다음과 같다.
                      <span class="br"></span>
    ① 「장애인 복지법 시행규칙」 제2조제1항에 따른 장애의 정도가 심한 장애인(휠체어등을 이용하는 보행 상 장애인에 한정)으로서 버스ㆍ지하철 등의 이용이 어려운         사람(복지카드, 장애인등록증, 진단서 등 제출자로 한함)_ (법 개정 전 1.2급은 복지         카드로, 3급은 휠체어 등을 이용하는 보행 상 장애인으로 한정하며 진단서 등 증빙         서류 제출자로 한함)
                      <span class="br"></span>
  ② 65세 이상으로 버스ㆍ지하철 등 이용이 어려운 사람(진단서 등 증빙서류 제출자로 한함)
                      <span class="br"></span>
  ③ 제1항 및 제2항에 해당하는 교통약자에 준하는 사람으로서 조례로 정하는 사람
                      <span class="br"></span>
    &nbsp;&nbsp;&nbsp;- 사고ㆍ질병 등 일시적 장애로 인한 휠체어 이용자(진단서 등 증빙서류 제출자로 한함)
                      <span class="br"></span>
    &nbsp;&nbsp;&nbsp;- 이외에 이동에 심한 불편을 느끼는 교통약자 중 특별교통수단이 필요하다고 인정하는 사람(진단서 등 증빙서류 제출자로 한함)
                      <span class="br"></span>
  ④ 제1항부터 제3항까지 해당하는 교통약자를 동반하는 가족 및 보호자(2명 이내)
                      <span class="br"></span>
                    </p>
                  </li>
                </ul>
              </dd>
              <dt class="tit tit-icon">이용기간</dt>
              <dd class="info" style="padding:50px;border:1px solid #a0a0a0">
                <ul>
                  <li>
                    <table class="tbl tbl_form">
                        <colgroup>
                            <col style="width:400px;"/>
                            <col style="width:400px;"/>
                            <col style="width:200px"/>
                        </colgroup>
                        <tr>
                            <th scope="row"><center>구분</th>
                            <td><center>제출서류</td>
                            <td><center>이용기간</td>
                        </tr>
                        <tr>
                            <th scope="row"><center>「장애인 복지법 시행규칙」 개정 전<br> 제2조에 따른 1급 장애인</th>
                            <td>복지카드 + 진단서(보행상 장애가 있는 사람)</td>
                            <td><center>최장 5년</td>
                        </tr>
                        <tr>
                            <th scope="row"><center>「장애인 복지법 시행규칙」 개정 전<br> 제2조에 따른 2급 장애인</th>
                            <td>복지카드 + 진단서(보행상 장애가 있는 사람)</td>
                            <td><center>최장 5년</td>
                        </tr>
                        <tr>
                            <th scope="row"><center>「장애인 복지법 시행규칙」 개정 전<br>제2조에 따른 3급 장애인</th>
                            <td>복지카드 + 진단서(휠체어 등 보행상 장애가 있는 사람)</td>
                            <td><center>최장 5년</td>
                        </tr>
                        <tr>
                            <th scope="row"><center>「장애인 복지법 시행규칙」 개정 후<br>제2조제1항 제28조제1항 중 중증</th>
                            <td>복지카드 + 진단서(휠체어 등 보행상 장애가 있는 사람)</td>
                            <td><center>최장 5년</td>
                        </tr>
                        <tr>
                            <th scope="row"><center>「장애인 복지법 시행규칙」 개정 후<br>제2조제1항 제28조제1항 중 경증</th>
                            <td>진단서 등(휠체어 등 보행상 장애가 있는 사람)</td>
                            <td><center>최장 1년</td>
                        </tr>
                        <tr>
                            <th scope="row"><center>「교통약자의 이동편의 증진법」 제2조제1호<br> "교통약자" 중 보행상 장애가 있는 사람</th>
                            <td>진단서 등(휠체어 등 보행상 장애가 있는 사람)</td>
                            <td><center>최장 1년</td>
                        </tr>
                    </table>
                  </li>
                </ul>
              </dd>
              <dt class="tit tit-icon">이용요금 안내</dt>
              <dd class="info" style="padding:50px;border:1px solid #a0a0a0">
                <ul>
                  <li>
                    <h3>「금천구 특별교통수단 등의 운영에 관한 조례」 제16조 규정에 의하여 금천구 교통약자 이동편의를 위한 특별교통수단(“행복콜”)의 이용요금과 이동지원센터의 운영에 대하여 고시한 요금으로 적용한다.
</h3>
                    <br/>
                    <p>
                      <em class="blue f-bold">- 요금 :</em> 무료로 운영됩니다.
                      <span class="br"></span>
                            <em class="blue f-bold">- 기타요금 :</em> 부대비용(주차비, 유료도로 통행료 등) 이용자 부담
                    </p>
                  </li>
                </ul>
              </dd>
              <dt class="tit tit-icon">이용신청서 제출 안내</dt>
              <dd class="info" style="padding:50px;border:1px solid #a0a0a0">
                <ul>
                  <li>
                    <h3>이용방법(과정)</h3>
                    <br/>
                    <p >
                      <img src="/support/resources/imagesUserMain1/service_img_03.png" />                    
                    </p>
                  </li>
                </ul>
                <ul>
                  <li >
                    <br/>
                    <br/>
                    <h3>이용신청서</h3>
                    <br/>
                    <a href="javascript:download()">
                        <p class="pdf-btn f-bold m-r-50">
                          <span class="color-f">다운로드</span>
                        </p>
                    </a> 
                  </li>
                  <li>
                    <br/>
                    <br/>
                    <h3>이용제한 사항</h3>
                    <br/>
                    <p>
                      <em class="blue f-bold">1일(당일) 제한</em> 
                      <span class="br"></span>
                      ▪ 탑승 시 신분증(복지카드) 및 진단서 등 증빙서류를 제시하지 못하는 경우
                      <span class="br"></span>
                      ▪ 신청 대상자와 이용자가 다른 경우(부정 이용자)
                      <span class="br"></span>
                      ▪ 운전원 및 상담원에 대한 폭행, 폭언 등의 불법을 행사 할 경우
                      <span class="br"></span>
                      </br>
                    </p>
                  </li>
                </ul>
              </dd>
            </dl>

          </div>
        </div>
      </div>
      <!--container end-->
 

        </form>
        
        <!--foot-->
        <%@include file="foot.jsp" %>
        <!--foot end-->
      </div>
    </div>

</body>
</html>
