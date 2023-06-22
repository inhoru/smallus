package com.smallus.qna.model.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smallus.qna.model.vo.Qna;

public class QnaDao {
	
	private Properties sql=new Properties();
	
	public QnaDao() {
		String path = QnaDao.class
					.getResource("sql/qna/qnasql.properties")
					.getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	private Qna getQna(ResultSet rs) throws SQLException{
		return Qna.builder()
				.qnaId(rs.getString("qna_id"))
				.memberId(rs.getString("member_id"))
				.classId(rs.getString("class_id"))
				.qnaTitle(rs.getString("qna_title"))
				.qndContent(rs.getString("qna_content"))
				.qndRdate(rs.getDate("qna_data"))
				.qnaFinishYn(rs.getString("qna_finish_yn"))
				.build();
	}
	public List<Qna> selectQna(Connection conn){
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		List<Qna> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectQna"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getQna(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

}
