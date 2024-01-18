package com.itwill.shop.user;

import java.util.List;

public interface UserDao {

	List<User> findAll() throws Exception;

	User findById(String userId) throws Exception;

	int insert(User user) throws Exception;

	int update(User user) throws Exception;

	int delete(String userId) throws Exception;

	int countById(String userId) throws Exception;

	User findByName(String userName) throws Exception;
}
