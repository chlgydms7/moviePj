package com.movie;

public class MovieStoreDTO {
	private int num;
	private String subject;
	private String saveFileName;
	private String originalFileName;
	private int price;
	private String storeType;
	
	
	public String getStoreType() {return storeType;}
	public void setStoreType(String storeType) {this.storeType = storeType;}
	public int getNum(){return num;}
	public void setNum(int num) {this.num = num;}
	public String getSubject() {return subject;}
	public void setSubject(String subject) {this.subject = subject;}
	public String getSaveFileName(){return saveFileName;}
	public void setSaveFileName(String saveFileName) {this.saveFileName = saveFileName;}
	public String getOriginalFileName() {return originalFileName;}
	public void setOriginalFileName(String originalFileName) {this.originalFileName = originalFileName;}
	public int getPrice() {return price;}
	public void setPrice(int price) {this.price = price;}

}
