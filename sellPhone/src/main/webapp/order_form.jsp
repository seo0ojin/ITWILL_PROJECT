<%@page import="com.itwill.shop.user.UserService"%>
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
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

ProductService productService = new ProductService();
PlanService planService = new PlanService();
CartService cartService = new CartService();
String buyType = request.getParameter("buyType");
Product product = new Product();
Plan plan = new Plan();
List<Cart> cartList = new ArrayList<Cart>();

String[] cartNoList={};
List<OrderItem> orderItems = new ArrayList<OrderItem>();
int[] contacts={};


if (buyType.equals("fromProduct")) {
	String productColor = request.getParameter("selected_color_input_order");
	int planNo = Integer.parseInt(request.getParameter("selected_plan_order"));
	
	plan = planService.findPlanByNo(planNo);
	product = productService.productDetailByImage(productColor);
	Cart cart = new Cart(0, sUserId, plan, product);
	OrderItem orderItem = new OrderItem(0, 0, plan, product, null);
	orderItems.add(orderItem);
	cartList.add(cart);
} else if (buyType.equals("fromCart")) {
	cartNoList = request.getParameterValues("cartNoList");
	for (String cartNo : cartNoList) {
		Cart cart = cartService.getCartByCartId(Integer.parseInt(cartNo));
		cartList.add(cart);
		plan = cart.getPlan();
		plan = planService.findPlanByNo(plan.getPlanNo());
		product = cart.getProduct();
		product = productService.productDetail(product.getProductNo());
		OrderItem orderItem = new OrderItem(0, 0, plan, product, null);
		orderItems.add(orderItem);
	}
} else {
	response.sendRedirect("shop_main.jsp");
	return;
}

