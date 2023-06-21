package com.smallus.host.dao;

import static com.smallus.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

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
   public Host hostLogin(Connection conn,String hostId,String password) {
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      Host h=null;
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
   public Host selectByhostId(Connection conn,String hostId) {
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      Host h=null;
      try {
         //selectByhostId=SELECT * FROM HOST WHERE HOST_ID=? AND HOST_ST='Y'
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
         //selectByhostNickname=SELECT * FROM HOST WHERE HOST_NICKNAME=? AND HOST_ST='Y'
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
         //enrollHost=INSERT INTO MEMBER VALUES(?,?,?,?,?,?,DEFAULT,DEFAULT,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)
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
   public Host updateHostCalc(Connection conn, String hostId) {
      PreparedStatement pstmt=null;
      ResultSet rs=null;
      Host h=null;
      try {
         //updateHostCalc=SELECT HOST_ACCOUNT_BANK, HOST_ACCOUNT, HOST_ACCOUNT_NAME FROM HOST WHERE HOST_ID=?
         pstmt=conn.prepareStatement(sql.getProperty("updateHostCalc"));
         pstmt.setString(1, hostId);
         rs=pstmt.executeQuery();
         if(rs.next()) {
            h.setHostAccount(rs.getString("HOST_ACCOUNT"));
            h.setHostAccountBank(rs.getString("HOST_ACCOUNT_BANK"));
            h.setHostAccountName(rs.getString("HOST_ACCOUNT_NAME"));
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(rs);
         close(pstmt);
      }return h;
   }
   
   public int updateHostCalc(Connection conn, String accountBank, String account, String accountName,String hostId) {
      PreparedStatement pstmt=null;
      int result=0;
      Host h=null;
      try {
         //updateHostCalc=UPDATE HOST SET HOST_ACCOUNT_BANK=?, HOST_ACCOUNT=?, HOST_ACCOUNT_NAME=? WHERE HOST_ID=?
         pstmt=conn.prepareStatement(sql.getProperty("updateHostCalc"));
         pstmt.setString(1, accountBank);
         pstmt.setString(2, account);
         pstmt.setString(3, accountName);
         pstmt.setString(4, hostId);
         result=pstmt.executeUpdate();
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }return result;
   }
   
}