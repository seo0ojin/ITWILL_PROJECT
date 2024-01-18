package com.itwill.shop.order.pay;

public class PaymentSQL {
final static public String INSERT_CARD="insert into card_pay values(#{cardNo},#{cardExpire},#{cardOwner})";
final static public String INSERT_ACCOUNT="insert into bank_pay values(#{accountNo},#{bank},#{accountOwner})";
final static public String INSERT_PAYMENT="insert into payment values(payment_payment_no_seq.currval,#{payment},sysdate,#{cardNo},#{accountNo})";

final static public String DELETE_ACCOUNT="delete bank_pay where account_no=#{accountNo}";
final static public String DELETE_CARD="delete card_pay where card_no=#{cardNo}";
final static public String DELETE_PAYMENT="delete payment where payment_no=#{paymentNo}";

final static public String SELECT_ACCOUNT="select * from bank_pay where account_no=#{accountNo}";
final static public String SELECT_CARD="select * from card_pay where card_no=#{cardNo}";
final static public String SELECT_PAYMENT_BY_PAYMENT_NO="select * from payment where payment_no=#{paymentNo}";
final static public String SELECT_PAYMENT_KEY="select payment_payment_no_seq.nextval from dual";

final static public String UPDATE_PAYMENT="update payment set payment=#{payment}, card_no=#{cardNo}, account_no=#{accountNo}, payment_date=sysdate where payment_no=#{paymentNo}";
}
