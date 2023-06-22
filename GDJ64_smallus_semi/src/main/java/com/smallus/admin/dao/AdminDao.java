package com.smallus.admin.dao;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.member.dao.MemberDao.getMember;
import static com.smallus.notice.dao.NoticeDao.getNotice;
import static com.smallus.classes.model.dao.ClassesDao.getClasses;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.smallus.classes.model.vo.Classes;
import com.smallus.common.JDBCTemplate;
import com.smallus.member.model.vo.Member;
import com.smallus.notice.model.vo.Notice;

public class AdminDao {
	private Properties sql = new Properties();// final로 선언하면 처리속도 빨라짐

	{
		String path = JDBCTemplate.class.getResource("/sql/admin.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int selectMemberCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public List<Member> checkMemberAll(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("checkMemberAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getMember(rs)); //getMember는 MemberDao에 있는 메소드를 스태틱으로 선언해서 불러옴
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectNoticeCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public List<Notice> checkNoticeAll(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("checkNoticeAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getNotice(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int selectConfirmClassesCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectConfirmClassesCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public List<Classes> checkConfirmClasses(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("checkConfirmClasses"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getClasses(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
}
