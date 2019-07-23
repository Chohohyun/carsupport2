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
   
    <script type="text/javascript">
      $(document).ready(function(){
    	  alert(${qnaSearchDTO.selectPageNo});
      	inputData("selectPageNo","${qnaSearchDTO.selectPageNo}");
    		inputData("keyword","${qnaSearchDTO.keyword}");
    		inputData("question_group_no","${qnaSearchDTO.question_group_no}");
    		$(".pagingNumber").html(
    				getPagingNumber(
    				"${qnaListAllCnt}", // 검색 결과 총 행 개수
    				"${qnaSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
    				"10", // 페이지 당 출력행의 개수
    				"10", // 페이지 당 보여줄 페이징번호 개수
    				"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
    				)
    			);
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

  	//**********************************************************************************
  	function goQnaContentForm(data){
  	  	alert(1);
		document.qnaContentForm.question_no.value=data;
		document.qnaContentForm.submit();
		
  	}
  	//*******************************************************************
  	// 버튼 클릭시 게시판 항목이 분류돼서 화면에 보여준다
  	//*******************************************************************
  	function goQnaList(data) {
  	  	
  		document.qnaSearchForm.question_group_no.value=data;
  		goSearch();
  	}
  	function goSearch(){
		alert(1);
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.qnaSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword]");
		inputData("selectPageNo","1");
		document.qnaSearchForm.submit();
	}
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
      
		<%@include file="title.jsp"%>
		
      <!--head end-->


    <!--container-->
    <div id="container">
        <div class="banner_box">
            <center><div class="img"><img src="/support/resources/imagesUserMain1/banner2.png" alt="banner" /></div></center>
        </div>

         

        <div class="sub_cont container">
            <div class="cont_box">
              <div class="tit_box">
                <h2 class="h2tit"><a href="javascript:goQnaList('1');" >공지사항 </a> / <a href="javascript:goQnaList('2');" >Q & A</a> </h2>
              </div>
                <table class="tbl tbl_list">
                    <colgroup>
                        <col style="width:15%;"/>
                        <col style="width:55%;"/>
                        <col style="width:15%;"/>
                        <col style="width:15%;"/>
                    </colgroup>
                    <thead>
                    	<th scope="col">번호</th>
                   	 	<th scope="col">제목</th>
                    	<th scope="col">작성자</th>
                    	<th scope="col">날짜</th>
                    </thead>
           			
                    <tbody>
					<c:forEach items="${qnaList}" var="qna" varStatus="loopTagStatus">
					<tr style="cursor: pointer" onClick="goQnaContentForm(${qna.question_no});">
						<td>${qnaListAllCnt-(qnaSearchDTO.selectPageNo*10-10+1+loopTagStatus.index)+1}</td>
						<td class="txt_left">${qna.question_subject}</td>
						<td>관리자</td>
						<td>${qna.reg_date}</td>
					</tr>
 					</c:forEach>
                    </tbody>
                </table>           
               	${requestScope.qnaListAllCnt==0?'검색된 글이 없습니다.':''}
					<div class="paging">
					<center>
					<table>
						<tr>
						<td align="center"><span  class="pagingNumber"></span>
					</table>
					</center>
					</div>
					<div class="btn_box">
					
						<form name="qnaSearchForm" method=post action="/support/qnaListForm.do">
							<input type="hidden" name="selectPageNo">
							<input type="text" name="keyword" style="height:40px">
							<input type="hidden" name="question_group_no">
							<a href="javascript:goSearch();" class="btn middle white radius-5">검색</a>
							
						</form>

					</div>
				</div>
			</div>
		</div>
    
   		 <form name="qnaOptionForm" method="post"
			action="/support/qnaListForm.do">
			<input type="hidden" name="question_group_no">
		</form>
		<form name="qnaContentForm" method="post" action="/support/qnaContentForm.do">
			<input type="hidden" name="question_no">
		</form>
    <!--container end-->


 

        
        <!--foot-->
        <%@include file="foot.jsp"%>
        <!--foot end-->
      </div>

  </body>
</html>


