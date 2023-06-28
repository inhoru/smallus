package com.smallus.qna.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.qna.model.vo.Qna;
import com.smallus.qna.model.vo.Qnac;
import com.smallus.qna.service.QnaService;
import com.smallus.qna.service.QnacService;

/**
 * Servlet implementation class QNA
 */
@WebServlet("/ajax/qnaTest.do")
public class QNAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date today=null;
		try {
			today=sdf.parse("2023-06-20");
		}catch(ParseException e) {
			//e.printStackTrace()
			today=new Date();
		}
		
//		List<Qna> qnas = List.of(
//				Qna.builder().qnaId("001").
//				memberId("aaaa").
//				classId("test-class-2").
//				qnaTitle("내 손으로 만드는 작은 바다").
//				qndContent("맞나?").
//				qndRdate(today).
//				qnaFinishYn("Y").build()
//				);
		
		List<Qna> qnas=new QnaService().detailQnaList();
		List<Qnac> qnacs=new QnacService().detailQnacList();

		request.setAttribute("qnas", qnas);
		request.setAttribute("qnacs", qnacs);
		
		request.getRequestDispatcher("/views/qna/qnalist.jsp").forward(request, response); //주소수정예정
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
