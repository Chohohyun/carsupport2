<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
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
	  	//***********************************************************
	  	// body 태그안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
	  	//***********************************************************
  		// name=boardRegForm 을 가진 form 태그와
  		// name=boardContentForm 을 가진 form 태그를 안보이게 하기
  		//***********************************************************
  		$("[name=RegForm]").hide();
      
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
    	function goRegForm(){
    		location.replace("/support/regForm.do");
    	} 


      </script>


  </head>
  <body>
    <div id="wrap">
      <!--head-->
      
		<%@include file="title.jsp"%>
		
      <!--head end-->






        <form name="aspnetForm" method="post" action="./member_join.aspx" id="aspnetForm" class="form-horizontal ">
<div>
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKMTY0MzM0MjA2OWQYAQUeX19Db250cm9sc1JlcXVpcmVQb3N0QmFja0tleV9fFgIFJWN0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkY2hlY2tBbGxvdzEFJWN0bDAwJENvbnRlbnRQbGFjZUhvbGRlcjEkY2hlY2tBbGxvdzJ5AcFLcest8EjG9B3TJhsA0/fp5QhKsAwZFG+YG1uH/g==" />
</div>

<div>

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="420C4295" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEdAAPJVVV5SQbYHhKHhg8Fldv/ovR0QqOEt9srdmuOaQgUxNbGu5KSfiHp5QIi7WK6mKN4T//tLutOj3RqOAC0XGPlMU8ajJQ6BuC3WcoY1uw6cA==" />
</div>
           
                    
    
    <script lang="ja">

        /*  유효성 체크 */
        function submitcheck() {


            if (document.getElementById('checkAllow1').checked != true) {
                alert('이용안내에 동의하셔야합니다.');
                return false;
            }
            if (document.getElementById('checkAllow2').checked != true) {
                alert('개인정보 취급방침에 동의하셔야합니다.');
                return false;
            }
            return true;
      
        }
        
        
        

    </script>

    
    <!--container-->
    <div id="container">
        <div class="banner_box">
            <center><div class="img"><img src="/support/resources/imagesUserMain1/banner2.png" alt="banner" /></div>
            <div class="container">
                <p class="tit"><br/></p>
            </div>
        </div>
        <div class="sub_cont container">
            <div class="cont_box">
                <div class="tit_box">
                    <h2 class="h2tit">회원가입</h2>
                </div>
                <div class="register_box">
                    <div class="item">
                        <h2 class="tit">이용안내 동의 관련
                            </h2>
                        <div class="txt">
                            <textarea class="txt_register" rows="8">[수집하는 개인정보의 항목 및 수집방법]

가. 수집하는 개인정보의 항목
① “행복콜”은 회원가입, 원활한 고객상담, 각종 서비스 등 기본적인 서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.

(내국인 회원가입)
- 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 주소, 핸드폰번호, 비밀번호찾기 질문답변.
- 선택항목 : 전화번호, 직업, 이메일, 이메일수신여부, SMS수신여부, 직분.

(한국어사용 외국인 회원가입)
- 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 주소, 핸드폰번호, 비밀번호찾기 질문답변
- 선택항목 : 전화번호, 직업, 이메일, 이메일수신여부, SMS수신여부, 직분.

② 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
- IP address, 쿠키, 방문일시, 서비스 이용기록


나. 개인정보 수집방법
홈페이지 회원가입, 서비스 이용, 회원정보수정

[개인정보의 수집 및 이용목적]

가. 서비스 제공에 관한 계약 이행
컨텐츠 제공, 특정 맞춤 서비스 제공, 본인인증

나. 회원관리
회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와
비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달

다. 신규 서비스 개발 및 마케팅, 광고에 활용
신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및
광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도
파악, 회원의 서비스 이용에 대한 통계

　[개인정보의 보유 및 이용기간]

