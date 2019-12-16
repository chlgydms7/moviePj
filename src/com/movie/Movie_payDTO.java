package com.movie;

public class Movie_payDTO {
	
	private String userId;
	private String payMethod;
	private String payInfo;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getPayInfo() {
		return payInfo;
	}
	public void setPayInfo(String payInfo) {
		this.payInfo = payInfo;
	}
	
}
