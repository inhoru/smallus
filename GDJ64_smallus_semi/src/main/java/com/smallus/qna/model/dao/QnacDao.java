package com.smallus.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.smallus.qna.model.vo.Qnac;
import static com.smallus.common.JDBCTemplate.close;

public class QnacDao {

	private Properties sql = new Properties();

	public QnacDao() {
		String path = QnacDao.class.getResource("sql/qnac/qnacsql.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private Qnac getQnac(ResultSet rs) throws SQLException {
		return Qnac.builder().qnacId(rs.getString("qnac_id")).qnaId(rs.getString("qna_id"))
				.hostId(rs.getString("host_id")).qnacContent(rs.getString("qnac_content"))
				.qnacRdate(rs.getDate("qnac_rdate")).build();
	}

	public int insertQnac(Connection conn, Qnac qc) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("insertDetailQnac"));
			pstmt.setString(1, qc.getQnaId());
			pstmt.setString(2, qc.getHostId());
			pstmt.setString(3, qc.getQnacContent());
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
