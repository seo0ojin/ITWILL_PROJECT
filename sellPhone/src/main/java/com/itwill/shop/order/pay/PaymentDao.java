package com.itwill.shop.order.pay;

import java.util.List;

public interface PaymentDao {
	int insertCard(Card card) throws Exception;
	int insertAccount(Account account) throws Exception;

	int deleteCard(String cardNo) throws Exception;
	int deleteAccount(String accountNo) throws Exception;
	int deletePayment(int paymentNo) throws Exception;
	
	int updatePayment(Payment payment) throws Exception;
	
	Account findAccount(String accountNo) throws Exception;
	Card findCard(String cardNo) throws Exception;
	Payment findPaymentByPaymentNo(int paymentNo) throws Exception;
}
