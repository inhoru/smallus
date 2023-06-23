package com.smallus.payment.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.member.model.vo.Member;
import com.smallus.payment.dao.PaymentDao;
import com.smallus.payment.model.vo.ClassPayment;
import com.smallus.payment.model.vo.Payment;
import com.smallus.payment.model.vo.PaymentCalc;
import com.smallus.payment.model.vo.PaymentCompleted;

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
	
	
	
}
