package com.smallus.payment.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.Classes;
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
	
	public List<Classes> selectClassByhostId(String hostId){
		Connection conn=getConnection();
		List<Classes> list=dao.selectClassByhostId(conn, hostId);
		close(conn);
		return list;
	}
}
