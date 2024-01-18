<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_check.jspf" %>
 <%
 CartService cartService = new CartService();
int rowCount=cartService.deleteCartByUserId(sUserId);
String referer=request.getHeader("referer");
response.sendRedirect(referer);
 
 
 
 %>   
    