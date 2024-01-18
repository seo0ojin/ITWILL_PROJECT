package com.itwill.shop.order;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.itwill.shop.order.pay.Payment;

public interface OrderDao {

	int insertOrder(Order order, Payment payment) throws Exception;

	int updateOrder(Order order) throws Exception;

	int deleteOrder(int orderNo) throws Exception;

	int insertPayment(Payment payment) throws Exception;

	int insertOrderItem(OrderItem orderItem) throws Exception;

	int updateOrderItem(OrderItem orderItem) throws Exception;

	int deleteOrderItem(int orderNo) throws Exception;

	List<Order> findAllOrders() throws Exception;

	Order findOrderByNo(int orderNo) throws Exception;

	List<Order> findOrdersByDate(Date startDate, Date endDate) throws Exception;

	List<Order> findOrdersById(String userId) throws Exception;

	List <Order> findOrdersByDeliveryReceiver(String deliveryReceiver) throws Exception;

	List<OrderItem> findAllOrderItems() throws Exception;

	OrderItem findOrderItemByNo(int oiNo) throws Exception;

	List<OrderItem> findOrderItemsByOrder(int orderNo) throws Exception;

	void commit();

	void rollback();
}
