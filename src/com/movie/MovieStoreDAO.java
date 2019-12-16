package com.movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MovieStoreDAO {
	private Connection conn;
	public MovieStoreDAO(Connection conn) {this.conn=conn;}
	public int insertData(MovieStoreDTO dto) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "insert into movie_store (num,subject,saveFileName,originalFileName,price) values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,dto.getNum());
			pstmt.setString(2,dto.getSubject());
			pstmt.setString(3,dto.getSaveFileName());
			pstmt.setString(4,dto.getOriginalFileName());
			pstmt.setInt(5,dto.getPrice());
			result = pstmt.executeUpdate();;
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
		    if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return result;
	}
	//게시판을 사용할때 데이터 총 갯수를 불러옴 
	public int getDataCount() {
		int dataCount=0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(count(*),0) from movie_store";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){dataCount = rs.getInt(1);}
		}catch(Exception e) {
			System.out.println(e.toString());
		}finally {
			  if(rs!=null)try{rs.close();}catch(SQLException ex){}
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			 // if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		return dataCount;
	}
	public int getMaxNum() {
		int maxNum = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select nvl(max(num),0) from movie_store";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){maxNum = rs.getInt(1);}
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
			  if(rs!=null)try{rs.close();}catch(SQLException ex){}
			  if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			//  if(conn!=null)try{conn.close();}catch(SQLException ex){}	
		}
		return maxNum;
	}
	public List<MovieStoreDTO> getLists(int start, int end){
	
		List<MovieStoreDTO> lists = new ArrayList<MovieStoreDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select * from (select rownum rnum, data.* from ";
			sql+= "(select num,subject,saveFileName,originalFileName,price ";
			sql+= "from movie_store order by num desc) data) where rnum>=? and rnum<=?  ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			MovieStoreDTO dto = null;
			while(rs.next()) {
				dto = new MovieStoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));	
				dto.setPrice(rs.getInt("price"));
				lists.add(dto);	
			}
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
		     if(rs!=null)try{rs.close();}catch(SQLException ex){}
		     if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return lists;
	}	
	public MovieStoreDTO getReadData(int num) {
		MovieStoreDTO dto = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select num,subject,saveFileName,originalFileName,price from movie_store where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new MovieStoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));
				dto.setPrice(rs.getInt("price"));
			}
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
		  if (rs!=null)try{rs.close();}catch(SQLException ex){}
		  if (pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return dto;
	}
	public int deleteData(int num) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql;
		try {
			sql = "delete movie_store where num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.toString());
		}finally {
		  if (pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return result;
	}
	public List<MovieStoreDTO> getLists(){
		List<MovieStoreDTO> lists = new ArrayList<MovieStoreDTO>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			sql = "select num,subject,saveFileName,originalFileName,price from movie_store order by num";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			MovieStoreDTO dto = null;
			while(rs.next()) {
				dto = new MovieStoreDTO();
				dto.setNum(rs.getInt("num"));
				dto.setSubject(rs.getString("subject"));
				dto.setSaveFileName(rs.getString("saveFileName"));
				dto.setOriginalFileName(rs.getString("originalFileName"));	
				dto.setPrice(rs.getInt("price"));
				lists.add(dto);	
			}
		}catch (Exception e) {
			System.out.println(e.toString());
		}finally {
		     if(rs!=null)try{rs.close();}catch(SQLException ex){}
		     if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		}
		return lists;
	}
}
