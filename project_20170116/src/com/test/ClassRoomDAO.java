package com.test;

import java.util.*;
import java.sql.*;

public class ClassRoomDAO {

	// 과정 입력
	public int add(ClassRoom cl) {
		int result = 0;

		String sql = "INSERT INTO Classroom(classroom_id, classroom_name, accommodate) VALUES ((SELECT classroom_id FROM classroomSeqView), ?,?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cl.getClassroom_name());
			pstmt.setInt(2, cl.getAccommodate());
			
			
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

	// 출력
	public List<ClassRoom> list(String key, String value) {
		List<ClassRoom> result = new ArrayList<>();

		String sql = "SELECT classroom_id, classroom_name, accommodate FROM classroom ";

		switch(key){
		case "all" :
			sql += "";
			break;
		case "cl_id" :
			sql += " WHERE classroom_id =?";
			break;
		}
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			switch (key) {
			case "all":
				break;
			case "cl_id":
				pstmt.setString(1, value);
				break;
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				ClassRoom cl = new ClassRoom();

				cl.setClassroom_id(rs.getString("classroom_id"));
				cl.setClassroom_name(rs.getString("classroom_name"));
				cl.setAccommodate(rs.getInt("accommodate"));

				result.add(cl);
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

	public int remove(String value) {
		int result = 0;
		String sql = "DELETE FROM classroom WHERE classroom_id = ?";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, value);
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
