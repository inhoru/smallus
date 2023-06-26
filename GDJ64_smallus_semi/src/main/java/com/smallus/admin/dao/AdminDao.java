package com.smallus.admin.dao;

import static com.smallus.classes.model.dao.ClassesDao.getClasses;
import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.host.dao.CalcDao.getCalc;
import static com.smallus.host.dao.HostDao.getHost;
import static com.smallus.member.dao.MemberDao.getMember;
import static com.smallus.notice.dao.NoticeDao.getNotice;
import static com.smallus.notice.dao.NoticeDao.getNoticeImage;

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
import com.smallus.host.model.vo.Calc;
import com.smallus.host.model.vo.Host;
import com.smallus.member.model.vo.Member;
import com.smallus.notice.model.vo.Notice;
import com.smallus.notice.model.vo.NoticeImage;

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
			//SELECT COUNT(*) FROM MEMBER
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
	public int selectMemberSortCount(Connection conn, String memberSt) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//SELECT COUNT(*) FROM MEMBER WHERE MEMBER_ST=?
			pstmt=conn.prepareStatement(sql.getProperty("selectMemberSortCount"));
			pstmt.setString(1, memberSt);
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
			//SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM MEMBER)M) WHERE RNUM BETWEEN ? AND ?
			pstmt=conn.prepareStatement(sql.getProperty("checkMemberAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getMember(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Member> checkMemberSort(Connection conn, String memberSt,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList();
		try {
			//SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM MEMBER WHERE MEMBER_ST=?)M) WHERE RNUM BETWEEN ? AND ?
			pstmt=conn.prepareStatement(sql.getProperty("checkMemberSort"));
			pstmt.setString(1, memberSt);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getMember(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public int deleteByMember(Connection conn,String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//UPDATE MEMBER SET MEMBER_ST='N' WHERE MEMBER_ID = ?
			pstmt=conn.prepareStatement(sql.getProperty("deleteByMember"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int deleteByHost(Connection conn,String hostId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteByHost"));
			pstmt.setString(1, hostId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int deleteByClass(Connection conn,String classId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteByClass"));
			pstmt.setString(1, classId);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<Host> checkHostAll(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Host> list=new ArrayList();
		try {
			//SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM HOST WHERE HOST_ST='Y')M) WHERE RNUM BETWEEN ? AND ?
			pstmt=conn.prepareStatement(sql.getProperty("checkHostAll"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getHost(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	public List<Host> checkHostSort(Connection conn, String hostSt, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Host> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("checkHostSort"));
			pstmt.setString(1, hostSt);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getHost(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public int selectHostCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//selectHostCount=SELECT COUNT(*) FROM HOST WHERE HOST_ST IN('Y')
			pstmt=conn.prepareStatement(sql.getProperty("selectHostCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public int selectHostSortCount(Connection conn,String hostSt) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectHostSortCount"));
			pstmt.setString(1, hostSt);
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	
	public int selectNoticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//SELECT COUNT(*) FROM NOTICE
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
			//SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM NOTICE)M) WHERE RNUM BETWEEN ? AND ?
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
	public List<NoticeImage> checkNoticeImageAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<NoticeImage> list2=new ArrayList();
		try {
			//checkNoticeImageAll=SELECT * FROM NOTICE_IMAGE
			pstmt=conn.prepareStatement(sql.getProperty("checkNoticeImageAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list2.add(getNoticeImage(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list2;
	}
	
	public int selectConfirmClassesCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//SELECT COUNT(*) FROM CLASS WHERE CLASS_PASS_ID='W'
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
			//SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM CLASS JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_PASS_ID='W')M) WHERE RNUM BETWEEN ? AND ?
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
	
	public int classReject(Connection conn,String classPassId,String classId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//UPDATE CLASS SET CLASS_PASS_ID=?,CLASS_PASS_DATE=SYSDATE WHERE CLASS_ID=?
			pstmt=conn.prepareStatement(sql.getProperty("classReject"));
			pstmt.setString(1, classPassId);
			pstmt.setString(2, classId);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int classConfirm(Connection conn,String classId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			//UPDATE CLASS SET CLASS_PASS_ID='Y' WHERE CLASS_ID=?
			pstmt=conn.prepareStatement(sql.getProperty("classConfirm"));
			pstmt.setString(1, classId);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<Classes> ClassesAll(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list2=new ArrayList();
		try {
			//classesAll=SELECT * FROM CLASS JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_PASS_ID='Y' AND CLASS_STATUS='Y'
			pstmt=conn.prepareStatement(sql.getProperty("classesAll"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list2.add(getClasses(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list2;
	}
	public int selectClassesCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//selectClassesCount=SELECT COUNT(*) FROM CLASS WHERE CLASS_PASS_ID='Y' AND CLASS_STATUS='Y'
			pstmt=conn.prepareStatement(sql.getProperty("selectClassesCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public List<Classes> checkClassesAll(Connection conn,int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList();
		try {
			//checkClassesAll=SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM CLASS JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_PASS_ID='Y' AND CLASS_STATUS='Y')M) WHERE RNUM BETWEEN ? AND ?
			pstmt=conn.prepareStatement(sql.getProperty("checkClassesAll"));
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
	public int selectClassSortCount(Connection conn,String categoryId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//selectClassSortCount=SELECT COUNT(*) FROM CLASS JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_PASS_ID='Y' AND CLASS_STATUS='Y' AND CATEGORY_ID=?
			pstmt=conn.prepareStatement(sql.getProperty("selectClassSortCount"));
			pstmt.setString(1,categoryId);
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public List<Classes> checkClassSort(Connection conn, String categoryId, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList();
		try {
			//checkClassSort=SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM CLASS JOIN CATEGORY USING(CATEGORY_ID) WHERE CLASS_PASS_ID='Y' AND CLASS_STATUS='Y' AND CATEGORY_ID=?)M) WHERE RNUM BETWEEN ? AND ?
			pstmt=conn.prepareStatement(sql.getProperty("checkClassSort"));
			pstmt.setString(1, categoryId);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
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
	public int selectConfirmCalcCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int totalData=0;
		try {
			//selectConfirmCalcCount=SELECT COUNT(*) FROM CALC WHERE CALC_STATUS='W'
			pstmt=conn.prepareStatement(sql.getProperty("selectConfirmCalcCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) 
				totalData=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return totalData;
	}
	public List<Calc> checkConfirmCalc(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Calc> list=new ArrayList();
		try {
			//checkConfirmCalc=SELECT * FROM (SELECT ROWNUM AS RNUM, M.* FROM (SELECT * FROM CALC WHERE CALC_STATUS='W')M) WHERE RNUM BETWEEN ? AND ?
			pstmt=conn.prepareStatement(sql.getProperty("checkConfirmCalc"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				list.add(getCalc(rs));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
}
