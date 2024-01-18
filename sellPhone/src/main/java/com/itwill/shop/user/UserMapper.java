package com.itwill.shop.user;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {

	@Insert("insert into userinfo values(#{userId},#{userPassword},#{userName},#{userEmail},#{userEmailSend},#{userJumin},#{userPhone},#{userGender})")
	public int insert(User user) throws Exception;
	
	@Update("update userinfo set user_password=#{userPassword},user_name=#{userName},user_email=#{userEmail},user_email_send=#{userEmailSend},user_jumin=#{userJumin}, user_phone=#{userPhone} where user_id=#{userId}")
	public int update(User user) throws Exception;
	
	@Delete("delete userinfo where user_id=#{userId}")
	public int delete(String userId) throws Exception;

	@Select("select user_id,user_password,user_name,user_email,user_email_send,user_jumin,user_phone,user_gender from userinfo")
	public List<User> findAll() throws Exception;
	
	@Select("select * from userinfo where user_id=#{userId}")
	public User findById(String userId) throws Exception;
	
	@Select("select count(*) cnt from userinfo where user_id=#{userId}")
	int countById(String userId) throws Exception;
	
	@Select("select * from userinfo where user_id=#{userName}")
	public User findByName(String name) throws Exception;

}