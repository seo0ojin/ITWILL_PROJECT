select * from orders;

select * from orders where orders_no=1;

select * from orders where orders_date=sysdate;

select * from orders where user_id='임도담';

update orders set order_no = 456,
    			  order_fee = 2,
    			  order_date = sysdate,
    			  delivery = 'delivery수정',
    			  delivery_req = 'delivery_req수정',
    			  delivery_status = 'delivery_status수정',
    			  delivery_receiver = 'delivery_receiver수정',
    			  user_id = 'user_id수정',
    			  payment_no = 2

delete from orders where order_no = 1;


    			
				  
				  