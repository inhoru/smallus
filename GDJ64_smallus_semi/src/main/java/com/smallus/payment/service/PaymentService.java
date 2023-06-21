package com.smallus.payment.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.member.model.vo.Member;
import com.smallus.payment.dao.PaymentDao;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.model.vo.PaymentCompleted;

public class PaymentService {
	private PaymentDao dao= new PaymentDao();
	
	public List<Payment> selectPaymentByhostId(String hostId){
		Connection conn=getConnection();
		List<Payment> list=dao.selectPaymentByhostId(conn, hostId);
		close(conn);
		return list;
	}
	
//	public Map<String, String> selectRsvByhostId(String hostId){
//		Connection conn=getConnection();
//		Map<String, String> list=dao.selectRsvByhostId(conn, hostId);
//		close(conn);
//		return list;
//	}
	
	
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
	
	
	
	
	
}
