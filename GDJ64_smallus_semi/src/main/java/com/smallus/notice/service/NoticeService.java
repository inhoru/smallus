package com.smallus.notice.service;

import java.sql.Connection;

import com.smallus.notice.dao.NoticeDao;
import com.smallus.notice.model.vo.Notice;
import static com.smallus.common.JDBCTemplate.*;

public class NoticeService {
	NoticeDao dao=new NoticeDao();
		
	public int enrollNotice(Notice n) {
		Connection conn=getConnection();
		int result=dao.enrollNotice(conn,n);
		close(conn);
		return result;
	}
}
