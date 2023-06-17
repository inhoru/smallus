package com.smallus.member.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.eclipse.jdt.core.compiler.CharOperation;

import static com.smallus.common.JDBCTemplate.*;
import com.smallus.common.JDBCTemplate;
import com.smallus.member.model.vo.Member;

public class MemberDao {
	private Properties sql=new Properties();//final로 선언하면 처리속도 빨라짐
	
	{
		String path=JDBCTemplate.class.getResource("/sql/member.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public Member memberLogin(Connection conn, String memberId, String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("memberLogin"));
			//SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PW=?
			pstmt.setString(1, memberId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally{
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int enrollMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("enrollMember"));
			//INSERT INTO MEMBER VALUES(?,?,?,?,?,DEFAULT,DEFAULT,?,DEFAULT)
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberPhone());
			pstmt.setString(5, m.getMemberEmail());
			pstmt.setString(6, m.getMemberNickname());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Member selectByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectByMemberId"));
			//SELECT * FROM MEMBER WHERE MEMBER_ID=?
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return m;
	}
	public Member selectBymemberNickname(Connection conn, String memberNickname) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Member m=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectBymemberNickname"));
			//SELECT * FROM MEMBER WHERE MEMBER_ID=?
			pstmt.setString(1, memberNickname);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=getMember(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rs);
		}return m;
	}
	public int updatePassword(Connection conn,String userId,String password) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updatePassword"));
			pstmt.setString(1, password);
			pstmt.setString(2, userId);
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public static Member getMember(ResultSet rs) throws SQLException{
		return Member.builder().
				memberId(rs.getString("member_id")).
				memberPw(rs.getString("MEMBER_PW")).
				memberName(rs.getString("MEMBER_NAME")).
				memberPhone(rs.getString("MEMBER_PHONE")).
				memberEmail(rs.getString("MEMBER_EMAIL")).
				memberConsent(rs.getString("MEMBER_CONSENT")).
				memberImg(rs.getString("MEMBER_IMG")).
				memberNickname(rs.getString("MEMBER_NICKNAME")).
				memberSt(rs.getString("MEMBER_ST")).build();
	}
}
	
