<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
OrderService orderService= new OrderService();
List<Order> orderList = orderService.findOrdersById(sUserId);



%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
function my_order_view(order_no){
	location.href="my_order_view.jsp?order_no="+order_no;
}
</script>
<style>
	#my_orders_table tbody tr:hover {
		opacity: 0.7;
		font-weight:bold;
	}
</style>
<head>
<meta charset="UTF-8">
<title>주문 내역</title>
</head>
<body>
	<table border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td><br />
				<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>주문 내역</b></td>
					</tr>
				</table>
				<input type="date" name="startDate"> ~<input type="date" name="endDate">
				<button type="button" onclick="" title="orderByDate" >검색</button>

				<div id="f">
					<br />
					<table id="my_orders_table" width="100%" align="center" border="0"
						cellpadding="10" cellspacing="1" bgcolor="BBBBBB">
						<thead>
						<tr>
							<td>주문번호</td>
							<td>주문일</td>
							<td>주문가격</td>
							<td>배송지</td>
							<td>배송상태</td>
							<td>수령인</td>
							<td>배송요청사항</td>
						</tr>
						</thead>
						<tbody>
						<%for(Order order:orderList){ %>
						<tr style="cursor: pointer;" onclick="my_order_view(<%=order.getOrderNo()%>);">
							<td ><%=order.getOrderNo() %></td>
							<td><%=order.getOrderDate() %></td>
							<td><%=order.getOrderFee() %></td>
							<td><%=order.getDelivery() %></td>
							<td><%=order.getDeliveryStatus() %></td>
							<td><%=order.getDeliveryReceiver() %></td>
							<td><%=order.getDeliveryReq() %></td>
						</tr>
					<%} %>
					</tbody>
					</table>
				</div> <br /></td>
		</tr>
	</table>

</body>
</html>