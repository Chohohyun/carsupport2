<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>


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






        <form name="aspnetForm" method="post" action="./reserv_request.aspx" id="aspnetForm" class="form-horizontal ">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__LASTFOCUS" id="__LASTFOCUS" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTI0NzQ2OTI2MQ9kFgJmD2QWAmYPZBYCAgEPZBYCAgsPZBYCZg9kFgQCAQ8QZA8WAWYWARAFDOyngeygkeyeheugpQUM7KeB7KCR7J6F66ClZxYBZmQCCQ8QZA8WAWYWARAFDOyngeygkeyeheugpQUM7KeB7KCR7J6F66ClZxYBZmRkezR3JA8iHO2qebjnhUtgyUBy/CyJDoH7zlTJA5A8fG0=" />
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


<script src="/WebResource.axd?d=_iJmq2pkNMcXKGYk-Qnev1h1px0gsAbaclohN03Mh_xkkyPMulJlNsUKyaJ4Tti62JxMKsAHwd-MOvwNIB4REZK204J4EVuf6Wd75B_MJ241&amp;t=636355230046607314" type="text/javascript"></script>


<script src="/ScriptResource.axd?d=L3lQo1A6wjFF9aDgCxHl8_x30Mxjv_P2x0fYlSJtmPVXpZwk5SViIqaOUU1Gnt-deCkxtl0HHcKRMFVd1h_Sen8qQGpiMNIxTmj_XneqatBKSuFbkIcFwLNVL-6_vNJeOcmsBf2Cv7lRGNIRDKffDKP0plgHqEmxNozlmgzDDMfRt-dsJONrnFB9fwHYlRe_0&amp;t=3d6efc1f" type="text/javascript"></script>
<script type="text/javascript">
//<![CDATA[
if (typeof(Sys) === 'undefined') throw new Error('ASP.NET Ajax 클라이언트 쪽 프레임워크를 로드하지 못했습니다.');
//]]>
</script>

