package com.movie;

public class Movie_discountDTO {
	
	private String userId;
	private String couponName;
	private int couponDiscount;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public int getCouponDiscount() {
		return couponDiscount;
	}
	public void setCouponDiscount(int couponDiscount) {
		this.couponDiscount = couponDiscount;
	}
	
}
