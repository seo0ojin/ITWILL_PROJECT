-- 카트에 있는 카트아이템 중복확인
SELECT count(*) as p_count 
FROM cart c 
WHERE c.user_id = '1111' AND c.product_no = 3;

--select userid, cartno 로 검색
select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where cart_no=15;
select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where user_id='1111';

--cart  상품리스트
select c.cart_no,c.plan_no,c.product_no,c.user_id,p.plan_name,p.plan_dc,p.plan_fare,p.plan_desc,p.product_name,p.product_model,p.product_price,p.product_storage,p.product_color,p.product_image,p.product_detail,p.spec_no,s.spec_network,s.spec_brand,s.spec_release,s.spec_color,s.spec_display,s.spec_size,s.spec_weight,s.spec_ram,s.spec_battery,s.spec_os,s.spec_cam from cart c join plan p on c.plan_no=p.plan_no join product p on p.product_no=c.product_no join spec s on s.spec_no=p.spec_no where cart_no=1;

--update
update cart set product_no=2,plan_no=3 where cart_no=1;

--delete
delete cart where cart_no=4;
delete cart where user_id='3333';
