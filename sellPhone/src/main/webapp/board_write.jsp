<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<% 
String product_noStr = request.getParameter("productNo");
ProductService productService = new ProductService();
Product product = productService.productDetail(Integer.parseInt(product_noStr));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title><%= product.getProductName() %> 게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
 
<script type="text/javascript">
	function boardCreate() {
		if (f.boardTitle.value == "") {
			alert("제목을 입력하십시요.");
			f.title.focus();
			return false;
		}
		if (f.boardContent.value == "") {
			alert("내용을 입력하십시요.");
			f.content.focus();
			return false;
		}

		f.action = "board_write_action.jsp";
		f.method="POST";
		f.submit();
	}

	function boardList(xx) {
		location.href = "board_list.jsp?productNo="+xx;
		/* f.submit(); */
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>게시판 -
											게시판 쓰기</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<input type="hidden" name="productNo" value="<%= product.getProductNo() %>"/>
								<input type="hidden" name="user" value="<%= sUserId %>"/>
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><input type="text" style="width: 150px"
											name="boardTitle"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px"
											align="left"><textarea name="boardContent" class="textarea"
												style="width: 350px" rows="14"></textarea></td>
									</tr>
								</table>
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="게시판 쓰기"
										onClick="boardCreate()"> &nbsp; <input type="button"
										value="게시판 목록" onClick="boardList(<%=product.getProductNo()%>)"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			
</body>
</html>