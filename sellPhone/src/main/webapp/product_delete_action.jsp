<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String p_no =request.getParameter("product_no");

	ProductService productService=new ProductService();
	productService.deleteProduct(Integer.parseInt(p_no));
	
	response.sendRedirect("product_list.jsp");

%>