<script src="/ScriptResource.axd?d=4Ep19dWAME-2r40imd1gTtbcCBTgsjv_owj8tvhmid6QHNRbHmGW9Gzzdb8SdXOobCLHRc_QAW7OfW3PNbhnuCrVzJpJlOzozekjZIrq0QR1M1sdfZA1Z2esuqrVnxLCga0zSX8ypbKWwb1WNh18T3qvuJ2lnIC6162PfNxwFlX7aBwHBOmgWRQ-ZbfZmp550&amp;t=3d6efc1f" type="text/javascript"></script>
<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="9ADC024A" />
</div>
           
                    
    
      <!-- 엔터키막기 -->
                             <div style="display:none;"> 
                                <input type="submit" name="ctl00$ContentPlaceHolder1$btnNull" value="" onclick="return false;" id="ctl00_ContentPlaceHolder1_btnNull" /> 
                            </div>
         <!-- 엔터키막기 -->
    
    <!-- -------------- 카렌다 시작 ---------------------- -->
    
    <script type="text/javascript">
        $(document).ready(function(){
            load_datetime('','');
        });
        $(document).delegate('.tbl_search td','mouseover', function(){
            $(this).closest('table').find('td').removeClass('on');
            $(this).closest('tr').find('td').addClass('on');
        });

        function load_datetime(date, time) {
            $('#datetimepicker').datetimepicker({
                timepicker: false,
                format: 'Y-m-d',
                lang: 'kr'
            });

            $('#datetimepicker').datetimepicker({ value: date, step: 10 });

            $('#datetimepicker1').datetimepicker({
                datepicker: false,
                format: 'H:i',
                step: 10
            });
            $('#datetimepicker1').datetimepicker({ value: time, step: 10 });

        }

    </script> 
    
    <script lang="ja">
        window.onload = function () {
           
            /* 예약가능시간

            var onul = new Date();
            var h = onul.getHours();

            if ((h >= 0 && h <= 7)
                || (h >= 21 && h <= 23)) {
                ;
            }
            else {
                alert("온라인 예약가능시간은 8일전 21:00 ~ 익일 07:00까지입니다.");
                document.location.href = "/";
            }
            예약가능시간 */
  
        };

        function zip_select1(addr) {
             
            //ZIP_CODE | ADDRBUNJI | DETAIL | SEQ
            var arr = addr.split('|');


            $("#closemodal1").click();


            arr[1] = arr[1].substring(0, arr[1].indexOf('('));

            document.forms[0].TextDeptZipCode.value = arr[0];
            document.forms[0].TextDeptFAddr.value = arr[1];
            document.forms[0].TextDeptNm.value = "";
            document.forms[0].HiddenSeq1.value = arr[3];


             

        }
        function zip_search1(search) {
            if (search.value == '') {
                alert('동명 또는 도로명을 입력하세요.');
                search.focus();
                return false;
            }
            else {
                return true;
            }
        }

        function zip_select2(addr) {
             
            //ZIP_CODE | ADDRBUNJI | DETAIL | SEQ
            var arr = addr.split('|');


            arr[1] = arr[1].substring(0, arr[1].indexOf('('));

            $("#closemodal2").click();

            document.forms[0].TextArrvZipCode.value = arr[0];
            document.forms[0].TextArrvFAddr.value = arr[1];
            document.forms[0].TextArrvNm.value = "";
            document.forms[0].HiddenSeq2.value = arr[3];
        }
        function zip_search2(search) {

            if (search.value == '') {
                alert('동명 또는 도로명을 입력하세요.');
                search.focus();
                return false;
            }
            else {
                return true;
            }
        }


        function submit_check() {

            try {
                 
                var deptZipCode = document.forms[0].TextDeptZipCode;
                var deptFAddr = document.forms[0].TextDeptFAddr;
                var deptNm = document.forms[0].TextDeptNm;
                var arrvZipCode = document.forms[0].TextArrvZipCode;
                var arrvFAddr = document.forms[0].TextArrvFAddr;
                var arrvNm = document.forms[0].TextArrvNm;


                /* 이틀후만가능 */

                var mydate = document.forms[0].datetimepicker.value;


                var diff_day = todaydiff(mydate);

                var today = new Date(); 

                //if (diff_day < 1 || diff_day > 2) 
                //{
                //    alert('예약일은 2일이내의 날짜만 예약가능합니다');
                //    return false;
                //}
                /* 이틀후만가능 */

                if (document.forms[0].datetimepicker1.value == '00:00') {
                    alert('예약시간을 입력하세요.');
                    document.forms[0].datetimepicker1.focus();
                    return false;
                }
                if (document.forms[0].DropDownDept.value == '직접입력' && deptZipCode.value == '') {
                    alert('출발지주소를 조회하세요.');
                    deptZipCode.focus();
                    return false;
                }

                if (document.forms[0].DropDownDept.value == '직접입력' && deptFAddr.value == '') {
                    alert('출발지주소를 입력하세요.');
                    deptFAddr.focus();
                    return false;
                }
                if (document.forms[0].DropDownDept.value == '직접입력' && deptNm.value == '') {
                    alert('출발지명칭을 입력하세요.');
                    deptNm.focus();
                    return false;
                }
                if (document.forms[0].DropDownArrv.value == '직접입력' && arrvZipCode.value == '') {
                    alert('도착지주소를 조회하세요.');
                    arrvZipCode.focus();
                    return false;
                }
                if (document.forms[0].DropDownArrv.value == '직접입력' && arrvFAddr.value == '') {
                    alert('도착지주소를 입력하세요.');
                    arrvFAddr.focus();
                    return false;
                }
                if (document.forms[0].DropDownArrv.value == '직접입력' && arrvNm.value == '') {
                    alert('도착지명칭을 입력하세요.');
                    arrvNm.focus();
                    return false;
                }

            }
            catch (e) {

                alert(e.message);
                return false;
            }
            return true;
        }
        function todaydiff(diffdate) {
            var today = new Date();

            var dateArray = diffdate.split("-");
            var dateObj = new Date(dateArray[0], Number(dateArray[1]) - 1, dateArray[2]);

            var getDiffTime = dateObj.getTime() - today.getTime();

            return Math.floor(getDiffTime / (1000 * 60 * 60 * 24)) + 1;


        }
    </script>
    
    
    <script type="text/javascript">
