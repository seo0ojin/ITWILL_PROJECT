 package com.itwill.shop.cart;

public class CartSQL {

	public static final String CART_INSERT = "insert into cart values(cart_cart_no_seq.nextval,?,?,?)";
	public static final String CART_SELECT_BY_USERID = "select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where user_id=?";
	public static final String CART_SELECT_BY_CART_NO = "select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where cart_no=?";
	public static final String CART_COUNT_BY_USERID_PRODUCT_NO = "SELECT count(*) as p_count \r\n"
			+ "FROM cart c \r\n"
			+ "WHERE c.user_id = ? AND c.plan_no = ? or\r\n"
			+ "c.product_no=?";
	public static final String CART_DELETE_BY_CART_NO = "delete cart where cart_no=?";
	public static final String CART_DELETE_BY_USERID = "delete cart where user_id=?";
	public static final String CART_UPDATE_BY_CART_NO = "update cart set product_no=?,plan_no=? where cart_no=?";
	public static final String CART_UPDATE_BY_USERID = "update cart set product_no=?,plan_no=? where user_id=?";
}	
