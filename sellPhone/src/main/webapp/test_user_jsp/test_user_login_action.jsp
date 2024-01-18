<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("test_user_login_form.jsp");
		return;
	}

	String user_id = request.getParameter("user_id");
	String user_password = request.getParameter("user_password");
	UserService userService = new UserService();
	
	int result = userService.login(user_id, user_password);
	if(result == 0){ //아이디 존재X
		String msg1 = user_id+" 는 존재하지 않는 아이디입니다.";
		out.println("<script>");
		out.println(" alert('" + msg1 + "');");
		out.println(" location.href='test_user_login_form.jsp';");
		out.println("</script>");
	}else if(result == 1){
		String msg2 = "패스워드가 일치하지 않습니다.";
		out.println("<script>");
		out.println(" alert('" + msg2 + "');");
		out.println(" location.href='test_user_login_form.jsp';");
		out.println("</script>");
	}else if(result == 2){
		session.setAttribute("sUserId", user_id);
		response.sendRedirect("index.jsp");
	}
	
	
%>
