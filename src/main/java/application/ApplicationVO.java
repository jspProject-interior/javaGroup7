package application;

public class ApplicationVO {
	private int idx;
	private String mid;
	private String name;
	private String conAddress;
	private String tel;
	private String category;
	private int price;
	private int budget;
	private int size;
	private String conStartDay;
	private String area;
	private String companyMid;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getConAddress() {
		return conAddress;
	}
	public void setConAddress(String conAddress) {
		this.conAddress = conAddress;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getBudget() {
		return budget;
	}
	public void setBudget(int budget) {
		this.budget = budget;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public String getConStartDay() {
		return conStartDay;
	}
	public void setConStartDay(String conStartDay) {
		this.conStartDay = conStartDay;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getCompanyMid() {
		return companyMid;
	}
	public void setCompanyMid(String companyMid) {
		this.companyMid = companyMid;
	}
	@Override
	public String toString() {
		return "ApplicationVO [idx=" + idx + ", mid=" + mid + ", name=" + name + ", conAddress=" + conAddress + ", tel="
				+ tel + ", category=" + category + ", price=" + price + ", budget=" + budget + ", size=" + size
				+ ", conStartDay=" + conStartDay + ", area=" + area + ", companyMid=" + companyMid + "]";
	}
}