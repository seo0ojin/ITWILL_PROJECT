package com.itwill.shop.order;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface OrderItemMapper {
	
	@Select("select * from order_item")
	public List<OrderItem> findAllOrderItem() throws Exception;

	@Select("select * from order_item where oi_no=#{oiNo}")
	public OrderItem findOrderItemByNo(int oiNo) throws Exception;

	@Insert("insert into order_item values(order_item_oi_no_seq.nextval, #{contact}, #{plan.planNo}, #{product.productNo}, #{order.orderNo})")
	public int insertOrderItem(OrderItem orderItem) throws Exception;

	@Update("update order_item set contact=#{contact}, plan_no=#{planNo} where oi_no=#{oiNo}")
	public int updateOrderItem(OrderItem orderItem) throws Exception;

	@Delete("delete order_item where oi_no=#{orderNo}")
	public int deleteOrderItem(int orderNo) throws Exception;

	@ResultMap("oiMapper")
	@Select("select * from order_item where order_no=#{orderNo}")
	public List<OrderItem> findOrderItemsByOrder(int orderNo) throws Exception;

	
}
