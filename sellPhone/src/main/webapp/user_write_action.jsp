<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@page import="com.itwill.shop.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("user_write_form.jsp");
		return;
	}
	
	try{
	request.setCharacterEncoding("UTF-8");
	int emailCheck=0;
	
	String userId=request.getParameter("userId");
	String password=request.getParameter("password");
	String password2=request.getParameter("password2");
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String emailstr= request.getParameter("emailCheck");
		if (emailstr==null){
		 emailCheck=0;
		}else{
		 emailCheck=1;
		}
	
	String jumin=request.getParameter("jumin");
	String phone=request.getParameter("phone");
	String gender=request.getParameter("gender");
	
	User newUser=new User(userId,password,name,email,emailCheck,jumin,phone,gender);
	//System.out.println(newUser);
	UserService userService=new UserService();
	User checkId=userService.findById(userId);
	
	int rowCount = userService.create(newUser);
	if(rowCount<0){
		out.println("<script>");
		out.println(" alert('사용 불가능한 아이디입니다.');");
		out.println(" location.href='user_write_form.jsp'");
		out.println("</script>");
		return;
	}	
		response.sendRedirect("user_login_form.jsp");
	
	
	}catch(Exception e){
		e.printStackTrace();
		response.sendRedirect("user_error.jsp");
	}
    	
%>





