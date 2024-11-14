package interior;

public class InteriorVO {
	private int idx;
	private String mid; 
	private String company;
	private String category;
	private String title;
	private int price;
	private String titleImg;
	private String subImg;
	private String thumbnail;
	private String fName;
	private String fSName;
	private int fSize;
	private String claim;
	private String wDate;
	private String interest;
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
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getSubImg() {
		return subImg;
	}
	public void setSubImg(String subImg) {
		this.subImg = subImg;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getfSName() {
		return fSName;
	}
	public void setfSName(String fSName) {
		this.fSName = fSName;
	}
	public int getfSize() {
		return fSize;
	}
	public void setfSize(int fSize) {
		this.fSize = fSize;
	}
	public String getClaim() {
		return claim;
	}
	public void setClaim(String claim) {
		this.claim = claim;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	@Override
	public String toString() {
		return "InteriorVO [idx=" + idx + ", mid=" + mid + ", company=" + company + ", category=" + category + ", title="
				+ title + ", price=" + price + ", titleImg=" + titleImg + ", subImg=" + subImg + ", thumbnail=" + thumbnail
				+ ", fName=" + fName + ", fSName=" + fSName + ", fSize=" + fSize + ", claim=" + claim + ", wDate=" + wDate
				+ ", interest=" + interest + "]";
	}
	
	
}