//<![CDATA[
Sys.WebForms.PageRequestManager._initialize('ctl00$ContentPlaceHolder1$ScriptManager1', 'aspnetForm', ['tctl00$ContentPlaceHolder1$UpdatePanel3','','tctl00$ContentPlaceHolder1$UpdatePanel1','','tctl00$ContentPlaceHolder1$UpdatePanel4',''], [], [], 90, 'ctl00');
//]]>
</script>

    
    <input type="hidden" name="ctl00$ContentPlaceHolder1$HiddenWeb_Res_No" id="HiddenWeb_Res_No" value="0" />
    <input type="hidden" name="ctl00$ContentPlaceHolder1$HiddenSeq1" id="HiddenSeq1" value="0" />
    <input type="hidden" name="ctl00$ContentPlaceHolder1$HiddenSeq2" id="HiddenSeq2" value="0" />
     
    <div id="ctl00_ContentPlaceHolder1_UpdatePanel3">
	

     
    
    <!--container-->
    <div id="container">
        <div class="banner_box">
            <center><div class="img"><center><img src="/support/resources/imagesUserMain1/banner2.png" alt="banner"/></center></div></center>
        </div>
        <div class="sub_cont container">
            <div class="cont_box">
                <div class="tit_box">
                    <span class="h2tit bg_service">예약신청</span>
                  <span class="txt_notice float-r">
                    <em class="color-or">*</em> 는 필수입력항목입니다.정확한 정보를 입력해주세요.
                  </span>
                </div> 
                    <table class="tbl tbl_form">
                        <colgroup>
                            <col style="width:21%;"/>
                            <col style="width:79%;"/>
                        </colgroup>
                        
                        <tr>
                            <th scope="row">출발지<em class="color-or"> *</em></th>
                            <td>
                                <div class="input_btn">
								
										<input name="ctl00$ContentPlaceHolder1$TextDeptZipCode" type="text" id="TextDeptZipCode" style="width:170px;" /> 
                                        <button class="btn small grey" type="button" data-toggle="modal" data-target="#myModal1">검색</button> 
                                </div>
                                <div class="row">
										<input name="ctl00$ContentPlaceHolder1$TextDeptFAddr" type="text" id="TextDeptFAddr" style="width:100%;" />  
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">출발지명칭<em class="color-or"> *</em></th>
                            <td>
										<input name="ctl00$ContentPlaceHolder1$TextDeptNm" type="text" id="TextDeptNm" style="width:100%;" />  
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">도착지선택<em class="color-or"> *</em></th>
                            <td>
                                <select name="ctl00$ContentPlaceHolder1$DropDownArrv" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$ContentPlaceHolder1$DropDownArrv\&#39;,\&#39;\&#39;)&#39;, 0)" id="DropDownArrv" class="select" style="width:100%;">
		<option selected="selected" value="직접입력">직접입력</option>

	</select>
                                  
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">도착지주소<em class="color-or"> *</em></th>
                            <td>
                                <div class="input_btn">
										<input name="ctl00$ContentPlaceHolder1$TextArrvZipCode" type="text" id="TextArrvZipCode" style="width:170px;" />  
                                    <button class="btn small grey" type="button" data-toggle="modal" data-target="#myModal2">우편번호검색</button>
                                </div>
                                <div class="row">
										<input name="ctl00$ContentPlaceHolder1$TextArrvFAddr" type="text" id="TextArrvFAddr" style="width:100%;" />  
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">도착지명칭<em class="color-or"> *</em></th>
                            <td>
										<input name="ctl00$ContentPlaceHolder1$TextArrvNm" type="text" id="TextArrvNm" style="width:100%;" />  
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">예약날짜<em class="color-or"> *</em></th>
                            <td>
                                        <input name="ctl00$ContentPlaceHolder1$datetimepicker" type="text" value="2019-07-19" id="datetimepicker" style="width:170px;" /> 
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">예약시간<em class="color-or"> *</em></th>
                            <td>
                                        <input name="ctl00$ContentPlaceHolder1$datetimepicker1" type="text" value="12:00" id="datetimepicker1" style="width:170px;" />  
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">동승자수<em class="color-or"> *</em></th>
                            <td>
							
                                        <select name="ctl00$ContentPlaceHolder1$DropDownShareCnt" id="ctl00_ContentPlaceHolder1_DropDownShareCnt" class="select" style="width:170px;">
		<option selected="selected" value="0">0</option>
		<option value="1">1</option>
		<option value="2">2</option>
		<option value="3">3</option>
		<option value="4">4</option>
		<option value="5">5</option>

	</select>  
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">비고</th>
                            <td>
									<textarea name="ctl00$ContentPlaceHolder1$TextComment" rows="5" cols="20" id="TextComment" class="form-control" style="width:100%; height:120px;">
