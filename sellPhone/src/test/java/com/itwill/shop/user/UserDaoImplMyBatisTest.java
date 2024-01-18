package com.itwill.shop.user;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.user.User;
import com.itwill.shop.user.UserDao;
import com.itwill.shop.user.UserDaoImplMyBatis;

class UserDaoImplMyBatisTest {

	UserDao userDao;
	
//	@Disabled
	@Test
	void testUserDaoMyBatis() throws Exception{
		userDao= new UserDaoImplMyBatis();
		assertNotNull(userDao);
	}

	@BeforeEach
	void setUp() throws Exception{
		userDao = new UserDaoImplMyBatis();
	}
	
//	@Disabled
	@Test
	void testFindAll() throws Exception{
		List<User> userList = userDao.findAll();
		assertNotNull(userList);
		assertNotSame(userList.size(), 0);
//		fail("Not yet implemented");
	}
	
//	@Disabled
	@Test
	void testfindById() throws Exception{
		User user = userDao.findById("2222");
		assertNotNull(user);
		assertSame("2222", user.getUserId());
//		fail("Not yet implemented");
	}
	
//	@Disabled
	@Test
	void testInsert() throws Exception{
		int insertRowCount = userDao.insert(new User("6666", "6666", "test", "test@gmail.com", 1, "test_jumin", "tttt", "M"));
		assertTrue(insertRowCount==1,"삽입 실패");
//		fail("Not yet implemented");
	}
	
//	@Disabled
	@Test
	void testUpdate() throws Exception{
		int updateRowCount = userDao.update(new User("4444", "4444", "update", "testUp@..", 0, "uptest_j", "tttp", "F"));
		assertTrue(updateRowCount==1,"업데이트 실패");
//		fail("Not yet implemented");
	}
	
//	@Disabled
	@Test
	void testDelete() throws Exception{
		int deleteRowCount = userDao.delete("5555");
		assertTrue(deleteRowCount==1,"삭제 실패");
//		fail("Not yet implemented");
	}
	
}
