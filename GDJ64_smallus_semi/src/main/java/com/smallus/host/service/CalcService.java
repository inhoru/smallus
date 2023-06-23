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
	
	// 전체정산 내역
	public List<Calc> selectAllcalcByhostId(String hostId, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Calc> calcList=dao.selectAllcalcByhostId(conn, hostId, cPage, numPerpage);
		if(calcList==null||calcList.isEmpty()) System.out.println("service X");
		close(conn);
		return calcList;
	}
	// 전체 정산 내역 중 정산 상태에 따라 필터링 
	public List<Calc> sortingByCalcStatus(String hostId, String calcStatus, int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Calc> calcList=dao.sortingByCalcStatus(conn, hostId, calcStatus, cPage, numPerpage);
		if(calcList==null||calcList.isEmpty()) System.out.println("service X");
		close(conn);
		return calcList;
	}
	
	
}
