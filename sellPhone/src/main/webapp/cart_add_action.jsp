<%@page import="com.itwill.shop.plan.PlanService"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.plan.Plan"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="login_check.jspf" %>
 <%
String product_noStr = request.getParameter("selected_color_input_order");
ProductService productService = new ProductService();
Product product = productService.productDetailByImage(product_noStr);


 
 String plan_noStr= request.getParameter("selected_plan_order");
//System.out.println(product_noStr);
//int product_no = Integer.parseInt(product_noStr);
int plan_no = Integer.parseInt(plan_noStr);
PlanService planService = new PlanService();
Plan plan =planService.findPlanByNo(plan_no);
 CartService cartService = new CartService();
cartService.addCart(new Cart(0,sUserId,plan,product));

response.sendRedirect("cart_veiw2.jsp");
 
 
 
 %>   
    