“행복콜”은 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다.
회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되었거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다.
또한 관계법령의 규정에 의하여 보존할 필요가 있는 경우 “교회”는 아래와 같은 관계법령에서 정한 일정한 기간 동안 회원정보를 보관할 수 있습니다.
- 소비자의 불만, 분쟁처리에 관한 기록 : 3년(전자상거래 등에서의 소비자보호에 관한 법률)
- 본인확인에 관한 기록 : 6개월(정보통신망 이용촉진 및 정보보호 등에 관한 법률)
- 웹사이트 방문기록 : 3개월(통신비밀보호법)



제 1 조 (목적)
이 약관은 구리시 교통약자이동지원센터(이하 센터)가 제공하는 행복콜 관련 이동지원 서비스(이하 서비스)의 이용과 관련하여 센터와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"센터"라 함은 “구리시 교통약자이동지원센터”를 의미합니다.
②"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 교통약자이동지원을 의미합니다.
③"회원"이라 함은 “센터”의 "홈페이지"에 접속하여 이 약관에 따라 “센터”와 이용계약을 체결하고 “센터”가 제공하는 "서비스"를 이용하는 고객을 말합니다.
④"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 센터가 승인하는 문자와 숫자의 조합을 의미합니다.
⑤"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑥"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
제 3 조 (약관의 게시와 개정)
①"센터"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
②"센터"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
③"센터"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
④”센터”가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 “센터”는 이용계약을 해지할 수 있습니다.
제 4 조 (약관의 해석)
①"센터"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.
제 5 조 (이용계약 체결)
①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "센터"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
②"센터"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "센터"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
1.	1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "센터"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
2.	실명이 아니거나 타인의 명의를 이용한 경우
3.	허위의 정보를 기재하거나, "센터"가 제시하는 내용을 기재하지 않은 경우
4.	14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
5.	이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
③제1항에 따른 신청에 있어 "센터"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
④"센터"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "센터"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
⑥이용계약의 성립 시기는 "센터"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
⑦"센터"는 "회원"에 대해 센터정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
⑧"센터"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
제 6 조 (회원정보의 변경)
①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "센터"에 대하여 그 변경사항을 알려야 합니다.
③제2항의 변경사항을 "센터"에 알리지 않아 발생한 불이익에 대하여 "센터"는 책임지지 않습니다.
제 7 조 (개인정보보호 의무)
"센터"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "센터"의 개인정보취급방침이 적용됩니다. 다만, "센터"의 공식 사이트 이외의 링크된 사이트에서는 "센터"의 개인정보취급방침이 적용되지 않습니다.
제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
②"센터"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "센터" 및 "센터"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "센터"에 통지하고 “센터"의 안내에 따라야 합니다.
④제3항의 경우에 해당 "회원"이 "센터"에 그 사실을 통지하지 않거나, 통지한 경우에도 "센터"의 안내에 따르지 않아 발생한 불이익에 대하여 "센터"는 책임지지 않습니다.
제 9 조 ("회원"에 대한 통지)
①"센터"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
②"센터"는 "회원" 전체에 대한 통지의 경우 7일 이상 "센터"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
제 10 조 ("센터"의 의무)
①"센터"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
②"센터"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
③"센터"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
제 11 조 ("회원"의 의무)
①"회원"은 다음 행위를 하여서는 안 됩니다.
1.	신청 또는 변경 시 허위내용의 등록
2.	타인의 정보도용
3.	"센터"가 게시한 정보의 변경
4.	"센터"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5.	"센터" 와 기타 제3자의 저작권 등 지적재산권에 대한 침해
6.	"센터" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.	외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8.	센터의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9.	기타 불법적이거나 부당한 행위
②"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "센터"가 통지하는 사항 등을 준수하여야 하며, 기타 "센터"의 업무에 방해되는 행위를 하여서는 안 됩니다.
제 12 조 ("서비스"의 제공 등)
①센터는 회원에게 아래와 같은 서비스를 제공합니다.
1.	검색 서비스
2.	개방형 서비스(블로그, 카페, 미투데이(me2day.net) 등)
3.	게시판형 서비스(지식iN, 뉴스 등)
4.	메일서비스
5.	보안패치, 백신서비스
6.	기타 "센터"가 추가 개발하거나 다른 센터와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스
②센터는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.
③"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
④"센터"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "센터"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "센터"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
⑤"센터"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제 13 조 ("서비스"의 변경)
①"센터"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
②"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.
③"센터"는 무료로 제공되는 서비스의 일부 또는 전부를 센터의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.
제 14 조 (정보의 제공 및 광고의 게재)
①"센터"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.
②제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.
③"센터"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "센터"에게 할 수 있습니다.
④"이용자(회원, 비회원 포함)"는 센터가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.
제 15 조 ("게시물"의 저작권)
①"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
②"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 센터는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③"센터"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.
제 16 조 ("게시물"의 관리)
①"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "센터"는 관련법에 따라 조치를 취하여야 합니다.
②"센터"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 센터 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.
③본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "센터"가 정한 "게시중단요청서비스"에 따릅니다.

