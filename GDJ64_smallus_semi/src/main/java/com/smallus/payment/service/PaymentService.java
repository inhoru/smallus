package com.smallus.payment.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.smallus.classes.model.vo.Classes;
import com.smallus.member.model.vo.Member;
import com.smallus.payment.dao.PaymentDao;
import com.smallus.payment.model.vo.ClassPayment;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.model.vo.PaymentCalc;
import com.smallus.payment.model.vo.PaymentCompleted;
import com.smallus.payment.model.vo.PaymentInfo;

public class PaymentService {
	private PaymentDao dao= new PaymentDao();
	
	public List<Payment> selectPaymentByhostId(String hostId){
		Connection conn=getConnection();
		List<Payment> list=dao.selectPaymentByhostId(conn, hostId);
		close(conn);
		return list;
	}
	
	public List<Member> searchByMemberPayment(String memberId,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Member> list=dao.searchByMemberPayment(conn, memberId,cPage,numPerpage);
		close(conn);
		return list;
	}
	public int paymentCount(String memberId) {
		Connection conn=getConnection();
		int result=dao.paymentCount(conn,memberId);
		close(conn);
		return result;
	}
	public int paymentdetailCount(String memberId,String completed) {
		Connection conn=getConnection();
		int result=dao.paymentdetailCount(conn,memberId,completed);
		close(conn);
		return result;
	}
	public  List<PaymentCompleted> paymentCompleted(String paymentId){
		Connection conn=getConnection();
		List<PaymentCompleted>  pc=dao.paymentCompleted(conn, paymentId);
		close(conn);
		return pc;
	}
	public List<Member> MemberCompletedpayment(String memberId,int cPage,int numPerpage,String completed){
		Connection conn=getConnection();
		List<Member> list=dao.MemberCompletedpayment(conn, memberId,cPage,numPerpage,completed);
		close(conn);
		return list;
	}

	public List<Member> Membercancellationpayment(String memberId,int cPage,int numPerpage,String completed){
		Connection conn=getConnection();
		List<Member> list=dao.Membercancellationpayment(conn, memberId,cPage,numPerpage,completed);
		close(conn);
		return list;
	}
	// 페이징 처리를 위한 전체 데이터 수 찾기
	public int selectRsvCount(String hostId) {
		Connection conn=getConnection();
		int count=dao.selectRsvCount(conn,hostId);
		if(count>0) commit(conn);
		else rollback(conn);
		return count;
	}
	
	// 전체 예약 내역 불러오기
	public List<PaymentCalc> selectAllpaymentByhostId(String hostId,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<PaymentCalc> list=dao.selectAllpaymentByhostId(conn, hostId,cPage,numPerpage);
		close(conn);
		return list;
	}
	
	//전체예약내역 중 필터링
	public List<PaymentCalc> sortingPaymentByStatus(String hostId,String passStatus, int cPage,int numPerpage){
		Connection conn=getConnection();
		List<PaymentCalc> list=dao.sortingPaymentByStatus(conn, hostId, passStatus,cPage,numPerpage);
		System.out.println(list);
		close(conn);
		return list;
	}
	
	//새로운 예약 내역불러오기
	public List<PaymentCalc> selectNewPaymentByhostId(String hostId){
		Connection conn=getConnection();
		List<PaymentCalc> list=dao.selectNewPaymentByhostId(conn, hostId);
		close(conn);
		return list;
	}
	
	public List<ClassPayment> selectClassDetailByClassId(String classId){
		Connection conn=getConnection();
		List<ClassPayment> list=dao.selectClassDetailByClassId(conn, classId);
		close(conn);
		return list;
	}
	
	public int insertPayment(Map dataMap) {
		Connection conn=getConnection();
		int count=dao.insertPayment(conn,dataMap);
		if(count>0) commit(conn);
		else rollback(conn);
		return count;
	}
	
	public PaymentCompleted paymentResult(String paymentId){
		Connection conn=getConnection();
		PaymentCompleted pc=dao.paymentResult(conn, paymentId);
		close(conn);
		return pc;
	}
	public int paymentCancel(String paymentId) {
		Connection conn=getConnection();
		int result=dao.paymentCancel(conn,paymentId);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public Payment searchBypaymentId(String paymentId){
		Connection conn=getConnection();
		Payment  pc=dao.searchBypaymentId(conn, paymentId);
		close(conn);
		return pc;
	}
	public int reinsertCoupon(String paymentId,String couponId,String memberId,java.util.Date date,java.util.Date date2) {
		Connection conn=getConnection();
		int result=dao.reinsertCoupon(conn,paymentId,couponId,memberId,date,date2);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	
	
	public PaymentInfo selectPaymentInfo(String classDetailId) {
		Connection conn=getConnection();
		PaymentInfo pinfo=dao.selectPaymentInfo(conn, classDetailId);
		close(conn);
		return pinfo;
	}
	
	public int selectRemainPer(String classDetailId) {
		Connection conn=getConnection();
		int result=dao.selectRemainPer(conn, classDetailId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	

	public Payment selectPaymentIdByMemberId(String memberId, String classDetailId) {
		Connection conn=getConnection();
		Payment p=dao.selectPaymentIdByMemberId(conn, memberId, classDetailId);
		close(conn);
		return p;
	}
	
	public int deleteCouponByMemberId(String memberId) {
		Connection conn=getConnection();
		int result=dao.deleteCouponByMemberId(conn, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public PaymentCompleted selectPaymentByPaymentId(String paymentId) {
		Connection conn=getConnection();
		PaymentCompleted p=dao.selectPaymentByPaymentId(conn, paymentId);
		close(conn);
		return p;
	}
	public int insertNot(String classDetailId,Classes n) {
		Connection conn=getConnection();
		int result=dao.insertNot(conn,classDetailId,n);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public Classes classDetailId(String classDetailId) {
		Connection conn=getConnection();
		Classes c=dao.classDetailId(conn,classDetailId);
		close(conn);
		return c; 
	}
	

	
	// 페이징 처리를 위한 전체 데이터 수 찾기
	public int selectSortingCount(String hostId,String paymentStatus) {
		Connection conn=getConnection();
		int count=dao.selectSortingCount(conn,hostId,paymentStatus);
		if(count>0) commit(conn);
		else rollback(conn);
		return count;
	}
	
	public int updatePaymentStatus() {
		Connection conn=getConnection();
		int count=dao.updatePaymentStatus(conn);
		if(count>0) commit(conn);
		else rollback(conn);
		return count;
	}
	
	
}
