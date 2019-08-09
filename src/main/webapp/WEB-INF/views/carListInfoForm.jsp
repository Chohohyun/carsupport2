<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>
<html>
<title>KOSMO 교통약자 이동지원센터</title>
<script>
$(document).ready(function() {
	inputData("keyword","${carSearchDTO.keyword}");
	inputData("car_code","${carSearchDTO.car_code}");
	inputData("selectPageNo","${carSearchDTO.selectPageNo}");
	
	// 페이징 처리 관련 html 소스를 class= pagingNumber 가진 태그 안에 삽입하기
	$(".pagingNumber").html(
		getPagingNumber(
		"${carListAllCnt}", // 검색 결과 총 행 개수
		"${carSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
		"5", // 페이지 당 출력행의 개수
		"10", // 페이지 당 보여줄 페이징번호 개수
		"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
		)
	);
	
}); //$(document).ready(function() {
	//----------------------------------------
	// 정비내역등록 화면이으로 이동
	//----------------------------------------
	function goCarMaintenanceRegForm(car_info_no){
	
		$("[name=carMaintenanceRegForm] [name=car_info_no]").val( car_info_no );
		document.carMaintenanceRegForm.submit();
	}
	function goSearch(){
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.carInfoSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword], [name=car_code]");
		inputData("selectPageNo","1");
		document.carInfoSearchForm.submit();
	}
	
	function goreset(){
		setEmpty2(" [name=keyword], [name=car_code]");
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
						<h2 class="h2tit">차량 정보</h2>
					</div>
					<form class="carInfoSearchForm" name="carInfoSearchForm" method="post" action="/support/carListInfoForm.do">
					<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 20%;" />
							<col style="width: 30%;" />
							<col style="width: 20%;" />
							<col style="width: 30%;" />
							
						</colgroup>
						
		
						<tbody>
							<tr>
								<th scope="row">키워드</th>
								<td><input type="text" name="keyword"></td>
								<th scope="row">차량종류</th>
								<td><select name="car_code">
										<option value="0"></option>
										<option value="1">슬로프</option>
										<option value="2">리프트</option>
									</select>
								</td>
								
							</tr>
							
						</tbody>
						</table>
							<input type="hidden" name="selectPageNo">
					</form>
					
					
					<div class="btn_box">
							<a href="javascript:goSearch();" class="btn middle white radius-5">검색</a>
							<a href="javascript:goSearchAll();" class="btn middle white radius-5">전부검색</a>
					</div>
				</div>
				
				
	
				<div class="cont_box">
				<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: 15%;" />
							<col style="width: 15%;" />
						</colgroup>
						<thead>
							<th scope="col">번호</th>
							<th scope="col">차량번호</th>
							<th scope="col">차량연식</th>
							<th scope="col">정비까지남은 KM</th>
							<th scope="col">차량종류</th>
							<th scope="col">정비내역등록</th>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.carList}" var="car" varStatus="loopTagStatus">
						<!--boardList는 BoardListFormAction에 request.setAttribute("boardList", boardList);에서 "boardList" 요고다-->
						<!--board 는 지역변수-->
						<tr>
							<td class="txt_center">${carListAllCnt-(carSearchDTO.selectPageNo*5-5+1+loopTagStatus.index)+1}</td>
							<td class="txt_center">${car.car_number}</td>
							
							<td class="txt_center">${car.car_year}</td>
							<c:choose>
							
								<c:when test="${car.maintance_distance<0}">
									<td class="txt_center">차량정기점검필요</td>
								</c:when>
								<c:otherwise>
									<td class="txt_center">${car.maintance_distance}km</td>
								</c:otherwise>
							</c:choose>
							
							<td class="txt_center">${car.car_code}</td>
							
							<td class="txt_center"><a href="javascript:goCarMaintenanceRegForm( ${car.car_info_no} );" class="btn middle white radius-5">정비내역등록</a></td>	
						</tr>							
					</c:forEach>
				
						</tbody>
					</table>
					${requestScope.carListAllCnt==0?'검색된 글이 없습니다.':''}
					<div class="paging">
					<center>
					<table>
						<tr>
						<td align="center"><span  class="pagingNumber"></span>
					</table>
					</center>
					</div>
				</div>
			</div>
		</div>
	</div>
		<!--container end-->'
	<form name="carMaintenanceRegForm" method="post" action="/support/carMaintenanceRegForm.do">
			<input type="hidden" name="car_info_no">
		</form>
	
</body>
</html>
 
					
  