</textarea>  
                            </td>
                        </tr>
                    </table>
                
                <div class="btn_box">
                     <a onclick="return submit_check();" id="ctl00_ContentPlaceHolder1_LinkOk" class="btn large blue radius-5" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$LinkOk&#39;,&#39;&#39;)">
                                          예약완료
                                    </a>
                    <a href="/" class="btn large white radius-5">취소</a> 
                </div>
            </div>
        </div>
    </div>
    <!--container end-->
      
        
</div>
    
<!-- modal -->  
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    
            <div id="ctl00_ContentPlaceHolder1_UpdatePanel1">
	

                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" id="closemodal2" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">닫기</span></button>
                                    <h4 class="modal-title" id="myModalLabel">우편번호검색</h4>
                                </div>
                                <div class="modal-body"> 
                                        <div class="form-group">
                                            <label class="col-lg-2 control-label">지번/도로명</label>
                                            <div class="col-lg-10 control-wrap">
                                                <div class="input-group">
                                                    <input name="ctl00$ContentPlaceHolder1$TextDong2" type="text" id="TextDong2" class="form-control" /> 
						                    <span class="input-group-btn">
                                                
                                                    <a onclick="return zip_search2(document.forms[0].TextDong2);" id="ctl00_ContentPlaceHolder1_LinkButton1" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$LinkButton1&#39;,&#39;&#39;)">

							                            <btn class="btn small grey" type="button"> 우편번호검색</btn>

                                                     </a> 
						                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    

                                    <div class="table-responsive">
                                        <table class="table table-hover table-zipcode text-center">
                                            <thead>
                                            <tr>
                                                <th>주소</th>
                                                <th>우편번호</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                                     
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- /.table-responsive -->

                                </div>
                            </div>
                        </div>
                    
                    
</div>
            </div>

    
<!-- modal -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    
            <div id="ctl00_ContentPlaceHolder1_UpdatePanel4">
	

                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" id="closemodal1"  data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">닫기</span></button>
                                <h4 class="modal-title" id="myModalLabel">우편번호검색</h4>
                            </div>
                            <div class="modal-body">
                                
                                    <div class="form-group">
                                        <label class="col-lg-2 control-label">지번/도로명</label>
                                        <div class="col-lg-10 control-wrap">
                                            <div class="input-group">
						                        <input name="ctl00$ContentPlaceHolder1$TextDong1" type="text" id="TextDong1" class="form-control" />
						                <span class="input-group-btn">
                                            
                                                    <a onclick="return zip_search1(document.forms[0].TextDong1);" id="ctl00_ContentPlaceHolder1_LinkAddr1" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$LinkAddr1&#39;,&#39;&#39;)">

							                            <btn class="btn small grey" type="button"> 우편번호검색</btn>

                                                     </a>
                    
                                             
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                

                                <div class="table-responsive">
                                    <table class="table table-hover table-zipcode text-center">
                                        <thead>
                                        <tr>
                                            <th>주소</th>
                                            <th>우편번호</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                                     
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.table-responsive -->

                            </div>
                        </div>
                    </div>
                    
