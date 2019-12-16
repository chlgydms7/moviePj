package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

	public class Movie_discountDAO {
	
	private Connection conn;

	public Movie_discountDAO(Connection conn) {
		this.conn = conn;
	}
	
	public Movie_discountDTO getReadData(String userId) {
		
		Movie_discountDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			
			sql = "select userId,couponName,couponDiscout from Movie_discount where userId=?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new Movie_discountDTO();
				
				dto.setUserId(rs.getString("userId"));
				dto.setCouponName(rs.getString("couponName"));
				dto.setCouponDiscount(rs.getInt("couponDiscount"));
				
			}
			
			rs.close();
			pstmt.close();
			
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

}
