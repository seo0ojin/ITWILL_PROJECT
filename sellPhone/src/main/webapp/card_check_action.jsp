<%@page import="java.awt.Window"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("pay_form.jsp");
	return;
}
String cardNo=request.getParameter("cardNo");
String cardExpireYear = request.getParameter("cardExpireYear");
String cardExpireMonth = request.getParameter("cardExpireMonth");
String cardExpireDay = request.getParameter("cardExpireDay");
String cardExpireStr= cardExpireYear+cardExpireMonth+cardExpireDay;
Date cardExpire = new SimpleDateFormat("yyyyMMdd").parse(cardExpireStr);
String cardOwner = request.getParameter("cardOwner");
PaymentService paymentService = new PaymentService();
Card card = paymentService.findCard(cardNo);
Date cardExpires = card.getCardExpire();
if(card!=null&&cardExpire.equals(cardExpires)&&cardOwner.equals(card.getCardOwner())){
	session.setAttribute("payNo", cardNo);
	session.setAttribute("payment", "카드");
	RequestDispatcher rd= request.getRequestDispatcher("order_action.jsp");
	rd.forward(request, response);
	%><script>
	window.close();
	</script>
	<%
	return;
}else{
	%>
	<script type="text/javascript">
window.alert("카드정보가 일치하지 않습니다.");
history.back();
</script>
<%}
%>

</head>
<body>

</body>
</html>