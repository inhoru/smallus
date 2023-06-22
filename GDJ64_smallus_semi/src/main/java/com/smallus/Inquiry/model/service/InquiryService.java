package com.smallus.Inquiry.model.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.Inquiry.dao.InquiryDao;
import com.smallus.Inquiry.model.vo.Faq;

public class InquiryService {
	private InquiryDao dao = new InquiryDao();

	public List<Faq> selectAllFaq(int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Faq> list = dao.selectAllFaq(conn, cPage, numPerpage);
		close(conn);
		return list;
	}

	public int selectFaqCount() {
		Connection conn = getConnection();
		int result = dao.selectFaqCount(conn);
		close(conn);
		return result;
	}
	public List<Faq> selectCategorie(int cPage, int numPerpagem,String categorie) {
		Connection conn = getConnection();
		List<Faq> list = dao.selectCategorie(conn, cPage,numPerpagem, categorie);
		close(conn);
		return list;
	}

	public int selectCategorieCount(String categorie) {
		Connection conn = getConnection();
		int result = dao.selectCategorieCount(conn,categorie);
		close(conn);
		return result;
	}
}
