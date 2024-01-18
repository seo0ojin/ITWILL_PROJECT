
select * from bank_pay;
select * from bank_pay where account_no=1;
select * from card_pay;
select * from card_pay where card_no=1;

delete card_pay where card_no=1;
delete bank_pay where account_no=1;

select * from payment;
select * from payment where payment_no=1;
select * from payment where card_no=1;
select * from payment where account_no=1;
select payment_payment_no_seq.CURRVAL from dual;

delete payment where payment_no=1;

update payment set payment='Account', card_no=null, account_no='125352335', payment_date=sysdate where payment_no=1;

select * from plan order by plan_fare desc;
select * from plan where plan_no=1;
select * from plan where plan_name='스페셜';
select * from plan where plan_fare>=50000 and plan_fare<=60000;
select * from plan where plan_desc like '%'||'90'||'%';
select * from plan where plan_dc>=10 and plan_dc<=15;
select * from plan where plan_fare>=50000 and plan_fare<=60000 and plan_dc>=1 and plan_dc<=2;

update plan set plan_name='스페셜', plan_dc= 11, plan_fare= 70000, plan_desc='데이터 완전 무제한' where plan_no=2;

delete plan where plan_no=1;
delete plan where plan_name='스페셜';

delete orders where order_no=1;

update orders set order_fee=1000000,order_date=sysdate,delivery='서울시 관악구',delivery_req='조심해주세요',delivery_status='배송중',delivery_receiver='최유강' where order_no=1;

select * from orders;
select * from orders where order_no=1;
select * from orders where order_date >= sysdate-10 and order_date<=sysdate;
select * from orders where user_id='';


delete order_item where oi_no=1;

update order_item set contact=24, plan_no=2 where oi_no=1;

select * from order_item;
select * from order_item where oi_no=1;
select * from order_item where order_no=1;

--orderitem, orders, cart 조인

update cart set cart_qty=1,plan_no=4 where cart_no=1;

delete cart where cart_no=1;

select * from cart where cart_no=1;
select * from cart where user_id='';

--cart 
select c.cart_no, cart_qty,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no;
select c.cart_no, cart_qty,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where cart_no=1;
--order_item
select oi.oi_no,contact,oi.plan_no,oi.product_no,oi.order_no,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from order_item oi join plan p on oi.plan_no=p.plan_no join product p on p.product_no=oi.product_no join spec s on s.spec_no=p.spec_no;
select oi.oi_no,contact,oi.plan_no,oi.product_no,oi.order_no,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from order_item oi join plan p on oi.plan_no=p.plan_no join product p on p.product_no=oi.product_no join spec s on s.spec_no=p.spec_no where oi_no=1;
select oi.oi_no,contact,oi.plan_no,oi.product_no,oi.order_no,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from order_item oi join plan p on oi.plan_no=p.plan_no join product p on p.product_no=oi.product_no join spec s on s.spec_no=p.spec_no where order_no=1;
--orders
select p.payment,p.payment_date,p.card_no,p.account_no,u.user_name,u.user_email,u.user_jumin,u.user_phone,u.user_gender,o.delivery,o.delivery_receiver,o.delivery_req,o.delivery_status,o.order_date,o.order_fee,o.payment_no,o.user_id,oi.oi_no,contact,oi.plan_no,oi.product_no,oi.order_no,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from order_item oi join plan p on oi.plan_no=p.plan_no join product p on p.product_no=oi.product_no join spec s on s.spec_no=p.spec_no join orders o on o.order_no=oi.order_no join userinfo u on u.user_id=o.user_id join payment p on p.payment_no=o.payment_no;
select p.payment,p.payment_date,p.card_no,p.account_no,u.user_name,u.user_email,u.user_jumin,u.user_phone,u.user_gender,o.delivery,o.delivery_receiver,o.delivery_req,o.delivery_status,o.order_date,o.order_fee,o.payment_no,o.user_id,oi.oi_no,contact,oi.plan_no,oi.product_no,oi.order_no,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from order_item oi join plan p on oi.plan_no=p.plan_no join product p on p.product_no=oi.product_no join spec s on s.spec_no=p.spec_no join orders o on o.order_no=oi.order_no join userinfo u on u.user_id=o.user_id join payment p on p.payment_no=o.payment_no where u.user_id='';