</div>
</div>

<script src="js/bootstrap.min.js"></script>
 

        

<script type="text/javascript">
//<![CDATA[
load_datetime('','');//]]>
</script>
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




<html>
<script>
	$(document).ready(function(){
				
		/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
		};  
		
		//지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		//주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		//주소로 좌표를 검색합니다
		geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {
		
		// 정상적으로 검색이 완료됐으면 
		 if (status === kakao.maps.services.Status.OK) {
		
		    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			alert(coords);
		    // 결과값으로 받은 위치를 마커로 표시합니다
		    var marker = new kakao.maps.Marker({
		        map: map,
		        position: coords
		    });
		
		    // 인포윈도우로 장소에 대한 설명을 표시합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
		    });
		    infowindow.open(map, marker);
		
		    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		    map.setCenter(coords);
		}
		 else{
			 alert(안되네);
		 }
	});     */
});
		
	function goMainPage(){
		location.replace("/support/userMainPage.do");

	}
</script>
<script>
function reservationCheck() {
		alert(1);
		alert($("[name=carReservationForm]").serialize());
		$.ajax({
			url:"/support/reservationCheck.do",
			type:"post",
			data: $("[name=carReservationForm]").serialize(),
			datatype:"html",
			
			success:function(data){
				if(data==1){
					alert("예약신청 성공!");
					location.replace("/support/userMainPage.do");
					
				}
				else if(data==0){
					alert("예약신청 도중 오류발생.");
				}
				else if(data==-2){
					alert("예약가능한 차량이 없습니다. 날짜나 차량종류를 변경해주세요.");
				}
				else{
					alert("예약실패");
				}
			},
			error : function(){
				alert("서버 접속 실패!");
			}
			
		}); 

	}
</script> <!-- Jquery JS-->
   
<head>
   
    <!-- Title Page-->
    <title>회원가입</title>
    
    <!-- 신청 날짜 달력 코드 -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />
        <script src="http://code.jquery.com/jquery-1.8.3.js"></script>
        <script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
        <link rel="stylesheet" href="/resources/demos/style.css" />

        <script type="text/javascript">
            $(function() { 
            $("#datepicker").datepicker({
            dateFormat: 'yymmdd',
            monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNamesMin: ['일','월','화','수','목','금','토'],
                changeMonth: true, //월변경가능
                changeYear: true, //년변경가능
                showMonthAfterYear: true, //년 뒤에 월 표시
            });
            });
    	</script>


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
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="/support/resources/css2/main.css">
    
    
</head>

