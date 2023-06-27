package com.smallus.host.dao;

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

import com.smallus.host.model.vo.Host;
import com.smallus.member.model.vo.Notifications;

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
            hostAccountName(rs.getString("HOST_ACCOUNT_NAME")).
            calcReqDate(rs.getInt("CALC_REQ_DATE")).
            build();
   }
   public Host hostLogin(Connection conn,String hostId,String password) {
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      Host h=null;
      try {
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
   public Host selectByhostId(Connection conn,String hostId) {
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      Host h=null;
      try {
         pstmt=conn.prepareStatement(sql.getProperty("selectByhostId"));
         pstmt.setString(1, hostId);
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
   public Host selectByhostNickname(Connection conn,String hostNickname) {
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      Host h=null;
      try {
         pstmt=conn.prepareStatement(sql.getProperty("selectByhostNickname"));
         pstmt.setString(1, hostNickname);
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
   public int enrollHost(Connection conn, Host h) {
      PreparedStatement pstmt=null;
      int result=0;
      try {
         pstmt = conn.prepareStatement(sql.getProperty("enrollHost"));
         pstmt.setString(1, h.getHostId());
         pstmt.setString(2, h.getHostPw());
         pstmt.setString(3, h.getHostName());
         pstmt.setString(4, h.getHostPhone());
         pstmt.setString(5, h.getHostHomephone());
         pstmt.setString(6, h.getHostEmail());
         pstmt.setString(7, h.getHostConsent());
         pstmt.setString(8, h.getHostNickname());
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }return result;
   }
   
   public int updateHostCalc(Connection conn, String accountBank, String account, String accountName, int calcReqDate, String hostId) {
		PreparedStatement pstmt=null;
		int result=0;
		Host h=null;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateHostCalc"));
			pstmt.setString(1, accountBank);
			pstmt.setString(2, account);
			pstmt.setString(3, accountName);
			pstmt.setInt(4, calcReqDate);
			pstmt.setString(5, hostId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
   
   public int deleteHostByhostId(Connection conn, String hostId, String password) {
	   PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteHostByhostId"));
			pstmt.setString(1,hostId);
			pstmt.setString(2, password);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
   }
   
   
   public int updateHostNickname(Connection conn,String hostNickname, String hostId) {
	      PreparedStatement pstmt=null;
	      ResultSet rs=null;
	      int result=0;
	      try {
	         pstmt=conn.prepareStatement(sql.getProperty("updateHostNickname"));
	         pstmt.setString(1, hostNickname);
	         pstmt.setString(2, hostId);
	         rs=pstmt.executeQuery();
	         if(rs.next()) result=rs.getInt(1);
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	      }return result;
   }
	
   public int updateHostProfile(Connection conn,Host h,String hostId) {
	      PreparedStatement pstmt=null;
	      int result=0;
	      try {
	         pstmt=conn.prepareStatement(sql.getProperty("updateHostProfile"));
	         pstmt.setString(1, h.getHostPw());
	         pstmt.setString(2, h.getHostHomephone());
	         pstmt.setString(3, h.getHostImg());
	         pstmt.setString(4, h.getHostNickname());
	         pstmt.setString(5, h.getHostEmail());
	         pstmt.setString(6, hostId);
	         result=pstmt.executeUpdate();
	      }catch(SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }return result;
	}
   public List<Notifications> selectAllNotifications(Connection conn, String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notifications> list=new ArrayList<Notifications>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectAllNotifications"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getNotifications(rs));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int notificationsCount(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("notificationsCount"));
			//SELECT COUNT(HOST_ID) FROM NOTIFICATIONS WHERE HOST_ID =?
			pstmt.setString(1,memberId);
			rs=pstmt.executeQuery();
			if(rs.next())result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	}
	public int notifications(Connection conn, String notId) {
		PreparedStatement pstmt=null;
		int result=0;

		try {
			pstmt=conn.prepareStatement(sql.getProperty("notifications"));
			//DELETE FROM NOTIFICATIONS WHERE NOTIFL_ID=?
			pstmt.setString(1,notId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int insertNot(Connection conn, String notId,String title) {
		PreparedStatement pstmt=null;
		int result=0;

		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNot"));
			//INSERT INTO NOTIFICATIONS VALUES(NTC_SEQUENCE.NEXTVAL,?,null,?,?,SYSDATE,?)
			String c="승인이되었습니다.";
			String d="클래스";
			pstmt.setString(1,notId);
			pstmt.setString(2,title);
			pstmt.setString(3,c);
			pstmt.setString(4,d);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int insertNot2(Connection conn, String notId,String title) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("insertNot"));
			//INSERT INTO NOTIFICATIONS VALUES(NTC_SEQUENCE.NEXTVAL,?,null,?,?,SYSDATE,?)
			String c="거절되었습니다.";
			String d="클래스";
			pstmt.setString(1,notId);
			pstmt.setString(2,title);
			pstmt.setString(3,c);
			pstmt.setString(4,d);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	public static Notifications getNotifications(ResultSet rs) throws SQLException {
		return Notifications.builder().notiflId(rs.getString("NOTIFL_ID")).hostId(rs.getString("HOST_ID")).memberId(rs.getString("MEMBER_ID")).typeTitle(rs.getString("TYPT_TITLE")).notiflMessage(rs.getString("NOTIFL_MESSAGE")).createdAt(rs.getDate("CREATED_AT")).notiflType(rs.getString("NOTIFL_TYPE")).build();
	}

   
   
   
   
}