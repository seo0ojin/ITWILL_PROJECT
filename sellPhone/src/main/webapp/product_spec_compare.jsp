<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.product.Spec"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String productNoStr = request.getParameter("product_no");
String compareNoStr = request.getParameter("compare_no");
if (  request.getParameter("compare_no") == null ) {
	response.sendRedirect("product_spec_compare.jsp?product_no="+productNoStr+"&compare_no="+productNoStr);
	return;
}

System.out.print(compareNoStr);


ProductService productService = new ProductService();
Product product = productService.productDetail(Integer.parseInt(productNoStr));
Product compareProduct = productService.productDetail(Integer.parseInt(compareNoStr));
Spec spec = product.getSpec();
Spec compareSpec = compareProduct.getSpec();

%>
<%
List<Product> productList=productService.productMasterList();




%>
<script type="text/javascript">
function changeModel() {
    var originModel = document.getElementById("origin_product").value;
    var selectedModel = document.getElementById("selected_color").value;
    window.location.href = 'product_spec_compare.jsp?product_no='+originModel+'&&compare_no='+selectedModel;
}
</script>
<!DOCTYPE html>
<p>&nbsp;</p>
<select id="selected_color"
					onchange="changeModel();">
						<%
						for (int i = 0; i < productList.size(); i++) {
						%>
						<option 
							value="<%=productList.get(i).getProductNo() %>"
							><%=productList.get(i).getProductName()%></option>
						<%
						}
						%>
				</select>
<div class="container">
<div class="table-container"><form method="post" name="product_detail"><input id="origin_product"  name="product_no" type="hidden" value="<%=product.getProductNo()%>" />
<table style="display: inline-table;" border="0" width="100%" cellspacing="1" cellpadding="0" bgcolor="BBBBBB">
<tbody>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">제품명</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=product.getProductName()%></td>
				<td id="text_test" style="padding-left: 15px;"bgcolor="ffffff" ><%=compareProduct.getProductName() %></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">사진</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><img width="300px" height="220px" id="displayImage"
					src='<%=product.getProductImage()%>' style="margin-bottom: 5px"></td>
				<td id="text_test" style="padding-left: 15px; "bgcolor="ffffff"><img width="300px" height="220px" id="displayImage"
					src='<%=compareProduct.getProductImage()%>' style="margin-bottom: 5px" ></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">브랜드</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=spec.getSpecBrand()%></td>
<td id="brand" style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecBrand() %></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">네트워크</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=spec.getSpecNetwork()%></td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecNetwork()%></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">출시일</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=new SimpleDateFormat("yyyy/MM/dd").format(spec.getSpecRelease())%></td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=new SimpleDateFormat("yyyy/MM/dd").format(compareSpec.getSpecRelease())%></td>
</tr>
<tr style="height: 22px;">
<td style="height: 22px;" align="center" bgcolor="E6ECDE" width="100">색상</td>
<td style="padding-left: 10px; height: 22px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecColor()%></td>
<td style="padding-left: 10px; height: 22px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecColor()%></td>
</tr>
<tr style="height: 31.5625px;">
<td style="height: 31.5625px;" align="center" bgcolor="E6ECDE" width="100">화면크기</td>
<td style="padding-left: 10px; height: 31.5625px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecDisplay()%></td>
<td style="padding-left: 10px; height: 31.5625px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecDisplay()%></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">제품크기</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecSize()%></td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecSize()%></td>
</tr>
<tr style="height: 22px;">
<td style="height: 22px;" align="center" bgcolor="E6ECDE" width="100">무게</td>
<td style="padding-left: 10px; height: 22px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecWeight()%></td>
<td style="padding-left: 10px; height: 22px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecWeight()%></td>
</tr>
<tr style="height: 22px;">
<td style="height: 22px;" align="center" bgcolor="E6ECDE" width="100">RAM</td>
<td style="padding-left: 10px; height: 22px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecRam()%></td>
<td style="padding-left: 10px; height: 22px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecRam()%></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">배터리</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecBattery()%></td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecBattery()%></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">운영체제</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecOs()%></td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecOs()%></td>
</tr>
<tr style="height: 36px;">
<td style="height: 36px;" align="center" bgcolor="E6ECDE" width="100">카메라</td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=product.getSpec().getSpecCam()%></td>
<td style="padding-left: 10px; height: 36px;" align="left" bgcolor="ffffff" width="490"><%=compareSpec.getSpecCam()%></td>
</tr>
</tbody>
</table>
</form></div>
<div class="table-container"><form method="post" name="product_detail"><input name="product_no" type="hidden" value="<%=product.getProductNo()%>" /></form></div>
</div>
