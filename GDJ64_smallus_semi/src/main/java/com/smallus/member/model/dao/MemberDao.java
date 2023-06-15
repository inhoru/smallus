package com.smallus.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
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
		Member m=new Member();
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
	
