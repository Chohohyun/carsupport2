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
      	inputData("selectPageNo","${qnaSearchDTO.selectPageNo}");
    		inputData("keyword","${qnaSearchDTO.keyword}");
    		inputData("question_group_no","${qnaSearchDTO.question_group_no}");
    		if(${qnaSearchDTO.question_group_no}==1){
    			$("#q2").css("color","gray");	
    			$("#q1").css("color","black");
        	}
    		else{
    			$("#q1").css("color","gray");	
    			$("#q2").css("color","black");
        	}
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
	  function goqnaRegForm()
      {
   	  location.replace("/support/qnaRegForm.do")
      }
    
      function goQnaUpDelForm(data) {
   	   
  		document.qnaUpDelForm.question_no.value=data;
  		document.qnaUpDelForm.submit(); 
  		}
	
    </script>
    
     

  </head>
  <body>
    <div id="wrap">
      <!--head-->
      	<c:choose>
      		<c:when test="${sessionScope.idChk==1}">
      		<%@include file="adminMainPage.jsp"%>
      		</c:when>
      		<c:when test="${sessionScope.idChk==3}">
      		<%@include file="title.jsp"%>
      		</c:when>
      		<c:when test="${sessionScope.idChk==5}">
      		<%@include file="title2.jsp"%>
      		</c:when>
      		<c:otherwise>
      		<%@include file="title.jsp"%>
      		</c:otherwise>
      	</c:choose>
      
      <!--head end-->


    <!--container-->
    <div id="container">
        <div class="banner_box">
            <center><div class="img"><img src="/support/resources/imagesUserMain1/banner2.png" alt="banner" /></div></center>
        </div>

         

        <div class="sub_cont container">
            <div class="cont_box">
              <div class="tit_box">
                <h2 class="h2tit"><a id="q1" href="javascript:goQnaList('1');" >공지사항 </a> / <a id="q2" href="javascript:goQnaList('2');" >Q & A</a> </h2>
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
					<c:choose>
						<c:when test="${sessionScope.idChk!=1}">
							<tr style="cursor: pointer" onClick="goQnaContentForm(${qna.question_no});">
						</c:when>
						<c:otherwise>
						<tr style="cursor: pointer"onClick="goQnaUpDelForm(${qna.question_no});">
						</c:otherwise>
						</c:choose>
						
					
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
							<a href="javascript:goSearchAll();" class="btn middle white radius-5">전부검색</a>
							<c:if test="${sessionScope.idChk==1}">
		
							<a href="javascript:goqnaRegForm();" class="btn middle white radius-5">글쓰기</a>
							</c:if>
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
		<form name="qnaUpDelForm" method="post"
			action="/support/qnaUpDelForm.do">
			<input type="hidden" name="question_no">
		</form>
		
    <!--container end-->


 

        
        <!--foot-->
       	<c:if test="${sessionScope.idChk!=1}">
		
        <%@include file="foot.jsp"%>
		</c:if>
        <!--foot end-->
      </div>

  </body>
</html>


