<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp" %>

<%@include file="checkUser.jsp" %>

<html>
<head>
<title>KOSMO 교통약자 이동지원센터</title>
<script>
	
	// 게시판 등록 화면에 입력된 데이터의 유효성 체크 함수 선언
	function checkDiscontentRegForm() {
		
		
		if(is_empty("discontent_subject")) {
			alert("제목을 입력하세요");
			$("[name=discontent_subject]").focus();
			return;
		}
		
		if(is_empty("discontent_content")) {
			alert("내용을 입력하세요");
			$("[name=discontent_content]").focus();
			return;
		}
		
		//-----------------------------------------------------------------------
		var content = $("[name=discontent_content]").val();
		if (content.length > 1000) {
				alert("내용은 1000자를 넘을 수 없습니다");
				return;
			} 
		
		if(confirm("정말 저장하시겠습니까?") == false) {return;}
		
		//alert($("[name=qnaRegForm]").serialize());
		//return;
		//----------------------------------------------------------------------
		// 현재 화면에서 페이지 이동 없이 서버쪽 "/support/qnaRegProc.do" 를 호출
		// 게시판 입력 행 적용 개수 가 있는 html 소스를 문자열로 받기
		$.ajax({
			// 호출할 서버쪽 URL 주소 설정
			url : "/support/discontentRegProc.do"
			
			// 전송방법 설정
			, type : "post"
			
			// 서버에 보낼 파라미터값 설정
			, data : $("[name=discontentRegForm]").serialize()
			
			, success : function( qnaRegCnt ) {
				if(qnaRegCnt == 1) {
					alert("게시판 새글 등록 성공!");
					document.discontentListForm.submit();
				}
				// [게시판 새글 입력 행 적용 개수] 가 1개가 아니면 경고하기
				else {
					alert("게시판 새글 등록 실패. 관리자에게 문의바람")
				}
			}
			
			// 서버의 응답을 못받았을 경우 실행할 익명함수
			, error : function() {
				alert("서버와 Ajax 통신 실패");
			}
			
		});
		//onClick="checkBoardRegForm()">
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
				<center>
					<div class="img">
						<img src="/support/resources/imagesUserMain1/banner2.png"
							alt="banner" />
					</div>
				</center>
			</div>



		<form  method="post" name="discontentRegForm" onsubmit="return false;" >
			<div class="sub_cont container">
				<div class="cont_box">
					<div class="tit_box">
						<span class="h2tit bg_service">불만게시판</span>
					</div>
					<table class="tbl tbl_form">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 15%;">
							<col style="width: 35%;">
						</colgroup>	
	
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td><input type="text" 	size="40" maxlength="50" name="discontent_subject"></td>
							</tr>
						
							<tr>
							<th scope="row">내용</th>
							<td colspan="3"><textarea name="discontent_content"  wrap="hard" rows="13"	cols="150"></textarea>
							</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn_box">
					
							<a href="javascript:checkDiscontentRegForm();" class="btn middle white radius-5">저장</a>
							<a href="javascript:document.discontentListForm.submit();" class="btn middle white radius-5">목록</a>
					</div>
				</div>
			</div>
			
			  
			
			</form>
		</div>
		<!--container end-->

		<!--foot-->
		<%@include file="foot.jsp"%>
		<!--foot end-->
	</div>

	<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 저장한 hidden 태그 출력하고 [게시판 목록]  화면으로 이동하는 form태그 선언-->
	<form name="discontentListForm" method="post" action="/support/discontentListForm.do"></form>


	
</body>
</html>
