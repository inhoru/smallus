package com.smallus.Inquiry.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smallus.Inquiry.model.service.InquiryService;
import com.smallus.Inquiry.model.vo.Faq;
import com.smallus.Inquiry.model.vo.Inquiry;
import com.smallus.Inquiry.model.vo.InquiryImg;
import com.smallus.member.model.vo.Member;

/**
 * Servlet implementation class MembInquiryServlet
 */
@WebServlet("/memberInquiry.do")
public class MembInquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembInquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 페이징 처리
    	
        int cPage, numPerpage;
        try {
            cPage = Integer.parseInt(request.getParameter("cPage"));
        } catch (NumberFormatException e) {
            cPage = 1;
        }
        try {
            numPerpage = Integer.parseInt(request.getParameter("numPerpage"));
        } catch (NumberFormatException e) {
            numPerpage = 5;
        }
        HttpSession session = request.getSession();
        Member loginMember = (Member) session.getAttribute("loginMember");
    	String categorie = request.getParameter("categorie");
		List<Faq> faqcategorie = new InquiryService().selectCategorie(categorie);
        List<Faq> faqList = new InquiryService().selectAllFaq();
        List<Inquiry> list = new InquiryService().selectAllInquiry(cPage, numPerpage, loginMember.getMemberId());


        int totalData = new InquiryService().selectInquiryCount(loginMember.getMemberId());
        
        
        int totalPage = (int) Math.ceil((double) totalData / numPerpage);
        int pageBarSize = 5;
        int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
        int pageEnd = pageNo + pageBarSize - 1;
      
        String pageBar = "";
        if (pageNo == 1) {
            pageBar += "<span class='h-pageBar-txt'> 이전 </span>";
        } else {
            pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + (pageNo - 1) + "&numPerpage=" + numPerpage + "' class='h-pageBar-txt'> 이전 </a>";
        }
        while (!(pageNo > pageEnd || pageNo > totalPage)) {
            if (pageNo == cPage) {
                pageBar += "<span class='h-pageBar-now'> " + pageNo + " </span>";
            } else {
                pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + pageNo + "&numPerpage=" + numPerpage + "'> " + pageNo + " </a>";
            }
            pageNo++;
        }
        if (pageNo > totalPage) {
            pageBar += "<span class='h-pageBar-txt'> 다음 </span>";
        } else {
            pageBar += "<a href='" + request.getRequestURI() + "?cPage=" + pageNo + "&numPerpage=" + numPerpage + "' class='h-pageBar-txt'> 다음 </a>";
        }

        request.setAttribute("pageBar", pageBar);
        request.setAttribute("inquiry", list);
        request.setAttribute("faqList", faqList);
        request.setAttribute("faqcategoie", faqcategorie);
        request.getRequestDispatcher("views/mypage/memberInquiry.jsp").forward(request, response);
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
