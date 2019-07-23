<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>

<html>
<script>
	$(document).ready(function() {
		inputData("selectPageNo","${utilizationSearchDTO.selectPageNo}");
  		$(".pagingNumber").html(
  				getPagingNumber(
  				"${userUtilDetailListAllCnt}", // 검색 결과 총 행 개수
  				"${utilizationSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
  				"10", // 페이지 당 출력행의 개수
  				"10", // 페이지 당 보여줄 페이징번호 개수
  				"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
  				)
  			);
      $('.slider_box .slider_main').bxSlider({loop:true, auto:true});
		
	});
	function goReviewRegForm(number){
		alert(1);
		document.reviewRegForm.reserve_apply_car_number.value=number;
		document.reviewRegForm.submit();
		
	}
	function goReviewUpDelForm(number){
		alert(1);
		document.reviewUpDelForm.reserve_apply_car_number.value=number;
		document.reviewUpDelForm.submit();
		
	}
	function goSearch(){
		alert(1);
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.utilizationSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword]");
		inputData("selectPageNo","1");
		document.utilizationSearchForm.submit();
	}
</script>
<head>

</head>
<body>
	<div id="wrap">
		<!--head-->

		<%@include file="title.jsp"%>

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
						<h2 class="h2tit">이용내역</h2>
					</div>
					<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 5%;" />
							<col style="width: 21%;" />
							<col style="width: 21%;" />
							<col style="width: 13%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<th scope="col">번호</th>
							<th scope="col">출발지</th>
							<th scope="col">도착지</th>
							<th scope="col">예약일시</th>
							<th scope="col">운전자</th>
							<th scope="col">예약상태</th>
							<th scope="col">평점</th>
							<th scope="col">비고</th>
						</thead>
						<tbody>
						
						<c:forEach items="${userUtilDetailList}" var="user" varStatus="loopTagStatus">
						<tr>
							<td class="txt_center">${userUtilDetailListAllCnt-(utilzationSearchDTO.selectPageNo*10-10+1+loopTagStatus.index)+1}</td>
							<td class="txt_center">${user.start_road_addr}</td>
							<td class="txt_center">${user.end_road_addr}</td>
							<td class="txt_center">${user.reservation_date}</td>
							<td class="txt_center">${user.driver_name}</td>
							<td class="txt_center">${user.reserve_status_name}</td>
							<td class="txt_center">${user.review_score}</td>
							<c:choose>
								<c:when test="${user.review_score=='미평가'}">
									<td class="txt_center"><a href="javascript:goReviewRegForm(${user.reserve_apply_car_number});" class="btn middle white radius-5">리뷰등록</a></td>
															
								</c:when>
								<c:otherwise>
									<td class="txt_center"><a href="javascript:goReviewUpDelForm(${user.reserve_apply_car_number});" class="btn middle white radius-5">리뷰수정</a></td>
								</c:otherwise>
							</c:choose>
													
						</tr>
						</c:forEach>
						
						</tbody>
					</table>
					${requestScope.userUtilDetaiListAllCnt==0?'검색된 글이 없습니다.':''}
					<div class="paging">
					<center>
					<table>
						<tr>
						<td align="center"><span  class="pagingNumber"></span>
					</table>
					</center>
					</div>
					<div class="btn_box">
					
						<form name="utilizationSearchForm" method=post action="/support/userUtilizationDetails.do">
							<input type="hidden" name="selectPageNo">
							<input type="text" name="keyword" style="height:40px">
							
							<a href="javascript:goSearch();" class="btn middle white radius-5">검색</a>
							
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
	
		
	<form name="reviewRegForm" method="post" action="/support/reviewRegForm.do">
		<input type="hidden" name="reserve_apply_car_number" value="">
	</form>

	<form name="reviewUpDelForm" method="post" action="/support/reviewUpDelForm.do">
		<input type="hidden" name="reserve_apply_car_number" value="">
	</form>

	
</body>
</html>