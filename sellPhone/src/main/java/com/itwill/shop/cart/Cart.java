package com.itwill.shop.cart;

import com.itwill.shop.plan.Plan;
import com.itwill.shop.product.Product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;



@Getter
@Setter
@ToString
public class Cart {
	private int cartNo;
	private String userId;
	Plan plan;
	Product product;
	
	public Cart(int cartNo, String userId, Plan plan, Product product) {
		super();
		this.cartNo = cartNo;
		this.userId = userId;
		this.plan = plan;
		this.product = product;
	}
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
	

}
