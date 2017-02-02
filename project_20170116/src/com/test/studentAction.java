package com.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class studentAction {
	
	public String studentlist(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String totalcount = "0"; 
		String count = "0";
		
		StudentDAO studentDAO = new StudentDAO();
		CourseDAO courseDAO = new CourseDAO();
		SubjectDAO subjectDAO = new SubjectDAO();
		List<Course> list = null;
		
		String skey = request.getParameter("skey");
		String svalue = request.getParameter("svalue");
		
		if(skey == null){
			skey = "all";
			svalue = "";
		}
		
		list = courseDAO.listlist(skey, svalue);
		
		count = String.valueOf(list.size()); 
		
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		request.setAttribute("totalcount", totalcount );
		request.setAttribute("skey", skey);
		request.setAttribute("svalue", svalue);
		
		return "WEB-INF/source/student_2.jsp"; 
	}

}
