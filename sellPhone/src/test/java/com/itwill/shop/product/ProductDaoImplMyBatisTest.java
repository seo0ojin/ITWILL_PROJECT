package com.itwill.shop.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Date;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ProductDaoImplMyBatisTest {



	@Test
	void testUpdateProduct() throws Exception {
		System.out.println(new ProductDaoImplMyBatis().findByImage("image/a245bk.jpg"));
		
	}


}