제 17 조 (권리의 귀속)
①"서비스"에 대한 저작권 및 지적재산권은 "센터"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
②"센터"는 서비스와 관련하여 "회원"에게 "센터"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠, "포인트" 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
제 18 조 (계약해제, 해지 등)
①"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "센터"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
②"회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "센터"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
③"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.
제 20 조 (이용제한 등)
①"센터"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
②"센터"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "센터"는 이에 대해 별도로 보상하지 않습니다.
③"센터"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
④"센터"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
⑤본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "센터"는 제9조["회원"에 대한 통지]에 따라 통지합니다.
⑥"회원"은 본 조에 따른 이용제한 등에 대해 "센터"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "센터"가 인정하는 경우 "센터"는 즉시 "서비스"의 이용을 재개합니다.
제 21 조 (책임제한)
①"센터"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
②"센터"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
③"센터"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
④"센터"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
⑤"센터"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
제 22 조 (준거법 및 재판관할)
①"센터"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.
②"센터"와 "회원"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
                            
                            </textarea>
                        </div>
                        <div class="agree">
                             <input id="checkAllow1" type="checkbox" name="ctl00$ContentPlaceHolder1$checkAllow1" /><label for="agree_1">위 사항에 동의합니다.</label>
                        </div>
                    </div>

                    <div class="item">
                        <h2 class="tit">개인정보취급방침</h2>
                        <div class="txt">
                            <textarea class="txt_register" rows="8">[수집하는 개인정보의 항목 및 수집방법]

가. 수집하는 개인정보의 항목
    ① “행복콜”은 회원가입, 원활한 고객상담, 각종 서비스 등 기본적인 서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.

     (내국인 회원가입)
     - 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 주소, 핸드폰번호, 비밀번호찾기 질문답변.
     - 선택항목 : 전화번호, 직업, 이메일, 이메일수신여부, SMS수신여부, 직분.

     (한국어사용 외국인 회원가입)
     - 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 주소, 핸드폰번호, 비밀번호찾기 질문답변
     - 선택항목 : 전화번호, 직업, 이메일, 이메일수신여부, SMS수신여부, 직분.

    ② 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
     - IP address, 쿠키, 방문일시, 서비스 이용기록


나. 개인정보 수집방법
     홈페이지 회원가입, 서비스 이용, 회원정보수정 

[개인정보의 수집 및 이용목적]

가. 서비스 제공에 관한 계약 이행
    컨텐츠 제공, 특정 맞춤 서비스 제공, 본인인증

나. 회원관리
    회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 
    비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달

다. 신규 서비스 개발 및 마케팅, 광고에 활용
    신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 
    광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 
    파악, 회원의 서비스 이용에 대한 통계 

　[개인정보의 보유 및 이용기간]

“행복콜”은 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다.
회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되었거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다.
또한 관계법령의 규정에 의하여 보존할 필요가 있는 경우 “교회”는 아래와 같은 관계법령에서 정한 일정한 기간 동안 회원정보를 보관할 수 있습니다.
- 소비자의 불만, 분쟁처리에 관한 기록 : 3년(전자상거래 등에서의 소비자보호에 관한 법률)
  - 본인확인에 관한 기록 : 6개월(정보통신망 이용촉진 및 정보보호 등에 관한 법률)
