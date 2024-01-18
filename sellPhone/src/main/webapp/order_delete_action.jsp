<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String order_noStr=request.getParameter("order_no");
	int order_no = Integer.parseInt(order_noStr);
	OrderService orderService = new OrderService();
	orderService.deleteOrder(order_no);
response.sendRedirect("my_order_list.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제</title>
</head>
<body>
</body>
</html>




