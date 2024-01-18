<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String p_noStr =request.getParameter("product_no");
ProductService productService = new ProductService();

Product product= productService.productDetail(Integer.parseInt(p_noStr));

	

%>
<script type="text/javascript">
function productUpdate() {
	f.action = 'product_updat_action.jsp';
	f.submit();
}
function productUpdate(){
	f.action = 'product_list.jsp'
	f.submit();
}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 정보 수정</title>
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel="icon" href="image/icons-phone.png">
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<div id="container">
		<div id="header">
			<jsp:include page="include_common_top.jsp" />
		</div>
		<div id="wrapper">
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b>휴대폰 수정</b>
									</td>
								</tr>
								<form name="f" method="post">
								<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">휴대폰 사진</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><img width="300px" height="220px"
									src="<%=product.getProductImage()%>" border="0"></td>
											
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">휴대폰 이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><input type="text" style="width: 150"
											name="productName" value="<%=product.getProductName()%>"></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">휴대폰 가격</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><input type="text" style="width: 150"
											name="productPrice" value="<%=product.getProductPrice()%>"></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">휴대폰 기종</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><input type="text" style="width: 150"
											name="productModel" value="<%=product.getProductModel()%>"></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">휴대폰 색상</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><input type="text" style="width: 150"
											name="productColor" value="<%=product.getProductColor()%>"></td>
									</tr>
									
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">휴대폰 저장공간</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="center"><input type="text" style="width: 150"
											name="productStorage" value="<%=product.getProductStorage()%>"></td>
									</tr>

								</table>
							</form>
								<tr>
									<td align=center><input type="button" value="수정"
										onClick="productUpdate()"> &nbsp; <input type="button"
										value="리스트" onClick="productUpdate()"></td>
								</tr>
								</table>
						</table>
		<div id="footer">
			<jsp:include page="include_common_bottom.jsp" />
		</div>
	</div>
</body>
</html>