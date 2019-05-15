package cafe.jjdev.mall.vo;

import java.util.List;

public class ProductCommon {
	private int productCommonNo;
	private int categoryNo;
	private String productCommonName;
	private String productCommonContents;
	private String productCommonSummary;
	private int productCommonPrice;
	private String productCommonDescription;
	private String productCommonDate;
	
	public String getProductCommonContents() {
		return productCommonContents;
	}
	public void setProductCommonContents(String productCommonContents) {
		this.productCommonContents = productCommonContents;
	}
	public String getProductCommonSummary() {
		return productCommonSummary;
	}
	public void setProductCommonSummary(String productCommonSummary) {
		this.productCommonSummary = productCommonSummary;
	}
	private List<Product> products;
	
	public List<Product> getProducts() {
		return products;
	}
	public void setProducts(List<Product> products) {
		this.products = products;
	}
	public int getProductCommonNo() {
		return productCommonNo;
	}
	public void setProductCommonNo(int productCommonNo) {
		this.productCommonNo = productCommonNo;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getProductCommonName() {
		return productCommonName;
	}
	public void setProductCommonName(String productCommonName) {
		this.productCommonName = productCommonName;
	}
	public int getProductCommonPrice() {
		return productCommonPrice;
	}
	public void setProductCommonPrice(int productCommonPrice) {
		this.productCommonPrice = productCommonPrice;
	}
	public String getProductCommonDescription() {
		return productCommonDescription;
	}
	public void setProductCommonDescription(String productCommonDescription) {
		this.productCommonDescription = productCommonDescription;
	}
	public String getProductCommonDate() {
		return productCommonDate;
	}
	public void setProductCommonDate(String productCommonDate) {
		this.productCommonDate = productCommonDate;
	}
	@Override
	public String toString() {
		return "ProductCommon [productCommonNo=" + productCommonNo + ", categoryNo=" + categoryNo
				+ ", productCommonName=" + productCommonName + ", productCommonContents=" + productCommonContents
				+ ", productCommonSummary=" + productCommonSummary + ", productCommonPrice=" + productCommonPrice
				+ ", productCommonDescription=" + productCommonDescription + ", productCommonDate=" + productCommonDate
				+ ", products=" + products + "]";
	}
	
	
}
