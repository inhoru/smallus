package com.smallus.host.service;

import java.sql.Connection;
import static com.smallus.common.JDBCTemplate.*;
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

}