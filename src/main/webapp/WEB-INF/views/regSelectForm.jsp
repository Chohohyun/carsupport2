<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>


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
	  	//***********************************************************
	  	// body 태그안의 모든 태그를 읽어들인 후 실행할 자스 코딩 설정
	  	//***********************************************************
  		// name=boardRegForm 을 가진 form 태그와
  		// name=boardContentForm 을 가진 form 태그를 안보이게 하기
  		//***********************************************************
  		$("[name=RegTypeForm]").hide();
      
      });


    </script>
    

      <script type="text/javascript" language="javascript">
    	
    	function goRegTypeForm(data){
    		document.goRegTypeForm1.regType.value=data;
    		document.goRegTypeForm1.submit();
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
                       <center><div class="img"><img src="/support/resources/imagesUserMain1/headReg.png" alt="banner" /></div>
                    <div class="item">
						<a href="javascript:goRegTypeForm('1');"> <img
							src="/support/resources/imagesUserMain1/userReg.png" alt="banner" />
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="javascript:goRegTypeForm('2');"> <img
							src="/support/resources/imagesUserMain1/driverReg.png" alt="banner" />
						</a>
					</div>
                    </div>
                </div>
             
            </div>
        </div>
    </div>
    <!--container end-->

 

        </form>
        
        <!--foot-->
       <%@include file="foot.jsp"%>
        <!--foot end-->
      </div>
    </div>
    <form name="goRegTypeForm1" method="post" action="/support/regTypeForm.do">
		<input type="hidden" name="regType">
	</form> 
  </body>
</html>