package com.smallus.payment.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.smallus.classes.model.vo.Classes;
import com.smallus.payment.model.vo.Payment;

public class PaymentDao {
	
	private Properties sql= new Properties();
	
	{
		String path=PaymentDao.class.getResource("/sql/payment.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
//	private Payment getPayment(ResultSet rs) throws SQLException {
//		return Payment.builder().paymentId(rs.getString("PAYMENT_ID")).paymentType(rs.getString("PAYMENT_TYPE")).classDetailId(rs.getString("CLASS_DETAIL_ID"))
//				.couponId(rs.getString("COUPON_ID")).amount(rs.getInt("AMOUNT")).finalPrice(rs.getInt("FINAL_PRICE")).paymentDate(rs.getDate("PAYMENT_DATE"))
//				.memberId(rs.getString("MEMBER_ID")).hostId(rs.getString("HOST_ID")).build();
//	}
//	
//	private Classes getClasses(ResultSet rs) throws SQLException {
//		return Classes.builder().classId(rs.getString("CLASS_ID")).classTitle(rs.getString("CLASS_TITLE")).classPersonnel(rs.getString(rs.getString("CLASS_PERSONNEL")))
//				.build();
//				
//	}
    //P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.CLASS_PERSONNEL, P.MEMBER_NAME
	public List<Payment> selectPaymentByhostId(Connection conn, String hostId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Payment> list=new ArrayList<Payment>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectPaymentByhostId"));
			pstmt.setString(1, hostId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Payment p=new Payment();
				p.setPaymentId(rs.getString("PAYMENT_ID"));
				p.setClassTitle(rs.getString("CLASS_TITLE"));
				p.setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				p.setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				p.setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				p.setMemberId(rs.getString("MEMBER_ID"));
				list.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	
	
	

}
