<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>

<html xmlns="https://www.w3.org/1999/xhtml">
<head>
<title>KOSMO 교통약자 이동지원센터</title>

<script type="text/javascript">
      $(document).ready(function(){
    	inputData("selectPageNo","${reserveSearchDTO.selectPageNo}");
  		
  		$(".pagingNumber").html(
  				getPagingNumber(
  				"${reserveListAllCnt}", // 검색 결과 총 행 개수
  				"${reserveSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
  				"5", // 페이지 당 출력행의 개수
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
  	function goSearch(){
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.reserveSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		inputData("selectPageNo","1");
		document.reserveSearchForm.submit();
	}
    </script>



</head>
<body>
	<div id="wrap">
		<!--head-->

		<%@include file="title2.jsp"%>

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
						<h2 class="h2tit">예약현황</h2>
					</div>
					<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<th scope="col">번호</th>
							<th scope="col">출발지</th>
							<th scope="col">목적지</th>
							<th scope="col">예약시간</th>
							<th scope="col">예약자</th>
							<th scope="col">비고</th>
						</thead>
						<tbody>
						
							<c:forEach items="${requestScope.reserveList}"
								var="reserve" varStatus="loopTagStatus">
								<!--boardList는 BoardListFormAction에 request.setAttribute("boardList", boardList);에서 "boardList" 요고다-->
								<!--board 는 지역변수-->
								<tr>
									<td class="txt_center">${reserveListAllCnt-(reserveSearchDTO.selectPageNo*5-5+1+loopTagStatus.index)+1}
									<td>${reserve.reservation_date}
									<td>${reserve.start_road_addr}
									<td>${reserve.end_road_addr}
									<td>${reserve.user_name}
									<td>
						
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<center>
					${requestScope.reserveListAllCnt==0?'검색된 주행기록이 없습니다.':''}
					</center>
					<div class="paging">
					<center>
					<table>
						<tr>
						<td align="center"><span class="pagingNumber"></span>
					
							</table>
					</center>
					</div>
					<div class="btn_box">
					
						<form name="reserveSearchForm" method=post
							action="/support/driverReservationSituation.do">
							<input type="hidden" name="selectPageNo">
							<!-- 
							<a href="javascript:goSearch();"
								class="btn middle white radius-5">검색</a>
							
							<a href="javascript:goDiscontentRegForm();"
								class="btn middle white radius-5">새 글쓰기</a> -->
						</form>

					</div>
				</div>
			</div>
		</div>
		<!--container end-->





		<!--foot-->
		<%@include file="foot.jsp"%>
		<!--foot end-->
	</div>
	
				
	
</body>
</html>