package com.itwill.shop.product;

import java.util.List;

public interface ProductDao {

	List<Product> findAllProduct() throws Exception;

	List<Product> findMasterProduct() throws Exception;
	
	List<Product> findMasterProductDesc() throws Exception;
	
	List<Product> findMasterProductAsc() throws Exception;

	List<Product> findColorProduct() throws Exception;

	Product findByPrimaryKey(int product_no) throws Exception;
	
	Product findByImage(String productImage) throws Exception;

	int insertProduct(Product product) throws Exception;
	
	int updateProduct(Product product) throws Exception;
	
	int deleteProduct(int ProductNo) throws Exception;
	
	
}