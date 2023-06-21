package com.smallus.notice.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.smallus.common.JDBCTemplate;
import com.smallus.notice.model.vo.Notice;

public class NoticeDao {
	private Properties sql = new Properties();// final로 선언하면 처리속도 빨라짐

	{
		String path = JDBCTemplate.class.getResource("/sql/notice.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int enrollNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//enrollNotice=INSERT INTO NOTICE VALUES(SEQ_NOTICE_ID.NEXTVAL,?,?,?,DEFAULT,?)
			pstmt=conn.prepareStatement(sql.getProperty("enrollNotice"));
			pstmt.setString(1, n.getHostId());
			pstmt.setString(2, n.getNoticeType());
			pstmt.setString(3, n.getNoticeTitle());
			pstmt.setString(4, n.getNoticeContent());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

}
