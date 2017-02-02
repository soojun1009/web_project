package com.test;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class adminAction {
	
	public String studentlist(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String totalcount = "0"; 
		String count = "0";
		
		SysopDAO sysopDAO = new SysopDAO();
		BookNameDAO booknameDAO = new BookNameDAO();
		ClassRoomDAO classroomDAO  = new ClassRoomDAO();
		CourseNameDAO coursenameDAO = new CourseNameDAO();
		SubjectNameDAO subjectNameDAO  = new SubjectNameDAO();
		TeacherDAO teacherDAO = new TeacherDAO();
		StudentDAO studentDAO = new StudentDAO();
		CourseDAO courseDAO = new CourseDAO();
		SubjectDAO subjectDAO = new SubjectDAO();
		
		String skey = request.getParameter("skey");
		String svalue = request.getParameter("svalue");
		
		List<Course> list1 = null;
		List<Student> list2 = null;
		
		
		if(skey == null){
			skey = "all";
			svalue = "";
		}
		
		list1 = courseDAO.list2(skey, svalue);
		list2 = courseDAO.list4(skey, svalue);
				
		count = String.valueOf(list1.size()); 
		
		request.setAttribute("list1", list1);
		request.setAttribute("list2", list2);
		request.setAttribute("count", count);
		request.setAttribute("totalcount", totalcount );
		request.setAttribute("skey", skey);
		request.setAttribute("svalue", svalue);
		
		return "WEB-INF/source/admin_3.jsp"; 
	}

}
