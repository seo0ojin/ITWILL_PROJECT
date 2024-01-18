insert into card_pay values('110101028394','2027/08/12','최유강');
insert into card_pay values('392810859283','2027/08/27','이현승');
insert into card_pay values('295839592803','2027/09/01','박서진');
insert into card_pay values('206839673925','2027/12/10','임승환');
insert into card_pay values('508693729583','2028/01/12','윤호진');
insert into card_pay values('105839672930','2028/03/02','이서림');
insert into card_pay values('120583967203','2028/06/30','우수미');

insert into bank_pay values('1101038295838','신한은행','최유강');
insert into bank_pay values('106039271233','국민은행','이현승');
insert into bank_pay values('920101829538','농협은행','박서진');
insert into bank_pay values('01829538582959','우리은행','임승환');
insert into bank_pay values('1103829683769','신한은행','윤호진');
insert into bank_pay values('105829557293','국민은행','이서림');
insert into bank_pay values('1106028693926','신한은행','우수미');

insert into payment values(payment_payment_no_seq.nextval,'CARD',sysdate,'110101028394','');
insert into payment values(payment_payment_no_seq.nextval,'CARD',sysdate,'392810859283','');
insert into payment values(payment_payment_no_seq.nextval,'ACCOUNT',sysdate,'','920101829538');
insert into payment values(payment_payment_no_seq.nextval,'CARD',sysdate,'206839673925','');
insert into payment values(payment_payment_no_seq.nextval,'ACCOUNT',sysdate,'','1103829683769');
insert into payment values(payment_payment_no_seq.nextval,'ACCOUNT',sysdate,'','105829557293');
insert into payment values(payment_payment_no_seq.nextval,'CARD',sysdate,'120583967203','');

insert into plan values(plan_plan_no_seq.nextval,'5G초이스',15,90000,'데이터 완전 무제한+넷플릭스');
insert into plan values(plan_plan_no_seq.nextval,'5G심플 90GB',	6, 69000, '데이터 90GB');
insert into plan values(plan_plan_no_seq.nextval,'5G심플 50GB',	4, 63000, '데이터 50GB');
insert into plan values(plan_plan_no_seq.nextval,'5G심플 30GB',	3, 58000, '데이터 30GB');
insert into plan values(plan_plan_no_seq.nextval,'5G슬림', 2, 55000, '데이터 10GB');
insert into plan values(plan_plan_no_seq.nextval,'스페셜', 10, 80000, '데이터 완전 무제한+VIP혜택');

insert into orders values(orders_order_no_seq.nextval,300000,sysdate,'서울시 관악구 신림동','조심해주세요','배송준비','최유강',null,16);
insert into orders values(orders_order_no_seq.nextval,100000,sysdate,'서울시 서초구 ','조심해주세요','배송준비','이현승',null,2);
insert into orders values(orders_order_no_seq.nextval,800000,sysdate,'서울시 신논현','조심해주세요','배송준비','박서진',null,3);
insert into orders values(orders_order_no_seq.nextval,700000,sysdate,'서울시 압구정','조심해주세요','배송준비','임승환',null,4);
insert into orders values(orders_order_no_seq.nextval,600000,sysdate,'서울시 서울대입구','조심해주세요','배송준비','윤호진',null,5);
insert into orders values(orders_order_no_seq.nextval,400000,sysdate,'서울시 삼성동','조심해주세요','배송준비','이서림',null,6);
insert into orders values(orders_order_no_seq.nextval,500000,sysdate,'서울시 청담동','조심해주세요','배송준비','우수미',null,7);

insert into order_item values(order_item_oi_no_seq.nextval, 12, 3, 1, 1);
insert into order_item values(order_item_oi_no_seq.nextval, 24, 2, 1, 2);
insert into order_item values(order_item_oi_no_seq.nextval, 36, 1, 1, 3);
insert into order_item values(order_item_oi_no_seq.nextval, 30, 6, 1, 4);
insert into order_item values(order_item_oi_no_seq.nextval, 12, 3, 1, 5);
insert into order_item values(order_item_oi_no_seq.nextval, 24, 4, 1, 6);
insert into order_item values(order_item_oi_no_seq.nextval, 36, 1, 1, 7);

insert into cart values(cart_cart_no_seq.nextval,1,3,3,null);
insert into cart values(cart_cart_no_seq.nextval,1,3,2,null);
insert into cart values(cart_cart_no_seq.nextval,1,3,1,null);
insert into cart values(cart_cart_no_seq.nextval,1,3,1,null);
insert into cart values(cart_cart_no_seq.nextval,1,3,2,null);
insert into cart values(cart_cart_no_seq.nextval,1,3,1,null);
insert into cart values(cart_cart_no_seq.nextval,1,3,2,null);
