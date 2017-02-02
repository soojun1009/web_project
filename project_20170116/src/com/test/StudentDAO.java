package com.test;

import java.sql.*;
import java.util.*;
public class StudentDAO {

	// 수강생용 list메소드
	public List<Student> list(String key, String value){
		List<Student> result = new ArrayList<>();
		/*
		CREATE OR REPLACE FORCE VIEW 
 		AS 
  			SELECT s.student_id, student_name, student_ssn, register_date, student_phone, attendance
			FROM student s, history h, grade g
			WHERE s.student_id = h.student_id(+) AND h.student_id = g.student_id(+) AND h.course_id = g.course_id(+)
			ORDER BY s.student_id;
		*/
		String sql = "SELECT student_id, student_name, student_ssn, register_date, student_phone, attendance FROM stugradeView001";

		Connection conn = null;
		PreparedStatement pstmt = null;
		
		switch (key) {		
		case "all":
			sql += "";	break;
		case "student_id":
			sql += " WHERE student_id = ?";	break;
		}
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);

			switch (key) {
			case "student_id":
				pstmt.setString(1, value);	break;
			}			
			ResultSet rs = pstmt.executeQuery();			
			while (rs.next()) {
				Student stu = new Student();
				stu.setStudent_id(rs.getString("student_id"));
				stu.setStudent_name(rs.getString("student_name"));
				stu.setStudent_ssn(rs.getInt("student_ssn"));
				stu.setRegister_date(rs.getString("register_date"));
				stu.setStudent_phone(rs.getString("student_phone"));
				stu.setAttendance(rs.getInt("attendance"));
				result.add(stu);
			}
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				DatabaseConnection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	// 수강생용 list메소드
		public List<Student> list2(String key, String value){
			List<Student> result = new ArrayList<>();
			
			
			String sql = "SELECT student_id, student_name, student_ssn, register_date, student_phone FROM student";

			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			switch (key) {
			case "all":
				sql += "";
				break;
			case "student_id":
				sql += " WHERE student_id = ?";
				break;
			}
			
			sql += " ORDER BY student_id";
			
			try {
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);

				switch (key) {
				case "student_id":
					pstmt.setString(1, value);
					break;
				}
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Student stu = new Student();
					stu.setStudent_id(rs.getString("student_id"));
					stu.setStudent_name(rs.getString("student_name"));
					stu.setStudent_ssn(rs.getInt("student_ssn"));
					stu.setRegister_date(rs.getString("register_date"));
					stu.setStudent_phone(rs.getString("student_phone"));
					result.add(stu);
				}
				rs.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} finally {

				try {
					if (pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

				try {
					DatabaseConnection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
			return result;
		}
	
	
	// 관리자용 과목list메소드
		public List<Student> studentlist(String key, String value){
			List<Student> result = new ArrayList<>();
			/*
			CREATE OR REPLACE VIEW admin_examtest4
			AS
			SELECT  DISTINCT sub.subject_id, sub_name,subject_start,subject_end,bookname, co.course_id,coursename,course_start,course_end,classroom_name, attendance, 
			writing, practice
			      ,t.teacher_id, teacher_name, exam_name, attendance_score, writing_score, practice_score, DECODE(attendance_score, null, 'X', 'O') AS scoreOX, DECODE(exam_name, null, 'X', 'O')AS testOX
			  FROM subject sub, subjectname sn, bookname b, course co, coursename cn, classroom cl, grade g,teacher t,student s, history h, exam e, score sc
			  WHERE sub.sub_name_id = sn.sub_name_id(+)
			    AND sub.bookname_id=b.bookname_id(+)
			    AND co.course_id= sub.course_id(+)
			    AND co.coursename_id=cn.coursename_id(+)
			    AND co.classroom_id(+)= cl.classroom_id
			    AND g.subject_id(+) = sub.subject_id
			    AND t.teacher_id(+)= sub.teacher_id
			    AND s.student_id(+) = h.student_id
			    AND h.student_id(+) = g.student_id
			    AND sub.subject_id = e.subject_id(+)
			    AND sub.subject_id = sc.subject_id(+);
			    AND co.course_id='course003'
			    ORDER BY sub.subject_id;
			*/
			
			String sql1 = "SELECT subject_id, sub_name, TO_CHAR(subject_start, 'yyyy-mm-dd') AS subject_start, TO_CHAR(subject_end, 'yyyy-mm-dd') AS subject_end, classroom_name, teacher_name, bookname, exam_name, coursename, TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end, attendance, writing, practice, student_name, student_ssn FROM admin_examtest4";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			switch (key) {
			case "all":
				sql1 += "";
				break;
			case "student_id":
				sql1 += " WHERE student_id = ?";
				break;
			case "subject_id":
				sql1 += " WHERE subject_id = ?";
				break;
			}
			
			try {
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql1);
				
				switch (key) {
				case "all" :				
					break;
				case "student_id":
					pstmt.setString(1, value);
					break;
				case "subject_id":
					pstmt.setString(1, value);					
					break;
				}
				
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					Student stu = new Student();
					stu.setStudent_name(rs.getString("student_name"));
					stu.setStudent_ssn(rs.getInt("student_ssn"));
					stu.setSub_name(rs.getString("sub_name"));
					stu.setSubject_start(rs.getString("subject_start"));
					stu.setSubject_end(rs.getString("subject_end"));
					stu.setTeacher_name(rs.getString("teacher_name"));
					stu.setCoursename(rs.getString("coursename"));
					stu.setCourse_start(rs.getString("course_start"));
					stu.setCourse_end(rs.getString("course_end"));
					stu.setClassroom_name(rs.getString("classroom_name"));
					stu.setAttendance(rs.getInt("attendance"));
					stu.setWriting(rs.getInt("writing"));
					stu.setPractice(rs.getInt("practice"));				
					result.add(stu);
				}
				rs.close();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} finally {

				try {
					if (pstmt != null)
						pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

				try {
					DatabaseConnection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
			return result;
		}

}