package com.smallus.payment.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.payment.dao.PaymentDao;
import com.smallus.payment.model.vo.Payment;

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
}
