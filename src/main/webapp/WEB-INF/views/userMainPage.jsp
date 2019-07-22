<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="https://www.w3.org/1999/xhtml">
  <head>
    <title>COSMO 교통약자 이동지원센터</title>
 
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
    <div id="wrap">
      <!--head-->
     <%@include file="title.jsp" %>
      <!--head end-->






        <form name="aspnetForm" method="post" action="./" id="aspnetForm" class="form-horizontal ">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTQ0NTgzODEyNA9kFgJmD2QWAmYPZBYCAgEPZBYCZg8WAh4LXyFJdGVtQ291bnQCBxYOZg9kFgJmDxUDAjM2RTIwMTnrhYQgN+yblCAx7J28IOq1rOumrOyLnCDqtZDthrXslb3snpAg7J2064+Z7KeA7JuQ7IS87YSwIOydtOyaqeuMgAoyMDE5LTA2LTI3ZAIBD2QWAmYPFQMCMzUmNuyblCA27J28KOuqqSkg7ZiE7Lap7J28IO2ctOustCDqtIDroKgKMjAxOS0wNS0xNGQCAg9kFgJmDxUDAjM0OTXsm5QgNuydvCjsm5TsmpTsnbwpIOyWtOumsOydtOuCoCDrjIDssrQg6rO17Zy07J28IOyVjOumvAoyMDE5LTA0LTE3ZAIDD2QWAmYPFQMCMzMzNeyblCAx7J28KOyImOyalOydvCkg6re866Gc7J6Q7J2YIOuCoCDqtIDroKgg7JWM66a8CjIwMTktMDQtMTdkAgQPZBYCZg8VAwIzMikyMDE564WEIDPsm5QgMeydvCDsgrzsnbzsoIgg7Zy066y0IOyVjOumvAoyMDE5LTAyLTE5ZAIFD2QWAmYPFQMCMzEuMjAxOeuFhCAy7JuUIDXsnbwg7ISk64KgIOyXsO2ctCDqtIDroKgg7JWM66a8IAoyMDE5LTAxLTA3ZAIGD2QWAmYPFQMCMjknMjAxOeuFhCAx7JuUIDHsnbwg7Iug7KCVIOq0gOugqCDslYzrprwgCjIwMTgtMTItMjZkZMWGtHGsyHtMNPWNYmr1tO1q1wmrQWkOoCJMRxET3FVf" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="CA0B0334" />
