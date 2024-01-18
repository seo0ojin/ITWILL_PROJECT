<%@page import="com.itwill.shop.board.Board"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.product.ProductService"%>
<%@page import="com.itwill.shop.board.BoardException"%>
<%@page import="com.itwill.shop.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	
	String product_noStr = request.getParameter("productNo");
	Integer boardno = null;
	Integer pageno = null;
	Integer productNo = null;
	
	try {
		boardno = Integer.valueOf(request.getParameter("boardno"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
		productNo = Integer.valueOf(request.getParameter("productNo"));
	} catch (Exception ex) {
	}
	boolean result = true;
	String msg = "";
	if (boardno == null) {
		result = false;
		msg = "삭제실패";
	} else {
		try {
			new BoardService().delete(boardno);
			result = true;
			msg = "삭제성공";
		} catch (BoardException e) {
			result = false;
			msg = "삭제실패:" + e.getMessage();
		}
	}
%>
<script type="text/javascript">
<%if (result) {%>
	alert('<%=msg%>');
	location.href='board_list.jsp?pageno=<%=pageno%>&productNo=<%= product_noStr %>';
<%} else {%>
	alert('<%=msg%>');
	//history.back();
	location.href='board_list.jsp?pageno=<%=pageno%>&productNo=<%= product_noStr %>';
<%}%>
	
</script>




