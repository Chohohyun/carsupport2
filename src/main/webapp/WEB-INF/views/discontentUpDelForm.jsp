<!-- JSP 기술의 한종류인 [Page Directive]를 이용해서 현 JSP 페이지 처리 -->
<!-- 현재 JSP 페이지의 처리 방식 설정 -->
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<!--JSP 기술의 한 종류인 [Include Directive] 를 이용하여 common.jsp파일의 코드를 삽입-->
<%@include file="common.jsp" %>

<html>
<head>
   <title>게시판</title>
   <script>
      // 게시판 수정 삭제 화면에 입력된 데이터의 유효성 체크 함수 선언
      function checkDisContentUpDelForm(upDel) {
    	  if("${sessionScope.id}"!="${discontentDTO.user_id}"){
         	 alert("자신의 게시물이 아닙니다.");
         	 return;
          }
         //------------------------------------------------------------------------------------------------------------------
         // 매개변수로 들어온 upDel에 del이 저장되었으면(삭제 버튼을 눌렀다면)암호 확인하고 삭제여부 묻기
         if(upDel == "del") {
            
            //<주의>------------------------------------------------------------------------------------------------
            // 아래코드를 생략하면 수정버튼 누르고 다시 취소를 누르면 [name=upDel] 에 up 이 들어간다.
            // 그리고 삭제 버튼 누르면 여전히 up 상태이기 때문에 삭제가 되지 않는다
            document.discontentUpDelForm.upDel.value="del";
            //--------------------------------------------------------------------------------------------------------
            if( confirm("정말 삭제 하시겠습니까?")==false) { return; }
         }
         //------------------------------------------------------------------------------------------------------------------
         // 매개변수로 들어온 upDel에 up이 저장되었으면(수정 버튼을 눌렀다면)입력양식의 유효성 체크하고 수정여부 묻기
         else if(upDel=="up") {
            
          
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
            
            if(confirm("정말 수정하시겠습니까?") == false) {return;}
         }
         //----------------------------------------------------------------------
         // 현재 화면에서 페이지 이동 없이 서버쪽 "support/boardUpDelProc.do" 를 호출
         // 게시판 수정 또는 삭제 적용 개수 가 있는 html 소스를  받기
         $.ajax({
            // 호출할 서버쪽 URL 주소 설정
            url : "/support/discontentUpDelProc.do"
            // 전송방법 설정
            , type : "post"
            // 서버에 보낼 파라미터값 설정
            , data : $("[name=discontentUpDelForm]").serialize()
            , success : function( upDelCnt ) {   
            
               // 게시판 새글 입력 행 적용개수 가 한개면 메세지 띄우고 /support/boardListForm.do 로 이동
            if(upDel == "up") {
               if(upDelCnt == 1) {
               alert("수정성공!");
               document.discontentListForm.submit();
               } 
               else if (upDelCnt == -1) {
                  alert("삭제되어 수정이 불가능합니다")

                  document.discontentListForm.submit();
               } else {
                  alert("서버 DB 연동 실패!")
               }
            }   
              else if(upDel=="del") {
               if(upDelCnt == 1) {
                  alert("삭제 성공!");

                  document.discontentListForm.submit();
               } else if(upDelCnt == -1) {
                  alert("이미 삭제된 글입니다");

                  document.discontentListForm.submit();
               }else {
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



		<form  method="post" name="discontentUpDelForm" onsubmit="return false;" >
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
								<td><input type="text" 	size="40" maxlength="50" name="discontent_subject" value="${discontentDTO.discontent_subject}"></td>
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
							<td colspan="3"><textarea name="discontent_content"  rows="13"	cols="150">${discontentDTO.discontent_content}</textarea>
							</td>
							</tr>
							
						</tbody>
					</table>
					<div class="btn_box">
					
							<a href="javascript:checkDisContentUpDelForm('up');" class="btn middle white radius-5">수정</a>
							<a href="javascript:checkDisContentUpDelForm('del');" class="btn middle white radius-5">삭제</a>
							<a href="javascript:document.discontentListForm.submit();" class="btn middle white radius-5">목록</a>
							
					</div> 
				</div>
			</div>
			   <input type="hidden"      name="upDel"      value="up">
			   <input type="hidden"      name="discontent_no"      value="${discontentDTO.discontent_no}">
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