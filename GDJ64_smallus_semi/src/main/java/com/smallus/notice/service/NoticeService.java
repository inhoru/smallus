package com.smallus.notice.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.smallus.notice.dao.NoticeDao;
import com.smallus.notice.model.vo.Notice;
import com.smallus.notice.model.vo.NoticeImage;

public class NoticeService {
	NoticeDao dao=new NoticeDao();
	
	public int enrollNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.enrollNotice(conn,n);
		close(conn);
		return result;
	}
	
	public int deleteNotice(String noticeId) {
		Connection conn=getConnection();
		int result=dao.deleteNotice(conn,noticeId);
		close(conn);
		return result;
	}
}
