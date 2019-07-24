<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>

<html>
<script>

      $(document).ready(function(){
		alert(${discontentSearchDTO.selectPageNo});
    	inputData("selectPageNo","${discontentSearchDTO.selectPageNo}");
  		inputData("keyword","${discontentSearchDTO.keyword}");
  		$(".pagingNumber").html(
  				getPagingNumber(
  				"${adminDiscontentListAllCnt}", // 검색 결과 총 행 개수
  				"${discontentSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
  				"10", // 페이지 당 출력행의 개수
  				"10", // 페이지 당 보여줄 페이징번호 개수
  				"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
  				)
  			);
      $('.slider_box .slider_main').bxSlider({loop:true, auto:true});

	

		//***********************************************************
		// name=boardRegForm 을 가진 form 태그와
		// name=boardContentForm 을 가진 form 태그를 안보이게 하기
		//***********************************************************
		$("[name=discontentRegForm], [name=discontentContentForm]").hide();
		
		
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

  	

  	function goAdminDiscontentContentForm(data){
  		document.adminDiscontentContentForm.adminDiscontent_no.value=data;
  		document.adminDiscontentContentForm.submit();
  	}
  	function goSearch(){
		alert(1);
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.adminDiscontentSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword]");
		inputData("selectPageNo","1");
		document.adminDiscontentSearchForm.submit();
	}
    </script>
    <script>

          if (/Android/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else if (/iPhone|iPad|iPod/i.test(navigator.userAgent)) {
              window.document.location.href = "/NotFound.aspx";
          } else {
              // 그 외 디바이스
          }
     </script>



<head>
</head>
<body>
	<div id="wrap">
		<!--head-->


		<!--head end-->


		<!--container-->
		<div id="container">
			<div class="banner_box">
				<center>
					<div class="img">
						<img src="/support/resources/imagesUserMain1/banner2.png"
							alt="banner" />
					</div>
				</center>
			</div>



			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<h2 class="h2tit">불만게시판</h2>
					</div>
					<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 60%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">날짜</th>
							<th scope="col">조회수</th>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.adminDiscontentList}" var="adminDiscontent" varStatus="loopTagStatus">
						<!--boardList는 BoardListFormAction에 request.setAttribute("boardList", boardList);에서 "boardList" 요고다-->
						<!--board 는 지역변수-->
						<tr style="cursor: pointer" onClick="goAdminDiscontentContentForm(${adminDiscontent.discontent_no});">
							<td class="txt_center">${adminDiscontentListAllCnt-(discontentSearchDTO.selectPageNo*10-10+1+loopTagStatus.index)+1}
							<td class="txt_left"><c:if test="${adminDiscontent.print_no > 1 }">
									<c:forEach begin="1" end="${adminDiscontent.print_no }">
									&nbsp;
									</c:forEach>
									답변:
									</c:if> ${adminDiscontent.discontent_subject} 
									<c:choose>
									<c:when test="${adminDiscontent.print_no==1}">
										<td class="txt_center">${adminDiscontent.user_name}
									</c:when>
									<c:otherwise>
										<td class="txt_center">${adminDiscontent.admin_name}
												</c:otherwise>
										</c:choose>
										<td class="txt_center">${adminDiscontent.reg_date}
										<td class="txt_center">${adminDiscontent.readcount}<!-- readcount는 BoardDAO에 getBoardList에 while문안에 "readcount" 요고다 -->
						</tr>
								</c:forEach>
							
						</tbody>
					</table>
					${requestScope.adminDiscontentListAllCnt==0?'검색된 글이 없습니다.':''}
					<div class="paging">
					<center>
					<table>
						<tr>
						<td align="center"><span  class="pagingNumber"></span>
					</table>
					</center>
					</div>
					<div class="btn_box">
					
						<form name="adminDiscontentSearchForm" method=post action="/support/adminDiscontentListForm.do">
							<input type="hidden" name="selectPageNo">
							<input type="text" name="keyword" style="height:40px">
							
							<a href="javascript:goSearch();" class="btn middle white radius-5">검색</a>
							
							<a href="javascript:goDiscontentRegForm();" class="btn middle white radius-5">새 글쓰기</a>
						</form>

					</div>
				</div>
			</div>
		</div>
		<!--container end-->

		<!--foot-->
		<!--foot end-->
	</div>
	<form name="adminDiscontentRegForm" method="post" action="/support/adminDiscontentRegForm.do"></form>
	<form name="adminDiscontentContentForm" method="post" action="/support/adminDiscontentContentForm.do">
		<input type="hidden" name="adminDiscontent_no">
	</form>
	
</body>
</html>