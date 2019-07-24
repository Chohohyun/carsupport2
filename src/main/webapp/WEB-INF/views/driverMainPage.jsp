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

	
	

  </head>
  <body>
    <div id="wrap">
      <!--head-->
      <%@include file="title2.jsp" %>
      <!--head end-->


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
              <a href="javascript:driverUserReserveForm();" class="item l1 radius-15 m-l-10">
                <h2 class="tit">
                  예약현황<span class="size-18" >></span>
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
              <a href="javascript:driverHistory();" class="item r1 radius-15 m-l-10">
                <h2 class="tit">
                  주행기록 <span class="size-18">></span>
                </h2>
                <!--<a href="#" class="btn_go"></a>-->
                <div class="img">
                  <img src="https://www.gurihappycall.or.kr/images/icon/icon_main01.png" alt="icon" />
                </div>
              </a>
              <a href="javascript:driverCarInfo();" class="item r2 radius-15 m-l-10 m-t-10">
                <h2 class="tit">
                  차량정보 <span class="size-18">></span>
                </h2>
                <span class="img">
                  <img src="https://www.gurihappycall.or.kr/images/icon/icon_main03.png" alt="icon" />
                </span>
              </a>
            </div>
          </div>
          <div class="bot_box">
            <div class="item t_obj bg-c-f">
              <h3 class="tit">운전자</h3>
              <ul class="txt_list">
                <li class="txt_item">
                  <p class="list_txt">      
                    1. 승,하차 시 인사<br>
                    2. 의자, 룸 밀러 및 사이드밀러 조절<br>
                    3. 안전벨트 착용<br>
                    4. 방향지시등 작동<br>
                    5. 차내 안전 확인<br>
                    6. 급출발 및 급조작 금지<br>
                    7. 진로변경 및 회전 시 방향지시등 조작<br>
                    8. 회전 시 일시정지 및 감속운전<br>
                    9. 후진 시 비상등 확인<br>
                    10. 요철이 심한 도로 감속운전<br>
                  </p>
                </li>
              </ul>
            </div>
            <div class="item t_obj">
              <h3 class="tit">주의사항</h3>
              <ul class="txt_list">
                <li class="txt_item">
                  <p class="list_txt">
                  11. 주행 중 속도조절<br>
                  12. 안전거리 확보 및 전방주시<br>
                  13. 신호 준수<br>
                  14. 정차 시 비상등 작동<br>
                  15. 하차 전 기어 P 위치 및 싸이드 브레이크 작동<br>
                  16. 하차 전 엔진정지<br>
                  17. 시내지리 숙지<br>
                  18. 올바른 태도 및 언행<br>
                  19. 복장상태 확인<br>
                  20. 긴급사항 시 센터에 보고<br>
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
        <%@include file="foot.jsp" %>
        <!--foot end-->
      </div>
    </div>
  </body>
</html>