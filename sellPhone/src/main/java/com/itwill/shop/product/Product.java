package com.itwill.shop.product;


public class Product {
	private int productNo;
	private String productName;
	private String productModel;
	private int productPrice;
	private String productStorage;
	private String productColor;
	private String productImage;
	private String productDetail;
	private Spec spec;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int productNo, String productName, String productModel, int productPrice, String productStorage,
			String productColor, String productImage, String productDetail, Spec spec) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.productModel = productModel;
		this.productPrice = productPrice;
		this.productStorage = productStorage;
		this.productColor = productColor;
		this.productImage = productImage;
		this.productDetail = productDetail;
		this.spec = spec;
	}

	public Product(int productNo) {
		super();
		this.productNo = productNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductModel() {
		return productModel;
	}

	public void setProductModel(String productModel) {
		this.productModel = productModel;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductStorage() {
		return productStorage;
	}

	public void setProductStorage(String productStorage) {
		this.productStorage = productStorage;
	}

	public String getProductColor() {
		return productColor;
	}

	public void setProductColor(String productColor) {
		this.productColor = productColor;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public Spec getSpec() {
		return spec;
	}

	public void setSpec(Spec spec) {
		this.spec = spec;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productName=" + productName + ", productModel=" + productModel
				+ ", productPrice=" + productPrice + ", productStorage=" + productStorage + ", productColor="
				+ productColor + ", productImage=" + productImage + ", productDetail=" + productDetail + ", spec="
				+ spec + "]\n";
	}
	
	
	

}
