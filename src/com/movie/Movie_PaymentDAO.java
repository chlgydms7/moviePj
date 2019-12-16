package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Movie_PaymentDAO {
	private Connection conn;
	public Movie_PaymentDAO(Connection conn) {
		this.conn=conn;
	}
	public int insert(Movie_PaymentDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql="insert into movie_paymenttable (movietype,timetype,roomtype,sitnum,userid,reservenum) values (?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMovietype());
			pstmt.setString(2, dto.getTimetype());
			pstmt.setInt(3, dto.getRoomtype());
			pstmt.setInt(4, dto.sitnum);
			pstmt.setString(5, dto.userId);
			pstmt.setInt(6, dto.getReserveNum());
			result=pstmt.executeUpdate();
			pstmt.close();
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return result;
	}
	public List<Movie_PaymentDTO> getLists(String movietype,String timetype,int roomtype){
		List<Movie_PaymentDTO> lists=new ArrayList<Movie_PaymentDTO>();
		PreparedStatement pstmt = null;
		String sql;
		ResultSet rs=null;
		try {
			sql="select movietype,timetype,roomtype,sitnum,userid from movie_paymenttable where movietype=? and timetype=? and roomtype=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, movietype);
			pstmt.setString(2, timetype);
			pstmt.setInt(3, roomtype);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Movie_PaymentDTO dto =new Movie_PaymentDTO();
				dto.setSitnum(rs.getInt("sitnum"));
				dto.setUserId(rs.getString("userid"));
				lists.add(dto);
			}
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.toString());
		}
		return lists;
	}
	
	public Movie_PaymentDTO getReadData(String userId) {

		Movie_PaymentDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;

		try {

			sql = "select movietype,timetype,roomtype,sitnum,userId,reservenum,paymethod from movie_paymenttable where userId=?";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			if(rs.next()) {

				dto = new Movie_PaymentDTO();

				dto.setMovietype(rs.getString("movietype"));
				dto.setTimetype(rs.getString("timetype"));
				dto.setRoomtype(rs.getInt("roomtype"));
				dto.setSitnum(rs.getInt("sitnum"));
				dto.setUserId(rs.getString("userId"));
				dto.setReserveNum(rs.getInt("reservenum"));
				dto.setPayMethod(rs.getString("paymethod"));
			}
			rs.close();
			pstmt.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	//결제를 했을때 데이터가 수정하는 메소드 
	public int paymentUpdateData(String userId,String payMethod, int reserveNum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {			
			sql="update movie_paymenttable set paymethod = ? , reserveNum = ?  where userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,payMethod);
			pstmt.setInt(2, reserveNum);
			pstmt.setString(3,userId);
			result = pstmt.executeUpdate();
			pstmt.close();
			System.out.println(userId+" : "+payMethod);
//		} catch (Exception e) {
//			System.out.println(e.toString());
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		finally {
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		return result;
	}
	public int paymentUpdateData(String userId,String payMethod) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {			
			sql="update movie_paymenttable set paymethod = ? where userid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,payMethod);
			pstmt.setString(2,userId);
			result = pstmt.executeUpdate();
			pstmt.close();
			System.out.println(userId+" : "+payMethod);
//		} catch (Exception e) {
//			System.out.println(e.toString());
		} catch (SQLException e) {
			System.out.println(e.toString());
		}
		finally {
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){};
		}
		return result;
	}
	public List<Movie_PaymentDTO> getListDate(String userId) {
		
		List<Movie_PaymentDTO> paylist = new ArrayList<Movie_PaymentDTO>();
		Movie_PaymentDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql  =  "select movietype,timetype,roomtype,sitnum,userId,reservenum,paymethod ";
			sql +=  " from movie_paymenttable where userId=? and paymethod is not null ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);

			rs = pstmt.executeQuery();

			while(rs.next()) {
				dto = new Movie_PaymentDTO();
				dto.setMovietype(rs.getString("movietype"));
				dto.setTimetype(rs.getString("timetype"));
				dto.setRoomtype(rs.getInt("roomtype"));
				dto.setSitnum(rs.getInt("sitnum"));
				dto.setUserId(rs.getString("userId"));
				dto.setReserveNum(rs.getInt("reservenum"));
				dto.setPayMethod(rs.getString("paymethod"));
				paylist.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return paylist;
	}	
}
