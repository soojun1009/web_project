package com.test;

import java.util.*;
import java.sql.*;

// 강사계정관리 클래스
public class TeacherDAO {
	
	//강사 등록
		public int teacherAdd(Teacher t, List<String> availablesub) {
			int result = 0;
			
			String sql1 = "SELECT teacher_id FROM teacherSeqView";
			String sql2 = "INSERT INTO teacher(teacher_id, teacher_name, teacher_ssn, teacher_phone) VALUES (?, ?, ?, ?)";
			String sql3 = "INSERT INTO availablesub(teacher_id, sub_name_id) VALUES (?, ?)";

			Connection conn = null;
			PreparedStatement pstmt1 = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;
			try {
				conn = DatabaseConnection.connect();
				
				conn.setAutoCommit(false);

				//강사 신규 번호 얻는 과정
				String teacher_id = "teacher000";
				pstmt1 = conn.prepareStatement(sql1);
				ResultSet rs = pstmt1.executeQuery();
				while(rs.next()) {
					teacher_id = rs.getString("teacher_id");
				}
				rs.close();
				
				//강사 개인 정보 입력 과정
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, teacher_id);
				pstmt2.setString(2, t.getTeacher_name());
				pstmt2.setInt(3, t.getTeacher_ssn());
				pstmt2.setString(4, t.getTeacher_phone());
				pstmt2.executeUpdate();
				
				//강의 가능 과목 입력 과정
				pstmt3 = conn.prepareStatement(sql3);
				for (String sub_name_id : availablesub) {
					pstmt3.setString(1, teacher_id);
					pstmt3.setString(2, sub_name_id);
					pstmt3.executeUpdate();
				}
				
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
		
		//강사 삭제
		public int teacherRemove(String key, String value){
			int result = 0;
			
			Connection conn = null;
			PreparedStatement pstmt = null;	

			try{
			conn = DatabaseConnection.connect();

			String sql = String.format("DELETE FROM teacher  WHERE %s = ?", key);
			
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
		
	
	// 강사 출력
	public List<Teacher> list(String key, String value) {
		List<Teacher> result = new ArrayList<>();

		String sql = "SELECT teacher_id, teacher_name, teacher_ssn, teacher_phone, sub_name FROM admin_teacherView";
		
		switch (key) {
	      case "all":
	         break;
	      case "teacher_id" : 
	         sql += " WHERE teacher_id = ?";
	         break;
	      }
		
		sql += " ORDER BY teacher_id";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			   switch (key) {
		         case "all":
		            break;
		         case "teacher_id" : 
		            pstmt.setString(1,value);             
		            break;
		         }
		         
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacher_id(rs.getString("teacher_id"));
				teacher.setTeacher_name(rs.getString("teacher_name"));
				teacher.setTeacher_ssn(rs.getInt("teacher_ssn"));
				teacher.setTeacher_phone(rs.getString("teacher_phone"));
				teacher.setSub_name(rs.getString("sub_name"));
				
				result.add(teacher);
				
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
	
	// 강사 아이디로 이름 출력
	public List<Teacher> printName(String key){
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT teacher_name FROM teacher WHERE teacher_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, key);

			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				Teacher t = new Teacher();
				t.setTeacher_name(rs.getString("teacher_name"));
				
				result.add(t);
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
	
	// 강의 종료, 진행, 예정 출력
	public List<Teacher> printCourse(String key){
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT DISTINCT course_id, coursename, TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end, classroom_name, subject_id , sub_name, TO_CHAR(subject_start, 'yyyy-mm-dd') AS subject_start, TO_CHAR(subject_end, 'yyyy-mm-dd') As subject_end, bookname, count_student,decision FROM teacher_view10 WHERE teacher_id = ?";

		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, key);

			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				Teacher t = new Teacher();
				t.setCourse_id(rs.getString("course_id"));
				t.setCoursename(rs.getString("coursename"));
				t.setCourse_start(rs.getString("course_start"));
				t.setCourse_end(rs.getString("course_end"));
				t.setClassroom_name(rs.getString("classroom_name"));
				t.setSubject_id(rs.getString("subject_id"));
				t.setSub_name(rs.getString("sub_name"));
				t.setSubject_start(rs.getString("subject_start"));
				t.setSubject_end(rs.getString("subject_end"));
				t.setBookname(rs.getString("bookname"));
				t.setCount_student(rs.getString("count_student"));
				t.setDecision(rs.getInt("decision"));
				
				result.add(t);
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
	
	// 잠시만요
	public boolean printCourse(String key, List<Teacher> teacher){
		boolean result = false;
		
		String sql = "SELECT course_id, coursename, TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd') AS course_end, classroom_name, subject_id , sub_name, TO_CHAR(subject_start, 'yyyy-mm-dd') AS subject_start, TO_CHAR(subject_end, 'yyyy-mm-dd') As subject_end, bookname, accommodate,decision FROM teacher_view1 WHERE teacher_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, key);

			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				Teacher t = new Teacher();
				t.setCourse_id(rs.getString("course_id"));
				t.setCoursename(rs.getString("coursename"));
				t.setCourse_start(rs.getString("course_start"));
				t.setCourse_end(rs.getString("course_end"));
				t.setClassroom_name(rs.getString("classroom_name"));
				t.setSubject_id(rs.getString("subject_id"));
				t.setSub_name(rs.getString("sub_name"));
				t.setSubject_start(rs.getString("subject_start"));
				t.setSubject_end(rs.getString("subject_end"));
				t.setBookname(rs.getString("bookname"));
				t.setAccommodate(rs.getInt("accommodate"));
				t.setDecision(rs.getInt("decision"));
				
				result = teacher.add(t);
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
	
	// 배점관리 -> 출력
	public List<Teacher> scoreManage(String key, String id,String subid){ // key는 id
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT subject_id, sub_name, TO_CHAR(subject_start, 'yyyy-mm-dd') AS subject_start, TO_CHAR(subject_end, 'yyyy-mm-dd') AS subject_end, bookname,course_id,coursename,TO_CHAR(course_start, 'yyyy-mm-dd') AS course_start,TO_CHAR(course_end, 'yyyy-mm-dd')AS course_end,classroom_name, attendance_score, writing_score, practice_score, TO_CHAR(exam_date, 'yyyy-mm-dd')AS exam_date FROM teacher_view2 WHERE teacher_id =?";
		
		switch(key){
		case "all" :
			sql += "";
			break;
		case "plus" :
			sql +=" AND subject_id = ?";
			break;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);	
			
			switch(key){
			case "all" :
				pstmt.setString(1, id);
				break;
			case "plus" :
				pstmt.setString(1, id);
				pstmt.setString(2, subid);
				break;
			}		
			
			ResultSet rs = pstmt.executeQuery();			
			
			while(rs.next()){
				Teacher t = new Teacher();
				t.setSubject_id(rs.getString("subject_id"));
				t.setSub_name(rs.getString("sub_name"));
				t.setSubject_start(rs.getString("subject_start"));
				t.setSubject_end(rs.getString("subject_end"));
				t.setBookname(rs.getString("bookname"));
				t.setCourse_id(rs.getString("course_id"));
				t.setCoursename(rs.getString("coursename"));
				t.setCourse_start(rs.getString("course_start"));
				t.setCourse_end(rs.getString("course_end"));
				t.setClassroom_name(rs.getString("classroom_name"));
				t.setAttendance_score(rs.getInt("attendance_score"));
				t.setWriting_score(rs.getInt("writing_score"));
				t.setPractice_score(rs.getInt("practice_score"));
				t.setExam_date(rs.getString("exam_date"));
				
				result.add(t);	
				
			}
			rs.close();
		}catch (ClassNotFoundException | SQLException e) {
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
	
	// 	[ subject001 / 자바 / 2016-11-01 ~ 2016-12-10 ] 이렇게 나오는 부분 출력
	public List<Teacher> scoreManageSub(String id, String subid){
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT subject_id,sub_name,TO_CHAR(subject_start,'yyyy-mm-dd')AS subject_start, TO_CHAR(subject_end, 'yyyy-mm-dd')AS subject_end FROM teacher_view3 WHERE teacher_id=? AND subject_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			pstmt.setString(2, subid);
			
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()){
				Teacher t = new Teacher();
				t.setSubject_id(rs.getString("subject_id"));
				t.setSub_name(rs.getString("sub_name"));
				t.setSubject_start(rs.getString("subject_start"));
				t.setSubject_end(rs.getString("subject_end"));
				
				result.add(t);	
				
			}
			rs.close();
		}catch (ClassNotFoundException | SQLException e) {
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
	
	public List<Teacher> scoreList(String id, String subid){
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT attendance_score,writing_score,practice_score,TO_CHAR(exam_date, 'yyyy-mm-dd') AS exam_date  FROM teacher_view4  WHERE teacher_id=? AND subject_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			pstmt.setString(2, subid);
			
			ResultSet rs = pstmt.executeQuery();			
			
			while(rs.next()){
				Teacher t = new Teacher();
				
				t.setAttendance_score(rs.getInt("attendance_score"));
				t.setWriting_score(rs.getInt("writing_score"));
				t.setPractice_score(rs.getInt("practice_score"));
				t.setExam_date(rs.getString("exam_date"));
				
				result.add(t);					
			}
			rs.close();
		}catch (ClassNotFoundException | SQLException e) {
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
	
	//배점 입력
	public int scoreAdd(Teacher t){
		int result = 0;
		
		String sql = "INSERT INTO score (subject_id, attendance_score,writing_score,practice_score) VALUES(?,?,?,?)";
		String sql2 = "INSERT INTO exam(subject_id,exam_name,exam_date) VALUES(?,?,?)";
		
		Connection conn = null;
		
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		try {
			conn = DatabaseConnection.connect();
			conn.setAutoCommit(false);

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, t.getSubject_id());
			pstmt.setInt(2, t.getAttendance_score());
			pstmt.setInt(3, t.getWriting_score());
			pstmt.setInt(4, t.getPractice_score());
			
			pstmt.executeUpdate();
			
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, t.getSubject_id());
			pstmt2.setString(2, t.getExam_name());
			pstmt2.setString(3, t.getExam_date());
			
			pstmt2.executeUpdate();
			
			conn.commit();
			
			result = 1;
					
			
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
	
	// 배점관리 첫 화면 출력 메소드
	public List<Teacher> scoreManage(String id){
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT distinct subject_id, sub_name,TO_CHAR(subject_start, 'yyyy-mm-dd')AS subject_start,TO_CHAR(subject_end,'yyyy-mm-dd')AS subject_end,bookname,course_id,coursename,TO_CHAR(course_start,'yyyy-mm-dd')AS course_start,TO_CHAR(course_end, 'yyyy-mm-dd')AS course_end,classroom_name, attendance_score, writing_score, practice_score, grade FROM teacher_view5 WHERE teacher_id =?";
		sql += " ORDER BY subject_id";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();			
			
			while(rs.next()){
				Teacher t = new Teacher();
				
				t.setSubject_id(rs.getString("subject_id"));
				t.setSub_name(rs.getString("sub_name"));
				t.setSubject_start(rs.getString("subject_start"));
				t.setSubject_end(rs.getString("subject_end"));
				t.setBookname(rs.getString("bookname"));
				t.setCourse_id(rs.getString("course_id"));
				t.setCoursename(rs.getString("coursename"));
				t.setCourse_start(rs.getString("course_start"));
				t.setCourse_end(rs.getString("course_end"));
				t.setClassroom_name(rs.getString("classroom_name"));
				t.setAttendance_score(rs.getInt("attendance_score"));
				t.setWriting_score(rs.getInt("writing_score"));
				t.setPractice_score(rs.getInt("practice_score"));
				t.setGrade(rs.getInt("grade"));
				
				result.add(t);					
			}
			rs.close();
		}catch (ClassNotFoundException | SQLException e) {
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

	// 수강생 정보조회 메소드
	public List<Teacher> listInform(String id, String subject_id){
		List<Teacher> result = new ArrayList<>();
		
		String sql = "SELECT DISTINCT subject_id,sub_name, TO_CHAR(subject_start, 'yyyy-mm-dd')AS subject_start,TO_CHAR(subject_end, 'yyyy-mm-dd') AS subject_end FROM teacher_view8 WHERE subject_id = ?";
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, subject_id);
			
			ResultSet rs = pstmt.executeQuery();			
			
			while(rs.next()){
				Teacher t = new Teacher();
				
				t.setSubject_id(rs.getString("subject_id"));
				t.setSub_name(rs.getString("sub_name"));
				t.setSubject_start(rs.getString("subject_start"));
				t.setSubject_end(rs.getString("subject_end"));
			
				result.add(t);					
			}
			rs.close();
		}catch (ClassNotFoundException | SQLException e) {
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
	
	// 수강생 정보 출력 메소드, 	// 성적 정보출력
	public List<Student> listStudent(String key, String id, String subject_id, String student_id){
		List<Student> result = new ArrayList<>();
		
		String sql = "SELECT student_id, student_name, student_phone, TO_CHAR(register_date, 'yyyy-mm-dd') AS register_date, TO_CHAR(fail_date, 'yyyy-mm-dd') AS fail_date,  attendance,writing,practice FROM teacher_view9 WHERE subject_id = ?";
		
		switch(key){
		case "all" :
			sql += "";
			break;
		case "stu_id" :
			sql += " AND student_id = ?";
			break;
		}
		sql += " ORDER BY student_id";
				
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);		
			
			switch(key){
			case "all":
				pstmt.setString(1, subject_id);
				break;
			case "stu_id" :
				pstmt.setString(1, subject_id);
				pstmt.setString(2, student_id);
			}
			
			ResultSet rs = pstmt.executeQuery();			
			
			while(rs.next()){
				Student s = new Student();
				
				s.setStudent_id(rs.getString("student_id"));
				s.setStudent_name(rs.getString("student_name"));
				s.setStudent_phone(rs.getString("student_phone"));
				s.setRegister_date(rs.getString("register_date"));
				s.setFail_date(rs.getString("fail_date"));
				s.setAttendance(rs.getInt("attendance"));
				s.setWriting(rs.getInt("writing"));
				s.setPractice(rs.getInt("practice"));
				result.add(s);					
			}
			rs.close();
		}catch (ClassNotFoundException | SQLException e) {
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
	
	public List<Student> listStudentName(String id, String student_id){
		List<Student> result = new ArrayList<>();
		
		String sql = "SELECT distinct student_name, attendance, writing, practice, attendance FROM teacher_view8 WHERE student_id = ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, student_id);
			
			ResultSet rs = pstmt.executeQuery();			
			
			while(rs.next()){
				Student s = new Student();
			
				s.setStudent_name(rs.getString("student_name"));
				s.setAttendance(rs.getInt("attendance"));
				s.setWriting(rs.getInt("writing"));
				s.setPractice(rs.getInt("practice"));
				s.setAttendance(rs.getInt("attendance"));
			
				result.add(s);					
			}
			rs.close();
			
		}catch (ClassNotFoundException | SQLException e) {
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
	
	// 성적 입력
	public int gradeAdd(Grade t){
		int result = 0;
		
		String sql = "INSERT INTO Grade (grade_id, attendance,writing,practice,subject_id,student_id,COURSE_ID) VALUES((SELECT grade_id FROM gradeSeqView),?,?,?,?,?,(SELECT distinct course_id FROM grade WHERE course_id = (SELECT course_id FROM history WHERE subject_ID = ? AND student_id = ?)))";
						   
		Connection conn = null;		
		PreparedStatement pstmt = null;

		try {
			conn = DatabaseConnection.connect();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, t.getAttendance());
			pstmt.setInt(2, t.getWriting());
			pstmt.setInt(3, t.getPractice());
			pstmt.setString(4, t.getSubject_id());
			pstmt.setString(5, t.getStudent_id());
			pstmt.setString(6, t.getSubject_id());	
			pstmt.setString(7, t.getStudent_id());
			
			result = pstmt.executeUpdate();			
			
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
	
	// 과목 강사 전체 출력
		public List<Teacher> list3(String key, String value) {
			
			List<Teacher> result = new ArrayList<Teacher>();
			
			String sql = "SELECT teacher_id, teacher_name, teacher_ssn, teacher_phone, sub_name  FROM admin_teacherView3";
			switch (key) {
			case "all":
				break;
			case "teacher_id" : 
				sql += " WHERE teacher_id = ?";
				break;
			case "sub_name_id" : 
				sql += " WHERE sub_name_id = ?";
				break;	
			}
			sql += " ORDER BY teacher_id";
			
			Connection conn = null;
			PreparedStatement pstmt = null;	
			
			try{
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);
				switch (key) {
				case "all":
					break;
				case "teacher_id" : 
					pstmt.setString(1,value); 				
					break;
				case "sub_name_id" :
					pstmt.setString(1, value);
					break;
				}
				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Teacher t = new Teacher();
					t.setTeacher_id(rs.getString("teacher_id"));
					t.setTeacher_name(rs.getString("teacher_name"));
					t.setTeacher_ssn(rs.getInt("teacher_ssn"));
					t.setTeacher_phone(rs.getString("teacher_phone"));
					t.setSub_name(rs.getString("sub_name"));
					
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
		// 강사 출력-강사과목 및 진행여부 쿼리
		public List<Teacher> list2(String key, String value) {
			
			List<Teacher> result = new ArrayList<Teacher>();
			 
			String sql = "SELECT sub_name, subject_start, subject_end, coursename, course_start, course_end, bookname, classroom_name, decision FROM admin_teacherView8";
			sql += " WHERE teacher_id = ?";
			
			
			Connection conn = null;
			PreparedStatement pstmt = null;	
			
			try{
				conn = DatabaseConnection.connect();
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1,value); 				

				
				ResultSet rs = pstmt.executeQuery();
				
				while (rs.next()) {
					Teacher t = new Teacher();
					t.setSub_name(rs.getString("sub_name"));
					t.setSubject_start(rs.getString("subject_start"));
					t.setSubject_end(rs.getString("subject_end"));
					t.setCoursename(rs.getString("coursename"));
					t.setCourse_start(rs.getString("course_start"));
					t.setCourse_end(rs.getString("course_end"));
					t.setBookname(rs.getString("bookname"));
					t.setClassroom_name(rs.getString("classroom_name"));
					t.setDecision(rs.getInt("decision"));
					
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
}
