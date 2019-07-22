<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- common.jsp 소스 파일 가져오기 [Include Directive] 기술-->
<!--  여러 JSP 페이지에 공통으로 들어갈 코드가 있다면 이 방법을 사용한다-->
<%@include file="common.jsp"%>

<html xmlns="https://www.w3.org/1999/xhtml">
  <head>
    <title>COSMO 교통약자 이동지원센터</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link type="text/css" rel="stylesheet" href="https://www.gurihappycall.or.kr/css/style.css"/>
    <link type="text/css" rel="stylesheet" href="https://www.gurihappycall.or.kr/css/pop.css"/>
    <script type="text/javascript" src="https://www.gurihappycall.or.kr/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="https://www.gurihappycall.or.kr/js/jquery.bxslider.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.css"/>
    <script type="text/javascript" src="https://www.gurihappycall.or.kr/js/datetimepicker/jquery.datetimepicker.js"></script>
    <script type="text/javascript" src="https://www.gurihappycall.or.kr/js/design.js"></script>
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

          

                  var LogOutTimer = function () {
                      var S = {
                          timer: null,
                          limit: 1000 * 60 * 10,
                          fnc: function () { },
                          start: function () {
                              S.timer = window.setTimeout(S.fnc, S.limit);
                          },
                          reset: function () {
                              window.clearTimeout(S.timer);
                              S.start();
                          }
                      };

                      document.onmousemove = function () { S.reset(); };

                      return S;
                  }();

                  // 로그아웃 체크시간 설정
                  LogOutTimer.limit = 1000 * 60 * 10;

                  // 로그아웃 함수 설정
                  LogOutTimer.fnc = function () {
                      alert("로그인후 약 10분동안 서비스 이용이 없어 로그아웃 합니다.");

                      document.location.href = "https://www.gurihappycall.or.kr/member_logout.aspx";
                  }

                  // 로그아웃 타이머 실행
                  LogOutTimer.start();
          


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
      
		<%@include file="title.jsp"%>
		
      <!--head end-->






        <form name="aspnetForm" method="post" action="./notice_list.aspx" id="aspnetForm" class="form-horizontal ">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwULLTE4NDYyNTE4NjUPFgIeB3RvdHBhZ2UCAxYCZg9kFgJmD2QWAgIBD2QWCGYPFgIeC18hSXRlbUNvdW50AgoWFGYPZBYCZg8VBgIzNgIyNQIzNkUyMDE564WEIDfsm5QgMeydvCDqtazrpqzsi5wg6rWQ7Ya17JW97J6QIOydtOuPmeyngOybkOyEvO2EsCDsnbTsmqnrjIAJ67CV7Z2s6rK9CjIwMTktMDYtMjdkAgEPZBYCZg8VBgIzNQIyNAIzNSY27JuUIDbsnbwo66qpKSDtmITstqnsnbwg7Zy066y0IOq0gOugqAnrsJXtnazqsr0KMjAxOS0wNS0xNGQCAg9kFgJmDxUGAjM0AjIzAjM0OTXsm5QgNuydvCjsm5TsmpTsnbwpIOyWtOumsOydtOuCoCDrjIDssrQg6rO17Zy07J28IOyVjOumvAnrsJXtnazqsr0KMjAxOS0wNC0xN2QCAw9kFgJmDxUGAjMzAjIyAjMzMzXsm5QgMeydvCjsiJjsmpTsnbwpIOq3vOuhnOyekOydmCDrgqAg6rSA66CoIOyVjOumvAnrsJXtnazqsr0KMjAxOS0wNC0xN2QCBA9kFgJmDxUGAjMyAjIxAjMyKTIwMTnrhYQgM+yblCAx7J28IOyCvOydvOygiCDtnLTrrLQg7JWM66a8Ceuwle2drOqyvQoyMDE5LTAyLTE5ZAIFD2QWAmYPFQYCMzECMjACMzEuMjAxOeuFhCAy7JuUIDXsnbwg7ISk64KgIOyXsO2ctCDqtIDroKgg7JWM66a8IAnrsJXtnazqsr0KMjAxOS0wMS0wN2QCBg9kFgJmDxUGAjI5AjE5AjI5JzIwMTnrhYQgMeyblCAx7J28IOyLoOyglSDqtIDroKgg7JWM66a8IAnrsJXtnazqsr0KMjAxOC0xMi0yNmQCBw9kFgJmDxUGAjI3AjE4AjI3PTIwMTnrhYQg4oCc7ZaJ67O17L2c4oCdIOywqOufiSDstpTqsIAg67CPIOyatOyYgeq0gOugqCDrs4Dqsr0J67CV7Z2s6rK9CjIwMTgtMTItMTdkAggPZBYCZg8VBgIyNgIxNwIyNiQxMuyblCAyNeydvCDshLHtg4TsoIgg6rSA66CoIOyVjOumvCAJ67CV7Z2s6rK9CjIwMTgtMTItMTdkAgkPZBYCZg8VBgIyNQIxNgIyNSkxMOyblCA57J28IO2VnOq4gOuCoCDtnLTrrLQg6rSA66CoIOyViOuCtAnrsJXtnazqsr0KMjAxOC0xMC0wNGQCAQ8PFgIeB0VuYWJsZWRoZGQCAg8PFgIfAmhkZAIDDxYCHwECAxYGZg9kFgICAQ8PFggeD0NvbW1hbmRBcmd1bWVudAUBMB4EVGV4dAUBMR4JRm9udF9Cb2xkZx4EXyFTQgKAEGRkAgEPZBYCAgEPDxYEHwMFATEfBAUBMmRkAgIPZBYCAgEPDxYEHwMFATIfBAUBM2RkZAgn494ZyW51bvYJnVCVSU5DIzv2x/lCiZQt9W/o5fZ3" />
