package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

public interface ProductMapper {
	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no")
	public List<Product> findAllProduct();
	
	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no where product_color = '대표'")
	public List<Product> findMasterProduct();
	
	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no where product_color != '대표'")
	public List<Product> findColorProduct();
	
	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no where product_color = '대표' order by product_price desc")
	public List<Product> findMasterProductDesc();
	
	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no where product_color = '대표' order by product_price")
	public List<Product> findMasterProductAsc();

	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no where product_no=#{productNo}")
	public Product findByPrimaryKey(int product_no);
	
	@ResultMap("productMapper")
	@Select("select * from product p join spec s on p.spec_no = s.spec_no where product_color != '대표' and product_image = #{productImage}")
	public Product findByImage(String productImage);
	
	@Delete("delete from product where product_no = #{productNo}")
	public int deleteProduct(int productNo);
	
	@SelectKey(statement = "select product_product_no_seq.nextval from dual", before = true, keyProperty = "productNo", resultType = Integer.class)
	@Insert("insert into product(product_no, product_name, product_model, product_price, product_storage, product_color, product_image, product_detail) values(#{productNo}, #{productName}, #{productModel}, #{productPrice}, #{productStorage}, #{productColor}, #{productImage}, #{productDetail})")
	public int insertProduct(Product product);
	
	
	@Update("update product set product_name = #{productNo},"
			+ "					product_model = #{productModel},"
			+ "					product_price = #{productPrice},"
			+ "					product_storage = #{productStorage},"
			+ "					product_color = #{productColor},"
			+ "					product_image = #{productImage},"
			+ "					product_detail = #{productDetail}"
			+ "where product_no = #{productNo}")
	public int updateProduct(Product product);
	
	@Update("update spec set spec_network = '#{specNetwork}',"
			+ "				spec_brand = '#{specBrand}',"
			+ "				spec_release = '#{specRelease}',"
			+ "				spec_display = '#{specDisplay}',"
			+ "				spec_size = '#{specSize}',"
			+ "				spec_weight = '#{specWeight}',"
			+ "				spec_ram = '#{specRam}',"
			+ "				spec_battery = '#{specBattery}',"
			+ "				spec_os = '#{specOs}',"
			+ "				spec_cam = '#{specCam}'"
			+ "where spec_no = #{specNo}")
	public int updateSpec(Product product);
	
	
	
	
	
	
}
