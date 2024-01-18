<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	/************case2 forward********************/
	String msg1 = (String)request.getAttribute("msg1");
	String msg2 = (String)request.getAttribute("msg2");
	User fuser = (User)request.getAttribute("fuser");
	
	if(msg1==null) msg1="";
	if(msg2==null) msg2="";
	if(fuser==null) fuser=new User("","","","",0,"","","");
	
	/*********************************************/
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
	 function userCreateForm() {
		location.href = "test_user_write_form.jsp";
	}

	function login() {
		if (document.f.userId.value == "") {
			alert("사용자 아이디를 입력하십시요.");
			document.f.userId.focus();
			return;
		}
		if (document.f.password.value == "") {
			alert("비밀번호를 입력하십시요.");
			f.password.focus();
			return;
		}

		document.f.action = "test_user_login_action.jsp";
		document.f.method='POST';
		document.f.submit();
	} 
</script>
<title>Insert title here</title>
</head>
<body>

<form method="post" style="width: 600px;margin:0 auto 0 auto" 
	   action="test_user_login_action.jsp">
	   
아이디
<input type="text" name="user_id" value=<%=fuser.getUser_id() %>><br/>
비밀번호
<input type="text" name="user_password" value=<%=fuser.getUser_password() %> ><br/>	   
	   
<br/>
<input type="submit" value="로그인" onClick="login();" />
<input type ="reset" value="취소" />
   
</form>
</body>
</html>