package com.smallus.Inquiry.model.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.Inquiry.dao.InquiryDao;
import com.smallus.Inquiry.model.vo.Faq;
import com.smallus.Inquiry.model.vo.Inquiry;

public class InquiryService {
	private InquiryDao dao = new InquiryDao();
	
	
	public List <Faq> selectAllFaq() {
		Connection conn = getConnection();
		List<Faq> list = dao.selectAllFaq(conn);
		close(conn);
		return list;
	}

	
	public List<Faq> selectCategorie(String categorie) {
		Connection conn = getConnection();
		List<Faq> list = dao.selectCategorie(conn, categorie);
		close(conn);
		return list;
	}

	
	public List<Inquiry>selectAllInquiry(int cPage,int numPerpage,String memberId){
		Connection conn = getConnection();
		List<Inquiry> result = dao.selectAllInquiry(conn,cPage,numPerpage,memberId);
		close(conn);
		return result;
	}
	public int selectInquiryCount(String memberId) {
		Connection conn = getConnection();
		int result = dao.selectInquiryCount(conn,memberId);
		close(conn);
		return result;
	}
	
	public int InquiryRemove(String memberId,String remove) {
		Connection conn = getConnection();
		int result = dao.InquiryRemove(conn,memberId,remove);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
	public int InsertInquiry(String memberId,String boardType,String boardTitle,String boardContent) {
		Connection conn = getConnection();
		int result = dao.InsertInquiry(conn,memberId,boardType,boardTitle,boardContent);
		if(result>0)commit(conn);
		else rollback(conn);
		return result;
	}
}