Order order = new Order(0, 0, new Date(), "", "", "", "", new User(sUserId), null, orderItems);
session.setAttribute("order", order);
session.setAttribute("cartNoList",cartNoList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel=stylesheet href="css/styles.css" type="text/css">
<script type="text/javascript">
	function calPrice(id) {
		var idx = id.charAt(13);
		var select=document.getElementById(id);
		var plan_price = document.getElementById("plan_price_value"+idx);
		var origin_price = document.getElementById("origin_price_value"+idx);
		var sale = document.getElementById("sale_value"+idx);
		var vvIdx = select.options[select.selectedIndex];
		var contact = vvIdx.value;
		let msg = sale.value+'/'+contact+'='+Math.round(sale.value/contact);
		document.getElementById("plan_price"+idx).innerHTML = plan_price.value;
		document.getElementById("origin_price"+idx).innerHTML = Math.round(origin_price.value/contact);
		document.getElementById("sale_price"+idx).innerText = msg;
		document.getElementById("monthly_price"+idx).innerHTML = Math.round(origin_price.value/contact)+parseInt(plan_price.value)-Math.round(sale.value/contact);
			calTot();
	}
	function calTot(){
		var tot_monthly = 0;
		var cartListSize = document.getElementById("cartListSize").value;
		for(i=0;i<cartListSize;i++){
			tot_monthly=tot_monthly+parseInt(document.getElementById("monthly_price"+i).innerText);
		}
		document.getElementById("tot_monthly").innerHTML=tot_monthly;
		document.getElementById("input_tot_monthly").value = tot_monthly;
	}
	
	function openCardCheck() {
		var left = Math.ceil((window.screen.width) / 5);
		var top = Math.ceil((window.screen.height) / 5);
		let idCheckWindow = window
				.open(
						"card_check_form.jsp",
						"checkForm",
						"width=990,height=230,top="
								+ top
								+ ",left="
								+ left
								+ ",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	}
	function openAccountCheck() {
		var left = Math.ceil((window.screen.width) / 5);
		var top = Math.ceil((window.screen.height) / 5);
		let idCheckWindow = window
				.open(
						"account_check_form.jsp",
						"checkForm",
						"width=430,height=200,top="
								+ top
								+ ",left="
								+ left
								+ ",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
	}

	function uncheckAccount() {
		document.getElementById("accountCk").checked = false;
	}
	function uncheckCard() {
		document.getElementById("cardCk").checked = false;
	}
	function whichPayment() {
		var payment = document.getElementById("cardCk").checked;
		if (payment == true) {
			openCardCheck();
		} else {
			openAccountCheck();
		}
	}
	function order(){
		if(document.getElementsByName('delivery')[0].value==""){
			alert('배송지를 입력하세요');
			document.getElementsByName('delivery')[0].focus();
			return false;
		}
		document.getElementById('order').action='order_payment_form.jsp';
		document.getElementById('order').method='POST';
		document.getElementById('order').submit();
		
	}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문</title>

</head>
<body><!-- onload="contactSelection()" -->
	<jsp:include page="include_common_top.jsp"></jsp:include>
	<h1 align="center">주문</h1>
	<form method="POST" action="order_payment_form.jsp" id="order" style="padding: 5%">
	<input type="hidden" id="cartListSize" value="<%=cartList.size()%>">
		<h3>주문상품 확인</h3>
		<table align=center width=100% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
			<!-- <thead> -->
			<tr>
				<td align="center" bgcolor="#e1f5e1"
											class=t1><font>제품이미지</font></td>
				<td width="200" align="center" bgcolor="#e1f5e1"
											class=t1><font>상품/요금제 정보</font></td>
				<td align="center" bgcolor="#e1f5e1"
											class=t1><font>약정</font></td>
				<td align="center" bgcolor="#e1f5e1"
											class=t1><font>상품 금액</font></td>
			</tr>
			<%
			int tot_price = 0;
			int tot_monthly = 0;
			for (int i = 0; i < cartList.size(); i++) {
				int plan_price = cartList.get(i).getPlan().getPlanFare();
				int origin_price = (int) (cartList.get(i).getProduct().getProductPrice());
				int product_price = (int) (cartList.get(i).getProduct().getProductPrice() * ((100 - plan.getPlanDc()) / 100))
				;
				int sale = origin_price - product_price;
				String msg = "";
				msg=sale+"/12="+(sale/12);
			%>
			<tr>
				<td align=center bgcolor="ffffff" class=t1>
				<input type="hidden" name="plan_price_value" id="plan_price_value<%=i%>" value="<%=plan_price%>">
				<input type="hidden" name="origin_price_value" id="origin_price_value<%=i%>" value="<%=origin_price%>">
				<input type="hidden" name="sale_value" id="sale_value<%=i%>" value="<%=sale%>">
				<img width="100" height="100" src="<%=cartList.get(i).getProduct().getProductImage() %>"></td>
				<td align=center bgcolor="ffffff" class=t1>상품명<%=cartList.get(i).getProduct().getProductName()%>&nbsp;
				(<%=cartList.get(i).getProduct().getProductStorage() %>)<br>
				가격<%=cartList.get(i).getProduct().getProductPrice() %><br>
				색상<%=cartList.get(i).getProduct().getProductColor() %><br>
				<br>
				요금제<%=cartList.get(i).getPlan().getPlanName()%><br>
				<%=cartList.get(i).getPlan().getPlanDesc()%><br>
				<%=cartList.get(i).getPlan().getPlanFare()%><br>
				</td>
				<td align=center bgcolor="ffffff" class=t1><select name="contact" id="selectContact<%=i%>"
					onchange="calPrice(this.id);">
					
						<option value="12" selected="selected">12개월</option>
						<option value="24">24개월</option>
						<option value="36">36개월</option>
				</select></td>
				<td align=center bgcolor="ffffff" class=t1>월 납부금 =<br> 단말 대금<span id="origin_price<%=i%>"><%=origin_price / 12%></span><br>-할인<span
					id="sale_price<%=i%>"><%=msg%></span><br>+요금제<span
					id="plan_price<%=i%>"><%=plan_price%></span>=<span
					id="monthly_price<%=i%>"><%=product_price / 12 + plan_price%></span>
				</td>
			</tr>
			<%
			tot_price += product_price;
			tot_monthly += product_price / 12 + plan_price;
			/* orderItems.get(i).setContact(contacts[i]) */;
			}
			order.setOrderItems(orderItems);
			session.setAttribute("order", order);
			%>
			<tr>
				<td colspan="5">단말기 가격 총합: <span id="tot_product"><%=tot_price%></span>
					&nbsp;&nbsp;&nbsp; 총 월 납부금: <span id="tot_monthly" ><%=tot_monthly%></span></td>
			</tr>
				
		</table>
		<h3>주문 정보</h3>
		<table align="center" width="100%" style="padding: 20px">
			<tr>
				<td>배송지</td>
				<td><input type="text" name="delivery" style="width: 350px"></td>
			</tr>
			<tr>
				<td>배송 요청사항</td>
				<td><input type="text" name="deliveryReq" value="" style="width: 350px"></td>
			</tr>
			<tr>
				<td>수령인</td>
				<td><input type="text" name="deliveryReceiver" value="<%=new UserService().findById(sUserId).getUserName() %>" style="width: 350px"></td>
			</tr>
		</table>
				<input type="hidden" name="input_tot_monthly" id="input_tot_monthly" value="<%=tot_monthly%>">
				<input type="hidden" name="buyType" id="buyType" value="<%=buyType%>">
		<div align="center" style="padding: 10px">
			<button type="button" onclick="order();">확인</button>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<button type="button" onclick="history.back();">취소</button>
		</div>
	</form>
	<jsp:include page="include_common_bottom.jsp"></jsp:include>
</body>
</html>