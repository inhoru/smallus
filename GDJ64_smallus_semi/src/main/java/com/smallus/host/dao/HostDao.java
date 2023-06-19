package com.smallus.host.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.smallus.common.JDBCTemplate.*;

import com.smallus.common.JDBCTemplate;
import com.smallus.host.model.vo.Host;

public class HostDao {
private Properties sql=new Properties();//final로 선언하면 처리속도 빨라짐

	{
		String path=HostDao.class.getResource("/sql/host.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}

	public Host hostLogin(Connection conn,String hostId,String password) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Host h=new Host();
		try {
			//hostLogin=SELECT * FROM HOST WHERE HOST_ID=? AND HOST_PW=?
			pstmt=conn.prepareStatement(sql.getProperty("hostLogin"));
			pstmt.setString(1, hostId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				h=getHost(rs);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return h;
	}
	public static Host getHost(ResultSet rs) throws SQLException{
		return Host.builder().
				hostId(rs.getString("HOST_ID")).
				hostPw(rs.getString("HOST_PW")).
				hostName(rs.getString("HOST_NAME")).
				hostPhone(rs.getString("HOST_PHONE")).
				hostHomephone(rs.getString("HOST_HOMEPHONE")).
				hostEmail(rs.getString("HOST_EMAIL")).
				hostConsent(rs.getString("HOST_CONSENT")).
				hostImg(rs.getString("HOST_IMG")).
				hostNickname(rs.getString("HOST_NICKNAME")).
				hostSt(rs.getString("HOST_ST")).
				hostAccountBank(rs.getString("HOST_ACCOUNT_BANK")).
				hostAccount(rs.getString("HOST_ACCOUNT")).
				hostAccountName(rs.getString("HOST_ACCOUNT_NAME")).build();
	}
}