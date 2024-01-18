package com.itwill.shop.order;

import com.itwill.shop.plan.Plan;
import com.itwill.shop.product.Product;

import lombok.Data;


public class OrderItem {
	private int oiNo;
	private int contact;//약정기간(할부개념)
	private Plan plan; //요금제
	private Product product; //상품(단말기)
	private Order order;
	
	public OrderItem() {
		// TODO Auto-generated constructor stub
	}

	public OrderItem(int oiNo, int contact, Plan plan, Product product, Order order) {
		super();
		this.oiNo = oiNo;
		this.contact = contact;
		this.plan = plan;
		this.product = product;
		this.order = order;
	}

	@Override
	public String toString() {
		return "OrderItem [oiNo=" + oiNo + ", contact=" + contact + ", plan=" + plan + ", product=" + product
				+ ", order=" + order + "]";
	}

	public int getOiNo() {
		return oiNo;
	}

	public void setOiNo(int oiNo) {
		this.oiNo = oiNo;
	}

	public int getContact() {
		return contact;
	}

	public void setContact(int contact) {
		this.contact = contact;
	}

	public Plan getPlan() {
		return plan;
	}

	public void setPlan(Plan plan) {
		this.plan = plan;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
}
