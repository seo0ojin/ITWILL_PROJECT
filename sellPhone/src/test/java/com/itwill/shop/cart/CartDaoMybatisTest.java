package com.itwill.shop.cart;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.plan.Plan;
import com.itwill.shop.product.Product;

class CartDaoMybatisTest {
	
	@Disabled
	@Test
	void testCartInsert() throws Exception {
		int rowCount = new CartDaoMybatis().cartInsert(new Cart(0, "2222", new Plan(7,null,1,1,null,null,null), new Product(51,null,null,1,null,null,null,null,null)));
		assertTrue(rowCount ==1,"삽입실패");
	}

	@Disabled
	@Test
	void testFindCartByUserId() throws Exception {
		List<Cart> cartList= new CartDaoMybatis().findCartByUserId("1111");
		assertTrue(cartList !=null,"삽입실패");
	}

	@Disabled
	@Test
	void testFindCartByCartNo() throws Exception{
		Cart cart= new CartDaoMybatis().findCartByCartNo(22);
		assertTrue(cart !=null,"삽입실패");
	}

	@Disabled
	@Test
	void testCountByProductNo()throws Exception {
		int count= new CartDaoMybatis().countByProductNo("1111", 3, 8);
		assertTrue(count ==0,"삽입실패");
	}

	@Disabled
	@Test
	void testDeleteCartByCartNo() throws Exception {
		int count= new CartDaoMybatis().deleteCartByCartNo(24);
		assertTrue(count ==1,"삽입실패");
	}

	@Disabled
	@Test
	void testDeleteCartByUserId() throws Exception {
		int count= new CartDaoMybatis().deleteCartByUserId("2222");
		assertTrue(count ==1,"삽입실패");
	}

	@Disabled
	@Test
	void testUpdateCartByCartNo() throws Exception {
		int count= new CartDaoMybatis().updateCartByCartNo(3,5,27);
		assertTrue(count ==1,"삽입실패");
	}

	@Disabled
	@Test
	void testUpdateCartByUserId() throws Exception {
		int count= new CartDaoMybatis().updateCartByUserId(5, 8, "3333");
		assertTrue(count ==1,"삽입실패");
	}

}
