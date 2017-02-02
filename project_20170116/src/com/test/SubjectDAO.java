package com.test;

import java.sql.*;
import java.util.*;

public class SubjectDAO {
	
	// 수강생용 과목list메소드
		public List<Subject> list(String key, String value1, String value2){
			List<Subject> result = new ArrayList<>();

			String sql = "SELECT subject_id, sub_name, classroom_name, attendance_score, writing_score, practice_score, attendance, writing, practice, student_id, course_id, coursename, TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end, TO_CHAR(subject_start, 'yyyy-mm-dd') AS subject_start, TO_CHAR(subject_end, 'yyyy-mm-dd') AS subject_end FROM studentview7";
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			switch (key) {
			case "student_id":
				sql += " WHERE student_id = ? AND course_id = ?";
				break;
			case "subject_id":
				sql += " WHERE subject_id = ?";
				break;
			}
			
			try {
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);

				switch (key) {
				case "student_id":
					pstmt.setString(1, value1);
					pstmt.setString(2, value2);
					break;
				case "subject_id":
					pstmt.setString(1, value1);
					break;
				}
				
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					Subject sub = new Subject();
					sub.setSubject_id(rs.getString("subject_id"));
					sub.setSub_name(rs.getString("sub_name"));
					sub.setClassroom_name(rs.getString("classroom_name"));
					sub.setAttendance_score(rs.getInt("attendance_score"));
					sub.setWriting_score(rs.getInt("writing_score"));
					sub.setPractice_score(rs.getInt("practice_score"));
					sub.setAttendance(rs.getString("attendance"));
					sub.setWriting(rs.getString("writing"));
					sub.setPractice(rs.getString("practice"));
					sub.setStudent_id(rs.getString("student_id"));
					sub.setCourse_id(rs.getString("course_id"));
					sub.setCoursename(rs.getString("coursename"));
					sub.setCourse_start(rs.getString("course_start"));
					sub.setCourse_end(rs.getString("course_end"));
					
					// subject_start, subject_end 12.14 19시25분 추가
					sub.setSubject_start(rs.getString("subject_start"));
					sub.setSubject_end(rs.getString("subject_end"));
					
					
					result.add(sub);

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
		
		
	//과정 출력
	public List<Subject> list(String key, String value) {
			
		List<Subject> result = new ArrayList<Subject>();
		
		/*
		CREATE OR REPLACE VIEW admin_courseView5
		AS  
		SELECT distinct ad.course_id, ad.coursename, ad.course_start, ad.course_end , classroom_name , accommodate
		      ,(SELECT count(*)FROM subject sub WHERE sub.course_id = ad.course_id) AS count_subject
		      ,(SELECT count(*)FROM history h WHERE h.course_id = ad.course_id) AS count_student
		FROM adminview2 ad,history h
		WHERE h.course_id(+) = ad.course_id
		ORDER BY course_id;
		*/
	
			String sql = "SELECT course_id, coursename, course_start, course_end , classroom_name,count_subject, accommodate ,count_student FROM admin_courseView5";
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
					Subject s = new Subject();
					s.setCourse_id(rs.getString("course_id"));
					s.setCoursename(rs.getString("coursename"));
					s.setCourse_start(rs.getString("course_start"));
					s.setCourse_end(rs.getString("course_end"));
					s.setClassroom_name(rs.getString("classroom_name"));
					s.setCount_subject(rs.getString("count_subject"));
					s.setAccommodate(rs.getInt("accommodate"));
					s.setCount_student(rs.getString("count_student"));
				
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
	
	//과목 출력
	public List<Subject> list2(String key, String value) {
			
		List<Subject> result = new ArrayList<Subject>();
			
		//String sql = "SELECT subject_id,sub_name, subject_start, subject_end, teacher_name, bookname FROM admin_teacherView6";
		String sql = "SELECT distinct subject_id, sub_name, coursename, classroom_name ,subject_start, subject_end, teacher_name, bookname FROM admin_teacherView6";
		switch (key) {
		case "all":
			break;
		case "course_id" : 
			sql += " WHERE course_id = ?";
			break;	
		case "subject_id" :
			sql += " WHERE subject_id = ?";
			break;
		}
			sql += " ORDER BY subject_id";
			
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
			case "subject_id" :
				pstmt.setString(1, value);
			}
				
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Subject s = new Subject();
				s.setSubject_id(rs.getString("subject_id"));
				s.setSub_name(rs.getString("sub_name"));
				s.setCoursename(rs.getString("coursename"));
				s.setClassroom_name(rs.getString("classroom_name"));
				s.setSubject_start(rs.getString("subject_start"));
				s.setSubject_end(rs.getString("subject_end"));
				s.setTeacher_name(rs.getString("teacher_name"));
				s.setBookname(rs.getString("bookname"));
				
							
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
			
		//과목 등록
	public int subjectAdd(Subject s) {
			int result = 0;
			
			String sql1= "SELECT subject_id FROM subjcetSeqView";
			String sql2 = "INSERT INTO subject(subject_id, subject_start,subject_end, course_id,teacher_id, bookname_id,sub_name_id)  VALUES (?,?,?, ?, ?, ?,?)";
			
			Connection conn = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;

			try {
				conn = DatabaseConnection.connect();
				
				conn.setAutoCommit(false);

				//과목 신규 번호 얻는 과정
				String subject_id = "subject000";
				pstmt1 = conn.prepareStatement(sql1);
				ResultSet rs = pstmt1.executeQuery();
				while(rs.next()) {
					subject_id = rs.getString("subject_id");
				}
				rs.close();
				
				//강사 개인 정보 입력 과정
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, subject_id);
				pstmt2.setString(2, s.getSubject_start());
				pstmt2.setString(3, s.getSubject_end());
				pstmt2.setString(4, s.getCourse_id());
				pstmt2.setString(5, s.getTeacher_id());
				pstmt2.setString(6, s.getBookname_id());
				pstmt2.setString(7, s.getSub_name_id());
				
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
			
		//과목 삭제
	public int subjectRemove(String key, String value){
			int result = 0;
				
			Connection conn = null;
			PreparedStatement pstmt = null;	

			try{
			conn = DatabaseConnection.connect();

			String sql = "DELETE FROM subject WHERE subject_id = ?";
			
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
	
	// 관리자용 과목list메소드
		public List<Subject> subjectlist(String key, String value){
			List<Subject> result = new ArrayList<>();
			/*
			CREATE OR REPLACE VIEW admin_examtest2
			AS
			SELECT  DISTINCT sub.subject_id, sub_name,subject_start,subject_end,bookname, co.course_id,coursename,course_start,course_end,classroom_name
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
			    AND sub.subject_id = sc.subject_id(+)
			    ORDER BY sub.subject_id;
			*/
			
			String sql1 = "SELECT subject_id, sub_name, classroom_name, teacher_name, bookname, scoreOX, testOX, exam_name, coursename, TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end FROM admin_examtest2";
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			
			switch (key) {
			case "all":
				sql1 += "";
				break;
			case "course_id":
				sql1 += " WHERE course_id = ?";
				break;
			case "subject_id":
				break;
			}
			
			try {
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql1);
				
				switch (key) {
				case "all" :
					break;
				case "course_id":
					pstmt.setString(1, value);					
					break;
				case "subject_id":
					break;
				}
				
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {

					Subject sub = new Subject();
					sub.setSubject_id(rs.getString("subject_id"));
					sub.setSub_name(rs.getString("sub_name"));
					sub.setClassroom_name(rs.getString("classroom_name"));
					sub.setTeacher_name(rs.getString("teacher_name"));
					sub.setBookname(rs.getString("bookname"));
					sub.setScoreOX(rs.getString("scoreOX"));
					sub.setTestOX(rs.getString("testOX"));
					sub.setCoursename(rs.getString("coursename"));
					sub.setCourse_start(rs.getString("course_start"));
					sub.setCourse_end(rs.getString("course_end"));
					
					result.add(sub);

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