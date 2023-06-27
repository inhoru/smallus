package com.smallus.host.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.smallus.host.dao.HostDao;
import com.smallus.host.model.vo.Host;

public class HostService {

   HostDao dao=new HostDao();

	public Host hostLogin(String hostId,String password) {
		Connection conn=getConnection();
		Host h=dao.hostLogin(conn,hostId,password);
		close(conn);
		return h;
	}
	
	
	public int updateHostCalc(String accountBank, String account, String accountName, int calcReqDate, String hostId) {
		Connection conn=getConnection();
		int result=dao.updateHostCalc(conn, accountBank, account, accountName, calcReqDate, hostId);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public Host selectByhostId(String hostId) {
		Connection conn=getConnection();
		Host h=dao.selectByhostId(conn,hostId);
		close(conn);
		return h;
	}
	public Host selectByhostNickname(String hostNickname) {
		Connection conn=getConnection();
		Host h=dao.selectByhostId(conn,hostNickname);
		close(conn);
		return h;
	}
	public int enrollHost(Host h) {
		Connection conn=getConnection();
		int result=dao.enrollHost(conn,h);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int deleteHostByhostId(String hostId, String password) {
		Connection conn=getConnection();
		int result=dao.deleteHostByhostId(conn,hostId, password);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateHostNickname(String nickname,String hostId) {
		Connection conn=getConnection();
		int result=dao.updateHostNickname(conn,nickname,hostId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public int updateHostProfile(Host h, String hostId) {
		Connection conn=getConnection();
		int result=dao.updateHostProfile(conn,h,hostId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	

}