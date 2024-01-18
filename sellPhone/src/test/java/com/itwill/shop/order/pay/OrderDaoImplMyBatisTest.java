package com.itwill.shop.order.pay;

import static org.junit.jupiter.api.Assertions.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.order.Order;
import com.itwill.shop.order.OrderDao;
import com.itwill.shop.order.OrderDaoImplMyBatis;
import com.itwill.shop.order.OrderItem;
import com.itwill.shop.order.OrderItemMapper;
import com.itwill.shop.order.OrderMapper;
import com.itwill.shop.product.Product;
import com.itwill.shop.product.ProductDaoImplMyBatis;
import com.itwill.shop.user.User;

class OrderDaoImplMyBatisTest {
	
	@Disabled
	@Test
	void testFindAllOrder() throws Exception {
		List<Order> productList = new OrderDaoImplMyBatis().findAllOrders();
		assertNotNull(productList);
		assertNotSame(0, productList.size());
	}
	@Disabled
	@Test
	void findOrderByNo() throws Exception {
		Order order = new OrderDaoImplMyBatis().findOrderByNo(4);
		assertNotNull(order);
	}



	@Disabled
	@Test
	void findOrdersById() throws Exception {
		List<Order> order = new OrderDaoImplMyBatis().findOrdersById("1111");
		assertNotNull(order);
	}

	
	@Disabled
	@Test
	void deleteOrder() throws Exception{
		int order = new OrderDaoImplMyBatis().deleteOrder(8);
		assertTrue(order==1,"삭제실패");

	}


	

	@Test
	void insertOrder() throws Exception {
		int insertRowCount = new OrderDaoImplMyBatis().insertOrder(new Order(5, 1000, new Date(), "용인시 상현동", "던지지마라", "배송중이다", "임도담", null , new Payment(1), null));
		assertTrue(insertRowCount==1);
	}
	@Disabled
	@Test
	void updateOrder() throws Exception {
		int updatedRowCount = new OrderDaoImplMyBatis().updateOrder(new Order(3, 1000, new Date(), "용인시 상현동", "던지지마라", "배송중이다", "임도담", null , null, null));
		assertTrue(updatedRowCount==1);
	}

	@Disabled
	@Test
		void findAllOrderItems() throws Exception {
		List<OrderItem> orderItemList = new OrderDaoImplMyBatis().findAllOrderItems();
		assertNotNull(orderItemList);
		assertNotSame(0, orderItemList.size());
	}
@Disabled
	@Test
	void findOrderItemByNo(int oiNo) throws Exception {
		OrderItem orderItem = new OrderDaoImplMyBatis().findOrderItemByNo(oiNo);
//		assertNotNull(orderItem);
	}

@Disabled
	@Test
	void findOrderItemsByOrder(int orderNo) throws Exception {
		List<OrderItem> orderItem = new OrderDaoImplMyBatis().findOrderItemsByOrder(orderNo);
		assertNotNull(orderItem);
		assertNotSame(0, orderItem.size());
	}

}
