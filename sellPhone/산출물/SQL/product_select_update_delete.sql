select p.*, s.* from product p join spec s on p.spec_no = s.spec_no;
select p.*, s.* from product p join spec s on p.spec_no = s.spec_no where p.product_no = 1;

update product set product_name = 'name수정',
					product_model = 'model수정',
					product_price = 'price수정',
					product_storage = 'storage수정',
					product_color = 'color수정',
					product_image = 'image수정',
					product_detail = 'detail수정'
where product_no = 1;

update spec set spec_network = 'network수정',
				spec_brand = 'brand수정',
				spec_release = 'release수정',
				spec_display = 'display수정',
				spec_size = 'size수정',
				spec_weight = 'weight수정',
				spec_ram = 'ram수정',
				spec_battery = 'battery수정',
				spec_os = 'os수정',
				spec_cam = 'cam수정'
where spec_no = 1;
					
delete from product where product_no = 1;

delete from spec where spec_no = 1;