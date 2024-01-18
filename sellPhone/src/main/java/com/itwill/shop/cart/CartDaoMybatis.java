package com.itwill.shop.cart;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class CartDaoMybatis implements CartDao {
	private SqlSessionFactory sqlSessionFactory;
	public CartDaoMybatis() throws Exception{
		this.sqlSessionFactory = 
				new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	

	
	
	

	@Override
	public List<Cart> findCartByUserId(String userId) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		List<Cart> cartList = cartMapper.findCartByUserId(userId);
		sqlSession.close();
		return cartList;
	}

	@Override
	public Cart findCartByCartNo(int cartno) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		Cart cart = cartMapper.findCartByCartNo(cartno);
		sqlSession.close();
		return cart;
	}

	@Override
	public int countByProductNo(String userId,int planNo, int productNo) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int count = cartMapper.countByProductNo(userId,planNo, productNo);
		sqlSession.close();
		return count;
	}

	@Override
	public int deleteCartByCartNo(int cartNo) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.deleteCartByCartNo(cartNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteCartByUserId(String userId) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.deleteCartByUserId(userId);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int updateCartByCartNo(int productNo, int planNo, int cartNo) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateCartByCartNo(productNo, planNo, cartNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int updateCartByUserId(int productNo, int planNo, String userId) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.updateCartByUserId(productNo, planNo, userId);
		sqlSession.close();
		return rowCount;
	}




	@Override
	public int cartInsert(Cart cart) {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		CartMapper cartMapper=sqlSession.getMapper(CartMapper.class);
		int rowCount = cartMapper.cartInsert(cart);
		sqlSession.close();
		return rowCount;
	}

	public void commit() {
		SqlSession sqlSession= 
				sqlSessionFactory.openSession(true);
		sqlSession.commit();
		sqlSession.close();
		
	}




	

}
