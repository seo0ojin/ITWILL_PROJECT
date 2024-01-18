<%@page import="com.itwill.shop.board.BoardService"%>
<%@page import="com.itwill.shop.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	//댓글의 대상글번호를 읽어서 변수에 저장
	if(request.getParameter("boardno")==null){
		response.sendRedirect("board_list.jsp");
		return;
	}
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	Board board=new BoardService().findBoard(boardno);
	if(board==null){
		response.sendRedirect("board_list.jsp");
		return;
	}
	String pageno="1";
	if(request.getParameter("pageno")!=null){
		pageno = request.getParameter("pageno");
	}
%>    	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
 
<script type="text/javascript">
	function boardReplayCreate() {
		if (document.f.boardTitle.value == "") {
			alert("제목을 입력하십시요.");
			f.boardTitle.focus();
			return false;
		}
		if (f.boardContent.value == "") {
			alert("내용을 입력하십시요.");
			f.boardContent.focus();
			return false;
		}
		f.action = "board_reply_write_action.jsp";
		f.method='POST';
		f.submit();
	}

	function boardList() {
		f.action = "board_list.jsp";
		f.submit();
	}
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>

									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>게시판 -
											게시판 답글 쓰기</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno"  value="<%=pageno%>" />
		        				<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>"/>
		        				<input type="hidden" name="productNo" value="<%= board.getProduct().getProductNo() %>"/>
		        				<input type="hidden" name="user" value="<%= sUserId %>"/>

								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input value="[RE]<%= board.getBoardTitle() %>"  type="text" style="width: 150"
											name="boardTitle">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<textarea name="boardContent" class="textarea" style="width: 350px" rows="14">>><%=board.getBoardContent().replace("\n",">>").trim()%></textarea>
										</td>
									</tr>


								</table>
							</form> <br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="게시판 답글 쓰기"
										onClick="boardReplayCreate()"> &nbsp; <input
										type="button" value="게시판 목록" onClick="boardList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
		<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>