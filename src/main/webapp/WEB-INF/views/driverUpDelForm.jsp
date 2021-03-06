<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp"%>
<%@include file="adminMainPage.jsp"%>
<html>
<script>
$(document).ready(function() {
	inputData("selectPageNo","${driverSearchDTO.selectPageNo}");
	inputData("keyword","${driverSearchDTO.keyword}");
	inputData("score","${driverSearchDTO.score}");
	<c:forEach items="${driverSearchDTO.gender}" var="gender">
	inputData("gender","${gender}");
	</c:forEach>
	// 페이징 처리 관련 html 소스를 class= pagingNumber 가진 태그 안에 삽입하기
	$(".pagingNumber").html(
		getPagingNumber(
		"${upDelListAllCnt}", // 검색 결과 총 행 개수
		"${driverSearchDTO.selectPageNo}", // 선택된 현재 페이지 번호
		"5", // 페이지 당 출력행의 개수
		"10", // 페이지 당 보여줄 페이징번호 개수
		"goSearch();" // 페이지 번호 클릭 실행할 자스 코드
		)
	);
	
});
	function upDelDriver(no){
		
		
		var driver_no = no;
		
		document.upDelDriverForm.driver_no.value=driver_no;
		document.upDelDriverForm.submit();
	}
	function goSearch(){
		
		if(is_special_char("keyword")){
			alert("키워드에는 영문,숫자,한글,_ 만 가능합니다.");
			$(".keyword").val("");
			return;
		}
		
		document.driverSearchForm.submit();
		
	}
	// 모두검색 키워드 없애기
	function goSearchAll(){
		// 공용함수 setEmpty2 활용
		setEmpty2(" [name=keyword], [name=gender], [name=score]");
		inputData("selectPageNo","1");
		document.driverSearchForm.submit();
	}
</script>
<head>

<title>KOSMO 교통약자 이동지원센터</title>
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
						<h2 class="h2tit">운전자 검색</h2>
					</div>
					<form class="driverSearchForm" name="driverSearchForm" method="post" action="/support/driverUpDelForm.do">
					<table class="tbl tbl_list">
						<colgroup>
							<col style="width: 10%;" />
							<col style="width: 23%;" />
							<col style="width: 10%;" />
							<col style="width: 23%;" />
							<col style="width: 10%;" />
							<col style="width: 23%;" />
							
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">키워드</th>
								<td><input type="text" name="keyword"></td>
								<th scope="row">성별</th>
								<td>
									<input type="checkbox" name="gender" id="gender1" value="male">남자 
									<input type="checkbox" name="gender" id="gender2" value="female">여자
								</td>
								<th scope="row">평점</th>
								<td>
									<select name="score">
										<option value=""></option>
										<option value="1">1점이하</option>
										<option value="2">1점~2점</option>
										<option value="3">2점~3점</option>
										<option value="4">3점~4점</option>
										<option value="5">4점~5점</option>
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
							<col style="width: 15%;" />
							<col style="width: 15%;" />
							<col style="width: 20%;" />
							<col style="width: 20%;" />
							<col style="width: 10%;" />
							<col style="width: 10%;" />
						</colgroup>
						<thead>
							<th scope="col">번호</th>
							<th scope="col">운전자 이름</th>
							<th scope="col">ID</th>
							<th scope="col">면허증 번호</th>
							<th scope="col">휴대폰</th>
							<th scope="col">평점</th>
							<th scope="col">수정/삭제</th>
						</thead>
						<tbody>
						<c:forEach items="${requestScope.upDelList}" var="upDel" varStatus="loopTagStatus">
						<!--boardList는 BoardListFormAction에 request.setAttribute("boardList", boardList);에서 "boardList" 요고다-->
						<!--board 는 지역변수-->
						<tr>
							<td class="txt_center">${upDelListAllCnt-(driverSearchDTO.selectPageNo*5-5+1+loopTagStatus.index)+1}</td>
							<td class="txt_center">${upDel.driver_name}</td>
							<td class="txt_center">${upDel.driver_id}</td>
							<td class="txt_center">${upDel.driver_license_number}</td>
							<td class="txt_center">${upDel.driver_phone}</td>
							<c:if test="${upDel.review_score=='리뷰없음'}">
								
								<td class="txt_center">${upDel.review_score}</td>
							</c:if>
							<c:if test="${upDel.review_score!='리뷰없음'}">
								
								<td class="txt_center">${upDel.review_score}점</td>
							</c:if>
							<td class="txt_center"><a href="javascript:upDelDriver(${upDel.driver_no});" class="btn middle white radius-5">수정</a>
						</tr>
						</c:forEach>
						</tbody>
					</table>
					${requestScope.upDelListAllCnt==0?'검색된 운전자가 없습니다.':''}
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
	<form name="upDelDriverForm" method="post"
			action="/support/driverUpDelDetailForm.do">
			<input type="hidden" name="driver_no" value="">
		</form>
	
</body>
</html>
