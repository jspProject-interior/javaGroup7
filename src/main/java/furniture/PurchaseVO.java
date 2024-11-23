package furniture;

public class PurchaseVO {
	private int idx;
	private String cusMid; 
	private String comMid; 
	private String name;
	private String company;
	private String tel;
	private String address;
	private String category;
	private String title;
	private String thumbnail;
	private int pay;
	private int discount;
	private int price;
	private int cnt;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCusMid() {
		return cusMid;
	}
	public void setCusMid(String cusMid) {
		this.cusMid = cusMid;
	}
	public String getComMid() {
		return comMid;
	}
	public void setComMid(String comMid) {
		this.comMid = comMid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	@Override
	public String toString() {
		return "PurchaseVO [idx=" + idx + ", cusMid=" + cusMid + ", comMid=" + comMid + ", name=" + name + ", company="
				+ company + ", tel=" + tel + ", address=" + address + ", category=" + category + ", title=" + title
				+ ", thumbnail=" + thumbnail + ", pay=" + pay + ", discount=" + discount + ", price=" + price + ", cnt=" + cnt
				+ "]";
	}

}
