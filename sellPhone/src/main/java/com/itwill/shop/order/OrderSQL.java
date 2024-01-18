package com.itwill.shop.order;

public class OrderSQL {
	final static public String INSERT_ORDERS="insert into orders values(orders_order_no_seq.nextval,#{orderFee},sysdate,#{delivery},#{deliveryReq},#{deliveryStatus},#{deliveryReceiver},null,#{paymentNo})";
	final static public String INSERT_ORDER_ITEM="insert into order_item values(order_item_oi_no_seq.nextval, #{contact}, #{planNo}, #{productNo}, #{orderNo})";
	
	final static public String ORDER_SELECT_BY_ALL = "select * from orders";
	
	final static public String ORDER_SELECT_BY_NO = "select * from orders where orders_no=#{}";
	final static public String ORDER_SELECT_BY_DATE = "select * from orders where orders_date=#{}";
	final static public String ORDER_SELECT_BY_USER_ID= "select * from orders where user_id=#{}";
	
	final static public String ORDERS_UPDATE="update orders set order_no = #{}, order_fee = #{}, order_date = #{}, delivery = #{}, delivery_req = #{}, delivery_status = #{}, delivery_receiver = #{}, user_id = #{},payment_no = #{}";
	final static public String ORDERS_DELETE="delete from orders where order_no=?";
	
	final static public String ORDER_ITEM_DELETE = "delete order_item where oi_no=#{}";

	final static public String ORDER_ITEM_UPDATE = "update order_item set contact=#{}, plan_no=#{} where oi_no=#{}";

	final static public String ORDER_ITEM_SELECT_BY_ALL = "select * from order_item";
	final static public String ORDER_ITEM_SELECT_BY_NO ="select * from order_item where oi_no=#{}";
	final static public String ORDER_ITEM_SLELECT_BY_ORDER="select * from order_item where order_no=#{}";
	

	final static public String ORDERS_SELECT_BY_DATE="select * from orders where order_date >= #{startDate} and order_date<=#{endDate}";
}
