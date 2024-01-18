<%@page import="com.itwill.shop.plan.PlanService"%>
<%@page import="com.itwill.shop.plan.Plan"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.order.OrderItem"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String order_noStr = request.getParameter("order_no");
int order_no = Integer.parseInt(order_noStr);
OrderService orderService = new OrderService();
Order order = orderService.findOrderByNo(order_no);
List<OrderItem> orderItems = orderService.findOrderItemsByOrder(order_no);
String payment= new PaymentService().findPaymentByPaymentNo(order.getPayment().getPaymentNo()).getPayment();
String deliveryStatus = order.getDeliveryStatus();
%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function deliveryStatusDisplay(){
	if(document.getElementById('deliveryStatus').value=='배송준비'){
		document.getElementById('deliveryStatus1').innerHTML='<img src="image/deliveryStatusDisplay.png">';
		document.getElementById('deliveryStatus2').innerHTML='';
		document.getElementById('deliveryStatus3').innerHTML='';
	}else if(document.getElementById('deliveryStatus').value=='배송중'){
		document.getElementById('deliveryStatus1').innerHTML='';
		document.getElementById('deliveryStatus2').innerHTML='<img src="image/deliveryStatusDisplay.png">';
		document.getElementById('deliveryStatus3').innerHTML='';
	}else if(document.getElementById('deliveryStatus').value=='배송완료'){
		document.getElementById('deliveryStatus1').innerHTML='';
		document.getElementById('deliveryStatus2').innerHTML='';
		document.getElementById('deliveryStatus3').innerHTML='<img src="image/deliveryStatusDisplay.png">';
	}
	
}
function order_cancel(){
	if(document.getElementById('deliveryStatus').value=='배송준비'){
		document.getElementById('order_f').action='order_delete_action.jsp';
		document.getElementById('order_f').method='POST';
		document.getElementById('order_f').submit();
	}else if(document.getElementById('deliveryStatus').value=='배송중'){
		alert('배송중엔 취소할 수 없습니다.');
	}else if(document.getElementById('deliveryStatus').value=='배송완료'){
		alert('배송완료 후엔 취소할 수 없습니다.');
	}
}
</script>
<meta charset="UTF-8">
<title>주문 상세보기</title>
</head>
<body onload="deliveryStatusDisplay();">
<form>
	<input type="hidden" id="deliveryStatus" value="<%=deliveryStatus%>">
</form>
	<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>배송상태</b></td>
								</tr>
							</table>
							<table align="center" width="80%"  border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문상세정보</caption>
									<tr>
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1 ><font
											>배송준비</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>배송중</font></td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>배송완료</font></td>
									</tr>
									
									
									<tr>
										<td width="33%" height=26 align=center bgcolor="ffffff" class=t1 id="deliveryStatus1"></td>
										<td width="33%" height=26 align=center bgcolor="ffffff" class=t1 id="deliveryStatus2"></td>
										<td width="33%" height=26 align=center bgcolor="ffffff" class=t1 id="deliveryStatus3"></td>
									</tr>
								</table> <!--form-->
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>주문상세조회</b></td>
								</tr>
							</table> <!--form-->
							<form id="order_f">
							<input type="hidden" name="order_no" value="<%=order.getOrderNo()%>">
								<table align="center" width="80%"  border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문상세정보</caption>
									<tr>
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>주문번호</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>주문일</font></td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>배송지</font></td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>수령인</font></td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>결제수단</font></td>
										<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1><font
											>비 고</font></td>
									</tr>
									
									
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1><%=order.getOrderNo()%></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=new SimpleDateFormat("yyyy/MM/dd").format(order.getOrderDate())%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=order.getDelivery()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=order.getDeliveryReceiver()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1><%=payment%></td>
										
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1>
												<input type="button" name="order_cancel_btn" id="order_cancel_btn" onclick="order_cancel();" value="주문취소">
										</td>
									</tr>
								</table>
									
								<br/>	
								<table align=center  width=80% border="0" cellpadding="0" cellspacing="1"  bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문제품목록</caption>
									<tr style="border: 0.1px solid">
										<td width=200 height=25 align=center bgcolor="E6ECDE" class=t1>상품이미지</td>
										<td width=290 height=25 align=center bgcolor="E6ECDE" class=t1>상품명</td>
										<td width=112 height=25 align=center bgcolor="E6ECDE" class=t1>요금제</td>
										<td width=100 height=25  align=center bgcolor="E6ECDE" class=t1>약정</td>
										<td width=100 height=25  align=center bgcolor="E6ECDE" class=t1>가격</td>
									</tr>
									
									<!-- orer item start -->
									<%
									for(OrderItem oi:orderItems) {
										Plan plan=oi.getPlan();
										plan = new PlanService().findPlanByNo(plan.getPlanNo());
										Product product = oi.getProduct();
										product = new ProductService().productDetail(product.getProductNo());
									%>
									<tr>
										<td width=200 height=200><img width=200 height=200 src="<%=product.getProductImage()%>" onclick="location.href='product_detail.jsp?productNo=<%=product.getProductNo()%>'"></td>
										<td width=290 height=26 align=center  bgcolor="ffffff" class=t1>
										<a href='product_detail.jsp?productNo=<%=product.getProductNo()%>'>
										<%=product.getProductName()%><br><%=product.getProductStorage()%>,<%=product.getProductColor() %></a>
										</td>
										
										<td width=112 height=26 align=center  bgcolor="ffffff" class=t1>
										<%=plan.getPlanName()%><br>
										<%=plan.getPlanDesc()%><br>
										<%=plan.getPlanFare()%>
										</td>

										<td width=100 height=26 align=center  bgcolor="ffffff" class=t1>
										<%=oi.getContact()%>개월
										</td>
										
										<td width=100 height=26 align=center bgcolor="ffffff" class=t1>
										<%=new DecimalFormat("#,###").format(product.getProductPrice())%>
										</td>
									</tr>
									<%}%>
									<!-- cart item end -->
									<tr>
										<td width=640 colspan=5 height=25  bgcolor="ffffff" class=t1>
										
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 결제 금액 : <%=new DecimalFormat("#,###").format(order.getOrderFee())%> 원
												</font>
											</p>
										</td>
									</tr>
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center> 
										&nbsp;&nbsp;<a href=my_order_list.jsp
										class=m1>주문목록</a>
										&nbsp;&nbsp;<a href=product_list.jsp
										class=m1>계속 쇼핑하기</a>

									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
</body>
</html>