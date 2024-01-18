<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.product.Spec"%>
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

ProductService productService = new ProductService();
Product product = productService.productDetail(Integer.parseInt(productNoStr));
Spec spec = product.getSpec();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=product.getProductName() %> 상세정보</title>
</head>
<body>
	<form name="product_detail" method="post">
		<input type="hidden" name="product_no" value="<%=product.getProductNo()%>">
		<table border="0" cellpadding="0" cellspacing="1" width="590"
			bgcolor="BBBBBB">
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">제품명</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getProductName()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">브랜드</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=spec.getSpecBrand()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">네트워크</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=spec.getSpecNetwork()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">출시일</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=new SimpleDateFormat("yyyy/MM/dd").format(spec.getSpecRelease())%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">색상</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecColor()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">화면크기</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecDisplay()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">제품크기</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecSize()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">무게</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecWeight()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">RAM</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecRam()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">배터리</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecBattery()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">운영체제</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecOs()%></td>
			</tr>
			<tr>
				<td width=100 align=center bgcolor="E6ECDE" height="22">카메라</td>
				<td width=490 bgcolor="ffffff" style="padding-left: 10px"
					align="left"><%=product.getSpec().getSpecCam()%></td>
			</tr>
		</table>

	</form>
</body>
</html>