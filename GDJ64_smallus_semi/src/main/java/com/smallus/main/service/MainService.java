package com.smallus.main.service;

import static com.smallus.common.JDBCTemplate.close;
import static com.smallus.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.smallus.classes.model.vo.Classes;
import com.smallus.main.dao.MainDao;

public class MainService {
	private MainDao dao= new MainDao();
	
	public List<Classes> mainPage(){
		Connection conn= getConnection();
		List<Classes> list=dao.mainPage(conn);
		close(conn);
		return list;
	}
}