- 웹사이트 방문기록 : 3개월(통신비밀보호법)



제 1 조 (목적)
이 약관은 구리시 교통약자이동지원센터(이하 센터)가 제공하는 행복콜 관련 이동지원 서비스(이하 서비스)의 이용과 관련하여 센터와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"센터"라 함은 “구리시 교통약자이동지원센터”를 의미합니다.
②"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 교통약자이동지원을 의미합니다.
③"회원"이라 함은 “센터”의 "홈페이지"에 접속하여 이 약관에 따라 “센터”와 이용계약을 체결하고 “센터”가 제공하는 "서비스"를 이용하는 고객을 말합니다.
④"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 센터가 승인하는 문자와 숫자의 조합을 의미합니다.
⑤"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑥"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
제 3 조 (약관의 게시와 개정)
①"센터"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
②"센터"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
③"센터"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
④”센터”가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 “센터”는 이용계약을 해지할 수 있습니다.
제 4 조 (약관의 해석)
①"센터"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.
제 5 조 (이용계약 체결)
①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "센터"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
②"센터"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "센터"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다. 
1.	1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "센터"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
2.	실명이 아니거나 타인의 명의를 이용한 경우
3.	허위의 정보를 기재하거나, "센터"가 제시하는 내용을 기재하지 않은 경우
4.	14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
5.	이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
③제1항에 따른 신청에 있어 "센터"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
④"센터"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "센터"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
⑥이용계약의 성립 시기는 "센터"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
⑦"센터"는 "회원"에 대해 센터정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
⑧"센터"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
제 6 조 (회원정보의 변경)
①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "센터"에 대하여 그 변경사항을 알려야 합니다.
③제2항의 변경사항을 "센터"에 알리지 않아 발생한 불이익에 대하여 "센터"는 책임지지 않습니다.
제 7 조 (개인정보보호 의무)
"센터"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "센터"의 개인정보취급방침이 적용됩니다. 다만, "센터"의 공식 사이트 이외의 링크된 사이트에서는 "센터"의 개인정보취급방침이 적용되지 않습니다.
제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
②"센터"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "센터" 및 "센터"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "센터"에 통지하고 “센터"의 안내에 따라야 합니다.
④제3항의 경우에 해당 "회원"이 "센터"에 그 사실을 통지하지 않거나, 통지한 경우에도 "센터"의 안내에 따르지 않아 발생한 불이익에 대하여 "센터"는 책임지지 않습니다.
제 9 조 ("회원"에 대한 통지)
①"센터"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
②"센터"는 "회원" 전체에 대한 통지의 경우 7일 이상 "센터"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
제 10 조 ("센터"의 의무)
①"센터"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
②"센터"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
③"센터"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
제 11 조 ("회원"의 의무)
①"회원"은 다음 행위를 하여서는 안 됩니다. 
1.	신청 또는 변경 시 허위내용의 등록
2.	타인의 정보도용
3.	"센터"가 게시한 정보의 변경
4.	"센터"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5.	"센터" 와 기타 제3자의 저작권 등 지적재산권에 대한 침해
6.	"센터" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.	외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8.	센터의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9.	기타 불법적이거나 부당한 행위
②"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "센터"가 통지하는 사항 등을 준수하여야 하며, 기타 "센터"의 업무에 방해되는 행위를 하여서는 안 됩니다.
제 12 조 ("서비스"의 제공 등)
①센터는 회원에게 아래와 같은 서비스를 제공합니다. 
1.	검색 서비스
2.	개방형 서비스(블로그, 카페, 미투데이(me2day.net) 등)
3.	게시판형 서비스(지식iN, 뉴스 등)
4.	메일서비스
5.	보안패치, 백신서비스
6.	기타 "센터"가 추가 개발하거나 다른 센터와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스
②센터는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.
③"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
④"센터"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "센터"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "센터"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
⑤"센터"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제 13 조 ("서비스"의 변경)
①"센터"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
②"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.
③"센터"는 무료로 제공되는 서비스의 일부 또는 전부를 센터의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.
제 14 조 (정보의 제공 및 광고의 게재)
①"센터"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.
②제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.
③"센터"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "센터"에게 할 수 있습니다.
④"이용자(회원, 비회원 포함)"는 센터가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.
제 15 조 ("게시물"의 저작권)
①"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
②"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 센터는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③"센터"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.
제 16 조 ("게시물"의 관리)
①"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "센터"는 관련법에 따라 조치를 취하여야 합니다.
②"센터"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 센터 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.
③본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "센터"가 정한 "게시중단요청서비스"에 따릅니다.

