package com.smallus.main.dao;

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
import static com.smallus.classes.model.dao.ClassesDao.getClasses2;

import com.smallus.classes.model.vo.Classes;
import com.smallus.payment.dao.PaymentDao;

public class MainDao {
	private Properties sql = new Properties();

	{
		String path = PaymentDao.class.getResource("/sql/main.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Classes> mainPage(Connection conn) {
		List<Classes> list = new ArrayList<Classes>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("mainPage"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(getClasses2(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
}