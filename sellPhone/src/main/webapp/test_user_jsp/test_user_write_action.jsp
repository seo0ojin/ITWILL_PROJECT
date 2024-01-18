<%@page import="com.itwill.shop.user.User"%>
<%@page import="com.itwill.shop.user.UserService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <% 
 	if(request.getMethod().equalsIgnoreCase("GET")){
 		response.sendRedirect("test_user_write_form.jsp");
 		return;
 	}
 	request.setCharacterEncoding("UTF-8");
 	
 	
 	int email_check=0;
 	
 	String user_id = request.getParameter("user_id");
 	String user_password = request.getParameter("user_password");
 	String user_name = request.getParameter("user_name");
 	String user_email = request.getParameter("user_email");
 	String user_email_send = request.getParameter("user_email_send");
 	
 	if(user_email_send ==null){
 		email_check=0;
 	}else{
 		email_check=1;
 	}
 	String user_jumin = request.getParameter("user_jumin");
 	String user_phone = request.getParameter("user_phone");
 	String user_gender = request.getParameter("user_gender");
 	
 	
 	UserService userService = new UserService();
	int insertPK= userService.create(new User(user_id,
			user_password,
			user_name,
			user_email,
			email_check,
			user_jumin,
			user_phone,
			user_gender));
					
 	if(insertPK>0){
 		out.println("<script>");
 		out.println("alert('가입 성공');");
 		out.println("location.href='test_user_write_form.jsp';");
 		out.println("</script>");
 		return;
 	}
 	
	//response.sendRedirect("test_user_write_form.jsp?user_id="+insertPK);
 %>
