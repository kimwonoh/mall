package cafe.jjdev.mall.vo;

public class Product {
	private int productNo;
	private int productCommonNo;
	private String productRental;
	private int productPrice;
	private String productStock;
	
	public String getProductRental() {
		return productRental;
	}
	public void setProductRental(String productRental) {
		this.productRental = productRental;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getProductCommonNo() {
		return productCommonNo;
	}
	public void setProductCommonNo(int productCommonNo) {
		this.productCommonNo = productCommonNo;
	}
	public String getProductStock() {
		return productStock;
	}
	public void setProductStock(String productStock) {
		this.productStock = productStock;
	}
	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", productCommonNo=" + productCommonNo + ", productRental="
				+ productRental + ", productPrice=" + productPrice + ", productStock=" + productStock + "]";
	}



}
