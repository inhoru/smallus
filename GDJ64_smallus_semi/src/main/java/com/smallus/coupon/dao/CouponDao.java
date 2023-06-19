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
	
	public List<Coupon> searchByMemberCoupon(Connection conn, String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Coupon> list=new ArrayList<Coupon>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchByMemberCoupon"));
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
	private Coupon getCoupon(ResultSet rs) throws SQLException {
		return Coupon.builder().couponId(rs.getString("COUPON_ID")).couponName(rs.getString("COUPON_NAME")).couponPrice(rs.getInt("COUPON_PRICE"))
				.created_date(rs.getDate("CREATED_DATE")).expiredDate(rs.getDate("EXPIRED_DATE")).build();
	}
	public int insertCoupon(Connection conn, String coupon, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertCoupon"));
			//INSERT INTO COUPON VALUES((SELECT COUPON_ID FROM COUPON_TYPE WHERE COUPON_ID='?'),'?');
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
			//DELETE FROM COUPON WHERE EXPIRED_DATE < SYSDATE
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
			//SELECT COUNT(MEMBER_ID) FROM COUPON WHERE MEMBER_ID=?
			pstmt.setString(1, memberId);
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
	
	
	

}
