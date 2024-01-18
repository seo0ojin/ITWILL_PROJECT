package com.itwill.shop.order;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itwill.shop.order.pay.Payment;
import com.itwill.shop.order.pay.PaymentMapper;

public class OrderDaoImplMyBatis implements OrderDao {
	private SqlSessionFactory sqlSessionFactory;

	public OrderDaoImplMyBatis() throws Exception {
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override

	public List<Order> findOrdersByDeliveryReceiver(String deliveryReceiver) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findOrdersByDeliveryReceiver(deliveryReceiver);
		sqlSession.close();
		return orderList;
	}

	@Override
	public int updateOrder(Order order) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.updateOrder(order);
		sqlSession.close();
		return rowCount;

	}

	@Override
	public int deleteOrder(int orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		int rowCount = orderMapper.deleteOrder(orderNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int insertOrder(Order order, Payment payment) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(false);
		try {
			OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
			OrderItemMapper oiMapper = sqlSession.getMapper(OrderItemMapper.class);
			int paymentNo = orderMapper.insertPayment(payment);
			order.setPayment(payment);
			orderMapper.insertOrder(order);
			int orderNo = order.getOrderNo();
			List<OrderItem> oiList = order.getOrderItems();
			for (int i = 0; i < oiList.size(); i++) {
				oiList.get(i).setOrder(order);
				oiMapper.insertOrderItem(oiList.get(i));
			}
		} catch (Exception e) {
			sqlSession.rollback();
			sqlSession.close();
			return 0;
		}
		sqlSession.commit();
		sqlSession.close();
		return 1;
	}

	@Override
	public int insertOrderItem(OrderItem orderItem) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(false);
		OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
		int rowCount = orderItemMapper.insertOrderItem(orderItem);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int insertPayment(Payment payment) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(false);
		OrderMapper paymentMapper = sqlSession.getMapper(OrderMapper.class);
		paymentMapper.insertPayment(payment);
		sqlSession.close();
		return payment.getPaymentNo();
	}

	@Override
	public int updateOrderItem(OrderItem orderItem) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
		int rowCount = orderItemMapper.updateOrderItem(orderItem);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteOrderItem(int orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
		int rowCount = orderItemMapper.deleteOrderItem(orderNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public List<Order> findAllOrders() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findAllOrders();
		sqlSession.close();
		return orderList;
	}

	@Override
	public Order findOrderByNo(int orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		Order order = orderMapper.findOrderByNo(orderNo);
		return order;
	}

	@Override
	public List<Order> findOrdersByDate(Date startDate, Date endDate) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orders = orderMapper.findOrdersByDate(startDate, endDate);
		return orders;
	}

	@Override
	public List<Order> findOrdersById(String userId) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		List<Order> orderList = orderMapper.findOrdersById(userId);
		sqlSession.close();
		return orderList;
	}

	@Override
	public List<OrderItem> findAllOrderItems() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
		List<OrderItem> orderItemList = orderItemMapper.findAllOrderItem();
		return orderItemList;
	}

	@Override
	public OrderItem findOrderItemByNo(int oiNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
		OrderItem orderItem = orderItemMapper.findOrderItemByNo(oiNo);
		sqlSession.close();
		return orderItem;
	}

	@Override
	public List<OrderItem> findOrderItemsByOrder(int orderNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		OrderItemMapper orderItemMapper = sqlSession.getMapper(OrderItemMapper.class);
		List<OrderItem> orderitemList = orderItemMapper.findOrderItemsByOrder(orderNo);
		sqlSession.close();
		return orderitemList;
	}

	public void commit() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.commit();
		sqlSession.close();
	}

	public void rollback() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.rollback();
		sqlSession.close();
	}

}
