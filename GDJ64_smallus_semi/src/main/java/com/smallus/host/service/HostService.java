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
			System.out.println("service nick O");
		}else {
			rollback(conn);
			System.out.println("service nick x");
		}
		close(conn);
		return result;
	}
	public int updateHostProfile(String hostId,String hostNickname,String hostPw,String hostHomePhone, String hostImg) {
		Connection conn=getConnection();
		int result=dao.updateHostProfile(conn,hostId,hostNickname,hostPw,hostHomePhone,hostImg);
		if(result>0) {
			commit(conn);
			System.out.println("service hostPf O");
		}else {
			rollback(conn);
			System.out.println("service hostPf  X");
		}
		close(conn);
		return result;
	}
	
	public int updateHostImg(String renameFile, String hostId) {
		Connection conn=getConnection();
		int result=dao.updateHostNickname(conn,renameFile,hostId);
		if(result>0) {
			commit(conn);
			System.out.println("service updateImg O");
		}else {
			rollback(conn);
			System.out.println("service updateImg x");
		}
		close(conn);
		return result;
	}
	
	

}