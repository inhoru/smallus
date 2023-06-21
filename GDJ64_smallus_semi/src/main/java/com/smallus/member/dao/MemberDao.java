package com.smallus.member.dao;

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

import com.smallus.classes.model.vo.Category;
import com.smallus.classes.model.vo.ClassDetail;
import com.smallus.classes.model.vo.Classes;
import com.smallus.common.JDBCTemplate;
import com.smallus.member.model.vo.Member;
import com.smallus.member.model.vo.Wishlist;
import com.smallus.payment.model.vo.Payment;

public class MemberDao {
	private Properties sql = new Properties();// final로 선언하면 처리속도 빨라짐

	{
		String path = JDBCTemplate.class.getResource("/sql/member.properties").getPath();
		try {
			sql.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member memberLogin(Connection conn, String memberId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("memberLogin"));
			// SELECT * FROM MEMBER WHERE MEMBER_ID=? AND MEMBER_PW=?
			pstmt.setString(1, memberId);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}	
		return m;
	}

	public int enrollMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("enrollMember"));
			// INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,DEFAULT,DEFAULT)
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberPhone());
			pstmt.setString(5, m.getMemberEmail());
			pstmt.setString(6, m.getMemberConsent());
			pstmt.setString(7, m.getMemberNickname());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member selectByMemberId(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectByMemberId"));
			// SELECT * FROM MEMBER WHERE MEMBER_ID=?
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}

	public Member selectBymemberNickname(Connection conn, String memberNickname) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBymemberNickname"));
			// SELECT * FROM MEMBER WHERE MEMBER_ID=?
			pstmt.setString(1, memberNickname);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}

	public int updatePassword(Connection conn, String userId, String password) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("updatePassword"));
			//updatePassword=UPDATE MEMBER SET MEMBER_PW=? WHERE MEMBER_ID=?
			pstmt.setString(1, password);
			pstmt.setString(2, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


	public int KakaoenrollMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("KakaoenrollMember"));
			// INSERT INTO MEMBER VALUES(?,?,?,?,?,DEFAULT,?,DEFAULT,DEFAULT)	
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getMemberName());
			pstmt.setString(4, m.getMemberPhone());
			pstmt.setString(5, m.getMemberEmail());
			pstmt.setString(6, m.getMemberNickname());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public Member kakaoLogin(Connection conn, String memberEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("kakaoLogin"));
			// SELECT * FROM MEMBER WHERE MEMBER_EMAIL=?
			pstmt.setString(1, memberEmail);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m = getMember(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return m;

	}
	public Member selectBynickName(Connection conn ,String nickName) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(sql.getProperty("selectBynickName"));
			pstmt.setString(1, nickName);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				m=(getMember(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return m;
	}
	public int updateMember(Connection conn, Member m,String s) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("updateMember"));
			//UPDATE MEMBER SET MEMBER_NICKNAME=?,MEMBER_IMG=? WHERE MEMBER_ID=?
			pstmt.setString(1, m.getMemberNickname());
			pstmt.setString(2, m.getMemberImg());
			pstmt.setString(3, s);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int deleteByMember(Connection conn, String memberId,String password) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteByMember"));
			//UPDATE MEMBER SET MEMBER_ST='N' WHERE MEMBER_ID = ? AND MEMBER_PW=?
			pstmt.setString(1,memberId);
			pstmt.setString(2, password);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public List<Member> paymentDetails(Connection conn, String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Member> list=new ArrayList<Member>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("paymentDetails"));
			//SELECT PAYMENT_STATUS,PAYMENT_DATE,CLASS_TITLE,CLASS_THUMBNAIL, P.CLASS_PERSONNEL,BOOKING_TIME_START,BOOKING_TIME_END FROM PAYMENT P JOIN CLASS_DETAIL USING(CLASS_DETAIL_ID) JOIN CLASS USING(CLASS_ID) WHERE MEMBER_ID=?
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Classes c=new Classes();
				Payment p=new Payment();
				ClassDetail d=new ClassDetail();
				p.setPaymentStatus(rs.getString("PAYMENT_STATUS"));
				p.setPaymentDate(rs.getDate("PAYMENT_DATE"));
				c.setClassTitle(rs.getString("CLASS_TITLE"));
				c.setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				p.setClassPersonnel(rs.getInt("CLASS_PERSONNEL"));
				d.setBookingTimeStart(rs.getDate("BOOKING_TIME_START"));
				d.setBookingTimeEnd(rs.getDate("BOOKING_TIME_END"));
				Member m = new Member();
				m.setClasses(c);
				m.setPayment(p);
				m.setClassDetail(d);
				list.add(m);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<Classes> wishList(Connection conn, String memberId){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Classes> list=new ArrayList<Classes>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("wishList"));
			pstmt.setString(1, memberId);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Wishlist w = new Wishlist();
				w.setMemberId(rs.getString("MEMBER_ID"));
				Category g=new Category();
				g.setCategoryTitle(rs.getString("CATEGORY_TITLE"));
				Classes c=new Classes();
				c.setClassTitle(rs.getString("CLASS_TITLE"));
				c.setClassThumbnail(rs.getString("CLASS_THUMBNAIL"));
				c.setWishlist(w);
				c.setCategory(g);
				list.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int wishRemove(Connection conn, String memberId,String title) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("wishRemove"));
			//wishRemove=DELETE FROM WISH WHERE MEMBER_ID = ? AND CLASS_ID=(SELECT CLASS_ID FROM CLASS WHERE CLASS_TITLE=?)
			pstmt.setString(1,memberId);
			pstmt.setString(2, title);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int wishAdd(Connection conn, String memberId,String title) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("wishAdd"));
			//INSERT INTO WISH VALUES('WIS'||SEQ_WISH_ID.NEXTVAL,?,(SELECT CLASS_ID FROM CLASS WHERE CLASS_TITLE=?));
			pstmt.setString(1,memberId);
			pstmt.setString(2, title);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	public int wishListCount(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("wishListCount"));
			//SELECT COUNT(MEMBER_ID) FROM WISH WHERE MEMBER_ID=? 
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
	
	


	public static Member getMember(ResultSet rs) throws SQLException {
		return Member.builder().memberId(rs.getString("member_id")).memberPw(rs.getString("MEMBER_PW"))
				.memberName(rs.getString("MEMBER_NAME")).memberPhone(rs.getString("MEMBER_PHONE"))
				.memberEmail(rs.getString("MEMBER_EMAIL")).memberConsent(rs.getString("MEMBER_CONSENT"))
				.memberImg(rs.getString("MEMBER_IMG")).memberNickname(rs.getString("MEMBER_NICKNAME"))
				.memberSt(rs.getString("MEMBER_ST")).build();
	}
}
