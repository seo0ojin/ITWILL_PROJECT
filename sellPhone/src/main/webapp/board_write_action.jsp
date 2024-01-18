<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@page import="com.itwill.shop.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("board_list.jsp");
		return;
	}
	
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String productNo = request.getParameter("productNo");
	
	BoardService boardService = new BoardService();
	
	int boardInsert = boardService.insert(new Board(0, boardTitle, boardContent, null, 0, 0, 0, 0, new Product(Integer.parseInt(productNo)), new User(sUserId)));
	
	response.sendRedirect("board_list.jsp?productNo=" + productNo);
%>
