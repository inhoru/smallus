package com.smallus.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smallus.admin.service.AdminService;
import com.smallus.classes.model.vo.Classes;
import com.smallus.host.model.vo.Calc;

/**
 * Servlet implementation class AdminMaingServlet
 */
@WebServlet("/admin/AdminMainServlet.do")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Classes> list=new AdminService().recentConfirmClasses();
		List<Calc> list2=new AdminService().recentConfirmCalc();
		if(list!=null&&!list.isEmpty()) {
		request.setAttribute("ClassesList", list);
		request.setAttribute("CalcList", list2);
		request.getRequestDispatcher("/views/admin/adminMain.jsp").forward(request, response);
		}else {
		request.getRequestDispatcher("/views/admin/adminMain.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
