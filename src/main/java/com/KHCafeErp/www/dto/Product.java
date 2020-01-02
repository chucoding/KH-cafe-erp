package com.KHCafeErp.www.dto;

public class Product {
	private int productNo;
	private int categoryMapNo;
	private int optionNo;
	private int shopNo;
	private String shopName;
	private String productName;
	private String productContent;
	private int originPrice;
	private int price;
	private String productOrigin;
	private String selStartDate;
	private String enrollDate;
	private String selEndDate;
	private int selStatus;
	private String categoryName;
	private int categoryNo;
	
	@Override
	public String toString() {

		return "Product [productNo=" + productNo + ", categoryMapNo=" + categoryMapNo + ", optionNo="
				+ optionNo + ", shopNo=" + shopNo + ", productName=" + productName + ", productContent="
				+ productContent + ", originPrice=" + originPrice + ", price=" + price + ", productOrigin="
				+ productOrigin + ", selStartDate=" + selStartDate + ", enrollDate=" + enrollDate + ", selEndDate="
				+ selEndDate + ", selStatus=" + selStatus + ", categoryName=" + categoryName + ", categoryNo="
				+ categoryNo + "]";

	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getCategoryMapNo() {
		return categoryMapNo;
	}
	public void setCategoryMapNo(int categoryMapNo) {
		this.categoryMapNo = categoryMapNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public int getShopNo() {
		return shopNo;
	}
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductContent() {
		return productContent;
	}
	public void setProductContent(String productContent) {
		this.productContent = productContent;
	}
	public int getOriginPrice() {
		return originPrice;
	}
	public void setOriginPrice(int originPrice) {
		this.originPrice = originPrice;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getProductOrigin() {
		return productOrigin;
	}
	public void setProductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	public String getSelStartDate() {
		return selStartDate;
	}
	public void setSelStartDate(String selStartDate) {
		this.selStartDate = selStartDate;
	}
	public String getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(String enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getSelEndDate() {
		return selEndDate;
	}
	public void setSelEndDate(String selEndDate) {
		this.selEndDate = selEndDate;
	}
	public int getSelStatus() {
		return selStatus;
	}
	public void setSelStatus(int selStatus) {
		this.selStatus = selStatus;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	
	
	
}
