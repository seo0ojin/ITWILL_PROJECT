package com.itwill.shop.product;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ProductDaoImplMyBatis implements ProductDao {
	private SqlSessionFactory sqlSessionFactory;

	public ProductDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	public List<Product> findAllProduct() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findAllProduct();
		sqlSession.close();
		return productList;
	}
	
	public List<Product> findMasterProduct() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findMasterProduct();
		sqlSession.close();
		return productList;
	}
	
	public List<Product> findMasterProductDesc() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findMasterProductDesc();
		sqlSession.close();
		return productList;
	}
	
	public List<Product> findMasterProductAsc() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findMasterProductAsc();
		sqlSession.close();
		return productList;
	}
	
	public List<Product> findColorProduct() throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		List<Product> productList = productMapper.findColorProduct();
		sqlSession.close();
		return productList;
	}

	public Product findByPrimaryKey(int product_no) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product findProduct = productMapper.findByPrimaryKey(product_no);
		sqlSession.close();
		return findProduct;
	}
	
	public Product findByImage(String productImage) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		Product findProduct = productMapper.findByImage(productImage);
		sqlSession.close();
		return findProduct;
	}

	public int insertProduct(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		productMapper.insertProduct(product);
		sqlSession.close();
		return product.getProductNo();
	}

	public int updateProduct(Product product) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		int rowCount = productMapper.updateProduct(product);
		sqlSession.close();
		return rowCount;
	}

	public int deleteProduct(int productNo) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ProductMapper productMapper = sqlSession.getMapper(ProductMapper.class);
		int rowCount = productMapper.deleteProduct(productNo);
		sqlSession.close();
		return rowCount;
	}

}
