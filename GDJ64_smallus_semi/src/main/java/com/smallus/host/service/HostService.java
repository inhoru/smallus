package com.smallus.host.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.classes.model.vo.Classes;
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
	
	public Host updateHostCalc(String hostId) {
		Connection conn=getConnection();
		Host h=dao.updateHostCalc(conn,hostId);
		close(conn);
		return h;
	}

}