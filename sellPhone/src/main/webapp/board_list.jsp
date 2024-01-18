<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@page import="com.itwill.shop.board.BoardService"%>
<%@page import="com.itwill.shop.board.BoardListPageMakerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
String product_noStr = request.getParameter("productNo");
ProductService productService = new ProductService();
Product product = productService.productDetail(Integer.parseInt(product_noStr));
%>
<%!public String getTitleString(Board board) {
		StringBuilder title = new StringBuilder(128);
		String t = board.getBoardTitle();
		if (t.length() > 15) {
			//t = t.substring(0,15);
			//t = t+"...";
			t = String.format("%s...", t.substring(0, 15));
		}
		//답글공백삽입
		
		for (int i = 0; i < board.getBoardDepth(); i++) {
			title.append("&nbsp;&nbsp;");
		}
		
		if (board.getBoardDepth() > 0) {
			title.append("<img border='0' src='image/re.gif'/>");
		}
		
		title.append(t.replace(" ", "&nbsp;"));
		
		return title.toString();
	}
	%>
<%
BoardService boardService = new BoardService();

System.out.print(product);

String productNo = Integer.toString(product.getProductNo());
if (productNo == null || productNo.equals("")) {
	response.sendRedirect("product_list.jsp");
}

String currentPage = request.getParameter("pageno");
if (currentPage == null || currentPage.equals("")) {
	currentPage = "1";
}

BoardListPageMakerDto boardListPage = boardService.findBoardList(Integer.parseInt(productNo), Integer.parseInt(currentPage));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function boardCreate(xx) {
		location.href = "board_write.jsp?productNo="+xx;
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b><%= product.getProductName() %> 게시판-리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
									<td height="20" class="t1" align="right" valign="bottom">♠
										총 <font color="#FF0000"><%=boardListPage.pageMaker.getTotCount()%></font>
										건 | 현재페이지( <font color="#FF0000"><%=boardListPage.pageMaker.getCurPage()%></font>
										/ <font color="#0000FF"><%=boardListPage.pageMaker.getTotPage()%></font>
										)
									</td>
								</tr>
							</table>  <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">

									<tr>
										<!-- <td width=280 align=center bgcolor="E6ECDE">번호</td> -->
										<td width=280 align=center bgcolor="E6ECDE">제목</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴이</td>
										<td width=120 align=center bgcolor="E6ECDE">글쓴날</td>
										<td width=70 align=center bgcolor="E6ECDE">본횟수</td>
									</tr>
									<%
										for (Board board : boardListPage.itemList) {
									%>
									<tr>
										<%-- <td width=120 align=center bgcolor="ffffff"><%=board.getBoardNo()%> --%>
										<td width=280 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<a href='board_view.jsp?boardno=<%=board.getBoardNo()%>&pageno=<%=boardListPage.pageMaker.getCurPage()%>&productNo=<%=product.getProductNo()%>'>
										<%=this.getTitleString(board)%>
										</a>
										</td>
										<td width=120 align=center bgcolor="ffffff"><%=board.getUser().getUserId()%>
										</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%-- <%=board.getBoardDate().toString().substring(0, 10)%> --%>
											<%=new SimpleDateFormat("yyyy-MM-dd (E)").format(board.getBoardDate())%>
										</td>
										<td width=70 align=center bgcolor="ffffff" align="left"><%=board.getBoardReadCount()%>
										</td>
									</tr>
									<!-- 
									<tr>
										<td width=280 bgcolor="ffffff" style="padding-left: 10"><a
											href='board_view.jsp?boardno=532&pageno=6'>게시판타이틀514</a></td>
										<td width=120 align=center bgcolor="ffffff">김경호514</td>
										<td width=120 bgcolor="ffffff" style="padding-left: 10">2014-12-23
										</td>
										<td width=70 align=center bgcolor="ffffff">0</td>
									</tr>
									 -->
									<%
										}
									%>
								</table>
								<!-- /list -->
							</form> 
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
							     		 <%if(boardListPage.pageMaker.getCurBlock() > 1) {%>    
											<a href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevGroupStartPage()%>">◀◀</a>&nbsp;
										 <%}%>
										
										 <%if(boardListPage.pageMaker.getPrevPage()>0) {%>    
											<a href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getPrevPage()%>">◀</a>&nbsp;&nbsp;
										 <%}%>
										
										<%
											for (int i = boardListPage.pageMaker.getBlockBegin(); i <= boardListPage.pageMaker.getBlockEnd(); i++) {
										 	if (boardListPage.pageMaker.getCurPage() == i) {
										%>
										 <font color='red'><strong><%=i%></strong></font>&nbsp;
										<%} else {%>
										<a href="./board_list.jsp?pageno=<%=i%>"><strong><%=i%></strong></a>&nbsp;
										<%
										   }
										  }%>
										  
										  
										 <%if(boardListPage.pageMaker.getNextPage()<=boardListPage.pageMaker.getTotPage()){%>
										  <a href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextPage()%>">▶</a>
										 <%}%>
										 <%if(boardListPage.pageMaker.getTotBlock() > boardListPage.pageMaker.getCurBlock()){%>
										  <a href="./board_list.jsp?pageno=<%=boardListPage.pageMaker.getNextGroupStartPage()%>">▶▶&nbsp;</a>
										 <%}%>
										
									</td>
								</tr>
							</table> <!-- button -->
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="right">
									<input type="button" value="게시물 생성" onclick="boardCreate(<%= product.getProductNo() %>);" /></td>
								</tr>
							</table></td>
					</tr>
				</table>
			
</body>
</html>