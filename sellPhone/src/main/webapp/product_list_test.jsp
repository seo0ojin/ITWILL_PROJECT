<%-- <%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ProductService productService = new ProductService();

String order = request.getParameter("order");
List<Product> productList = null;
if(order==null||order.equals("")){
	productList=productService.productMasterList();
}else if(order.equals("desc")){
	productList=productService.productMasterListDesc();
}else{
	productList=productService.productMasterListAsc();
}

String pageNostr =request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 리스트</title>
</head>
<body>
	<table border=0 cellpadding=0 cellspacing=0>
		<tr>
			<td><br />
				<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>쇼핑몰 -
								상품리스트</b></td>
					</tr>
				</table>
				<a href="product_list_test.jsp">추천순</a>
				<a href="product_list_test.jsp?order=desc">가격높은순</a>
				<a href="product_list_test.jsp?order=asc">가격낮은순</a>

				<div id="f">
				<% for(int i=0;i<productList.size();i++){
				Product product = productList.get(i);
				%>
					<div class="productitem">
					<img src="<%%>">
					</div>
						<%
						int product_size=productList.size();
						int product_line_count = 1;
							
						for (int i = 0 ; i < productList.size();i++){
							Product product = productList.get(i);
						%>
						<tr>
						
						<td align="center" width="25%" bgcolor="ffffff">
						<a href="product_detail.jsp?product_no=<%= product.getProductNo()%>"></a>
						<img width="300px" height="220px"
									src="<%=product.getProductImage()%>" border="0"></a><br />
									<br /> <b><%=product.getProductName()%></b>
									<br> <font color="#FF0000">가격:<%=new DecimalFormat("#,##0").format(product.getProductPrice())%>원
									</font></td>
                    </table>
                </div>
                <% }%>
                <br />
                <div align="center">
                   <%
                   for(){
                   %>
                    <%%>
                </div>
            </td>
        </tr>
    </table>
</body> --%>