제 17 조 (권리의 귀속)
①"서비스"에 대한 저작권 및 지적재산권은 "센터"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
②"센터"는 서비스와 관련하여 "회원"에게 "센터"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠, "포인트" 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
제 18 조 (계약해제, 해지 등)
①"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "센터"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
②"회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "센터"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
③"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.
제 20 조 (이용제한 등)
①"센터"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
②"센터"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "센터"는 이에 대해 별도로 보상하지 않습니다.
③"센터"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
④"센터"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
⑤본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "센터"는 제9조["회원"에 대한 통지]에 따라 통지합니다.
⑥"회원"은 본 조에 따른 이용제한 등에 대해 "센터"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "센터"가 인정하는 경우 "센터"는 즉시 "서비스"의 이용을 재개합니다.
제 21 조 (책임제한)
①"센터"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
②"센터"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
③"센터"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
④"센터"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
⑤"센터"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
제 22 조 (준거법 및 재판관할)
①"센터"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.
②"센터"와 "회원"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
[수집하는 개인정보의 항목 및 수집방법]

가. 수집하는 개인정보의 항목
    ① “행복콜”은 회원가입, 원활한 고객상담, 각종 서비스 등 기본적인 서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.

     (내국인 회원가입)
     - 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 주소, 핸드폰번호, 비밀번호찾기 질문답변.
     - 선택항목 : 전화번호, 직업, 이메일, 이메일수신여부, SMS수신여부, 직분.

     (한국어사용 외국인 회원가입)
     - 필수항목 : 아이디, 비밀번호, 이름, 생년월일, 주소, 핸드폰번호, 비밀번호찾기 질문답변
     - 선택항목 : 전화번호, 직업, 이메일, 이메일수신여부, SMS수신여부, 직분.

    ② 서비스 이용과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
     - IP address, 쿠키, 방문일시, 서비스 이용기록


나. 개인정보 수집방법
     홈페이지 회원가입, 서비스 이용, 회원정보수정 

[개인정보의 수집 및 이용목적]

가. 서비스 제공에 관한 계약 이행
    컨텐츠 제공, 특정 맞춤 서비스 제공, 본인인증

나. 회원관리
    회원제 서비스 이용에 따른 본인확인, 개인 식별, 불량회원의 부정 이용 방지와 
    비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달

다. 신규 서비스 개발 및 마케팅, 광고에 활용
    신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 
    광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속 빈도 
    파악, 회원의 서비스 이용에 대한 통계 

　[개인정보의 보유 및 이용기간]

“행복콜”은 회원가입일로부터 서비스를 제공하는 기간 동안에 한하여 이용자의 개인정보를 보유 및 이용하게 됩니다.
회원탈퇴를 요청하거나 개인정보의 수집 및 이용에 대한 동의를 철회하는 경우, 수집 및 이용목적이 달성되었거나 보유 및 이용기간이 종료한 경우 해당 개인정보를 지체 없이 파기합니다.
또한 관계법령의 규정에 의하여 보존할 필요가 있는 경우 “교회”는 아래와 같은 관계법령에서 정한 일정한 기간 동안 회원정보를 보관할 수 있습니다.
- 소비자의 불만, 분쟁처리에 관한 기록 : 3년(전자상거래 등에서의 소비자보호에 관한 법률)
  - 본인확인에 관한 기록 : 6개월(정보통신망 이용촉진 및 정보보호 등에 관한 법률)
- 웹사이트 방문기록 : 3개월(통신비밀보호법)


