<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sUserId = (String) session.getAttribute("sUserId");
%>
<a href="index.jsp"><img src="image/sellphone_image.jpg" alt="" width="150" height="60" /></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="user_login_form.jsp" style="font-size: 25px; font-weight: bold; color: rgba(6,94,166,1);">내정보</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="product_list.jsp" style="font-size: 25px; font-weight: bold; color: rgba(6,94,166,1);">휴대폰</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="cart_veiw2.jsp" style="font-size: 25px; font-weight: bold; color: rgba(6,94,166,1);">장바구니</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="my_order_list.jsp" style="font-size: 25px; font-weight: bold; color: rgba(6,94,166,1);">주문내역</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<%
if(sUserId==null){
	%>
	<h6 align="right">
	<a href="user_login_form.jsp">로그인</a>
</h6><%
}else{
User sUser = new UserService().findById(sUserId);
	%>
	<h6 align="right">
	<a href="user_view.jsp"><%=sUserId %>님 환영합니다</a>
	<!-- <a href="myPage_view.jsp">내 정보</a> -->
	<a href="user_logout_action.jsp">로그아웃</a>
	<%
	if(session.getAttribute("sUserId") != null && ((String)session.getAttribute("sUserId")).equals("admin")) {
	%>
	<a href="order_list_admin.jsp">고객 주문내역 조회</a>	
	<%
	}
	%>		
	
	</h6>
	
	<%
}
%>
