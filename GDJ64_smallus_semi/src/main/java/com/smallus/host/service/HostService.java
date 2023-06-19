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
	
	public List<Classes> selectClassesByHostId(String hostId){
		Connection conn=getConnection();
		List<Classes> list =dao.selectClassesByHostId(conn,hostId);
		close(conn);
		if(list.size()==1) {
			System.out.println("service-list");			
		}
		return list;
	}

}