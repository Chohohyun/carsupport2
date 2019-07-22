<!--  현재 이 jsp 페이지 실행 후 생성되는 문서는 html 이고 이문서는 utf-8 방식으로 인코딩한다. -->

<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- jsp 기술의 한 종류인 include Directive를 이용하여 common.jsp 파일 내의 소스를 삽입하기 -->
<%@include file="common.jsp" %>
<%@include file="driverMainPage.jsp" %>
<html>
<script>
	

</script>
<head>

    
        
</head>
    <body>
    <center><br><h3>차량 정보 UI</h3><br>
       <table border=2	class="" cellpadding=5	cellspacing=0> 
            <tr>
            	<th width=200 height=30>차량번호
            	<td width=200 align=center>${carDTO.car_number} 
            <tr> 
            	<th width=200 height=30>남은 차량 연식
            	<td width=200 align=center>${carDTO.car_year} 년
             <tr> 
            	<th width=200 height=30>정비까지 남은 KM
            	<td width=200 align=center >${carDTO.car_distance} KM
             <tr> 
            	<th width=200 height=30>차량 종류
				<td  width=200 align=center>${carDTO.car_code}
 				
	 
		</table>

</center>
    </body>
</html>