</div>

<script type="text/javascript">
//<![CDATA[
var theForm = document.forms['aspnetForm'];
if (!theForm) {
    theForm = document.aspnetForm;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
</script>


<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="2EF086C7" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAAYTNSLHkmkPS9WKyW0CCiv3aHK4HjdWyISiF+LHmdLZwKgYvF/w0gLDniVq/YqEbwlBiv+kpo3lSwvYf/KmRnnIopYmrcRCyIVI2YZN3RqOr/lRjOSIZU3aJQu/5XnqZkSy41rwd2EaH2yUzUkTw6PBfBi8Rgy6BkUAIBc8IyAcVA==" />
</div>
           
                    
    
    <script lang="ja">
        function cancel(res_date, res_time) {
            return confirm(res_date + ' ' + res_time + ' 예약을 삭제하시겠습니까?');
        }
    </script>
    
    
    <!--container-->
    <div id="container">
        <div class="banner_box">
            <center><div class="img"><img src="/support/resources/imagesUserMain1/banner2.png" alt="banner" /></div></center>
        </div>

         

        <div class="sub_cont container">
            <div class="cont_box">
              <div class="tit_box">
                <h2 class="h2tit">공지사항</h2>
              </div>
                <table class="tbl tbl_list">
                    <colgroup>
                        <col style="width:10%;"/>
                        <col style="width:70%;"/>
                        <col style="width:10%;"/>
                        <col style="width:10%;"/>
                    </colgroup>
                    <thead>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">작성자</th>
                    <th scope="col">날짜</th>
                    </thead>
                    <tbody>
					
                                                    
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=36">25</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=36">2019년 7월 1일 구리시 교통약자 이동지원센터 이용대</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2019-06-27</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=35">24</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=35">6월 6일(목) 현충일 휴무 관련</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2019-05-14</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=34">23</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=34">5월 6일(월요일) 어린이날 대체 공휴일 알림</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2019-04-17</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=33">22</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=33">5월 1일(수요일) 근로자의 날 관련 알림</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2019-04-17</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=32">21</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=32">2019년 3월 1일 삼일절 휴무 알림</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2019-02-19</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=31">20</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=31">2019년 2월 5일 설날 연휴 관련 알림 </a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2019-01-07</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=29">19</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=29">2019년 1월 1일 신정 관련 알림 </a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2018-12-26</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=27">18</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=27">2019년 “행복콜” 차량 추가 및 운영관련 변경</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2018-12-17</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=26">17</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=26">12월 25일 성탄절 관련 알림 </a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2018-12-17</td>
  
                                                                        </tr>

                                                             
                                                        
                                                            
                                                                        <tr>
																		
																					<td class="txt_center"><a href="notice_view.aspx?no=25">16</a></td>
																					<td class="txt_left"><a href="notice_view.aspx?no=25">10월 9일 한글날 휴무 관련 안내</a></td>
																					<td class="txt_center">박희경</td>
																					<td class="txt_center">2018-10-04</td>
  
                                                                        </tr>

                                                             
                                                         

 
                    </tbody>
                </table>           
                <div class="paging">
					                                        <!-- 페이징  -->  
                                 <a id="ctl00_ContentPlaceHolder1_LinkFirst" disabled="disabled" class="item first"></a>
                            
                                <a id="ctl00_ContentPlaceHolder1_LinkPrev" disabled="disabled" class="item first"></a>
                     
                                    
                                                       <a id="ctl00_ContentPlaceHolder1_Repeater2_ctl00_LinkPage" class="item" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$Repeater2$ctl00$LinkPage&#39;,&#39;&#39;)" style="font-weight:bold;">1</a>
                                          
                                            
                                                       <a id="ctl00_ContentPlaceHolder1_Repeater2_ctl01_LinkPage" class="item" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$Repeater2$ctl01$LinkPage&#39;,&#39;&#39;)">2</a>
                                          
                                            
                                                       <a id="ctl00_ContentPlaceHolder1_Repeater2_ctl02_LinkPage" class="item" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$Repeater2$ctl02$LinkPage&#39;,&#39;&#39;)">3</a>
                                          
                                             
                                                                                
                             <a id="ctl00_ContentPlaceHolder1_LinkNext" class="item next" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$LinkNext&#39;,&#39;&#39;)"></a> 
                         
                        
                             <a id="ctl00_ContentPlaceHolder1_LinkLast" class="item last" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$LinkLast&#39;,&#39;&#39;)"></a> 
                                                                                      
				                                        <!--	 페이징 -->   
                </div>
                <div class="btn_box">
                  <a href="notice_list.aspx" class="btn middle white radius-5">목록</a>
                      
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



<!-- 게시판 화면을 구성하는 태그 -->
<html>
<script>

	$(document).ready(function() {
		

	    // id = movieList 를 가진 태그를 관리하는 jQuery 객체의 메위주를 변수 tableObj 에 저장
	    var tableObj = $(".qnaList");
	
	    // id = movieList 를 가진 태그 내부에 모든 tr을 관리 jQuery 객체 생성해 변수 trObj에 저장
	    // var trObj = $("#movieList tr")
	    var trObj = tableObj.find("tr");
	
	    // 홀수 tr을 관리하는 jQuery 객체 메위주를 변수 trOddObj 에 저장
	    var trOddObj = trObj.filter(":even");
	    // 짝수 tr을 관리하는 jQuery 객체 메위주를 변수 trEvenObj 에 저장
	    var trEvenObj = trObj.filter(":odd");
	    //-------------------------------------------------------------------------------------
	    // 짝수번째 tr 감추기
	    trEvenObj.hide();
	   
	 	// 홀수 tr 에 마우스 대면 손모양 보이기
	    trOddObj.css("cursor", "pointer");
	    
	     trObj.filter(":even").click(function () {  
	    	trEvenObj.hide();
	        $(this).next().show();
	    });  
	
	     
	     $(".qna_group").css("cursor","pointer");
	     $(".content").css("cursor","pointer");   
	}); 


	
	
	//********************************************************************************** 
	//  글쓰기 페이지로 이동하는 함수 설정
	
	function goQnaRegForm() { 
		// name=boardRegForm 을 가진 form 태그 안의 action 에 설정된 URL로 이동하기
		// 이동시 form 태그안의 모든 입력 양식이 파라미터 값으로 전송
		document.qnaRegForm.submit(); 
	}			
	//**********************************************************************************
	
	//*******************************************************************
	// 버튼 클릭시 게시판 항목이 분류돼서 화면에 보여준다
	//*******************************************************************
	function goQnaList(data) {
		document.qnaOptionForm.question_group_no.value=data;
		document.qnaOptionForm.submit();
	}
	
function goQnaUpDelForm(data) {
		if("${sessionScope.id}"!='abc'){
			
			  // id = movieList 를 가진 태그를 관리하는 jQuery 객체의 메위주를 변수 tableObj 에 저장
		    var tableObj = $(".qnaList");
		
		    // id = movieList 를 가진 태그 내부에 모든 tr을 관리 jQuery 객체 생성해 변수 trObj에 저장
		    // var trObj = $("#movieList tr")
		    var trObj = tableObj.find("tr");
			 var trEvenObj = trObj.filter(":odd");
			    //-------------------------------------------------------------------------------------
			    // 짝수번째 tr 감추기
			trEvenObj.hide();
			return;
		}
		document.qnaUpDelForm.question_no.value=data;
		document.qnaUpDelForm.submit();
	}
	
</script>


<head>





</head>
<body>
	<!---------------------------------------------------------------------------------------------------------- -->
	<center>
		<table>
			<tr>
				<td>QnA 게시판<br>
				<br>
			<tr>
				<c:if test="{sessionScope.id=='abc'}">
					<td><input type="button" value=" 글쓰기 "
						onclick="goQnaRegForm();">
				</c:if>
		</table>
		<br>

		<table border=1 cellpadding=5 cellspacing=0 width=400
			class="qna_group">
			<tr>
				<td><input type="button" class="qna_group" value="공지사항"
					onClick="goQnaList('1');">
				<td><input type="button" class="qna_group" value="이용관련"
					onClick="goQnaList('2');">
				<td><input type="button" class="qna_group" value="사이트관련"
					onClick="goQnaList('3');">
		</table>
		<br>

		<table border=1 class="qnaList" cellpadding=5 cellspacing=0 width=400>
			<c:forEach items="${requestScope.qnaList}" var="qna"
				varStatus="loopTagStatus">
				<tr bgcolor=#FAFAAA>
					<td align="center">${qna.question_subject }
				<tr bgcolor="white"
					onclick="javascript:goQnaUpDelForm(${qna.question_no});">
					<td align="center"><textarea name="content" class="content"
							rows="10" cols="40">${qna.question_content }</textarea>
			</c:forEach>
		</table>


		<!-- [QnA 글쓰기 화면] 으로 이동하는 form 태그  -->
		<!-- 이동시 form 태그안의 모든 입력 양식이 파라미터 값으로 전송된다. -->
		<form name="qnaRegForm" method="post" action="/support/qnaRegForm.do">
		</form>
		<form name="qnaOptionForm" method="post"
			action="/support/qnaListForm.do">
			<input type="hidden" name="question_group_no">
		</form>

		<form name="qnaUpDelForm" method="post"
			action="/support/qnaUpDelForm.do">
			<input type="hidden" name="question_no">
		</form>
	</center>
</body>
</html>