package com.itwill.shop.order.pay;

import java.util.List;

public class PaymentService {
	PaymentDao paymentDao;

	public PaymentService() throws Exception {
		paymentDao = new PaymentDaoImplMybatis();
	}

	public int insertAccount(Account account) throws Exception {
		return paymentDao.insertAccount(account);
	}

	public int insertCard(Card card) throws Exception {
		return paymentDao.insertCard(card);
	}

	

	public int deleteCard(String cardNo) throws Exception {
		return paymentDao.deleteCard(cardNo);
	}

	public int deleteAccount(String accountNo) throws Exception {
		return paymentDao.deleteAccount(accountNo);
	}

	public int deletePayment(int paymentNo) throws Exception {
		return paymentDao.deletePayment(paymentNo);
	}

	public int updatePayment(Payment payment) throws Exception {
		return paymentDao.updatePayment(payment);
	}

	public Account findAccount(String accountNo) throws Exception {
		return paymentDao.findAccount(accountNo);
	}

	public Card findCard(String cardNo) throws Exception {
		return paymentDao.findCard(cardNo);
	}

	public Payment findPaymentByPaymentNo(int paymentNo) throws Exception {
		return paymentDao.findPaymentByPaymentNo(paymentNo);
	}

}
