package com.smallus.admin.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.admin.dao.AdminDao;
import com.smallus.member.model.vo.Member;
public class AdminService {
	
		AdminDao dao=new AdminDao();
	
	public int selectMemberCount() {
		Connection conn=getConnection();
		int totalData=dao.selectMemberCount(conn);
		close(conn);
		return totalData;
	}
	
	public List<Member>checkMemberAll(int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Member> list=dao.checkMemberAll(conn,cPage,numPerpage);
		close(conn);
		return list;
	}

}
