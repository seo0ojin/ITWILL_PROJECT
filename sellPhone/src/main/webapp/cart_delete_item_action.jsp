<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String cart_no = request.getParameter("cart_no_delete");
 CartService cartService = new CartService();
int rowCount=cartService.deleteCartByCartNo(Integer.parseInt(cart_no));
String referer=request.getHeader("referer");
response.sendRedirect(referer);
 
 
 
 %>   
    