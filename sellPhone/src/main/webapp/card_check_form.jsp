<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<%-- <%
boolean isChecked=false;
if(request.getParameter("accountNo")!=null){
	isChecked=true;
}
%> --%>
<script type="text/javascript">
function cancel(){
	opener.document.getElementById("cardCk").checked=false;
	window.close();
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body onload="document.getElementById('input_cartNo').focus();">
<form method="POST" action="card_check_action.jsp" name="card_check_f" id="card_check_f">
	카드 결제<br>
	<table>
		<tr>
			<td>카드번호</td>
			<td><input type="text" id="input_cartNo" name="cardNo"></td>
		</tr>
		<tr>
			<td>유효기간</td>
			<td>
			<input type="text" name="cardExpireYear" value="YYYY" onclick="this.value='';">
			<input type="text" name="cardExpireMonth" value="MM" onclick="this.value='';">
			<input type="text" name="cardExpireDay" value="DD" onclick="this.value='';">
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="cardOwner"></td>
		</tr>
	</table>
	<button type="submit">다음</button>
	<button type="button" onclick="cancel()">취소</button>
</form>
</body>
</html>