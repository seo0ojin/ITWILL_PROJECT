<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	int cart_item_count=0;
	String sUserId=(String)session.getAttribute("sUserId");
	if(sUserId!=null){
		CartService cartService=new CartService();
		cart_item_count = cartService.getCartByUserId(sUserId).size();
	}
%>		
<div id="menu">
	<ul>
		<li id="logo"><a href="shop_main.jsp"></a></li>
		<li><a href="user_login_form.jsp"></a>로그인</li>
		<li><a href="product_list.jsp"></a>휴대폰</li>
		<li><a href="cart_veiw.jsp"></a>장바구니</li>
		<li><a href="order_form.jsp"></a>주문내역</li>
		
	</ul>
</div>