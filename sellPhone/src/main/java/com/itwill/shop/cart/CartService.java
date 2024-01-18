package com.itwill.shop.cart;

import java.util.List;

public class CartService {
	private CartDao cartDao;
	
	public CartService() throws Exception {
		cartDao=new CartDaoMybatis();
	}
	
	
	// User 카트리스트 전체보기
	public List<Cart> getCartByUserId(String userId){
		List<Cart> cartList=cartDao.findCartByUserId(userId);
		
		
		return cartList;
	}
	
	//USer 카트리스트 1개보기
	
	public Cart getCartByCartId(int cartno){
		Cart cart=cartDao.findCartByCartNo(cartno);
		return cart;
	}
	
	
	//상품리스트에서 카트추가 (카트중복체크)
	public int addCart(Cart cart) {
	
		 int rowCount =cartDao.cartInsert(cart);
	
	
		 return rowCount ;
		
	}
	
	
	
	// 카트 한개삭제
	public int deleteCartByCartNo(int cartNo) {
		int rowCount =cartDao.deleteCartByCartNo(cartNo);
		return rowCount;
	}
	
	// user 카트리스트 전체삭제 
	public int deleteCartByUserId(String userId) {
		int rowCount =cartDao.deleteCartByUserId(userId);
		return rowCount;
	}
	
	//장바구니에서 수정
	public int updateCart(int productNo ,int planNo,int cartNo) {
		int rowCount = cartDao.updateCartByCartNo(productNo,planNo,cartNo);
		return rowCount;
	}
	
	
	
	
}
