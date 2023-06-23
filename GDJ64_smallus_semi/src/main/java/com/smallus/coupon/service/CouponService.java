package com.smallus.coupon.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.coupon.dao.CouponDao;
import com.smallus.coupon.model.vo.Coupon;

public class CouponService {
	private CouponDao dao= new CouponDao();
	
	
	public List<Coupon> searchByMemberCoupon(String memberId,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Coupon> list=dao.searchByMemberCoupon(conn, memberId,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int insertCoupon(String coupon,String memberId) {
		Connection conn=getConnection();
		int result=dao.insertCoupon(conn,coupon,memberId);
		close(conn);
		return result;
	}
	public int deleteCoupon() {
		Connection conn=getConnection();
		int result=dao.deleteCoupon(conn);
		close(conn);
		return result;
		
	}
	public int couponCount(String memberId) {
		Connection conn=getConnection();
		int result=dao.couponCount(conn,memberId);
		close(conn);
		return result;
	}
	
	public List<Coupon> selectCouponByMemberId(String memberId){
		Connection conn=getConnection();
		List<Coupon> list=dao.selectCouponByMemberId(conn, memberId);
		close(conn);
		return list;
	}
	
}
