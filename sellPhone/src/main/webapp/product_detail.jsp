<%@page import="com.itwill.shop.order.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.plan.Plan"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.plan.PlanService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String productNoStr = request.getParameter("product_no");
if (productNoStr == null || productNoStr.equals("")) {
	response.sendRedirect("product_list.jsp");
	return;
}

OrderService orderService = new OrderService();

ProductService productService = new ProductService();
Product product = productService.productDetail(Integer.parseInt(productNoStr));

if (product.getProductColor().equals("대표"))
	response.sendRedirect("product_detail.jsp?product_no=" + (product.getProductNo() + 1));

String colorList = product.getSpec().getSpecColor();
String[] colors = colorList.split(",");
for (int i = 0; i < colors.length; i++) {
	colors[i] = colors[i].trim();
}

// 앞뒤 공백 제거 후 반환
for (int i = 0; i < colors.length; i++) {
	colors[i] = colors[i].trim();
}

PlanService planService = new PlanService();
List<Plan> planList = planService.findAllPlan();
%>
<!DOCTYPE html>
<html>
<link rel="icon" href="image/icons-phone.png"> 
<script type="text/javascript">
//스펙 상세보기
function productDetailPopUp(product_no){
   var left = Math.ceil(( window.screen.width)/5);
   var top = Math.ceil(( window.screen.height)/5);
   var pageUrl = "product_spec_detail.jsp?product_no=" + product_no;
   let idCheckWindow = window.open(pageUrl,"checkForm","width=600,height=600,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
}
//상품토론방
function productDebatePopUp(product_no){
   var left = Math.ceil(( window.screen.width)/5);
   var top = Math.ceil(( window.screen.height)/5);
   var pageUrl = "board_list.jsp?productNo=" + product_no;
   let idCheckWindow = window.open(pageUrl,"checkForm","width=600,height=600,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
}
//스펙 비교하기
function productComparePopUp(product_no){
   var left = Math.ceil(( window.screen.width)/5);
   var top = Math.ceil(( window.screen.height)/5);
   var pageUrl = "product_spec_compare.jsp?product_no=" + product_no;
   let idCheckWindow = window.open(pageUrl,"checkForm","width=1000,height=800,top="+top+",left="+left+",resizable = no,location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
}
//색상 선택에 따른 이미지 변경
function changeImage() {
    var selectedImage = document.getElementById("selected_color").value;
    document.getElementById("displayImage").src = selectedImage;
    document.getElementById("selected_color_input_cart").value = selectedImage;
    document.getElementById("selected_color_input_order").value = selectedImage;
}
//플랜따오기
function getPlan() {
    var selectedPlan = document.getElementById("selected_plan").value;
    document.getElementById("selected_plan_cart").value = selectedPlan;
    document.getElementById("selected_plan_order").value = selectedPlan;
}

function goToCart() {
	directOrder.action = "cart_add_action.jsp";
	directOrder.method='POST';
	directOrder.submit();
}

function goToOrder() {
	directOrder.action = "order_form.jsp";
	directOrder.method='POST';
	directOrder.submit();
}


</script>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel="icon" href="image/icons-phone.png"> 
<style type="text/css" media="screen"></style>
<title><%=product.getProductName()%> 상세정보</title>
</head>
<body>
<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
			
			<div align=right">
	<a href="product_list.jsp" title="리스트" style="font-size: 20px">제품 리스트</a></div>
	<% if(session.getAttribute("sUserId") != null && ((String)session.getAttribute("sUserId")).equals("admin")) {%>
	<a href="product_delete_action.jsp" title="삭제">제품 삭제</a>
	<a href="product_update_form.jsp?product_no=<%=product.getProductNo() %>" title="수정">제품 수정</a>
	<% } %>
	<form method="post" action="cart_add_action.jsp" style="display:inline">
						<input type="hidden" name="selected_color_input_cart" id="selected_color_input_cart" value="<%=product.getProductImage()%>">
						<input type="hidden" name="selected_plan_cart" id="selected_plan_cart" value="<%=planList.get(0).getPlanNo()%>">
					</form>
					<form id="directOrder" method="post" action="order_form.jsp" style="display:inline">
						<input type="hidden" name="selected_color_input_order" id="selected_color_input_order" value="<%=product.getProductImage()%>">
						<input type="hidden" name="selected_plan_order" id="selected_plan_order" value="<%=planList.get(0).getPlanNo()%>">
						<input type="hidden" name="buyType" id="buyType" value="fromProduct">
					</form>
	
	<form id="product_detail" name="product_detail" method="post">
			
		<table border="0" cellpadding="0" cellspacing="1" width="1300"
			bgcolor="BBBBBB">
			<tr>
				<td rowspan="6" width=500 height=500 bgcolor="ffffff" 
					style="padding-left: 10px" align="center"><img id="displayImage"
					src='<%=product.getProductImage()%>' style="margin-bottom: 5px" width="320" height="300"><br />
				</td>
			<tr>
				<td width=200 align=center bgcolor="E6ECDE" height="22">제품명</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="center"><%=product.getProductName()%></td>
			</tr>
			<tr>
				<td width=200 align=center bgcolor="E6ECDE" height="22">가격</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="center"><%=new DecimalFormat("#,##0").format(product.getProductPrice())%></td>
			</tr>
			<tr>
				<td width=200 align=center bgcolor="E6ECDE" height="22">용량</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="center"><%=product.getProductStorage()%></td>
			</tr>
			<tr>
				<td width=200 align=center bgcolor="E6ECDE" height="22">색상</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="center"><select id="selected_color"
					onclick="changeImage()">
						<%
						for (int i = 0; i < colors.length; i++) {
						%>
						<option 
							value="<%=productService.productDetail(product.getProductNo() + i).getProductImage()%>"
							><%=colors[i]%></option>
						<%
						}
						%>
				</select></td>
			</tr>
			<tr>
				<td width=200 align=center bgcolor="E6ECDE" height="22">요금제</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="center"><select id="selected_plan" onclick="getPlan()">
						<%
						for (Plan plan : planList) {
						%>
						<option value="<%=plan.getPlanNo()%>"><%=plan.getPlanName()%></option>
						<%
						}
						%>
				</select></td>
			</tr>
			<tr>
			<td width=200 bgcolor="ffffff" height="55px" style="padding-left: 10px" align="center">
				<a href="javascript:void(0);" onclick="productDebatePopUp(<%=product.getProductNo()%>)" style="font-size: 15px; font-weight: bold;">상품 토론방</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0);" onclick="productDetailPopUp(<%=product.getProductNo()%>)" style="font-size: 15px; font-weight: bold;" >상품상세</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0);" onclick="productComparePopUp(<%=product.getProductNo()%>)" style="font-size: 15px; font-weight: bold;">상품 비교하기</a>
				</td>
			
				<td colspan="2" width=200 bgcolor="ffffff" height="55px" style="padding-left: 10px" align="center">
						<button type="button" onclick="goToCart()" value="카트 담기">카트 담기</button>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="goToOrder()" value="바로 결제">바로 결제</button>
			</tr>
				
			<tr>
				<td colspan="3" width=490 bgcolor="ffffff" height="180px"
					style="padding-left: 10px" align="center"><img
					src='<%=product.getProductDetail()%>' style="margin-bottom: 5px"><br />
				</td>
			</tr>
		</table>

	</form>
	
	
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