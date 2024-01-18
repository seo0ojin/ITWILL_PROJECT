package com.itwill.shop.order;

import java.util.Date;
import java.util.List;

import com.itwill.shop.cart.CartDao;
import com.itwill.shop.cart.CartDaoMybatis;
import com.itwill.shop.order.pay.Payment;
import com.itwill.shop.order.pay.PaymentDao;
import com.itwill.shop.order.pay.PaymentDaoImplMybatis;

public class OrderService {
	OrderDao orderDao;
	CartDao cartDao;

	public OrderService() throws Exception {
		orderDao = new OrderDaoImplMyBatis();
		cartDao = new CartDaoMybatis();
	}

	public int insertOrder(Order order,Payment payment, String[] cartNoList) throws Exception {
		int orderNo=orderDao.insertOrder(order,payment);
		for(int i=0; i<cartNoList.length;i++) {
				cartDao.deleteCartByCartNo(Integer.parseInt(cartNoList[i]));
			}
		return 1;
	}

	public List<Order> findOrdersByDeliveryReceiver(String deliveryReceiver) throws Exception {
		return orderDao.findOrdersByDeliveryReceiver(deliveryReceiver);
	};

	public int insertPayment(Payment payment) throws Exception {
		return orderDao.insertPayment(payment);
	}

	public int updateOrder(Order order) throws Exception {
		return orderDao.updateOrder(order);

	}

	public int deleteOrder(int orderNo) throws Exception {
		return orderDao.deleteOrder(orderNo);
	}

	public int insertOrderItem(OrderItem orderItem) throws Exception {
		return orderDao.insertOrderItem(orderItem);
	}

	public int updateOrderItem(OrderItem orderItem) throws Exception {
		return orderDao.updateOrderItem(orderItem);
	}

	public int deleteOrderItem(int orderNo) throws Exception {
		return orderDao.deleteOrderItem(orderNo);
	}

	public List<Order> findAllOrders() throws Exception {
		return orderDao.findAllOrders();
	}

	public Order findOrderByNo(int orderNo) throws Exception {
		return orderDao.findOrderByNo(orderNo);
	}

	public List<Order> findOrdersByDate(Date startDate, Date endDate) throws Exception {
		return orderDao.findOrdersByDate(startDate, endDate);
	}

	public List<Order> findOrdersById(String userId) throws Exception {
		return orderDao.findOrdersById(userId);
	}

	public List<OrderItem> findAllOrderItems() throws Exception {
		return orderDao.findAllOrderItems();
	}

	public OrderItem findOrderItemByNo(int oiNo) throws Exception {
		return orderDao.findOrderItemByNo(oiNo);
	}

	public List<OrderItem> findOrderItemsByOrder(int orderNo) throws Exception {
		return orderDao.findOrderItemsByOrder(orderNo);
	}

	public void commit() {
		orderDao.commit();
	}

	public void rollback() {
		orderDao.rollback();
	}
}
