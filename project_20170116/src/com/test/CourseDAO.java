package com.test;

import java.sql.*;
import java.util.*;

public class CourseDAO {
	
	// 기본확인출력
	
	public List<Course> listlist(String key, String value) {
		
		List<Course> result = new ArrayList<Course>();
		
		String sql = "SELECT course_id, coursename, course_start, course_end, classroom_name, accommodate FROM adminview1";
		switch (key) {
		case "all":
			break;
		case "course_id" : 
			sql += " WHERE course_id = ?";
			break;
		}
		sql += " ORDER BY course_id";
		
		Connection conn = null;
		PreparedStatement pstmt = null;	
		
		try{
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			switch (key) {
			case "all":
				break;
			case "course_id" : 
				pstmt.setString(1,value); 				
				break;
			}
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Course c = new Course();
				c.setCourse_id(rs.getString("course_id"));
				c.setCoursename(rs.getString("coursename"));
				c.setCourse_start(rs.getString("course_start"));
				c.setCourse_end(rs.getString("course_end"));
				c.setClassroom_name(rs.getString("classroom_name"));
				c.setAccommodate(rs.getInt("accommodate"));

				result.add(c);
			}
			rs.close();

		}catch(ClassNotFoundException|SQLException e){
			e.printStackTrace();

		}finally{
			try{
				if(pstmt != null)
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			try{
				DatabaseConnection.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}	
		
		return result;
	}
	
	
	public List<Course> list(String key, String value){
		List<Course> result = new ArrayList<>();
	/*
	CREATE OR REPLACE VIEW studentview1
	AS
	SELECT c.course_id,cn.coursename,c.course_start,c.course_end,s.student_id
	  FROM course c, coursename cn ,student s,history h
	  WHERE s.student_id = h.student_id
	    AND h.course_id = c.course_id 
	    AND c.coursename_id=cn.coursename_id;
	*/ 
	
	
		String sql = "SELECT course_id, coursename, TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end, student_id FROM studentview1";
	
	
		Connection conn = null;
		PreparedStatement pstmt = null;
	
		switch (key) {
		case "all" :
			break;			
		case "student_id":
			sql += " WHERE student_id = ?";			
			break;
		case "course_id":
			sql += " WHERE course_id = ?";
			break;
		}
		
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
	
			switch (key) {
			case "all":
				break;
			case "student_id":
				pstmt.setString(1, value);
				break;
			case "course_id":
				pstmt.setString(1, value);
				break;
			}
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
	
				Course cou = new Course();
				cou.setCourse_id(rs.getString("course_id"));
				cou.setCoursename(rs.getString("coursename"));
				cou.setCourse_start(rs.getString("course_start"));
				cou.setCourse_end(rs.getString("course_end"));
				cou.setStudent_id(rs.getString("student_id"));
				result.add(cou);
	
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
	
	
	//과정 등록
		public int courseAdd(Course c) {
			int result = 0;
			
			String sql1 = "SELECT course_id FROM courseSeqView";
			String sql2 = "INSERT INTO course(course_id, course_start, course_end, classroom_id, coursename_id) VALUES (?, ?, ?, ?, ?)";

			Connection conn = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;
			try {
				conn = DatabaseConnection.connect();
				
				conn.setAutoCommit(false);

				//강사 신규 번호 얻는 과정
				String course_id = "course000";
				pstmt1 = conn.prepareStatement(sql1);
				ResultSet rs = pstmt1.executeQuery();
				while(rs.next()) {
					course_id = rs.getString("course_id");
				}
				rs.close();
				
				//강사 개인 정보 입력 과정
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, course_id);
				pstmt2.setString(2, c.getCourse_start());
				pstmt2.setString(3, c.getCourse_end());
				pstmt2.setString(4, c.getClassroom_id());
				pstmt2.setString(5, c.getCoursename_id());

				pstmt2.executeUpdate();
				
				
				conn.commit();
				result = 1;

			} catch (ClassNotFoundException | SQLException e) {
				try {
					conn.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
				e.printStackTrace();
			} finally {

				try {
					if (pstmt3 != null)
						pstmt3.close();
					if (pstmt2 != null)
						pstmt2.close();
					if (pstmt1 != null)
						pstmt1.close();
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
	
		//과정 삭제
		public int courseRemove(String key, String value){
			int result = 0;
			
			Connection conn = null;
			PreparedStatement pstmt = null;	

			try{
			conn = DatabaseConnection.connect();

			String sql = String.format("DELETE FROM course  WHERE %s = ?", key);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, value);
			result = pstmt.executeUpdate();
			
			}catch(ClassNotFoundException|SQLException e){
				e.printStackTrace();

			}finally{
				try{
					if(pstmt != null)
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
				try{
					if(conn != null)
					conn.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}	
			
			return result;
		}
	

		// 과정 출력-과목등록갯수, 등록인원
		public List<Course> list2(String key, String value) {
			
			List<Course> result = new ArrayList<Course>();
			
			String sql = "SELECT course_id, coursename, course_start, course_end, classroom_name ,count_subject ,accommodate ,count_student FROM admin_courseView5";
			sql += " ORDER BY course_id";
			
			Connection conn = null;
			PreparedStatement pstmt = null;	
			
			try{
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);
			
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Course c = new Course();
					c.setCourse_id(rs.getString("course_id"));
					c.setCoursename(rs.getString("coursename"));
					c.setCourse_start(rs.getString("course_start"));
					c.setCourse_end(rs.getString("course_end"));
					c.setClassroom_name(rs.getString("classroom_name"));
					c.setAccommodate(rs.getInt("accommodate"));
					c.setCount_subject(rs.getInt("count_subject"));
					c.setCount_student(rs.getInt("count_student"));

					result.add(c);
				}
				rs.close();

			}catch(ClassNotFoundException|SQLException e){
				e.printStackTrace();

			}finally{
				try{
					if(pstmt != null)
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
				try{
					DatabaseConnection.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}	
			
			return result;
		}
		
		//과정 선택 후 과목 출력
		public List<Teacher> list3(String key, String value) {
			
			List<Teacher> result = new ArrayList<Teacher>();
			
			String sql = "SELECT sub_name, subject_start, subject_end, bookname, teacher_name FROM admin_teacherView2 WHERE course_id = ?";
			
			Connection conn = null;
			PreparedStatement pstmt = null;	
			
			try{
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, value);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Teacher t = new Teacher();
					t.setSub_name(rs.getString("sub_name"));
					t.setSubject_start(rs.getString("subject_start"));
					t.setSubject_end(rs.getString("subject_end"));
					t.setBookname(rs.getString("bookname"));
					t.setTeacher_name(rs.getString("teacher_name"));

					result.add(t);
				}
				rs.close();

			}catch(ClassNotFoundException|SQLException e){
				e.printStackTrace();

			}finally{
				try{
					if(pstmt != null)
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
				try{
					DatabaseConnection.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}	
			
			return result;
		}
		
		
		//과정 선택 후 수강생 출력
		public List<Student> list4(String key, String value) {
			
			List<Student> result = new ArrayList<Student>();
			
			String sql = "SELECT  student_id, student_name, student_ssn, student_phone, register_date, course_id ,fail_date FROM admin_courseview4 WHERE course_id = ?";
			sql += " ORDER BY student_id";
			
			Connection conn = null;
			PreparedStatement pstmt = null;	
			
			try{
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, value);
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Student s = new Student();
					s.setStudent_id(rs.getString("student_id"));
					s.setStudent_name(rs.getString("student_name"));
					s.setStudent_ssn(rs.getInt("student_ssn"));
					s.setStudent_phone(rs.getString("student_phone"));
					s.setRegister_date(rs.getString("register_date"));
					s.setCourse_id(rs.getString("course_id"));
					s.setFail_date(rs.getString("fail_date"));

					result.add(s);
				}
				rs.close();

			}catch(ClassNotFoundException|SQLException e){
				e.printStackTrace();

			}finally{
				try{
					if(pstmt != null)
					pstmt.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
				try{
					DatabaseConnection.close();
				}catch(SQLException e){
					e.printStackTrace();
				}
			}	
			
			return result;
		}
		
		
		
		public List<Course> courselist(String key, String value){
			List<Course> result = new ArrayList<>();
		
			String sql = "SELECT distinct course_id,coursename,TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start,TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end FROM teacher_view2 ";
			switch (key) {
			case "all" :
				sql += "";
				break;
			case "course_id":
				sql += " WHERE course_id = ? ";
				break;
			}
			
			sql += " ORDER BY course_id";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			try {
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);

				switch (key) {
				case "all":
					break;
				case "course_id" :
					pstmt.setString(1, value);
					break;
				}
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					
					Course c = new Course();
					
					c.setCourse_id(rs.getString("course_id"));
					c.setCoursename(rs.getString("coursename"));
					c.setCourse_start(rs.getString("course_start"));
					c.setCourse_end(rs.getString("course_end"));
					
					result.add(c);

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
