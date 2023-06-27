package com.smallus.payment.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.member.model.vo.Member;
import com.smallus.member.model.vo.Notifications;
import com.smallus.payment.model.vo.ClassPayment;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.model.vo.PaymentCalc;
import com.smallus.payment.model.vo.PaymentCompleted;
import com.smallus.payment.model.vo.PaymentInfo;

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
	
    //SELECT P.PAYMENT_ID, C.CLASS_TITLE, CD.BOOKING_TIME_START, CD.BOOKING_TIME_END, P.CLASS_PERSONNEL, P.PAYMENT_DATE, P.MEMBER_ID, 
	//CL.CALC_PASS_DATE FROM CLASS_DETAIL CD LEFT JOIN CLASS C USING(CLASS_ID) LEFT JOIN PAYMENT P USING(CLASS_DETAIL_ID) 
	//LEFT JOIN CALC CL USING(HOST_ID)WHERE HOST_ID=? AND P.PAYMENT_ID IS NOT NULL
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
	public List<Member> searchByMemberPayment(Connection conn, String memberId,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList<Member>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchByMemberPayment"));
			//SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM (SELECT PAYMENT_STATUS,PAYMENT_DATE,CLASS_TITLE,CLASS_THUMBNAIL,P.CLASS_PERSONNEL,BOOKING_TIME_START,BOOKING_TIME_END FROM PAYMENT P JOIN CLASS_DETAIL USING(CLASS_DETAIL_ID) JOIN CLASS USING(CLASS_ID) WHERE MEMBER_ID=? ORDER BY PAYMENT_DATE DESC)B) WHERE RNUM BETWEEN ? AND ?
			pstmt.setString(1, memberId);
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			Classes c=new Classes();
			Payment p=new Payment();
			ClassDetail d=new ClassDetail();
			p.setPaymentStatus(rs.getString("PAYMENT_STATUS"));
			p.setPaymentDate(rs.getDate("PAYMENT_DATE"));
			c.setClassTitle(rs.getString("CLASS_TITLE"));
			c.setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
			p.setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
			d.setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
			d.setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
			p.setPaymentId(rs.getString("PAYMENT_ID"));
			Member m = new Member();
			m.setClasses(c);
			m.setPayment(p);
			m.setClassDetail(d);
			list.add(m);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Member> MemberCompletedpayment(Connection conn, String memberId,int cPage,int numPerpage,String completed){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList<Member>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("memberCompletedpayment"));
			//SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM (SELECT PAYMENT_STATUS,PAYMENT_DATE,CLASS_TITLE,CLASS_THUMBNAIL,P.CLASS_PERSONNEL,BOOKING_TIME_START,BOOKING_TIME_END FROM PAYMENT P JOIN CLASS_DETAIL USING(CLASS_DETAIL_ID) JOIN CLASS USING(CLASS_ID) WHERE MEMBER_ID=? AND PAYMENT_STATUS=? ORDER BY PAYMENT_DATE DESC)B) WHERE RNUM BETWEEN ? AND ?
			pstmt.setString(1, memberId);
			pstmt.setString(2,completed);
			pstmt.setInt(3,(cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			Classes c=new Classes();
			Payment p=new Payment();
			ClassDetail d=new ClassDetail();
			p.setPaymentStatus(rs.getString("PAYMENT_STATUS"));
			p.setPaymentDate(rs.getDate("PAYMENT_DATE"));
			c.setClassTitle(rs.getString("CLASS_TITLE"));
			c.setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
			p.setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
			d.setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
			d.setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
			p.setPaymentId(rs.getString("PAYMENT_ID"));
			Member m = new Member();
			m.setClasses(c);
			m.setPayment(p);
			m.setClassDetail(d);
			list.add(m);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<Member> Membercancellationpayment(Connection conn, String memberId,int cPage,int numPerpage,String completed){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList<Member>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("membercancellationpayment"));
			//SELECT * FROM (SELECT ROWNUM AS RNUM, B.* FROM (SELECT PAYMENT_STATUS,PAYMENT_DATE,CLASS_TITLE,CLASS_THUMBNAIL,P.CLASS_PERSONNEL,BOOKING_TIME_START,BOOKING_TIME_END FROM PAYMENT P JOIN CLASS_DETAIL USING(CLASS_DETAIL_ID) JOIN CLASS USING(CLASS_ID) WHERE MEMBER_ID=? AND PAYMENT_STATUS=? ORDER BY PAYMENT_DATE DESC)B) WHERE RNUM BETWEEN ? AND ?
			pstmt.setString(1, memberId);
			pstmt.setString(2,completed);
			pstmt.setInt(3,(cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			Classes c=new Classes();
			Payment p=new Payment();
			ClassDetail d=new ClassDetail();
			p.setPaymentStatus(rs.getString("PAYMENT_STATUS"));
			p.setPaymentDate(rs.getDate("PAYMENT_DATE"));
			c.setClassTitle(rs.getString("CLASS_TITLE"));
			c.setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
			p.setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
			d.setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
			d.setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
			p.setPaymentId(rs.getString("PAYMENT_ID"));
			Member m = new Member();
			m.setClasses(c);
			m.setPayment(p);
			m.setClassDetail(d);
			list.add(m);
		}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	
	public int paymentCount(Connection conn ,String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentCount"));
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
	public int paymentdetailCount(Connection conn ,String memberId,String completed) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentdetailCount"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, completed);
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
	
	
	public List<PaymentCompleted>  paymentCompleted(Connection conn, String paymentId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<PaymentCompleted>  list= new ArrayList<PaymentCompleted>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentCompleted"));
			pstmt.setString(1, paymentId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PaymentCompleted pc=new PaymentCompleted();
				pc.getPayment().setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				pc.getPayment().setPaymentDate(rs.getDate("PAYMENT_DATE"));
				pc.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				pc.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				pc.getPayment().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				pc.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				pc.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				pc.getPaymentType().setPaymentName(rs.getString("PAYMENT_NAME"));
				pc.getClasses().setClassPrice(rs.getInt("CLASS_PRICE"));
				pc.getHost().setHostName(rs.getString("HOST_NAME"));
				pc.getCoupon().setCouponPrice(rs.getInt("COUPON_PRICE"));
				pc.getPayment().setTotalPrice(rs.getInt("TOTAL_PRICE"));
				list.add(pc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int selectRsvCount(Connection conn,String hostId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectRsvCount"));
			pstmt.setString(1, hostId);
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
	
	public List<PaymentCalc> selectAllpaymentByhostId(Connection conn, String hostId,int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentCalc> list = new ArrayList<PaymentCalc>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectAllpaymentByhostId"));
			pstmt.setString(1, hostId);
			pstmt.setInt(2,(cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PaymentCalc p = new PaymentCalc();
				p.getPayment().setPaymentId(rs.getString("PAYMENT_ID"));
				p.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				p.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				p.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				p.getPayment().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				p.getPayment().setPaymentDate(rs.getDate("PAYMENT_DATE"));
				p.getPayment().setMemberId(rs.getString("MEMBER_ID"));
				p.getPayment().setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public List<PaymentCalc> sortingPaymentByStatus(Connection conn, String hostId,String passStatus,int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentCalc> list = new ArrayList<PaymentCalc>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("sortingPaymentByStatus"));
			pstmt.setString(1, hostId);
			pstmt.setString(2, passStatus);
			pstmt.setInt(3,(cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PaymentCalc p = new PaymentCalc();
				p.getPayment().setPaymentId(rs.getString("PAYMENT_ID"));
				p.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				p.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				p.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				p.getPayment().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				p.getPayment().setPaymentDate(rs.getDate("PAYMENT_DATE"));
				p.getPayment().setMemberId(rs.getString("MEMBER_ID"));
				p.getPayment().setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public List<PaymentCalc> selectNewPaymentByhostId(Connection conn, String hostId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<PaymentCalc> list = new ArrayList<PaymentCalc>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectNewPaymentByhostId"));
			pstmt.setString(1, hostId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				PaymentCalc p = new PaymentCalc();
				p.getPayment().setPaymentId(rs.getString("PAYMENT_ID"));
				p.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				p.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				p.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				p.getPayment().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				p.getPayment().setPaymentDate(rs.getDate("PAYMENT_DATE"));
				p.getPayment().setMemberId(rs.getString("MEMBER_ID"));
				p.getPayment().setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public List<ClassPayment> selectClassDetailByClassId(Connection conn, String classId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ClassPayment> list = new ArrayList<ClassPayment>();
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectClassDetailByClassId"));
			pstmt.setString(1, classId);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ClassPayment p = new ClassPayment();
				p.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
				p.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				p.getClasses().setClassAddress(rs.getString("CLASS_ADDRESS"));
				p.getClasses().setClassId(rs.getString("CLASS_ID"));
				p.getClassDetail().setClassDetailId(rs.getString("CLASS_DETAIL_ID"));
				p.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				p.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				p.getClasses().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				p.getClassDetail().setRemainingPersonnel(rs.getInt("REMAINING_PERSONNEL"));
				p.getClasses().setClassPrice(rs.getInt("CLASS_PRICE"));
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	
	public int insertPayment(Connection conn, Map<String,String> dataMap) {
		PreparedStatement pstmt=null;
		int result=0;
		String paymentStatus="";
		if((boolean)dataMap.get("status").equals("paid")) {
			paymentStatus="결제완료";
		}
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertPayment"));
			pstmt.setString(1, dataMap.get("merchant_uid"));
			pstmt.setString(2, dataMap.get("classDetailId"));
			pstmt.setString(3, dataMap.get("memberId"));
			pstmt.setString(4, dataMap.get("couponId"));
			pstmt.setInt(5, Integer.parseInt(dataMap.get("price")));
			pstmt.setInt(6, Integer.parseInt(dataMap.get("classPersonnel")));
			pstmt.setInt(7, Integer.parseInt(dataMap.get("totalPrice")));
			pstmt.setString(8, dataMap.get("pg_provider"));
			pstmt.setString(9, dataMap.get("status"));
			
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public PaymentCompleted paymentResult(Connection conn, String paymentId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PaymentCompleted p = new PaymentCompleted();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentCompleted"));
			pstmt.setString(1, paymentId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				PaymentCompleted pc=new PaymentCompleted();
				pc.getPayment().setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				pc.getPayment().setPaymentDate(rs.getDate("PAYMENT_DATE"));
				pc.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				pc.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				pc.getPayment().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				pc.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				pc.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				pc.getPaymentType().setPaymentName(rs.getString("PAYMENT_NAME"));
				pc.getClasses().setClassPrice(rs.getInt("CLASS_PRICE"));
				pc.getHost().setHostName(rs.getString("HOST_NAME"));
				pc.getCoupon().setCouponPrice(rs.getInt("COUPON_PRICE"));
				pc.getPayment().setTotalPrice(rs.getInt("TOTAL_PRICE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}	
	
	public PaymentInfo selectPaymentInfo(Connection conn, String classDetailId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PaymentInfo p = new PaymentInfo();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectPaymentInfo"));
			pstmt.setString(1, classDetailId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p.getCategory().setCategoryTitle(rs.getString("CATEGORY_TITLE"));
				p.getClasses().setClassId(rs.getString("CLASS_ID"));
				p.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				p.getClasses().setClassPrice(rs.getInt("CLASS_PRICE"));
				p.getClasses().setClassAddress(rs.getString("CLASS_ADDRESS"));
				p.getClassDetail().setClassDetailId(rs.getString("CLASS_DETAIL_ID"));
				p.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				p.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				p.getClassDetail().setRemainingPersonnel(rs.getInt("REMAINING_PERSONNEL"));
				p.getHost().setHostNickname(rs.getString("HOST_NICKNAME"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	

	public int selectRemainPer(Connection conn, String classDetailId) {
		PreparedStatement pstmt=null;
		int result=0;
		ResultSet rs=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectRemainPer"));
			pstmt.setString(1, classDetailId);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int paymentCancel(Connection conn,String paymentId) {
		String cancel="결제취소";
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentCancel"));
			pstmt.setString(1, cancel);
			pstmt.setString(2, paymentId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public Payment searchBypaymentId(Connection conn, String paymentId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Payment p = new Payment();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchBypaymentId"));
			pstmt.setString(1, paymentId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				p=(getPayment(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	public int reinsertCoupon(Connection conn,String paymentId,String couponId,String memberId,Date createdDate,Date expiredDated) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("reinsertCoupon"));
			pstmt.setString(1, couponId);
			pstmt.setString(2, memberId);
			pstmt.setDate(3, (java.sql.Date) createdDate);
			pstmt.setDate(4, (java.sql.Date) expiredDated);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public static Payment getPayment(ResultSet rs) throws SQLException {
		return Payment.builder().paymentId(rs.getString("PAYMENT_ID")).classDetailId(rs.getString("CLASS_DETAIL_ID")).memberId(rs.getString("MEMBER_ID")).couponId(rs.getString("COUPON_ID")).price(rs.getInt("PRICE")).classPersonnel(rs.getInt("CLASS_PERSONNEL")).TotalPrice(rs.getInt("TOTAL_PRICE")).paymentType(rs.getString("PAYMENT_TYPE")).paymentDate(rs.getDate("PAYMENT_DATE")).paymentStatus(rs.getString("PAYMENT_STATUS")).createdDate(rs.getDate("CREATED_DATE")).expiredDated(rs.getDate("EXPIRED_DATED")).build();
	}
	
	public Payment selectPaymentIdByMemberId(Connection conn,String memberId, String classDetailId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String status="결제완료";
		Payment p=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("searchBypaymentId"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, classDetailId);
			pstmt.setString(3, status);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				getPayment(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return p;
	}
	
	public int deleteCouponByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteCouponByMemberId"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public PaymentCompleted selectPaymentByPaymentId(Connection conn, String paymentId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		PaymentCompleted pc=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectPaymentByPaymentId"));
			pstmt.setString(1, paymentId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				pc=new PaymentCompleted();
				pc.getPayment().setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				pc.getPayment().setPaymentDate(rs.getDate("PAYMENT_DATE"));
				pc.getClasses().setClassTitle(rs.getString("CLASS_TITLE"));
				pc.getClasses().setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				pc.getPayment().setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				pc.getClassDetail().setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				pc.getClassDetail().setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				pc.getPaymentType().setPaymentName(rs.getString("PAYMENT_NAME"));
				pc.getClasses().setClassPrice(rs.getInt("CLASS_PRICE"));
				pc.getHost().setHostName(rs.getString("HOST_NAME"));
				pc.getCoupon().setCouponPrice(rs.getInt("COUPON_PRICE"));
				pc.getPayment().setTotalPrice(rs.getInt("TOTAL_PRICE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return pc;
	}
	
	
	public int selectSortingCount(Connection conn,String hostId,String paymentStatus) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectSortingCount"));
			pstmt.setString(1, hostId);
			pstmt.setString(2, paymentStatus);
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














