<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.product.Product"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@page import="com.itwill.shop.board.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	//Board객체를 생성하고 입력된데이타를 읽어서 객체에저장
	Board board = new Board();
	/*
	원글boardno
	*/
	String boardNo = request.getParameter("boardno");
	
	/*
	답글 데이타
	*/
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String productNo = request.getParameter("productNo");
	
	BoardService boardService = new BoardService();
	
	int boardReplyInsert = boardService.insertReply(new Board(Integer.parseInt(boardNo), boardTitle, boardContent, null, 0, 0, 0, 0, new Product(Integer.parseInt(productNo)), new User(sUserId)));
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("board_list.jsp?pageno=%s&productNo=%s",pageno,productNo));
	
%>