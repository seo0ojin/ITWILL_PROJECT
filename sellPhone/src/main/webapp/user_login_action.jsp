<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if (request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_login_form.jsp");
		return;
	}

	String userId = request.getParameter("userId");
	String password = request.getParameter("password");
	
	UserService userService = new UserService();
	int loginUser = userService.login(userId, password);
	
	if(loginUser == 0){ //아이디 존재X
		String msg1 = userId+" 는 존재하지 않는 아이디입니다.";
		out.println("<script>");
		out.println(" alert('" + msg1 + "');");
		out.println(" location.href='user_login_form.jsp';");
		out.println("</script>");
	}else if(loginUser == 1){
		String msg2 = "패스워드가 일치하지 않습니다.";
		out.println("<script>");
		out.println(" alert('" + msg2 + "');");
		out.println(" location.href='user_login_form.jsp';");
		out.println("</script>");
	}else if(loginUser == 2){
		session.setAttribute("sUserId", userId);
		response.sendRedirect("shop_main.jsp");
	}
	

%>


