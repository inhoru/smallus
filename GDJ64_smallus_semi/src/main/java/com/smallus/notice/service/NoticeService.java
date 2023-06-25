package com.smallus.notice.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.smallus.notice.dao.NoticeDao;
import com.smallus.notice.model.vo.Notice;
import com.smallus.notice.model.vo.NoticeImage;

public class NoticeService {
	NoticeDao dao=new NoticeDao();
	
	public Notice selectNotice(Notice n) {
		Connection conn=getConnection();
		Notice notice=dao.selectNotice(conn,n);
		close(conn);
		return notice;
	}
	
	public int enrollNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.enrollNotice(conn,n);
		close(conn);
		return result;
	}
	
	public int enrollNoticeImg(NoticeImage ni) {
		Connection conn=getConnection();
		int result2=dao.enrollNoticeImg(conn,ni);
		close(conn);
		return result2;
	}
	public int deleteNotice(String NoticeId) {
		Connection conn=getConnection();
		int result=dao.deleteNotice(conn,NoticeId);
		close(conn);
		return result;
	}
}
