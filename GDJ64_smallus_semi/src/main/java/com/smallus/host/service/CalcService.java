package com.smallus.host.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.host.dao.CalcDao;
import com.smallus.host.model.vo.Calc;
public class CalcService {
	
	private CalcDao dao= new CalcDao();
	
	public int selectCalcCount(String hostId) {
		Connection conn=getConnection();
		int result=dao.selectCalcCount(conn, hostId);
		if(result>0) {
			commit(conn);
		}else rollback(conn);
		close(conn);
		return result;
	}
	
	public List<Calc> selectAllcalcByhostId(String hostId, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Calc> calcList=dao.selectAllcalcByhostId(conn, hostId, cPage, numPerpage);
		close(conn);
		return calcList;
	}
}
