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
    <title>KOSMO 교통약자 이동지원센터</title>

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

      function goQnaContentForm(data){
  		document.qnaContentForm.question_no.value=data;
  		document.qnaContentForm.submit();
  		
    	}
    </script>
      <!-- <script type="text/javascript" language="javascript">

          if (/Android/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else {
              // 그 외 디바이스
          }
     </script> -->

	
	

  </head>
  <body>
    <div id="wrap">
      <!--head-->
      <%@include file="title.jsp" %>
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
              <a href="javascript:userReservationSituation();" class="item l1 radius-15 m-l-10">
                <h2 class="tit">
                  예약확인/취소 <span class="size-18" >></span>
                </h2>
                <span class="img">
                  <img src="/support/resources/imagesUserMain1/icon_main02.png" alt="icon" />
                </span>
              </a>
              <div class="item2 l2 radius-15 m-l-10 m-t-10 border-1-b" >
                <p class="m-notice">
                  <span class="notice-tit">공지사항</span>
                  <a href="javascript:qnaListFormMain();"><span class="notice-view">+더보기</span></a>
                </p>
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout:fixed" >
                 <colgroup>
                       
                        <col style="width:70%;"/>
                        <col style="width:30%;"/>
                 </colgroup>
				<c:forEach items="${qnaList}" var="qna" varStatus="loopTagStatus">
					<tr>
					<c:choose>
						<c:when test="${loopTagStatus.index>=7}">
						<td>
						
						</td>
						</c:when>
						<c:otherwise>
						<td class="l-h-30" style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;"><a href="javascript:goQnaContentForm(${qna.question_no});">${qna.question_subject}</a></td>
						<td >${qna.reg_date}</td> 
						</c:otherwise>
					</c:choose>
					
					</tr>
 					</c:forEach>

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
                  <img src="/support/resources/imagesUserMain1/icon_main01.png" alt="icon" />
                </div>
              </a>
              <a href="javascript:userUseProcedure();" class="item r2 radius-15 m-l-10 m-t-10">
                <h2 class="tit">
                  예약안내 <span class="size-18">></span>
                </h2>
                <span class="img">
                  <img src="/support/resources/imagesUserMain1/icon_main03.png" alt="icon" />
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
                    <strong class="size-14">사전예약</strong></br>
                    - 평일 09:00 ~ 18:00(이용 2일전 사전예약제)</br>
                    &nbsp;&nbsp;토·일·공휴일 예약은 평일 근무시간 접수)</br></br>
                    <strong class="size-14">즉시 이용</strong></br>
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
                    - 금천구 전역, 경기도, 서울특별시, 인천광역시</br>
                    &nbsp;&nbsp; 전역 편도운행</br></br>
                    - 관내에서 출발하는 교통약자로서 출발지는</br>
                    &nbsp;&nbsp;금천구 관내 원칙</br></br>

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
                  KOSMO 교통약자 이동지원센터
                </h3>
              </div>
              <div class="time_box">
                <div class="phone_box2">
                  <h2 class="phone2">행복콜</h2>
                  <h2 class="phone">2025-8523</h2>
                  <div class="txt call-img-txt">
                    교통약자 이동지원센터에</br>
                    <em class="blue f-bold size-15">&nbsp;&nbsp;&nbsp;등록된 회원만</em></br>
                    <em class="blue f-bold size-15">예약 가능</em>합니다.
                  </div>
                  <div class="img call-img">
                    <img src="/support/resources/imagesUserMain1/img_people.png" alt="icon" />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!--container end-->

 

        </form>
        	<form name="qnaContentForm" method="post" action="/support/qnaContentForm.do">
			<input type="hidden" name="question_no">
		</form>
        <%@include file="foot.jsp" %>
        <!--foot end-->
      </div>
    </div>
  </body>
</html>