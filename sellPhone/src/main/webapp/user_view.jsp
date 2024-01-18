<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	UserService userService=new UserService();
	User user = userService.findById(sUserId);
	System.out.print(user);
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내정보</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<link rel="icon" href="image/icons-phone.png">
<script type="text/javascript">
	
	function userModify() {
		document.f.action = "user_modify_form.jsp";
		document.f.method = "POST";
		document.f.submit();
	}
	function userLogout() {
		
		document.f.action = "user_logout_action.jsp";
		document.f.method = "POST";
		document.f.submit();
		
	}
	function userRemove() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.f.action = "user_remove_action.jsp";
			document.f.method='POST';
			document.f.submit();
		}
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
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->

			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내정보 관리
											- 내정보보기</b></td>
								</tr>
							</table> <!-- view Form  -->
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"> 
										아이디</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
										&nbsp;&nbsp;<%=user.getUserId() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22"> 
										이름</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
										&nbsp;&nbsp;<%=user.getUserName()%>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">
										 이메일 주소</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
										&nbsp;&nbsp;<%=user.getUserEmail() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">
										 이메일 수신여부</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
											<% 
											int count = user.getUserEmailSend();
											String emailCheck="O";
												if(count>0){ 
												emailCheck = "O";
												}else{
												emailCheck = "X";
												}
												%>
											&nbsp;&nbsp;<%=emailCheck %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">
										 주민번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
										&nbsp;&nbsp;<%=user.getUserJumin() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">
										 전화번호</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
										&nbsp;&nbsp;<%=user.getUserPhone() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">
										 성별</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10">
										&nbsp;&nbsp;<%=user.getUserGender() %>
										</td>
									</tr>
									
								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="정보 수정" onClick="userModify()">&nbsp; 
									<input type="button" value="로그아웃" onClick="userLogout()">&nbsp; 
									<input type="button" value="탈퇴" onClick="userRemove()">&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
