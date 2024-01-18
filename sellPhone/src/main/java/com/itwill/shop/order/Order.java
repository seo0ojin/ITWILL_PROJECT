package com.itwill.shop.order;

import java.util.Date;
import java.util.List;

import com.itwill.shop.order.pay.Payment;
import com.itwill.shop.user.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NonNull;

public class Order {
	private int orderNo;
	private int orderFee;
	private Date orderDate;
	private String delivery;// 배송주소
	private String deliveryReq;// 배송 요청사항
	private String deliveryStatus;// 배송상태
	private String deliveryReceiver;// 수령인
	private User user;// 주문자 정보
	private Payment payment;// 결제 정보
	private List<OrderItem> orderItems;// 주문할 아이템들

	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(int orderNo, int orderFee, Date orderDate, String delivery, String deliveryReq, String deliveryStatus,
			String deliveryReceiver, User user, Payment payment, List<OrderItem> orderItems) {
		super();
		this.orderNo = orderNo;
		this.orderFee = orderFee;
		this.orderDate = orderDate;
		this.delivery = delivery;
		this.deliveryReq = deliveryReq;
		this.deliveryStatus = "배송준비";
		this.deliveryReceiver = deliveryReceiver;
		this.user = user;
		this.payment = payment;
		this.orderItems = orderItems;
	}

	public Order(int orderNo) {
		super();
		this.orderNo = orderNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getOrderFee() {
		return orderFee;
	}

	public void setOrderFee(int orderFee) {
		this.orderFee = orderFee;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getDeliveryReq() {
		return deliveryReq;
	}

	public void setDeliveryReq(String deliveryReq) {
		this.deliveryReq = deliveryReq;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getDeliveryReceiver() {
		return deliveryReceiver;
	}

	public void setDeliveryReceiver(String deliveryReceiver) {
		this.deliveryReceiver = deliveryReceiver;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderFee=" + orderFee + ", orderDate=" + orderDate + ", delivery="
				+ delivery + ", deliveryReq=" + deliveryReq + ", deliveryStatus=" + deliveryStatus
				+ ", deliveryReceiver=" + deliveryReceiver + ", user=" + user + ", payment=" + payment + ", orderItems="
				+ orderItems + "]";
	}

}
