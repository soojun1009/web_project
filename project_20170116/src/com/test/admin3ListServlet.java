package com.test;

import java.io.IOException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class admin3ListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		StringBuilder sb = new StringBuilder();
		String totalcount = "0"; 
		String count = "0";
		
		CourseDAO dao = new CourseDAO();
		List<Course> list = null;
		
		String skey = request.getParameter("skey");
		String svalue = request.getParameter("svalue");
		
	 	if(skey == null){
			skey = "all";
			svalue = "";
		}
		list = dao.listlist(skey, svalue);  
		
		totalcount = String.valueOf(dao.listlist(skey, svalue)); 
		count = String.valueOf(list.size()); 
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("totalcount", totalcount );
		request.setAttribute("skey", skey);
		request.setAttribute("svalue", svalue);
		
		RequestDispatcher req = request.getRequestDispatcher("WEB-INF/source/admin_3.jsp");
		req.forward(request, response);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
