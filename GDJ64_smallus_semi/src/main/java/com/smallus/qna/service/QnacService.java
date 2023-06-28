package com.smallus.qna.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.qna.model.dao.QnacDao;
import com.smallus.qna.model.vo.Qnac;
public class QnacService {
	
	private QnacDao dao= new QnacDao(); 
	
	public int insertQnac(Qnac q) {
		Connection conn = getConnection();
		int result = dao.insertQnac(conn,q);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Qnac> detailQnacList(){
		Connection conn=getConnection(); 
		List<Qnac> list=dao.detailQnacList(conn);
		close(conn);
		return list;
		
	}
}
