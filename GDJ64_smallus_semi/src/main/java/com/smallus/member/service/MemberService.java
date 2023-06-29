package com.smallus.member.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.classes.model.vo.Classes;
import com.smallus.member.dao.MemberDao;
import com.smallus.member.model.vo.Member;
import com.smallus.member.model.vo.Notifications;

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

	public int KakaoenrollMember(Member m) {
		Connection conn=getConnection();
		int result=dao.KakaoenrollMember(conn,m);
		close(conn);
		return result;
	}
	public Member kakaoLogin(String memberEmail) {
		Connection conn=getConnection();
		Member m=dao.kakaoLogin(conn,memberEmail);
		close(conn);
		return m;

	}
	public Member selectBynickName(String nickName) {
		Connection conn=getConnection();
		Member m=dao.selectBynickName(conn,nickName);
		close(conn);
		return m;
	}
	public int updateMember(Member b ,String m) {
		Connection conn=getConnection();
		int result=dao.updateMember(conn,b,m);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
		
	}
	public int deleteByMember(String memberId,String password) {
		Connection conn=getConnection();
		int result=dao.deleteByMember(conn,memberId,password);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	public List<Member> paymentDetails(String memberId){
		Connection conn=getConnection();
		List<Member> list=dao.paymentDetails(conn,memberId);
		close(conn);
		return list;
	}
	public List<Classes> wishList(String memberId,int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Classes> list=dao.wishList(conn,memberId, cPage,numPerpage);
		close(conn);
		return list;
	}
	public int wishRemove(String memberId,String title) {
		Connection conn=getConnection();
		int result=dao.wishRemove(conn,memberId,title);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	public int wishAdd(String memberId,String title) {
		Connection conn=getConnection();
		int result=dao.wishAdd(conn,memberId,title);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
	public int wishListCount(String memberId) {
		Connection conn=getConnection();
		int result=dao.wishListCount(conn,memberId);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	public List<Notifications> selectAllNotifications(String memberId){
		Connection conn=getConnection();
		List<Notifications> list=dao.selectAllNotifications(conn,memberId);
		close(conn);
		return list;
	}
	
	public int notificationsCount(String memberId) {
		Connection conn=getConnection();
		int result=dao.notificationsCount(conn,memberId);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	public int notifications(String notId) {
		Connection conn=getConnection();
		int result=dao.notifications(conn,notId);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	public int reviewCount(String memberId) {
		Connection conn=getConnection();
		int result=dao.reviewCount(conn,memberId);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	
}
