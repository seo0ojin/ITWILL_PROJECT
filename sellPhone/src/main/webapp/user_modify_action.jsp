<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>     
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
	try{
		
		int emailCheck=0;
		
		request.setCharacterEncoding("UTF-8");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String emailstr= request.getParameter("emailCheck");
		if (emailstr==null){
		 	emailCheck=0;
		}else{
		 	emailCheck=1;
		}
		String phone=request.getParameter("phone");
		
		UserService userService=new UserService();
		User findUser = userService.findById(sUserId);
		String jumin=findUser.getUserJumin();
		String gender=findUser.getUserGender();
		
		
		User user=new User(sUserId,password,name,email,emailCheck,jumin,phone,gender);
		int updateRowCount=userService.update(user);
		response.sendRedirect("user_view.jsp");
		
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");
	}
	
%>






