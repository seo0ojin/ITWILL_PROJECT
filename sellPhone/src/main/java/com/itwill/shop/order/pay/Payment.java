package com.itwill.shop.order.pay;

import java.util.Date;

import com.itwill.shop.order.Order;

import lombok.Data;

public class Payment {
	private int paymentNo;
	private String payment;//결제수단
	private Date paymentDate;//결제일
	private String cardNo;
	private String accountNo;
	private Order order;
	
	public Payment(int paymentNo) {
		super();
		this.paymentNo = paymentNo;
	}
	public Payment(int paymentNo, String payment, Date paymentDate, String cardAccountNo, Order order) {
		super();
		this.paymentNo = paymentNo;
		this.payment = payment;
		this.paymentDate = paymentDate;
		if(payment!=null&&payment.equals("카드")) {
		this.cardNo = cardAccountNo;
		this.accountNo="";
		}else {
			this.accountNo=cardAccountNo;
			this.cardNo="";
		}
		this.order = order;
	}
	public Payment() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Payment [paymentNo=" + paymentNo + ", payment=" + payment + ", paymentDate=" + paymentDate + ", cardNo="
				+ cardNo + ", accountNo=" + accountNo + ", order=" + order + "]";
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Date getPaymentDate() {
		return paymentDate;
	}
	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
}
