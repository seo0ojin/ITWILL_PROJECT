<%@page import="com.itwill.shop.order.pay.Account"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("pay_form.jsp");
	return;
}
String accountNo = request.getParameter("accountNo");
String bank = request.getParameter("bank");
String accountOwner = request.getParameter("accountOwner");
PaymentService paymentService = new PaymentService();
Account account = paymentService.findAccount(accountNo);
if (account != null && account.getBank().equals(bank) && account.getAccountOwner().equals(accountOwner)) {
	session.setAttribute("payNo", accountNo);
	session.setAttribute("payment", "계좌이체");
	RequestDispatcher rd= request.getRequestDispatcher("order_action.jsp");
	rd.forward(request, response);
%><script>
		window.close();
	</script>
<%

} else {
%>
<script type="text/javascript">
	alert("계좌정보가 일치하지 않습니다.");
	history.back();
</script>
<%
}
%>

</head>
<body>

</body>
</html>