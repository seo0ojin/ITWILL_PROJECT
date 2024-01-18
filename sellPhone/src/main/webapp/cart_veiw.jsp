<%@page import="com.itwill.shop.plan.Plan"%>
<%@page import="com.itwill.shop.plan.PlanService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.cart.Cart"%>
<%@page import="com.itwill.shop.cart.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="login_check.jspf" %> 
<%
CartService cartService = new CartService();
List<Cart> cartList = cartService.getCartByUserId(sUserId);

PlanService planService = new PlanService();
List<Plan> planList = planService.findAllPlan();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>장바구니</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
<link rel="icon" href="image/icons-phone.png"> 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	/*
	장바구니 비우기 [anchor 클릭시 cart 전체삭제요청 서버로전송]
	 */
	function cart_delete_action() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'cart_delete_action.jsp';
		document.cart_view_form.submit();
		
	}

	/*
	 카드에담긴전체상품을주문
	 */
	function cart_view_form_order_submit() {
		document.cart_view_form.method = 'POST';
		document.cart_view_form.action = 'order_form.jsp';
		document.cart_view_form.submit();
	}
	
	function cartPlanViewPopUp(cart_no){
		   var left = Math.ceil(( window.screen.width)/5);
		   var top = Math.ceil(( window.screen.height)/5);
		   var pageUrl = "cart_plan_view.jsp?cart_no=" + cart_no;
		   let idCheckWindow = window.open(pageUrl,"checkForm","width=600,height=600,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
		}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="cart_view_form" style="margin: 0">
		<input type="hidden" name="buyType" value="fromCart">
	</form>
	
	<!-- container start-->

	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td height="22">&nbsp;&nbsp;<b>장바구니 목록</b></td>
								</tr>
							</table> <!--form--> <!-- 
							<form name="f" method="post">
							 -->
							<div id='f'>
								<table align=center width=80% border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=100 height=25 align="center" bgcolor="#e1f5e1"
											class=t1><font>상품</font></td>
										<td width=210 height=25 align="center" bgcolor="#e1f5e1"
											class=t1><font>상품명/요금제</font></td>
										<td width=140 height=25 align="center" bgcolor="#e1f5e1"
											class=t1><font>월 요금</font><font size="1">(24개월 약정기준)</font></td>
										<td width=50 height=25 align="center" bgcolor="#e1f5e1"
											class=t1><font>비 고</font></td>
									</tr>
									
																					<%
 																				if (cartList.size() < 1) {
 																					%>
 																					<tr>
 																					<td colspan="4" width=100 height=50 align=center bgcolor="ffffff" class=t1><font color="#808080" >장바구니 물품이 없습니다.</font></td>
 																					
 																					</tr>
 																					<%} %>
 																					
 																					

									<!-- cart item start -->
									<%
									for (Cart cart : cartList) {
									%>
									<tr>
										<td width=40 height=26 align=center bgcolor="ffffff" class=t1><img src='<%=cart.getProduct().getProductImage()%>' width="150" height="150" /></td>
										<td width=100 height=26 align=center bgcolor="ffffff" class=t1><a href='product_detail.jsp?p_no=<%=cart.getProduct().getProductNo()%>'><%=cart.getProduct().getProductName()%></a>
										<br>
										<form action="cart_update.jsp" method="post">
												<input type="hidden" name="cart_update"
													value="<%=cart.getCartNo()%>"> <select
													name="selected_plan">
													<%
													for (Plan plan : planList) {
														String selected = "";
														if (cart.getPlan().getPlanName().equals(plan.getPlanName())) {
															selected = "selected";
														}
													%>
													<option value="<%=plan.getPlanNo()%>" <%=selected%>><%=plan.getPlanName()%></option>
													<%
													}
													%>
												</select> <input type="submit" value="요금제변경">
											</form>
										</td>
										

										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("\u00A4 #,###").format(cart.getPlan().getPlanFare()+ ((cart.getProduct().getProductPrice()) - ((cart.getPlan().getPlanDc()) * 0.01)) / 24)%><br>
    <a href="javascript:cartPlanViewPopUp('<%= cart.getCartNo() %>')"><font color="#00a2be">[상세조회]</font></a>
</td>
										<td width=50 height=25 align=center bgcolor="ffffff" class=t1>
											<form action="cart_delete_item_action.jsp" method="post">
												<input type="hidden" name="cart_no_delete"
													value="<%=cart.getCartNo()%>"> 
													<input type="submit" value="삭제">
											</form>
										</td>
									</tr>
									<%
									}
									%>
									<!-- cart item end -->
									
								</table>
							</div> <!-- 
							</form> 
							 --> <br />
							<table style="padding-left: 30px" border="0" cellpadding="0"
								cellspacing="1" width="590">
								<tr>
									<td align=center>
																			<%
 																				if (cartList.size() >= 1) {
 																					%> <a
										href="javascript:cart_view_form_order_submit();" class=m1>총
											<span style="font-weight: bold;" id="cart_item_select_count"><%=cartList.size()%></span>개
											주문하기[주문폼]
									</a> <a href="javascript:cart_delete_action();" class=m1>장바구니 비우기</a>&nbsp;&nbsp;
										<%
										}
										%>
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>