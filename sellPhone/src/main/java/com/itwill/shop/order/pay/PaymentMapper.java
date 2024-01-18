package com.itwill.shop.order.pay;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface PaymentMapper {
	@Insert(PaymentSQL.INSERT_CARD)
	int insertCard(Card card) throws Exception;
	@Insert(PaymentSQL.INSERT_ACCOUNT)
	int insertAccount(Account account) throws Exception;
	
	@Delete(PaymentSQL.DELETE_CARD)
	int deleteCard(String cardNo) throws Exception;
	@Delete(PaymentSQL.DELETE_ACCOUNT)
	int deleteAccount(String accountNo) throws Exception;
	@Delete(PaymentSQL.DELETE_PAYMENT)
	int deletePayment(int paymentNo) throws Exception;
	
	@Update(PaymentSQL.UPDATE_PAYMENT)
	int updatePayment(Payment payment) throws Exception;
	
	@Select(PaymentSQL.SELECT_ACCOUNT)
	Account findAccount(String accountNo) throws Exception;
	
	@Select(PaymentSQL.SELECT_CARD)
	Card findCard(String cardNo) throws Exception;
	
	@Select(PaymentSQL.SELECT_PAYMENT_BY_PAYMENT_NO)
	Payment findPaymentByPaymentNo(int paymentNo) throws Exception;
	
}
