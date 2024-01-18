package com.itwill.shop.order;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import com.itwill.shop.order.pay.Payment;
import com.itwill.shop.order.pay.PaymentSQL;

public interface OrderMapper {
	@SelectKey(statement = "select orders_order_no_seq.nextval from dual", before = true, keyProperty = "orderNo", resultType = Integer.class)
	@Insert("insert into orders values(orders_order_no_seq.currval,#{orderFee},sysdate,#{delivery},#{deliveryReq},#{deliveryStatus},#{deliveryReceiver},#{user.userId},#{payment.paymentNo})")
	public int insertOrder(Order order) throws Exception;

	@Insert(PaymentSQL.INSERT_PAYMENT)
	@SelectKey(statement = PaymentSQL.SELECT_PAYMENT_KEY, before = true, keyProperty = "paymentNo", resultType = Integer.class)
	int insertPayment(Payment payment) throws Exception;

	@Update("update orders set order_fee = #{orderFee}, order_date = sysdate, delivery = #{delivery}, delivery_req = #{deliveryReq}, delivery_status = #{deliveryStatus}, delivery_receiver = #{deliveryReceiver}, user_id = #{user.userId}, payment_no = #{payment.paymentNo} where order_no = #{orderNo}")
	public int updateOrder(Order order) throws Exception;

	@Delete("delete orders where order_no=#{orderNo}")
	public int deleteOrder(int orderNo) throws Exception;

	@ResultMap("orderMapper")
	@Select("select * from orders")
	public List<Order> findAllOrders() throws Exception;
	@ResultMap("orderMapper")
	@Select("select * from orders where order_no=#{orderNo}")
	public Order findOrderByNo(int orderNo) throws Exception;

	@ResultMap("orderMapper")
	@Select("select * from orders where user_id=#{userId}")
	public List<Order> findOrdersById(String userId) throws Exception;

	@ResultMap("orderMapper")
	@Select("select * from orders where delivery_receiver=#{deliveryReceiver}")
	List<Order> findOrdersByDeliveryReceiver(String deliveryReceiver) throws Exception;

	List<Order> findOrdersByDate(Date startDate, Date endDate);

}
