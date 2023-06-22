package com.smallus.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.smallus.qna.model.vo.Qnac;

public class QnacDao {

	private Properties sql = new Properties();

	public QnacDao() {
		String path = QnacDao.class.getResource("sql/qna/qnacsql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	private Qnac getQnac(ResultSet rs) throws SQLException{
		return Qnac.builder()
				.qnacId(rs.getString("qnac_id"))
				.qnaId(rs.getString("qna_id"))
				.hostId(rs.getString("host_id"))
				.qnacContent(rs.getString("qnac_content"))
				.qnacRdate(rs.getDate("qnac_rdate"))
				.build();
	}

}
