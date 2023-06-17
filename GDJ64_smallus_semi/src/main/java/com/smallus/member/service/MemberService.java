package com.smallus.member.service;

import static com.smallus.common.JDBCTemplate.*;

import java.sql.Connection;

import com.smallus.member.dao.MemberDao;
import com.smallus.member.model.vo.Member;

public class MemberService {
		MemberDao dao=new MemberDao();
		
	public Member memberLogin(String memberId, String password) {
		Connection conn=getConnection();
		Member m=dao.memberLogin(conn,memberId,password);
		close(conn);
		return m; 
	}
	public int enrollMember(Member m) {
		Connection conn=getConnection();
		int result=dao.enrollMember(conn,m);
		close(conn);
		return result;
	}
	
	public Member selectByMemberId(String memberId) {
		Connection conn=getConnection();
		Member m=dao.selectByMemberId(conn,memberId);
		close(conn);
		return m;
	}
	
	public Member selectBymemberNickname(String memberNickname) {
		Connection conn=getConnection();
		Member m=dao.selectByMemberId(conn,memberNickname);
		close(conn);
		return m;
	}
	public int updatePassword(String userId,String password) {
		Connection conn=getConnection();
		int result=dao.updatePassword(conn,userId,password);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
}
