package com.test;

import java.util.*;
import java.sql.*;

public class CourseNameDAO {

	// 과정 입력
	public int add(CourseName cn) {
		int result = 0;

		String sql = "INSERT INTO coursename(coursename_id, coursename) VALUES ((SELECT coursename_id FROM coursenameSeqView), ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cn.getCoursename());

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
	public List<CourseName> list(String key, String value) {
		List<CourseName> result = new ArrayList<>();

		String sql = "SELECT coursename_id, coursename FROM coursename ";

		switch (key) {
		case "all":
			sql += "";
			break;
		case "cn_id":
			sql += " WHERE coursename_id =?";
			break;
		}
		sql += " ORDER BY coursename_id";

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DatabaseConnection.connect();
			pstmt = conn.prepareStatement(sql);
			switch (key) {
			case "all":
				break;
			case "cn_id":
				pstmt.setString(1, value);
				break;
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CourseName cn = new CourseName();

				cn.setCoursename_id(rs.getString("coursename_id"));
				cn.setCoursename(rs.getString("coursename"));

				result.add(cn);
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

		String sql = "DELETE FROM coursename WHERE coursename_id = ?";

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