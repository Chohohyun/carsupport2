<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="common.jsp" %>
<c:if test="${sessionScope.idChk!=1}">

	<script>
		alert("관리자로 로그인 요망");
		location.replace("/support/loginForm.do");
	</script>
</c:if>