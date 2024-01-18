<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@page import="com.itwill.shop.order.pay.Payment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	
</script>
<head>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
	return;
}
PaymentService paymentServcie = new PaymentService();
CartService cartService = new CartService();
OrderService orderService = new OrderService();
String paymentStr = (String) session.getAttribute("payment");
String cardAccountNo = "";
if (paymentStr != null && paymentStr.equals("카드")) {
	cardAccountNo = (String)session.getAttribute("payNo");
} else if (paymentStr != null && paymentStr.equals("계좌이체")) {
	cardAccountNo = (String)session.getAttribute("payNo");
} else {
	response.sendRedirect("shop_main.jsp");
	return;
}
Order order = (Order) session.getAttribute("order");
String[] cartNoList =(String[])session.getAttribute("cartNoList");
Payment payment = new Payment(0, paymentStr, new Date(), cardAccountNo, new Order(1));
/* int paymentNo = paymentServcie.insertPayment(new Payment(0, payment, new Date(), cardAccountNo, new Order(1)));
Payment findPayment = paymentServcie.findPaymentByPaymentNo(paymentNo);
order.setPayment(findPayment);
int orderNo = orderService.insertOrder(order);
if (orderNo == order.getOrderNo()) {
	List<OrderItem> oiList = order.getOrderItems();
	boolean isAllInserted = true;
	for(int i = 0; i<oiList.size(); i++){
		oiList.get(i).setOrder(new Order(orderNo));
		int rowCount =orderService.insertOrderItem(oiList.get(i));
		if(cartNoList.size()!=0){
		cartService.deleteCartByCartNo(cartNoList.get(i));
		}
		if(rowCount!=1){
			isAllInserted = false;
			break;
		}
	}
	if(isAllInserted==false){ */
		/* <script>
		location.href = "index.jsp";
		window.alert('결제 실패');
	</script> */

	/* } */
	if(orderService.insertOrder(order, payment, cartNoList)==1){
%>
<script>
	window.opener.location.href = "shop_main.jsp";
	window.alert('주문 완료');
	window.close();
</script>
<%
return;
} else {
%><script>
		location.href = "index.jsp";
		window.alert('결제 실패');
	</script>
<%
}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제</title>
</head>
<body>
</body>
</html>