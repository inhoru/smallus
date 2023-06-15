package com.smallus.member.model.service;

import static com.smallus.common.JDBCTemplate.*;

import java.sql.Connection;

import com.smallus.member.model.dao.MemberDao;
import com.smallus.member.model.vo.Member;

public class MemberService {
		MemberDao dao=new MemberDao();
		
	public Member memberLogin(String memberId, String password) {
		Connection conn=getConnection();
		Member m=dao.memberLogin(conn,memberId,password);
		close(conn);
		return m; 
	}

}
