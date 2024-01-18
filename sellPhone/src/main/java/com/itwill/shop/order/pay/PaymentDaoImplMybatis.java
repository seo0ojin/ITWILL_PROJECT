package com.itwill.shop.order.pay;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PaymentDaoImplMybatis implements PaymentDao{
	private SqlSessionFactory sqlSessionFactory;
	
	public PaymentDaoImplMybatis() throws Exception {
		this.sqlSessionFactory= new SqlSessionFactoryBuilder().build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	@Override
	public int insertCard(Card card) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper =sqlSession.getMapper(PaymentMapper.class);
		int rowCount=paymentMapper.insertCard(card);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int insertAccount(Account account) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper =sqlSession.getMapper(PaymentMapper.class);
		int rowCount=paymentMapper.insertAccount(account);
		sqlSession.close();
		return rowCount;
	}

	

	@Override
	public int deleteCard(String cardNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper =sqlSession.getMapper(PaymentMapper.class);
		int rowCount = paymentMapper.deleteCard(cardNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deleteAccount(String accountNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper =sqlSession.getMapper(PaymentMapper.class);
		int rowCount = paymentMapper.deleteAccount(accountNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int deletePayment(int paymentNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper =sqlSession.getMapper(PaymentMapper.class);
		int rowCount = paymentMapper.deletePayment(paymentNo);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int updatePayment(Payment payment) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper =sqlSession.getMapper(PaymentMapper.class);
		int rowCount = paymentMapper.updatePayment(payment);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public Account findAccount(String accountNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
		Account account = paymentMapper.findAccount(accountNo);
		sqlSession.close();
		return account;
	}

	@Override
	public Card findCard(String cardNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
		Card card= paymentMapper.findCard(cardNo);
		sqlSession.close();
		return card;
	}


	@Override
	public Payment findPaymentByPaymentNo(int paymentNo) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		PaymentMapper paymentMapper = sqlSession.getMapper(PaymentMapper.class);
		Payment payment= paymentMapper.findPaymentByPaymentNo(paymentNo);
		sqlSession.close();
		return payment;
	}


}
