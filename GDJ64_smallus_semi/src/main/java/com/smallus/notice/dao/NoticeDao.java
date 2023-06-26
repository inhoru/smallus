package com.smallus.notice.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.smallus.common.JDBCTemplate;
import com.smallus.notice.model.vo.Notice;
import com.smallus.notice.model.vo.NoticeImage;

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
	public static Notice getNotice(ResultSet rs) throws SQLException{
		return Notice.builder().
				noticeId(rs.getString("NOTICE_ID")).
				hostId(rs.getString("HOST_ID")).
				noticeType(rs.getString("NOTICE_TYPE")).
				noticeTitle(rs.getString("NOTICE_TITLE")).
				noticeRdate(rs.getDate("NOTICE_RDATE")).
				noticeContent(rs.getString("NOTICE_CONTENT")).
				noticeFilepath(rs.getString("NOTICE_FILEPATH")).
				build();
//				noticeImageOrignal(rs.getString("NOTICE_IMAGE_ORIGNAL")).
//				noticeImageRename(rs.getString("NOTICE_IMAGE_RENAME")).build();
	}
	
	public static NoticeImage getNoticeImage(ResultSet rs) throws SQLException{
		return NoticeImage.builder()
				.noticeImageId(rs.getString("NOTICE_IMAGE_ID"))
				.noticeId(rs.getString("NOTICE_ID"))
				.noticeImageOrignal(rs.getString("NOTICE_IMAGE_ORIGNAL"))
				.noticeImageRename(rs.getString("NOTICE_IMAGE_RENAME"))
				.build();
	}
	
	public int enrollNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//enrollNotice=INSERT INTO NOTICE VALUES(SEQ_NOTICE_ID.NEXTVAL,?,?,?,?,DEFAULT,?)
			pstmt=conn.prepareStatement(sql.getProperty("enrollNotice"));
			pstmt.setString(1, n.getHostId());
			pstmt.setString(2, n.getNoticeType());
			pstmt.setString(3, n.getNoticeTitle());
			pstmt.setString(4, n.getNoticeContent());
			pstmt.setString(5, n.getNoticeFilepath());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public Notice selectNotice(Connection conn, Notice n) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice notice=null;
		try {
			//SELECT * FROM NOTICE WHERE NOTICE_TITLE=?
			pstmt=conn.prepareStatement(sql.getProperty("selectNotice"));
			pstmt.setString(1,n.getNoticeTitle());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				notice=getNotice(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return notice;
	}
	
	public int enrollNoticeImg(Connection conn, NoticeImage ni) {
		PreparedStatement pstmt=null;
		int result2=0;
		try {
			//enrollNoticeImg=INSERT INTO NOTICE_IMAGE VALUES(SEQ_NOTICE_IMAGE_ID.NEXTVAL,?,?,?)
			pstmt=conn.prepareStatement(sql.getProperty("enrollNoticeImg"));
			pstmt.setString(1, ni.getNoticeId());
			pstmt.setString(2, ni.getNoticeImageOrignal());
			pstmt.setString(3, ni.getNoticeImageRename());
			result2=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result2;
	}
	
	public int deleteNotice(Connection conn, String noticeId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//deleteNotice=DELETE FROM NOTICE WHERE NOTICE_ID=?
			pstmt=conn.prepareStatement(sql.getProperty("deleteNotice"));
			pstmt.setString(1,noticeId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int deleteNoticeImage(Connection conn, String noticeId) {
		PreparedStatement pstmt=null;
		int result2=0;
		try {
			//deleteNOticeImage=DELETE FROM NOTICE_Image WHERE NOTICE_ID=?
			pstmt=conn.prepareStatement(sql.getProperty("deleteNoticeImage"));
			pstmt.setString(1,noticeId);
			result2=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result2;
	}
}
