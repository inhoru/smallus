package com.smallus.host.dao;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.host.dao.HostDao.getHost;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smallus.host.model.vo.Calc;
import com.smallus.host.model.vo.Host;

public class CalcDao {
	private Properties sql=new Properties();
	{
		String path=HostDao.class.getResource("/sql/calc.properties").getPath();
		try {
			sql.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	public static Calc getCalc(ResultSet rs) throws SQLException {
		return Calc.builder().calcId(rs.getString("CALC_ID")).paymentId(rs.getString("PAYMENT_ID")).hostId(rs.getString("HOST_ID")).calcStatus(rs.getString("CALC_STATUS"))
				.calcReqDate(rs.getDate("CALC_REQ_DATE")).calcPassDate(rs.getDate("CALC_PASS_DATE")).calcPrice(rs.getInt("CALC_PRICE")).calcFinalPrice(rs.getInt("CALC_FINAL_PRICE")).build();
	}
	
	//selectCalcCount=SELECT COUNT(CALC_ID) FROM HOST_CALC WHERE HOST_ID=?
	public int selectCalcCount(Connection conn, String hostId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentCount"));
			pstmt.setString(1, hostId);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	
	}
	
	//SELECT * FROM (SELECT ROWNUM AS RNUM, C.* FROM (SELECT COUNT(CALC_ID) FROM HOST_CALC WHERE HOST_ID=?)C) WHERE RNUM BETWEEN ? AND ?;
	public List<Calc> selectAllcalcByhostId(Connection conn, String hostId, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Calc> calcList=new ArrayList<Calc>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectAllcalcByhostId"));
			pstmt.setString(1, hostId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Calc c=new Calc();
				calcList.add(getCalc(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return calcList;
	}
	
	
	
	
}
