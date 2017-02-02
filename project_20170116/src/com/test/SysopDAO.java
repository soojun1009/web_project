package com.test;

import java.sql.*;
import java.util.*;

public class SysopDAO {
	
	public List<Sysop> listStudent(String key, String value){
		List<Sysop> result = new ArrayList<>();
		
		String sql = "SELECT student_id, student_name, student_ssn, TO_CHAR(register_date,'yyyy-mm-dd')AS register_date, student_phone ,count_history FROM adminview3";
		
		switch(key){
		case "all" :
			sql += "";
			break;
		case "student_id" :
			sql += " WHERE student_id = ?";
			break;
		}
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			switch(key){
			case "all" :
				break;
			case "student_id" :
				pstmt.setString(1, value);
				break;
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Sysop sysop = new Sysop();
				sysop.setStudent_id(rs.getString("student_id"));
				sysop.setStudent_name(rs.getString("student_name"));
				sysop.setStudent_ssn(rs.getInt("student_ssn"));
				sysop.setRegister_date(rs.getString("register_date"));
				sysop.setStudent_phone(rs.getString("student_phone"));
				sysop.setCount_history(rs.getString("count_history"));
				
				result.add(sysop);				
				
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
	
	public int registStudent(Sysop s, List<String> history){
		int result = 0;
		
		String sql = "INSERT INTO student(student_id, student_name, student_ssn, register_date, student_phone) VALUES ((SELECT student_id FROM studentSeqView), ?, ?, ?,?)";
		   
		Connection conn = null;		
		PreparedStatement pstmt = null;

		try {
			conn = DatabaseConnection.connect();
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, s.getStudent_name());
			pstmt.setInt(2, s.getStudent_ssn());
			pstmt.setString(3, s.getRegister_date());
			pstmt.setString(4, s.getStudent_phone());			
			
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
	
	public int addStudent(Sysop s){
		int result = 0;
		
		String sql = "INSERT INTO student(student_id, student_name, student_ssn, register_date, student_phone) VALUES ((SELECT student_id FROM studentSeqView), ?, ?, ?,?)";
		   
		Connection conn = null;		
		PreparedStatement pstmt = null;

		try {
			conn = DatabaseConnection.connect();
			
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, s.getStudent_name());
			pstmt.setInt(2, s.getStudent_ssn());
			pstmt.setString(3, s.getRegister_date());
			pstmt.setString(4, s.getStudent_phone());			
			
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
	
	// 잠깐만
	public int addStudent(Sysop s, List<String> history){
		int result = 0;
		
		String sql1 = "SELECT student_id FROM studentSeqView";
		String sql2 = "INSERT INTO student(student_id, student_name, student_ssn, register_date, student_phone) VALUES (?, ?, ?, ?, ?)";
		String sql3 = "INSERT INTO history(student_id, course_id) VALUES (?, ?)";
		   
		Connection conn = null;		
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		try {
			conn = DatabaseConnection.connect();
			
			conn.setAutoCommit(false);
			
			// 학생 신규번호 얻는 과정
			String student_id = "student000";
			pstmt1 = conn.prepareStatement(sql1);
			ResultSet rs = pstmt1.executeQuery();
			while(rs.next()){
				student_id = rs.getString("student_id");
			}
		
			rs.close();
			
			// 수강생 입력 과정
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, student_id);
			pstmt2.setString(2, s.getStudent_name());			
			pstmt2.setInt(3, s.getStudent_ssn());
			pstmt2.setString(4, s.getRegister_date());
			pstmt2.setString(5, s.getStudent_phone());
			pstmt2.executeUpdate();
			
			// courseID 입력 과정
			pstmt3 = conn.prepareStatement(sql3);
			for (String course_id : history) {
			pstmt3.setString(1, student_id);
			pstmt3.setString(2, course_id);
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
	
	// 신규 과정 연결을 위한 출력 메소드
	public List<Sysop> listNewCourse(String key, String value){
		List<Sysop> result = new ArrayList<>();
		
		String sql = "SELECT course_id, coursename, course_start, course_end, classroom_name , accommodate ,count_student FROM admin_courseView5";
		
		switch(key){
		case "all" :
			sql += "";
			break;
		case "cour_id" :
			sql += " WHERE course_id = ?";
			break;
		}
		
		sql += " ORDER BY course_id";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			switch(key){
			case "all" :
				break;
			case "cour_id" :
				pstmt.setString(1, value);
				break;
			}

			ResultSet rs = pstmt.executeQuery();
			 
			while (rs.next()) {
				Sysop sysop = new Sysop();
				
				sysop.setCourse_id(rs.getString("course_id"));
				sysop.setCoursename(rs.getString("coursename"));
				sysop.setCourse_start(rs.getString("course_start"));
				sysop.setCourse_end(rs.getString("course_end"));
				sysop.setClassroom_name(rs.getString("classroom_name"));
				sysop.setAccommodate(rs.getInt("accommodate"));
				sysop.setCount_student(rs.getInt("count_student"));
				
				result.add(sysop);				
				
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
	
	// 수강생이 듣는(들었던) 과정 출력
	public List<Sysop> listCourse(String student_id){
		List<Sysop> result = new ArrayList<>();
		
		String sql = "SELECT Distinct student_id,coursename,TO_CHAR(course_start, 'yyyy-mm-dd')AS course_start, TO_CHAR(course_end, 'yyyy-mm-dd')AS course_end, classroom_name,TO_CHAR(fail_date, 'yyyy-mm-dd')AS fail_date, DECODE(fail_date, NULL, 'O','X') AS decision FROM admin_student3 ad Where student_id =  ?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, student_id);
	
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Sysop sysop = new Sysop();
				sysop.setStudent_id(rs.getString("student_id"));
				sysop.setCoursename(rs.getString("coursename"));
				sysop.setCourse_start(rs.getString("course_start"));
				sysop.setCourse_end(rs.getString("course_end"));
				sysop.setClassroom_name(rs.getString("classroom_name"));
				sysop.setFail_date(rs.getString("fail_date"));
				sysop.setDecision(rs.getString("decision"));
				
				result.add(sysop);				
				
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
	
	//수강생 삭제 메소드
	public int remove(String student_id){
		int result = 0;
		
		String sql = "DELETE FROM student WHERE student_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, student_id);
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

}
