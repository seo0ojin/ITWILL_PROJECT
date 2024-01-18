<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ProductService productService = new ProductService();

String order = request.getParameter("order");
List<Product> productList = null;
if(order == null || order.equals("")) {
	productList = productService.productMasterList();
} else if(order.equals("desc")) {
	productList = productService.productMasterListDesc();	
} else {
	productList = productService.productMasterListAsc();
}



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel="icon" href="image/icons-phone.png"> 
<title>휴대폰 리스트</title>
</head>
<body>
<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp" />
		</div>
		<div id="wrapper">
			<div id="content">


	<table border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td><br />
				<a href="product_list.jsp">추천순</a>
				<a href="product_list.jsp?order=desc">가격 높은 순</a>
				<a href="product_list.jsp?order=asc">가격 낮은 순</a>

				<div id="f">
					<br />
					<table id="product_table" width="100%" align="center" border="0"
						cellpadding="10" cellspacing="1" bgcolor="BBBBBB">
						<%
						int product_size = productList.size();
						int product_column_size = 3;
						int product_line_count = 1;

						for (int i = 0; i < productList.size(); i++) {
							Product product = productList.get(i);
						%>
						<!--상품시작 -->
						<%
						if (i % product_column_size == 0) {
						%>
						<tr>
							<%
							}
							%>
							<td align="center" width="25%" bgcolor="ffffff"><a
								href="product_detail.jsp?product_no=<%=product.getProductNo()%>">
								<img width="250px" height="180px"
									src="<%=product.getProductImage()%>" border="0"></a><br />
								<br /> <b><%=product.getProductName()%></b>
								<br> <font color="#FF0000">가격:<%=new DecimalFormat("#,##0").format(product.getProductPrice())%>원
							</font></td>
							<%
							if (i % product_column_size == 2) {
							%>
						</tr>
						<%
						}
						%>

						<!--상품 끝 -->
						<%
						}
						%>
					</table>
				</div> <br /></td>
		</tr>
	</table>



		</div>
		</div>
		<div id="footer">
			<jsp:include page="include_common_bottom.jsp" />
		</div>
	</div>
	<!--container end-->
</body>
</html>