제 1 조 (목적)
이 약관은 구리시 교통약자이동지원센터(이하 센터)가 제공하는 행복콜 관련 이동지원 서비스(이하 서비스)의 이용과 관련하여 센터와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
제 2 조 (정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
①"센터"라 함은 “구리시 교통약자이동지원센터”를 의미합니다.
②"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 교통약자이동지원을 의미합니다.
③"회원"이라 함은 “센터”의 "홈페이지"에 접속하여 이 약관에 따라 “센터”와 이용계약을 체결하고 “센터”가 제공하는 "서비스"를 이용하는 고객을 말합니다.
④"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 센터가 승인하는 문자와 숫자의 조합을 의미합니다.
⑤"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
⑥"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.
제 3 조 (약관의 게시와 개정)
①"센터"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
②"센터"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
③"센터"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
④”센터”가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 “센터”는 이용계약을 해지할 수 있습니다.
제 4 조 (약관의 해석)
①"센터"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.
제 5 조 (이용계약 체결)
①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "센터"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
②"센터"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "센터"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다. 
1.	1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "센터"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
2.	실명이 아니거나 타인의 명의를 이용한 경우
3.	허위의 정보를 기재하거나, "센터"가 제시하는 내용을 기재하지 않은 경우
4.	14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
5.	이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
③제1항에 따른 신청에 있어 "센터"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
④"센터"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "센터"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
⑥이용계약의 성립 시기는 "센터"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
⑦"센터"는 "회원"에 대해 센터정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
⑧"센터"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.
제 6 조 (회원정보의 변경)
①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "센터"에 대하여 그 변경사항을 알려야 합니다.
③제2항의 변경사항을 "센터"에 알리지 않아 발생한 불이익에 대하여 "센터"는 책임지지 않습니다.
제 7 조 (개인정보보호 의무)
"센터"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "센터"의 개인정보취급방침이 적용됩니다. 다만, "센터"의 공식 사이트 이외의 링크된 사이트에서는 "센터"의 개인정보취급방침이 적용되지 않습니다.
제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)
①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
②"센터"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "센터" 및 "센터"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "센터"에 통지하고 “센터"의 안내에 따라야 합니다.
④제3항의 경우에 해당 "회원"이 "센터"에 그 사실을 통지하지 않거나, 통지한 경우에도 "센터"의 안내에 따르지 않아 발생한 불이익에 대하여 "센터"는 책임지지 않습니다.
제 9 조 ("회원"에 대한 통지)
①"센터"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
②"센터"는 "회원" 전체에 대한 통지의 경우 7일 이상 "센터"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.
제 10 조 ("센터"의 의무)
①"센터"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
②"센터"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보취급방침을 공시하고 준수합니다.
③"센터"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
제 11 조 ("회원"의 의무)
①"회원"은 다음 행위를 하여서는 안 됩니다. 
1.	신청 또는 변경 시 허위내용의 등록
2.	타인의 정보도용
3.	"센터"가 게시한 정보의 변경
4.	"센터"가 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시
5.	"센터" 와 기타 제3자의 저작권 등 지적재산권에 대한 침해
6.	"센터" 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위
7.	외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 "서비스"에 공개 또는 게시하는 행위
8.	센터의 동의 없이 영리를 목적으로 "서비스"를 사용하는 행위
9.	기타 불법적이거나 부당한 행위
②"회원"은 관계법, 이 약관의 규정, 이용안내 및 "서비스"와 관련하여 공지한 주의사항, "센터"가 통지하는 사항 등을 준수하여야 하며, 기타 "센터"의 업무에 방해되는 행위를 하여서는 안 됩니다.
제 12 조 ("서비스"의 제공 등)
①센터는 회원에게 아래와 같은 서비스를 제공합니다. 
1.	검색 서비스
2.	개방형 서비스(블로그, 카페, 미투데이(me2day.net) 등)
3.	게시판형 서비스(지식iN, 뉴스 등)
4.	메일서비스
5.	보안패치, 백신서비스
6.	기타 "센터"가 추가 개발하거나 다른 센터와의 제휴계약 등을 통해 "회원"에게 제공하는 일체의 서비스
②센터는 "서비스"를 일정범위로 분할하여 각 범위 별로 이용가능시간을 별도로 지정할 수 있습니다. 다만, 이러한 경우에는 그 내용을 사전에 공지합니다.
③"서비스"는 연중무휴, 1일 24시간 제공함을 원칙으로 합니다.
④"센터"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을 일시적으로 중단할 수 있습니다. 이 경우 "센터"는 제9조["회원"에 대한 통지]에 정한 방법으로 "회원"에게 통지합니다. 다만, "센터"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다.
⑤"센터"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에 따릅니다.
제 13 조 ("서비스"의 변경)
①"센터"는 상당한 이유가 있는 경우에 운영상, 기술상의 필요에 따라 제공하고 있는 전부 또는 일부 "서비스"를 변경할 수 있습니다.
②"서비스"의 내용, 이용방법, 이용시간에 대하여 변경이 있는 경우에는 변경사유, 변경될 서비스의 내용 및 제공일자 등은 그 변경 전에 해당 서비스 초기화면에 게시하여야 합니다.
③"센터"는 무료로 제공되는 서비스의 일부 또는 전부를 센터의 정책 및 운영의 필요상 수정, 중단, 변경할 수 있으며, 이에 대하여 관련법에 특별한 규정이 없는 한 "회원"에게 별도의 보상을 하지 않습니다.
제 14 조 (정보의 제공 및 광고의 게재)
①"센터"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할 수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을 할 수 있습니다.
②제1항의 정보를 전화 및 모사전송기기에 의하여 전송하려고 하는 경우에는 "회원"의 사전 동의를 받아서 전송합니다. 다만, "회원"의 거래관련 정보 및 고객문의 등에 대한 회신에 있어서는 제외됩니다.
③"센터"는 "서비스"의 운영과 관련하여 서비스 화면, 홈페이지, 전자우편 등에 광고를 게재할 수 있습니다. 광고가 게재된 전자우편을 수신한 "회원"은 수신거절을 "센터"에게 할 수 있습니다.
④"이용자(회원, 비회원 포함)"는 센터가 제공하는 서비스와 관련하여 게시물 또는 기타 정보를 변경, 수정, 제한하는 등의 조치를 취하지 않습니다.
제 15 조 ("게시물"의 저작권)
①"회원"이 "서비스" 내에 게시한 "게시물"의 저작권은 해당 게시물의 저작자에게 귀속됩니다.
②"회원"이 "서비스" 내에 게시하는 "게시물"은 검색결과 내지 "서비스" 및 관련 프로모션 등에 노출될 수 있으며, 해당 노출을 위해 필요한 범위 내에서는 일부 수정, 복제, 편집되어 게시될 수 있습니다. 이 경우, 센터는 저작권법 규정을 준수하며, "회원"은 언제든지 고객센터 또는 "서비스" 내 관리기능을 통해 해당 게시물에 대해 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다.
③"센터"는 제2항 이외의 방법으로 "회원"의 "게시물"을 이용하고자 하는 경우에는 전화, 팩스, 전자우편 등을 통해 사전에 "회원"의 동의를 얻어야 합니다.
제 16 조 ("게시물"의 관리)
①"회원"의 "게시물"이 "정보통신망법" 및 "저작권법"등 관련법에 위반되는 내용을 포함하는 경우, 권리자는 관련법이 정한 절차에 따라 해당 "게시물"의 게시중단 및 삭제 등을 요청할 수 있으며, "센터"는 관련법에 따라 조치를 취하여야 합니다.
②"센터"는 전항에 따른 권리자의 요청이 없는 경우라도 권리침해가 인정될 만한 사유가 있거나 기타 센터 정책 및 관련법에 위반되는 경우에는 관련법에 따라 해당 "게시물"에 대해 임시조치 등을 취할 수 있습니다.
③본 조에 따른 세부절차는 "정보통신망법" 및 "저작권법"이 규정한 범위 내에서 "센터"가 정한 "게시중단요청서비스"에 따릅니다.

