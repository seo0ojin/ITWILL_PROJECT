package com.itwill.shop.user;

import java.util.List;

public class UserService {
	
	private UserDao userDao;
	
	public UserService() throws Exception{
		userDao = new UserDaoImplMyBatis();
	}
	
	// 회원가입
	public int create(User user)throws Exception{
		/* -1:아이디중복 | 1:회원가입성공 */
		
		if(userDao.countById(user.getUserId())==1) { //아이디중복
			return -1;
		}else {
			//아이디 중복 X -> 회원가입
			userDao.insert(user);
			return 1;
		}
	}
	
	//회원 로그인
	/** 
	   0:아이디 존재 안함
	  	1:패쓰워드 불일치
	  	2:로그인 성공(세션)
	 **/
	public int login(String userId,String userPassword) throws Exception{
		int result=-1;
		//아이디존재여부
		User user = userDao.findById(userId);
		if(user==null) { 
			//아이디존재안함
			result = 0;
		}else { 
			//아이디존재함
			if(user.getUserPassword().equals(userPassword)) { 
				//패쓰워드일치
				result=2;
			}else { 
				//패쓰워드불일치
				result=1;
			}
		}
		return result;
	}
	
	//회원 상세보기
	public User findById(String userId) throws Exception{
		return userDao.findById(userId);
	}

	//전체 회원 리스트
	public List<User> findAll() throws Exception {
		return userDao.findAll();
	}
	
	
	//회원 수정
	public int update(User user) throws Exception{
		return userDao.update(user);
	}
	
	//회원 탈퇴
	public int delete(String userId) throws Exception{
		return userDao.delete(userId);
	}
	
	public User findByName(String name) throws Exception{
		return userDao.findById(name);
	}
}