<body>
    <div class="page-wrapper bg-gra-03 p-t-45 p-b-50">
        <div class="wrapper wrapper--w790">
            <div class="card card-5">
           
                <div class="card-heading">
                    <h2 class="title">예약신청</h2>
                </div>
                <div class="card-body">
                
                   
                    
                    <!-- ----------------------------------------------------------------------------------------------- -->
                    
                      <form name="carReservationForm" method="POST">
                        
                         <div class="form-row m-b-55">
                            <div class="name">출발지</div>
                            <div class="value">
                                <div class="row row-refine">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                      						  <input class="input100 input--style-5" id="startpostal_code"  type="text" name="start_postal_code" >
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code('start')" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="startroad_addr"  type="text" name="start_road_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="startjibun_addr" type="text" name="start_jibun_addr" >
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="startdetail_addr"  type="text" name="start_detail_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        </div>
                                
                                </div>
                            </div>
                        </div> 
                      
                      	<input type="hidden" name="startLatitude" id="startLatitude">
                      	<input type="hidden" name="startLongitude" id="startLongitude">
                      	
                         <div class="form-row m-b-55">
                            <div class="name">도착지</div>
                            <div class="value">
                                <div class="row row-refine">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                      						  <input class="input100 input--style-5" id="endpostal_code"  type="text" name="end_postal_code" >
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                        					<input type="button" class="login100-form-btn btn btn--radius-2 btn--red" onclick="searchPostal_code('end')" value="주소검색">
                                            
                                           <span class="focus-input100"></span>
                                          
                                        </div>
                                         <div class="wrap-input40 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="endroad_addr"  type="text" name="end_road_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        
                                        </div>
                                        
                                 			  &nbsp;&nbsp;&nbsp;
                                          <div class="wrap-input50 input-group-desc">
                    					<input class="input100 input--style-5" id="endjibun_addr" type="text" name="end_jibun_addr" >
                                            
                                           <span class="focus-input100"></span>
                                          
										<span id="guide" style="color:#999;display:none"></span>
                                        </div>
                                        <div class="wrap-input100 input-group-desc">
                                        
                       					<input class="input100 input--style-5" id="edndetail_addr"  type="text" name="end_detail_addr" >
                       					
                                           <span class="focus-input100"></span>
                                        </div>
                                
                                </div>
                            </div>
                        </div> 
                        
                        
                      	<input type="hidden" name="endLatitude" id="endLatitude">
                      	<input type="hidden" name="endLongitude" id="endLongitude">
                        <!-- 
                        <div class="form-row m-b-55">
                            <div class="name">지도확인</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                                       
										<div id="map" style="width:100%;height:350px;"></div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div> -->
                         <div class="form-row m-b-55">
                            <div class="name">차량종류</div>
                            <div class="value">
                                <div class="row row-space">
                                    <div class="input-group wrap-input100">
                               			 <label class="radio-container m-r-55">슬로프
                                   		 <input type="radio" checked="checked" name="car_code" value="1">
                                    		<span class="checkmark"></span>
                               			 </label>
                               			 <label class="radio-container m-r-55">리프트
                                   		 <input type="radio"  name="car_code" value="2">
                                    		<span class="checkmark"></span>
                               			 </label>
                                </div>
                               </div>
                            </div>
                        </div>
                        
                        
                         <div class="form-row m-b-55">
                            <div class="name">예약일시</div>
                            <div class="value">
                                <div class="row row-refine">
                                 	 
                                        <div class="wrap-input40 input-group-desc">
                                        
                                            <input class="input100 input--style-5" type="text" id="datepicker" name="car_reservation_date" placeholder="날짜선택▼">
                                            
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input50 input-group-desc">
                                            <div class="rs-select2 js-select-simple select--no-search">
                                        	<select name="car_reservation_hour">
                                            <option disabled="disabled" selected="selected" value="">시간을 선택해주세요</option>
                                            <option value="08">오전8시</option>
											<option value="10">오전10시</option>
											<option value="12">오후12시</option>
											<option value="14">오후2시</option>
											<option value="16">오후4시</option>
											<option value="18">오후6시</option>
                                        </select>
                                        <div class="select-dropdown"></div>
                                    </div>
                                        </div>
                                </div>
                            </div>
                        </div>
                        
                        
						                        
						<script>
						
						</script>
                        
                        
                        
                       <div class="form-row m-b-55">
                                 	 
                                           <div class="wrap-input40 input-group-desc">
                                           
                            <input type="button" class=" login100-form-btn btn btn--radius-2 btn--red" onclick="reservationCheck();" value="예약신청">
                                           <span class="focus-input100"></span>
                                    
                                        </div>
                                 
                                 			  &nbsp;&nbsp;&nbsp;
                                        <div class="wrap-input40 input-group-desc">
                                        
               						 
                            <input type="button" class="login100-form-btn btn btn--radius-2 btn--green" type="button" onclick="goMainPage();" value="취소">
                               <span class="focus-input100"></span>
                          </div>           
                       </div>    
                    </form>
                </div>
            </div>
        </div>
    </div>

   

</body>
</html>