<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.order.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 조회</title>
<style>
table {
	width: 80%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: center;
}

th {
	background-color: #dcdcdc;
}

select, input[type="text"] {
	padding: 6px;
}
</style>
</head>
<body>
	<%@include file="include_common_top.jsp"%>

	<%
	OrderService orderService = new OrderService();
	UserService userService = new UserService();
	List<Order> orderList = orderService.findAllOrders();
	List<User> userList = userService.findAll();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(new Date());
	calendar.add(Calendar.DAY_OF_MONTH, -7);
	Date oneWeekAgo = calendar.getTime();
	String oneWeekAgoStr = sdf.format(oneWeekAgo);
	String todayStr = sdf.format(new Date());
	
	String searchField = request.getParameter("searchField");
	String searchKeyword = request.getParameter("searchKeyword");
	
	String startDateStr = request.getParameter("startDate");
	String endDateStr = request.getParameter("endDate");

	if (searchKeyword == null) {
		searchKeyword = "검색어를 입력하세요";
	}
	%>
	<h1>주문 내역 조회</h1>
	<form method="post" action="order_list_admin.jsp">
		<label for="searchField">검색 항목:</label> <select name="searchField"
			id="searchField">
			<option value="order_option">항목을 선택해주세요</option>
			<option value="user_id">아이디</option>
			<option value="delivery_receiver">수령인</option>
		</select> 
		<input type="text" name="searchKeyword"
			placeholder="<%=searchKeyword%>">
		<button type="submit">검색</button>
		<input type="date" name="startDate" value="<%=oneWeekAgoStr%>">
		<input type="date" name="endDate" value="<%=todayStr%>">
	</form>
	<table>
		<tr>
			<th>주문 번호</th>
			<th>상품 가격</th>
			<th>주문 날짜</th>
			<th>배송지</th>
			<th>배송시 요청사항</th>
			<th>배송 상태</th>
			<th>수령인</th>
			<th>아이디</th>
			<th>주문자</th>
		</tr>
		<%
		Date startDate=null;
		Date endDate=null;
		if(startDateStr==null || endDateStr==null){
			startDate=oneWeekAgo;
			endDate=new Date();
		}else{
		 	startDate=new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
		 	endDate=new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
		}
		if (searchField != null && searchField.equals("user_id")) {
				orderList = orderService.findOrdersById(searchKeyword);
				//orderList=orderService.findOrdersByDate(startDate, endDate, searchKeyword, searchField);
		} else if (searchField != null && searchField.equals("delivery_receiver")) {
				orderList = orderService.findOrdersByDeliveryReceiver(searchKeyword);
				//orderList=orderService.findOrdersByDate(startDate, endDate, searchKeyword, searchField);
		} else {
			    orderList = orderService.findAllOrders();
			
		}

		for (Order order : orderList) {
		%>
		<tr>
		<td><%=order.getOrderNo()%></td>
		<td><%=order.getOrderFee()%></td>
		<td><%=sdf.format(order.getOrderDate())%></td>
		<td><%=order.getDelivery()%></td>
		<td><%=order.getDeliveryReq()%></td>
		<td><%=order.getDeliveryStatus()%></td>
		<td><%=order.getDeliveryReceiver()%></td>
		<td><%=order.getUser().getUserId()%></td>
		<td><%=new UserService().findById(order.getUser().getUserId()).getUserName()%></td>
		</tr>
		<%
		}
		%>
	</table>

	<%@include file="include_common_bottom.jsp"%>
</body>
</html>