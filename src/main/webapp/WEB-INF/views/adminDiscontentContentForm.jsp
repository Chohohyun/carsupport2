<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp" %>
<%@include file="adminMainPage.jsp" %>
<!-- 게시판에 보이는 글이 내가 클릭하기 직전에 삭제되었으면 경고를 띄우고  게시판 목록보기 화면으로 이동하기-->
<c:if test="${empty discontentDTO}">
	<script>
      alert("게시판 글이 삭제되었습니다");
      document.discontentListForm.submit();
   </script>
</c:if>

<html>
<head>
<title>KOSMO 교통약자 이동지원센터</title>
<script>
      
//게시판 답글 화면으로 이동하는 함수 선언
function goAdminDiscontentRegForm() {
	//
	
	
	$.ajax({
		// 호출할 서버쪽 URL 주소 설정
		url : "/support/admindiscontentRepleChk.do"
		
		// 전송방법 설정
		, type : "post"
		
		// 서버에 보낼 파라미터값 설정
		, data : $("[name=discontentRepleChkForm]").serialize()
		, datatype: "html"
		, success : function(data) {	
		 
			if(data == 0) {
				alert("이미 삭제된 게시글입니다.")
				document.discontentListForm.submit();
				
			} else if(data == 1) {
				document.adminDiscontentRegForm.submit();
			} else if(data==2){
				alert("이미 답글이 있는 게시물 입니다");
				document.discontentListForm.submit();
			
			}
			else{
				alert("서버연동 실패");
			}
		  
		} 
		// 서버의 응답을 못받았을 경우 실행할 익명함수
		, error : function() {
			alert("서버와 Ajax통신 실패");
		}
			
	});	 
	
	
} 


// 답글삭제하는 함수
	function goAdminDiscontentUpDelForm(upDel) {
		if(upDel == "del") {	
			//document.discontentUpDelForm.upDel.value="del";
		if( confirm("정말 삭제 하시겠습니까?")==false) { return; }
		}	
	//----------------------------------------------------------------------
	
	// 게시판 삭제 적용 개수가 있는 html 소스를  받기
	$.ajax({
		// 호출할 서버쪽 URL 주소 설정
		url : "/support/discontentUpDelProc.do"
		
		// 전송방법 설정
		, type : "post"
		
		// 서버에 보낼 파라미터값 설정
		, data : $("[name=adminDiscontentContentForm]").serialize()
		
		, success : function( upDelCnt ) {	
			if(upDel=="del") {
				
				// 게시판 새글 입력 행 적용개수 가 한개면 메세지 띄우고 /erp/boardListForm.do 로 이동
				if(upDelCnt >= 1) {
					alert("삭제 성공!");
					document.discontentListForm.submit();
				} else if(upDelCnt == -1) {
					alert("이미 삭제된 글입니다");
					document.discontentListForm.submit();
				} 
				 else {
					alert("서버연동 실패");
				}
			}
		}	 
		// 서버의 응답을 못받았을 경우 실행할 익명함수
		, error : function() {
			alert("서버와 통신 실패");
		}
		
	});
}	  
   
	function goAdminDiscontentEditForm() {
		document.adminDiscontentEditForm.submit();
	}
</script>
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



			<form  method="post" name="adminDiscontentContentForm" >
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
						<colgroup>
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">글번호</th>
								<td>${discontentDTO.discontent_no}</td>
								<th scope="row">작성자</th>
								<c:if test="${discontentDTO.print_no==1}">
           							 <td>${discontentDTO.user_name} </td>
            					</c:if>
            					<c:if test="${discontentDTO.print_no==2}">
           							 <td>${discontentDTO.admin_name}</td>
            					</c:if>
							</tr>
							<tr>
							<th scope="row">조회수</th>
							 
           					<td>${discontentDTO.readcount}</td>
					        <th scope="row">작성일</th>
							<td>${discontentDTO.reg_date}</td>
					        
					     
							</tr>
							<tr>
							<th scope="row">제목</th>
							<td colspan="3">${discontentDTO.discontent_subject}</td>
							</tr>
							<tr>
							<th scope="row">내용</th>
							<td colspan="3"><pre>${discontentDTO.discontent_content}</pre>
							</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn_box">
					
				      <c:choose>
				      		<c:when test="${discontentDTO.print_no==1}">
				      			<a href="javascript:goAdminDiscontentUpDelForm('del');" class="btn middle white radius-5">삭제</a>
								<a href="javascript:goAdminDiscontentRegForm();" class="btn middle white radius-5">답글달기</a>
								<a href="javascript:document.discontentListForm.submit();" class="btn middle white radius-5">목록</a>
				      		</c:when>
				      		
				      		<c:otherwise>
				      			<a href="javascript:goAdminDiscontentEditForm();" class="btn middle white radius-5">수정/삭제</a>
								<a href="javascript:document.discontentListForm.submit();" class="btn middle white radius-5">목록</a>
			
				      		</c:otherwise>
				      </c:choose>
					
					<input type="hidden"      name="upDel"      value="del">
     				<input type="hidden"      name="discontent_no"   value="${discontentDTO.discontent_no}">
      

					</div> 
				</div>
			</div>
			</form>
		</div>
		<!--container end-->

		<!--foot-->
		<!--foot end-->
	</div>

	 <!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 저장한 hidden 태그 출력하고 [게시판 목록]  화면으로 이동하는 form태그 선언-->
   <form name="discontentRepleChkForm"   method="post"   >
   <input type="hidden"		name="discontent_no"	value="${discontentDTO.discontent_no}">
   </form>
   <form name="discontentListForm"   method="post" action="/support/adminDiscontentListForm.do">
   </form>
   
   <!--************************************************************************ -->
   <!-- 답글쓰기 화면으로 이동하기 위한 form 태그 선언-->
   <!--************************************************************************ -->
   <form name="adminDiscontentRegForm"	method="post"	action="/support/adminDiscontentRegForm.do">
		<!-- 게시판 상세보기 화면을  구성하는 글의 고유번호를 hidden 태그에 저장한다-->
		<!-- 댓글을 달기위해서는 주인글의 고유번호를 알아야 하기 때문이다-->
		<input type="hidden"		name="discontent_no"	value="${discontentDTO.discontent_no}">
	</form>
   
   
   <!--************************************************************************ -->
   <!-- 수정/삭제 화면으로 이동하기 위한 form 태그 선언-->
   <!--************************************************************************ -->
   <form name="adminDiscontentEditForm"   method="post"   action="/support/adminDiscontentEditForm.do">
      <!-- 게시판 상세보기 글의 고유번호를 hidden 태그에 저장한다-->
      <!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야 하기 때문이다-->
      <input type="hidden"      name="discontent_no"   value="${discontentDTO.discontent_no}">   
   </form>
</body>
</html>