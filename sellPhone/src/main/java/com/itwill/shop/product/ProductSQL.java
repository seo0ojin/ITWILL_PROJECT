package com.itwill.shop.product;

public class ProductSQL {
	// 프로덕트 전체 셀렉트
	public final static String PRODUCT_SELECT_ALL=
			"select * from product p join spec s on p.spec_no = s.spec_no";
	
	// 프로덕트 전체 셀렉트 (대표모델)
	public final static String PRODUCT_SELECT_ALL_MASTER=
			"select * from product p join spec s on p.spec_no = s.spec_no where product_color = '대표'";
		
	// 프로덕트 전체 셀렉트 (색상모델)
	public final static String PRODUCT_SELECT_ALL_COLOR=
				"select * from product p join spec s on p.spec_no = s.spec_no where product_color != '대표'";
	
	// 프로덕트 단일 셀렉트
	public final static String PRODUCT_SELECT_BY_NO=
			"select * from product p join spec s on p.spec_no = s.spec_no where product_no = #{}";

	// 프로덕트 이미지 경로 셀렉트
		public final static String PRODUCT_SELECT_BY_IMAGE=
				"select * from product p join spec s on p.spec_no = s.spec_no where product_color != '대표' and product_image = #{}";
	
	// 프로덕트 삭제
	public final static String DELETE_PRODUCT="delete from product where product_no = #{}";
		
	// 프로덕트 스펙 삭제
	public final static String DELETE_SPEC="delete from spec where spec_no = #{}";
	
	// 프로덕트 인서트
	public final static String PRODUCT_INSERT=
			"insert into product(product_no, product_name, product_model, product_price, product_storage, product_color, product_image, product_detail)\r\n"
			+ "         values(product_product_no_SEQ.nextval, #{}, #{}, #{}, #{}, #{}, #{}, #{})";
	
	
	//프로덕트 업데이트
	public final static String PRODUCT_UPDATE=	
	"update product set product_name = #{},"
	+ "					product_model = #{},"
	+ "					product_price = #{},"
	+ "					product_storage = #{},"
	+ "					product_color = #{},"
	+ "					product_image = #{},"
	+ "					product_detail = #{}"
	+ "where product_no = #{}";
	
	// 프로덕트 스펙 업데이트
	public final static String PRODUCT_SPEC_UPDATE =
			"update product set spec_no = #{} where product_no = #{}";
	
	// 스펙 인서트
	public final static String SPEC_INSERT = 
			"insert into spec(spec_no, spec_network, spec_brand, spec_release, spec_color, spec_display, spec_size, spec_weight, spec_ram, spec_battery, spec_os, spec_cam)"
			+ " values(spec_spec_no_SEQ.nextval, #{}, #{}, #{}, #{}, #{}, #{}, #{}, #{}, #{}, #{}, #{})";
	
	// 스팩 업데이트
	public final static String SPEC_UPDATE=
			"update spec set spec_network = #{},\r\n"
			+ "				spec_brand = #{},\r\\n"
			+ "				spec_release = #{},\r\n"
			+ "				spec_display = #{},\r\n"
			+ "				spec_size = #{},\r\n"
			+ "				spec_weight = #{},\r\n"
			+ "				spec_ram = #{},\r\n"
			+ "				spec_battery = #{},\r\n"
			+ "				spec_os = #{},\r\n"
			+ "				spec_cam = #{}\r\n"
			+ "where spec_no = #{}";
	
}
