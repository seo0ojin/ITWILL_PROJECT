package com.itwill.shop.cart;

import java.util.List;

public interface CartDao  {
	
	
	int cartInsert(Cart cart);
	

	List<Cart> findCartByUserId(String userId);

	Cart findCartByCartNo(int cartno);


	int deleteCartByCartNo(int cartNo);

	int deleteCartByUserId(String userId);

	//카트에서 수정
	int updateCartByCartNo(int productNo, int planNo, int cartNo);

	//상품에서 카트추가시 수정
	int updateCartByUserId(int productNo, int planNo, String userId);

	//장바구니 상품 중복확인 
	int countByProductNo(String userId, int planNo, int productNo);
	
	
	
}
