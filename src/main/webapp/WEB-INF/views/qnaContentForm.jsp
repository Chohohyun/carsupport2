<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp"%>

<!-- 게시판에 보이는 글이 내가 클릭하기 직전에 삭제되었으면 경고를 띄우고  게시판 목록보기 화면으로 이동하기-->
<c:if test="${empty qnaDTO}">
	<script>
      alert("게시판 글이 삭제되었습니다");
      document.qnaListForm.submit();
   </script>
</c:if>

<html>
<head>
<title>게시판</title>
<script>
      
      
</script>
</head>

<body>
	<div id="wrap">
		<!--head-->
		<c:choose>
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
						<span class="h2tit bg_service">공지사항</span>
					</div>
					<table class="tbl tbl_form">
						<colgroup>
							<col style="width: 15%;">
							<col style="width: 35%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
							<col style="width: 10%;">
						</colgroup>
						
						<tbody>
							<tr>
								<th scope="row">제목</th>
								<td>${qnaDTO.subject}</td>
								<th scope="row">작성일</th>
								<td>${qnaDTO.reg_date}</td>
								<th scope="row">작성자</th>
								<td>관리자</td>
					     
							</tr>
						
							
							<tr>
							<th scope="row">내용</th>
							<td colspan="5"><pre>${qnaDTO.content}</pre>
							</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn_box">
					
							<a href="javascript:document.qnaListForm.submit();" class="btn middle white radius-5">목록</a>
					
					</div> 
				</div>
			</div>
		</div>
		<!--container end-->

		<!--foot-->
		<%@include file="foot.jsp"%>
		<!--foot end-->
	</div>

	<!-- 이전 페이지에서 온 게시판 선택 페이지 번호를 저장한 hidden 태그 출력하고 [게시판 목록]  화면으로 이동하는 form태그 선언-->
	<form name="qnaListForm" method="post" action="/support/qnaListForm.do"></form>


	
</body>