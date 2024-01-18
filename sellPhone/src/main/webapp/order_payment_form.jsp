<%@page import="com.itwill.shop.user.User"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.plan.PlanService"%>
<%@page import="com.itwill.shop.plan.Plan"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.order.pay.Payment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%-- <%@include file="login_check.jspf" %> --%>
<%
 if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("index.jsp");
	return;
} 
String buyType = request.getParameter("buyType");
String delivery = request.getParameter("delivery");
String deliveryReq = request.getParameter("deliveryReq");
String deliveryReceiver = request.getParameter("deliveryReceiver");
int orderFee = Integer.parseInt(request.getParameter("input_tot_monthly"));
String[] contacts=request.getParameterValues("contact");
Order order =(Order)session.getAttribute("order");
order.setDelivery(delivery);
order.setDeliveryReq(deliveryReq);
order.setDeliveryReceiver(deliveryReceiver);
order.setOrderFee(orderFee);
List<OrderItem> orderItems =order.getOrderItems();
for(int i=0;i<orderItems.size();i++){
	orderItems.get(i).setContact(Integer.parseInt(contacts[i]));
}
order.setOrderItems(orderItems);
session.setAttribute("order", order);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<link rel=stylesheet href="css/styles.css" type="text/css">
	<script type="text/javascript" >

</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제</title>
<script>
function openCardCheck(){
	var left = Math.ceil(( window.screen.width)/5);
	var top = Math.ceil(( window.screen.height)/5); 
	let idCheckWindow = window.open("card_check_form.jsp","checkForm","width=990,height=230,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
}
function openAccountCheck(){
	var left = Math.ceil(( window.screen.width)/5);
	var top = Math.ceil(( window.screen.height)/5); 
	let idCheckWindow = window.open("account_check_form.jsp","checkForm","width=430,height=200,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
}
function uncheckAccount(){
	document.getElementById("accountCk").checked=false;
}
function uncheckCard(){
	document.getElementById("cardCk").checked=false;
}
function whichPayment(){
	var payment=document.getElementById("cardCk").checked;
	if(payment==true){
		openCardCheck();
	}else{
		openAccountCheck();
	}
}
function cancelO(){
	if(document.getElementById('buyType').value=='fromCart'){
		location.href='cart_view.jsp';
	}else{
		location.href='product_detail.jsp?product_no=<%=orderItems.get(0).getProduct().getProductNo()%>';
	}
}
</script>
</head>
<body>
<jsp:include page="include_common_top.jsp"></jsp:include>
<h1 align="center">결제</h1>
	<div align="center" style="padding: 20px"><h3>결제수단</h3>
	<form action="order_action.jsp" method="POST">
	카드<input type="checkbox" name="payment" value="카드" id="cardCk"onchange="uncheckAccount();">
	계좌이체<input type="checkbox" name="payment" value="계좌이체" id="accountCk"onchange="uncheckCard();">
	<input type="button" name="pay" onclick="whichPayment();" value="결제하기">
	<input type="button" name="cancel" onclick="cancelO();" value="취소">
	<input type="hidden" name="cardAccountNo" id="cardAccountNo"  value="">
	<input type="hidden" name="buyType" id="buyType"  value="buyType">
	</form>
	</div>
	<jsp:include page="include_common_bottom.jsp"></jsp:include>
</body>
</html>