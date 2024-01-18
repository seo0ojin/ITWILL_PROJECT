package com.itwill.shop.order.pay;

import static org.junit.jupiter.api.Assertions.*;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import com.itwill.shop.order.Order;
import com.itwill.shop.order.OrderItem;
import com.itwill.shop.user.User;

import oracle.net.aso.p;

class PaymentDaoImplMybatisTest {
	@Disabled
	@Test
	void testInsertCard() throws Exception {
		int rowCount=new PaymentDaoImplMybatis().insertCard(new Card("108482952",new SimpleDateFormat("YYYY/MM/DD").parse("2028/01/03"),"testMan"));
		assertTrue(rowCount==1,"삽입실패");
	}
	@Disabled
	@Test
	void testInsertAccount() throws Exception {
		int rowCount=new PaymentDaoImplMybatis().insertAccount(new Account("108482952","신한은행","testMan"));
		assertTrue(rowCount==1,"삽입실패");
	
	}
	@Disabled
	@Test
	void testInsertPayment() throws Exception {
		Payment payment = new Payment(0,"Card",new Date(),"10389327",new Order(1,1000000,new Date(),"서울시","조심","배송준비","최유강",new User(),new Payment(15, null, null, null, null),new ArrayList<OrderItem>()));
		int rowCount=new PaymentDaoImplMybatis().insertPayment(payment);
		assertTrue(rowCount==payment.getPaymentNo(),"삽입실패");
	
	}

	@Disabled
	@Test
	void testDeleteCard() throws Exception {
		int rowCount =new PaymentDaoImplMybatis().deleteCard("108482952");
		assertTrue(rowCount==1,"삭제실패");
	}

	@Disabled
	@Test
	void testDeleteAccount() throws Exception {
		int rowCount =new PaymentDaoImplMybatis().deleteAccount("108482952");
		assertTrue(rowCount==1,"삭제실패");
	}

	@Disabled
	@Test
	void testDeletePayment() throws Exception {
		int rowCount =new PaymentDaoImplMybatis().deletePayment(1);
		assertTrue(rowCount==1,"삭제실패");
	}

	@Disabled
	@Test
	void testUpdatePayment() throws Exception {
		int rowCount =new PaymentDaoImplMybatis().updatePayment(new Payment(15, "Card", new Date(), "1039283", new Order(1,1000000,new Date(),"서울시","조심","배송준비","최유강",null,null,null)));
		assertTrue(rowCount==1,"변경실패");
	}

	@Disabled
	@Test
	void testFindAccount() throws Exception {
		Account account = new PaymentDaoImplMybatis().findAccount("108482952");
		assertNotNull(account);
		assertEquals("108482952", account.getAccountNo());
	}

	@Disabled
	@Test
	void testFindCard() throws Exception {
		Card card = new PaymentDaoImplMybatis().findCard("108482952");
		assertNotNull(card);
		assertEquals("108482952", card.getCardNo());
	}

	//@Disabled
	@Test
	void testFindPaymentByPaymentNo() throws Exception {
		Payment payment = new PaymentDaoImplMybatis().findPaymentByPaymentNo(27);
		assertNotNull(payment);
		assertSame(27, payment.getPaymentNo());
	}
@Disabled
	@Test
	void testFindPaymentByOrderNo() throws Exception {
		Payment payment = new PaymentDaoImplMybatis().findPaymentByOrderNo(9);
		assertNotNull(payment);
		assertSame(9, payment.getOrder().getOrderNo());
	}
@Disabled
	@Test
	void testFindAllPayments() throws Exception {
		List<Payment> payments = new PaymentDaoImplMybatis().findAllPayments();
		assertNotNull(payments);
		assertNotSame(0, payments.size());
		
	}

}
