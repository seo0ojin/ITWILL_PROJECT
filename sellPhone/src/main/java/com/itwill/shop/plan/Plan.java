package com.itwill.shop.plan;

import com.itwill.shop.cart.Cart;
import com.itwill.shop.order.OrderItem;

import lombok.Data;


public class Plan {
private int planNo;
private String planName;
private double planDc;
private int planFare;
private String planDesc;
private Cart cart;
private OrderItem orderItem;

public Plan() {
	// TODO Auto-generated constructor stub
}

public Plan(int planNo, String planName, double planDc, int planFare, String planDesc, Cart cart, OrderItem orderItem) {
	super();
	this.planNo = planNo;
	this.planName = planName;
	this.planDc = planDc;
	this.planFare = planFare;
	this.planDesc = planDesc;
	this.cart = cart;
	this.orderItem = orderItem;
}

public Plan(int planNo) {
	super();
	this.planNo = planNo;
}

@Override
public String toString() {
	return "Plan [planNo=" + planNo + ", planName=" + planName + ", planDc=" + planDc + ", planFare=" + planFare
			+ ", planDesc=" + planDesc + ", cart=" + cart + ", orderItem=" + orderItem + "]";
}

public int getPlanNo() {
	return planNo;
}

public void setPlanNo(int planNo) {
	this.planNo = planNo;
}

public String getPlanName() {
	return planName;
}

public void setPlanName(String planName) {
	this.planName = planName;
}

public double getPlanDc() {
	return planDc;
}

public void setPlanDc(double planDc) {
	this.planDc = planDc;
}

public int getPlanFare() {
	return planFare;
}

public void setPlanFare(int planFare) {
	this.planFare = planFare;
}

public String getPlanDesc() {
	return planDesc;
}

public void setPlanDesc(String planDesc) {
	this.planDesc = planDesc;
}

public Cart getCart() {
	return cart;
}

public void setCart(Cart cart) {
	this.cart = cart;
}

public OrderItem getOrderItem() {
	return orderItem;
}

public void setOrderItem(OrderItem orderItem) {
	this.orderItem = orderItem;
}

}
