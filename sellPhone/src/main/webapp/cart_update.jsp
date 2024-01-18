<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String cart_no = request.getParameter("cart_update");
 String cart_plan=request.getParameter("selected_plan");
 CartService cartService = new CartService();
 Cart cart = cartService.getCartByCartId(Integer.parseInt(cart_no));
int rowCount=cartService.updateCart(cart.getProduct().getProductNo(),Integer.parseInt(cart_plan),cart.getCartNo());
String referer=request.getHeader("referer");
response.sendRedirect(referer);
 
 
 
 %>   
    