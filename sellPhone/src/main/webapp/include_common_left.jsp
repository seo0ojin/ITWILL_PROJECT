<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sUserId = (String) session.getAttribute("sUserId");
%>

<p>
	<strong>메 뉴</strong>
</p>
<ul>

	<%
	if (sUserId == null) {
	%>
	<li><a href="index.jsp">메인</a></li>
	<li><a href="user_login_form.jsp">로그인</a></li>
	<li><a href="user_write_form.jsp">회원가입</a></li>
	<li><a href="product_list.jsp">휴대폰★리스트</a></li>

	<%
	} else {
	User sUser = new UserService().findById(sUserId);
	%>
	<li><a href="index.jsp">메인</a></li>
	<li><a href="product_list.jsp">휴대폰★리스트</a></li>
	<li><a href="cart_veiw2.jsp">장바구니</a></li>
	<li><a href="order_form.jsp">주문내역</a></li>
	<%
	}
	%>
</ul>