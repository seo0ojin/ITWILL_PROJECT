<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String productNo = request.getParameter("productNo");
String productName = request.getParameter("productName");
String productModel = request.getParameter("productModel");
String productPrice = request.getParameter("productPrice");
String productStorage = request.getParameter("productStorage");
String productColor = request.getParameter("productColor");
String productImage = request.getParameter("productImage");
String productDetail = request.getParameter("productDetail");

ProductService productService = new ProductService();

int rowCount = productService.updateProduct(new Product(Integer.parseInt(productNo),productName,productModel,Integer.parseInt(productPrice),productStorage,productColor,productImage,productDetail,null));

%>
