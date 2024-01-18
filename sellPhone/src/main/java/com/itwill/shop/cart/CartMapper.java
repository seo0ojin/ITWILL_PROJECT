package com.itwill.shop.cart;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface CartMapper {

	//
	
	@Insert("insert into cart values(cart_cart_no_seq.nextval,#{plan.planNo},#{product.productNo},#{userId})")
	int cartInsert(Cart cart);
	
	
	
	@ResultMap("cartMapper")
	@Select("select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where user_id=#{userId}")
	List<Cart> findCartByUserId(String userId);
	
	@ResultMap("cartMapper")
	@Select("select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where cart_no=#{cartNo}")
	Cart findCartByCartNo(int cartNo);
	
	//장바구니 상품 중복확인 
	
	@Select("SELECT count(*) as p_count FROM cart c WHERE c.user_id = #{userId} AND c.plan_no = #{planNo} AND c.product_no=#{productNo}")
	int countByProductNo(@Param("userId") String userId, @Param("planNo")int planNo,@Param("productNo")int productNo);
	
	@Delete("delete cart where cart_no=#{cartNo}")
	int deleteCartByCartNo(int cartNo);
	@Delete("delete cart where user_id=#{userId}")
	int deleteCartByUserId(String userId);

	//카트에서 수정
	@Update("update cart set product_no=#{productNo},plan_no=#{planNo} where cart_no=#{cartNo}")
	int updateCartByCartNo(@Param("productNo")  int productNo,@Param("planNo") int planNo, @Param("cartNo") int cartNo);

	//상품에서 카트추가시 수정
	@ResultMap("cartMapper")
	@Update("update cart set product_no=#{productNo},plan_no=#{planNo} where user_id=#{userId}")
	int updateCartByUserId(@Param("productNo")int productNo, @Param("planNo")int planNo, @Param("userId")String userId);

	
	
}