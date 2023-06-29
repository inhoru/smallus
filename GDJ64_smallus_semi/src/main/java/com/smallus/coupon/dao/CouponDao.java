package com.smallus.coupon.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smallus.coupon.model.vo.Coupon;

public class CouponDao {
	
	private Properties sql= new Properties();
	
	{
		String path=CouponDao.class.getResource("/sql/coupon.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Coupon> searchByMemberCoupon(Connection conn, String memberId,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Coupon> list=new ArrayList<Coupon>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchByMemberCoupon"));
			
			pstmt.setString(1, memberId);
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getCoupon(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	private Coupon getCoupon(ResultSet rs) throws SQLException {
		return Coupon.builder().couponId(rs.getString("COUPON_ID")).couponName(rs.getString("COUPON_NAME")).couponPrice(rs.getInt("COUPON_PRICE"))
				.created_date(rs.getDate("CREATED_DATE")).expiredDate(rs.getDate("EXPIRED_DATED")).build();
	}
	public int insertCoupon(Connection conn, String coupon, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertCoupon"));
			pstmt.setString(1, coupon);
			pstmt.setString(2, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	public int deleteCoupon(Connection conn) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteCoupon"));
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int couponCount(Connection conn ,String memberId) {
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("couponCount"));
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, "NONE");
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	
	public List<Coupon> selectCouponByMemberId(Connection conn, String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Coupon> list=new ArrayList<Coupon>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectCouponByMemberId"));
			
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) list.add(getCoupon(rs));
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public Coupon searchCoupon(Connection conn, String memberId,String coupon){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Coupon c=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchCoupon"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, coupon);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				c=new Coupon();
				c.setCouponId(rs.getString("COUPON_ID"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return c;
	}
	
	
	

}
