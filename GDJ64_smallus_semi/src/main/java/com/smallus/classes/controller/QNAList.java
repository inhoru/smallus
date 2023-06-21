package com.smallus.classes.controller;

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

/**
 * Servlet implementation class QNA
 */
@WebServlet("/ajax/qnaTest.do")
public class QNAList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QNAList() {
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
		List<Qna> qnas = List.of(
				Qna.builder().qnaId("001").
				memberId("aaaa").
				classId("test-class-2").
				qnaTitle("내 손으로 만드는 작은 바다").
				qndContent("맞나?").
				qndRdate(today).
				qnaFinishYn("Y").build()
				);
		request.setAttribute("qnas", qnas);
		
		request.getRequestDispatcher("/views/qna/qnaListAjax.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