</div>
           
                    
 
      <!--container-->
      <div id="container">
        <div class="main_cont container">
          <div class="top_box">
            <div class="top_col center">
              <div class="slider_box">
                <ul class="slider_main">
                  <li>
                    <a href="#">
                      <img src="/support/resources/imagesUserMain1/background1.jpg" alt="slider01" />
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <img src="/support/resources/imagesUserMain1/background2.jpg" alt="slider02" />
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="top_col right">
              <a href="javascript:userReservationSituation();" class="item l1 radius-15 m-l-10">
                <h2 class="tit">
                  예약확인/취소 <span class="size-18" >></span>
                </h2>
                <span class="img">
                  <img src="https://www.gurihappycall.or.kr/images/icon/icon_main02.png" alt="icon" />
                </span>
              </a>
              <div class="item2 l2 radius-15 m-l-10 m-t-10 border-1-b" >
                <p class="m-notice">
                  <span class="notice-tit">공지사항</span>
                  <a href="javascript:qnaListForm();"><span class="notice-view">+더보기</span></a>
                </p>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">

                    
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=36">2019년 7월 1일 구리시 교통약자 이동지원센터 이용대</a></td>
													<td >2019-06-27</td> 
  
                                        </tr>

                             
                        
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=35">6월 6일(목) 현충일 휴무 관련</a></td>
													<td >2019-05-14</td> 
  
                                        </tr>

                             
                        
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=34">5월 6일(월요일) 어린이날 대체 공휴일 알림</a></td>
													<td >2019-04-17</td> 
  
                                        </tr>

                             
                        
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=33">5월 1일(수요일) 근로자의 날 관련 알림</a></td>
													<td >2019-04-17</td> 
  
                                        </tr>

                             
                        
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=32">2019년 3월 1일 삼일절 휴무 알림</a></td>
													<td >2019-02-19</td> 
  
                                        </tr>

                             
                        
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=31">2019년 2월 5일 설날 연휴 관련 알림 </a></td>
													<td >2019-01-07</td> 
  
                                        </tr>

                             
                        
                            
                                        <tr>
										
													<td class="l-h-30"><a href="https://www.gurihappycall.or.kr/notice_view.aspx?no=29">2019년 1월 1일 신정 관련 알림 </a></td>
													<td >2018-12-26</td> 
  
                                        </tr>

                             
                         

                </table>
              </div>
            </div>

            <div class="top_col right">
              <a href="javascript:userReservationForm();" class="item r1 radius-15 m-l-10">
                <h2 class="tit">
                  예약신청 <span class="size-18">></span>
                </h2>
                <!--<a href="#" class="btn_go"></a>-->
                <div class="img">
                  <img src="https://www.gurihappycall.or.kr/images/icon/icon_main01.png" alt="icon" />
                </div>
              </a>
              <a href="javascript:userUseProcedure();" class="item r2 radius-15 m-l-10 m-t-10">
                <h2 class="tit">
                  예약안내 <span class="size-18">></span>
                </h2>
                <span class="img">
                  <img src="https://www.gurihappycall.or.kr/images/icon/icon_main03.png" alt="icon" />
                </span>
              </a>
            </div>
          </div>
          <div class="bot_box">
            <div class="item t_obj bg-c-f">
              <h3 class="tit">이용안내</h3>
              <ul class="txt_list">
                <li class="txt_item">
                  <p class="list_txt">
                    <strong class="size-14">사전예약(상담)</strong></br>
                    - 평일 09:00 ~ 18:00(이용 2일전 사전예약제)</br>
                    &nbsp;&nbsp;토·일·공휴일 예약은 평일 근무시간 접수)</br></br>
                    <strong class="size-14">즉시(콜) 이용</strong></br>
                    - 이용 당일 최소 2시간 전 예약신청</br>
                    &nbsp;&nbsp;(월~금, 배차여유 가능 시)
                  </p>
                </li>
              </ul>
            </div>
            <div class="item t_obj">
              <h3 class="tit">운행지역</h3>
              <ul class="txt_list">
                <li class="txt_item">
                  <p class="list_txt">
                    - 구리시 전역, 경기도, 서울특별시, 인천광역시</br>
                    &nbsp;&nbsp; 전역 편도운행</br></br>
                    - 관내에서 출발하는 교통약자로서 출발지는</br>
                    &nbsp;&nbsp;구리시 관내 원칙</br></br>

                    <strong class="size-14">차량운행</strong></br>
                    - 평일(월~금) 07:00~22:00</br>
                    ※ 야간 및 토·일·공휴일 이용은 사전예약자에 한함
                  </p>
                </li>
              </ul>
            </div>
            <div class="item bg_transport">
              <ul class="car_slider">
                <li>
                  <img src="/support/resources/imagesUserMain1/car1.jpg" alt="" />
                </li>
                <li>
                  <img src="/support/resources/imagesUserMain1/car2.jpg" alt="" />
                </li>
              </ul>
            </div>
            <script type="text/javascript">
              $(document).ready(function(){
              $('.car_slider').bxSlider({loop:true, auto:true});
              });
            </script>
            <div class="item contact_info">
              <div class="phone_box">
                <h3 class="tit">
                  COSMO 교통약자 이동지원센터
                </h3>
              </div>
              <div class="time_box">
                <div class="phone_box2">
                  <h2 class="phone2">행복콜</h2>
                  <h2 class="phone">1577-3659</h2>
                  <div class="txt call-img-txt">
                    교통약자 이동지원센터에</br>
                    <em class="blue f-bold size-15">&nbsp;&nbsp;&nbsp;등록된 회원만</em></br>
                    <em class="blue f-bold size-15">예약 가능</em>합니다.
                  </div>
                  <div class="img call-img">
                    <img src="https://www.gurihappycall.or.kr/images/img_main.png" alt="icon" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--container end-->

 

        </form>
        
        <!--foot-->
        <div id="term">  
          <div class="term_box container"> 
            <div style="margin-top:20px;text-align:center; color:#777777; font-family:Dotum; font-size:15px;">
                 <a href='https://www.gurihappycall.or.kr/term.aspx'>이용약관</a>&nbsp;
                |&nbsp; <a href='https://www.gurihappycall.or.kr/private.aspx'>개인정보 처리방침</a>&nbsp;
                |&nbsp; <a href='https://www.gurihappycall.or.kr/media.aspx'>영상정보처리기 운영관리방침</a>&nbsp;
                |&nbsp; <a href='https://www.gurihappycall.or.kr/email.aspx'>이메일집단수집거부</a>
            </div> 
             </div> 
        </div>
        
        <div id="foot">   
          <div class="foot_box container"> 
            <p class="copyright">
              경기도 구리시 안골로 40(교문동, 교문동주차빌딩 3층)&nbsp;㉾ 11934&nbsp;&nbsp;&nbsp;전화 : 1577-3659&nbsp;&nbsp;&nbsp;팩스 : 070-4275-1080
              <br/>Copyright © Guri Support For Moving Center All Right Reserved.
            </p> 
          </div>
        </div>
        <!--foot end-->
      </div>
    </div>
  </body>
</html>