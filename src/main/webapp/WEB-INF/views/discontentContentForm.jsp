<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp"%>
<!-- 게시판에 보이는 글이 내가 클릭하기 직전에 삭제되었으면 경고를 띄우고  게시판 목록보기 화면으로 이동하기-->
<c:if test="${empty discontentDTO}">
	<script>
      alert("게시판 글이 삭제되었습니다");
      document.discontentListForm.submit();
   </script>
</c:if>

<html>
<head>
<title>게시판</title>
<script>
      
      
      // 게시판 수정화면으로 이동하는 함수 선언
      function goDiscontentUpDelForm() {
         if("${sessionScope.id}"!="${discontentDTO.user_id}"){
        	 alert("자신의 게시물이 아닙니다.");
        	 return;
         }
         if(confirm("수정/삭제로 이동하시겠습니까?") == false) {return;}
         // name=boardUpDelForm 을 가진 form 태그의 action 값 url로 서버에 접속
         document.discontentUpDelForm.submit();
         
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
								<th scope="row">제목</th>
								<td>${discontentDTO.discontent_subject}</td>
								<th scope="row">작성일</th>
								<td>${discontentDTO.reg_date}</td>
							</tr>
							<tr>
							<th scope="row">작성자</th>
							  <c:if test="${discontentDTO.print_no==1}">
           						 <td>${discontentDTO.user_name}
					            </td>
					            </c:if>
					            <c:if test="${discontentDTO.print_no==2}">
					            <td>${discontentDTO.admin_name}
					            </td>
					            </c:if>
					        <th>
					        	조회수
					        </th>
					        <td>${discontentDTO.readcount}
					        </td>
					     
							</tr>
							
							<tr>
							<th scope="row">내용</th>
							<td colspan="3">${discontentDTO.discontent_content}
							</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn_box">
					<c:choose>
						<c:when test="${discontentDTO.print_no==1}">
							<a href="javascript:goDiscontentUpDelForm();" class="btn middle white radius-5">수정/삭제</a>
							<a href="javascript:document.discontentListForm.submit();" class="btn middle white radius-5">목록</a>
							
						</c:when>
				
						<c:otherwise>
							<a href="javascript:document.discontentListForm.submit();" class="btn middle white radius-5">목록</a>
						</c:otherwise>
					</c:choose>
						


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
	<form name="discontentListForm" method="post" action="/support/discontentListForm.do"></form>


	<!--************************************************************************ -->
	<!-- 수정/삭제 화면으로 이동하기 위한 form 태그 선언-->
	<!--************************************************************************ -->
	<form name="discontentUpDelForm" method="post" action="/support/discontentUpDelForm.do">
		<!-- 게시판 상세보기 화면을  구성하는 글의 고유번호를 hidden 태그에 저장한다-->
		<!-- 수정/삭제를 하려면 현재 글의 고유번호를 알아야 하기 때문이다-->
		<input type="hidden" name="discontent_no" value="${discontentDTO.discontent_no}">
	</form>
</body>