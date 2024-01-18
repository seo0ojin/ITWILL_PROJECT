package com.itwill.shop.user;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class UserDaoImplMyBatis implements UserDao{
	
		private SqlSessionFactory sqlSessionFactory;
		
		public UserDaoImplMyBatis() throws Exception{
			this.sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
		}
		
 		@Override
		public List<User> findAll() throws Exception{
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			List<User> userList = userMapper.findAll();
			sqlSession.close();
			return userList;
		}
		@Override
		public User findById(String userId) throws Exception{
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			User user = userMapper.findById(userId);
			sqlSession.close();
			return user;
		}
		
		@Override
		public int countById(String userId) throws Exception {
			SqlSession sqlSession= sqlSessionFactory.openSession(true);
			UserMapper userMapper=sqlSession.getMapper(UserMapper.class);
			int rowCount=userMapper.countById(userId);
			sqlSession.close();
			return rowCount;
		}
		
		@Override
		public int insert(User user) throws Exception{
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			int rowCount = userMapper.insert(user);
			sqlSession.close();
			return rowCount;
		}
		
		@Override
		public int update(User user) throws Exception{
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			int rowCount = userMapper.update(user);
			sqlSession.close();
			return rowCount;
		}
		
		@Override
		public int delete(String userId) throws Exception{
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			int rowCount = userMapper.delete(userId);
			sqlSession.close();
			return rowCount;
		}
		@Override
		public User findByName(String userName) throws Exception{
			SqlSession sqlSession = sqlSessionFactory.openSession(true);
			UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
			User user = userMapper.findByName(userName);
			sqlSession.close();
			return user;
		}
}
