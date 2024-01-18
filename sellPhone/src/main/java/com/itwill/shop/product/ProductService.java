package com.itwill.shop.product;

import java.util.List;

public class ProductService {
	private ProductDao productDao;
	
	public ProductService() throws Exception {
		productDao = new ProductDaoImplMyBatis();
	}
	
	//전체리스트
	public List<Product> productList() throws Exception{
		return productDao.findAllProduct();
	}
	
	//전체리스트 (대표)
	public List<Product> productMasterList() throws Exception{
		return productDao.findMasterProduct();
	}
	
	//전체리스트 (대표, 가격높은순)
	public List<Product> productMasterListDesc() throws Exception{
		return productDao.findMasterProductDesc();
	}
		
		
	//전체리스트 (대표, 가격낮은순)
	public List<Product> productMasterListAsc() throws Exception{
		return productDao.findMasterProductAsc();
	}
	
	
	//전체리스트 (색상)
	public List<Product> productColorList() throws Exception{
		return productDao.findColorProduct();
	}
	
	//단일제품
	public Product productDetail(int p_no) throws Exception{
		return productDao.findByPrimaryKey(p_no);
	}
	
	public Product productDetailByImage(String productImage) throws Exception {
		return productDao.findByImage(productImage);
	}
	
	//제품 삽입
	public int insertProduct(Product product) throws Exception {
		return productDao.insertProduct(product);
	}
	// 제품 업데이트
	public int updateProduct(Product product) throws Exception{
		return productDao.updateProduct(product);
	}
	public int deleteProduct(int ProductNo)throws Exception{
		return productDao.deleteProduct(ProductNo);
	}
	

}
