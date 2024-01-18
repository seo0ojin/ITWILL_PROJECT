package com.itwill.shop.user;

public class UserSQL {
	public final static String USERINFO_SELECT_ALL 
	="select * from userinfo";
	public final static String USERINFO_SELECT_BY_ID 
	="select * from userinfo where user_id = ?";
	
	public final static String USERINFO_UPDATE
	="update userinfo set user_password=?,user_name=?,user_email=?,user_email_send=?,user_jumin=?, user_phone =? where user_id = ?";
	public final static String USERINFO_DELETE 
	="delete from userinfo where user_id = ?";
	
	public final static String USERINFO_INSERT 
	="insert into userinfo values(?,?,?,?,?,?,?,?) ";
	
	public final static String USER_SELECT_BY_ID_COUNT
	="select count(*) cnt from userinfo where userid=?";
}
