
public class Item {
  private int mid; //medicine ID
	private String name;
	private String brand;
	private int cost;
	private String description;
	
	private String expireDate;
	private String status;
	private String stockstatus;
	
	private int quantity;
	private int averageConsumption;
	
	public Item() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Item(int mid, String name, String brand, int cost,
			String description, String expireDate, String status,
			String stockstatus, int quantity, int averageConsumption) {
		super();
		this.mid = mid;
		this.name = name;
		this.brand = brand;
		this.cost = cost;
		this.description = description;
		this.expireDate = expireDate;
		this.status = status;
		this.stockstatus = stockstatus;
		this.quantity = quantity;
		this.averageConsumption = averageConsumption;
	}
	
	@Override
	public String toString() {
		return "Medicine [mid=" + mid + ", name=" + name + ", brand=" + brand
				+ ", cost=" + cost + ", description=" + description
				+ ", expireDate=" + expireDate + ", status=" + status
				+ ", stockstatus=" + stockstatus + ", quantity=" + quantity
				+ ", averageConsumption=" + averageConsumption + "]";
	}
	
	
	public int getMid() {
		return mid;
	}
	
	public void setMid(int mid) {
		this.mid = mid;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getBrand() {
		return brand;
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public int getCost() {
		return cost;
	}
	
	public void setCost(int cost) {
		this.cost = cost;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getExpireDate() {
		return expireDate;
	}
	
	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}
	
	public String getStatus() {
		return status;
	}
	
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getStockstatus() {
		return stockstatus;
	}
	
	public void setStockstatus(String stockstatus) {
		this.stockstatus = stockstatus;
	}
	
	public int getQuantity() {
		return quantity;
	}
	
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public int getAverageConsumption() {
		return averageConsumption;
	}
	
	public void setAverageConsumption(int averageConsumption) {
		this.averageConsumption = averageConsumption;
	}
	

}
