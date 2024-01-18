<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
</head>
<body>
<form method="post" style="width: 600px;margin:0 auto 0 auto" 
	   action="test_user_write_action.jsp">
아이디
<input type="text" name="user_id"><br/>
비밀번호
<input type="text" name="user_password"><br/>
이름
<input type="text" name="user_name"><br/>
이메일
<input type="text" name="user_email"><br/>
이메일 수신동의
<input type="checkbox" name="user_email_send"><br/>
주민번호
<input type="text" name="user_jumin"><br/>
전화번호
<input type="text" name="user_phone"><br/>
성별
<input type="radio" name="user_gender" value="M"/>남
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
<input type="radio" name="user_gender" value="F" checked="checked"/>여<br/>
<br/>
<input type="submit" value="회원가입" />
<input type ="reset" value="취소" />
</form>
</body>
</html>