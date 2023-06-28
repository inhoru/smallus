package com.smallus.admin.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.commit;
import static com.smallus.common.JDBCTemplate.getConnection;
import static com.smallus.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.smallus.Inquiry.model.vo.Inquiry;
import com.smallus.admin.dao.AdminDao;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Calc;
import com.smallus.host.model.vo.Host;
import com.smallus.member.model.vo.Member;
import com.smallus.notice.model.vo.Notice;
public class AdminService {
   
      AdminDao dao=new AdminDao();
   
   public int selectMemberCount() {
      Connection conn=getConnection();
      int totalData=dao.selectMemberCount(conn);
      close(conn);
      return totalData;
   }
   public int selectMemberSortCount(String memberSt) {
      Connection conn=getConnection();
      int totalData=dao.selectMemberSortCount(conn,memberSt);
      close(conn);
      return totalData;
   }
   public List<Member>checkMemberAll(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Member> list=dao.checkMemberAll(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   public List<Member>checkMemberSort(String memberSt,int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Member> list=dao.checkMemberSort(conn,memberSt,cPage,numPerpage);
      close(conn);
      return list;
   }
   
   public int deleteByMember(String memberId) {
      Connection conn=getConnection();
      int result=dao.deleteByMember(conn,memberId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   public int deleteByHost(String hostId) {
      Connection conn=getConnection();
      int result=dao.deleteByHost(conn,hostId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   public int deleteByClass(String classId) {
      Connection conn=getConnection();
      int result=dao.deleteByClass(conn,classId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   public int selectHostCount() {
      Connection conn=getConnection();
      int totalData=dao.selectHostCount(conn);
      close(conn);
      return totalData;
   }
   public int selectHostSortCount(String hostSt) {
      Connection conn=getConnection();
      int totalData=dao.selectHostSortCount(conn,hostSt);
      close(conn);
      return totalData;
   }
   public List<Host>checkHostAll(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Host> list=dao.checkHostAll(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   public List<Host>checkHostSort(String hostSt,int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Host> list=dao.checkHostSort(conn,hostSt,cPage,numPerpage);
      close(conn);
      return list;
   }
   
   public int selectNoticeCount() {
      Connection conn=getConnection();
      int totalData=dao.selectNoticeCount(conn);
      close(conn);
      return totalData;
   }
   
   public List<Notice> checkNoticeAll(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Notice> list=dao.checkNoticeAll(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   
   public int selectConfirmClassesCount() {
      Connection conn=getConnection();
      int totalData=dao.selectConfirmClassesCount(conn);
      close(conn);
      return totalData;
   }

   public List<Classes> checkConfirmClasses(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Classes> list=dao.checkConfirmClasses(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   
   public int classReject(String classPassId,String classId) {
      Connection conn=getConnection();
      int result=dao.classReject(conn,classPassId,classId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   public int classConfirm(String classId) {
      Connection conn=getConnection();
      int result=dao.classConfirm(conn,classId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   
   public List<Classes> ClassesAll(){
      Connection conn=getConnection();
      List<Classes> list2=dao.ClassesAll(conn);
      close(conn);
      return list2;
   }
   public int selectClassesCount() {
      Connection conn=getConnection();
      int totalData=dao.selectClassesCount(conn);
      close(conn);
      return totalData;
   }
   public List<Classes> checkClassesAll(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Classes> list=dao.checkClassesAll(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   public int selectClassSortCount(String categoryId) {
      Connection conn=getConnection();
      int totalData=dao.selectClassSortCount(conn,categoryId);
      close(conn);
      return totalData;
   }
   public List<Classes> checkClassSort(String categoryId,int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Classes> list=dao.checkClassSort(conn,categoryId,cPage,numPerpage);
      close(conn);
      return list;
   }
   public int selectConfirmCalcCount() {
      Connection conn=getConnection();
      int totalData=dao.selectConfirmCalcCount(conn);
      close(conn);
      return totalData;
   }
   public List<Calc> checkConfirmCalc(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Calc> list=dao.checkConfirmCalc(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   public int selectCalcCount(){
      Connection conn=getConnection();
      int totalData=dao.selectCalcCount(conn);
      close(conn);
      return totalData;
   }
   public int calcConfirm(int calcFinalPrice,String calcId) {
      Connection conn=getConnection();
      int result=dao.calcConfirm(conn,calcFinalPrice,calcId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   public int calcReject(String calcId) {
      Connection conn=getConnection();
      int result=dao.calcReject(conn,calcId);
      close(conn);
      if(result>0)commit(conn);
      else rollback(conn);
      return result;
   }
   public List<Calc> checkCalcAll(int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Calc> list=dao.checkCalcAll(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
   public int selectCalcSortCount(String calcStatus) {
      Connection conn=getConnection();
      int totalData=dao.selectCalcSortCount(conn,calcStatus);
      close(conn);
      return totalData;
   }
   public List<Calc> checkCalcSort(String calcStatus, int cPage, int numPerpage){
      Connection conn=getConnection();
      List<Calc> list=dao.checkCalcSort(conn,calcStatus,cPage,numPerpage);
      close(conn);
      return list;
   }
   public Classes classHostId(String classId) {
      Connection conn=getConnection();
      Classes c=dao.classHostId(conn,classId);
      close(conn);
      return c; 
   }
   public int selectInquiryCount() {
      Connection conn=getConnection();
      int totalData=dao.selectInquiryCount(conn);
      close(conn);
      return totalData;
   }
   public List<Inquiry> checkInquiryAll(int cPage,int numPerpage){
      Connection conn=getConnection();
      List<Inquiry> list=dao.checkInquiryAll(conn,cPage,numPerpage);
      close(conn);
      return list;
   }
	public int inquiryAnswerEnroll(String boardId,String commentConent) {
		Connection conn=getConnection();
		int result=dao.inquiryAnswerEnroll(conn,boardId,commentConent);
		close(conn);
		return result;
	}
	public int inquiryUpdate(String boardId,String boardCheck) {
		Connection conn=getConnection();
		int result2=dao.inquiryUpdate(conn,boardId,boardCheck);
		close(conn);
		return result2;
	}
	public int selectInquirySortCount(String boardCheck) {
	    Connection conn=getConnection();
	    int totalData=dao.selectInquirySortCount(conn,boardCheck);
	    close(conn);
	    return totalData;
	}
	public List<Inquiry> checkInquirySort(String boardCheck, int cPage, int numPerpage){
	      Connection conn=getConnection();
	      List<Inquiry> list=dao.checkInquirySort(conn,boardCheck,cPage,numPerpage);
	      close(conn);
	      return list;
	}
	public List<Classes> recentConfirmClasses(){
		Connection conn=getConnection();
		List<Classes> list=dao.recentConfirmClasses(conn);
		close(conn);
		return list;
	}
	public List<Calc> recentConfirmCalc(){
		Connection conn=getConnection();
		List<Calc> list2=dao.recentConfirmCalc(conn);
		close(conn);
		return list2;
	}
}