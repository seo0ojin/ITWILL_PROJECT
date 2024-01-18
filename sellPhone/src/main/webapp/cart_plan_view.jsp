<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.order.pay.Card"%>
<%@page import="com.itwill.shop.order.pay.PaymentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String cart_no = request.getParameter("cart_no");
 
 CartService cartService = new CartService();
Cart cart=cartService.getCartByCartId(Integer.parseInt(cart_no));
 
 
 
 %>   
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<script type="text/javascript">
function cancel(){
	window.close();

}


</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<h2>요금 상세조회</h2>
<body>
<form method="POST" action="card_check_action.jsp">
	<br>
	<table>
		<tr>
										<td width=80 height=15  align="center" bgcolor="E6ECDE" class=t1><font
											 >할부원금(24개월)</font></td>
											 <td width=80 height=15 align="center" bgcolor="E6ECDE" class=t1><font
											 >요금제</font></td>
										<td width=80 height=15 align="center" bgcolor="E6ECDE" class=t1><font
											 >월 요금</font></td>
										<td width=80 height=5 align="center" bgcolor="E6ECDE" class=t1><font
											 >요금 할인</font></td>
										
									</tr>
									<tr>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getProduct().getProductPrice() %>원
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getPlan().getPlanName()%>
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getPlan().getPlanFare() %>원
										<td width=146 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getPlan().getPlanDc() %>%
										</tr>
										
										
		
	</table>
	<br>
	<div style=" text-align: center;">
	<button type="button" onclick="cancel()" >확인</button>
	</div>
</form>
</body>
</html>