제 17 조 (권리의 귀속)
①"서비스"에 대한 저작권 및 지적재산권은 "센터"에 귀속됩니다. 단, "회원"의 "게시물" 및 제휴계약에 따라 제공된 저작물 등은 제외합니다.
②"센터"는 서비스와 관련하여 "회원"에게 "센터"가 정한 이용조건에 따라 계정, "아이디", 콘텐츠, "포인트" 등을 이용할 수 있는 이용권만을 부여하며, "회원"은 이를 양도, 판매, 담보제공 등의 처분행위를 할 수 없습니다.
제 18 조 (계약해제, 해지 등)
①"회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "센터"는 관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다.
②"회원"이 계약을 해지할 경우, 관련법 및 개인정보취급방침에 따라 "센터"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시 "회원"의 모든 데이터는 소멸됩니다.
③"회원"이 계약을 해지하는 경우, "회원"이 작성한 "게시물" 중 메일, 블로그 등과 같이 본인 계정에 등록된 게시물 일체는 삭제됩니다. 다만, 타인에 의해 담기, 스크랩 등이 되어 재게시되거나, 공용게시판에 등록된 "게시물" 등은 삭제되지 않으니 사전에 삭제 후 탈퇴하시기 바랍니다.
제 20 조 (이용제한 등)
①"센터"는 "회원"이 이 약관의 의무를 위반하거나 "서비스"의 정상적인 운영을 방해한 경우, 경고, 일시정지, 영구이용정지 등으로 "서비스" 이용을 단계적으로 제한할 수 있습니다.
②"센터"는 전항에도 불구하고, "주민등록법"을 위반한 명의도용 및 결제도용, "저작권법" 및 "컴퓨터프로그램보호법"을 위반한 불법프로그램의 제공 및 운영방해, "정보통신망법"을 위반한 불법통신 및 해킹, 악성프로그램의 배포, 접속권한 초과행위 등과 같이 관련법을 위반한 경우에는 즉시 영구이용정지를 할 수 있습니다. 본 항에 따른 영구이용정지 시 "서비스" 이용을 통해 획득한 "포인트" 및 기타 혜택 등도 모두 소멸되며, "센터"는 이에 대해 별도로 보상하지 않습니다.
③"센터"는 "회원"이 계속해서 3개월 이상 로그인하지 않는 경우, 회원정보의 보호 및 운영의 효율성을 위해 이용을 제한할 수 있습니다.
④"센터"는 본 조의 이용제한 범위 내에서 제한의 조건 및 세부내용은 이용제한정책 및 개별 서비스상의 운영정책에서 정하는 바에 의합니다.
⑤본 조에 따라 "서비스" 이용을 제한하거나 계약을 해지하는 경우에는 "센터"는 제9조["회원"에 대한 통지]에 따라 통지합니다.
⑥"회원"은 본 조에 따른 이용제한 등에 대해 "센터"가 정한 절차에 따라 이의신청을 할 수 있습니다. 이 때 이의가 정당하다고 "센터"가 인정하는 경우 "센터"는 즉시 "서비스"의 이용을 재개합니다.
제 21 조 (책임제한)
①"센터"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이 면제됩니다.
②"센터"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다.
③"센터"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지 않습니다.
④"센터"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이 면제됩니다.
⑤"센터"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.
제 22 조 (준거법 및 재판관할)
①"센터"와 "회원" 간 제기된 소송은 대한민국법을 준거법으로 합니다.
②"센터"와 "회원"간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
.</textarea>
                        </div>
                        <div class="agree">
						
                             <input id="checkAllow2" type="checkbox" name="ctl00$ContentPlaceHolder1$checkAllow2" />
							 <label for="agree_2">위 사항에 동의합니다.</label>
                        </div>
                    </div>
                </div>
              <div class="btn_box">
			  
                    <a href="javascript:goRegForm();" onclick="return submitcheck()"  class="btn large blue radius-5">동의합니다</a>
                    <a href="javascript:userMainPage();" class="btn large white radius-5">취소</a> 
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
 <!--    <form name="RegForm" method="post" action="/support/RegForm.do">
	</form> -->
  </body>
</html>