package com.test;

import java.util.*;
import java.sql.*;

public class SubjectNameDAO {

	// 과정 입력
	public int add(SubjectName sn) {
		int result = 0;

		String sql = "INSERT INTO subjectname(sub_name_id, sub_name) VALUES ((SELECT sub_name_id FROM subjectnameSeqView), ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sn.getSub_name());

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
	public List<SubjectName> list(String key, String value) {
		List<SubjectName> result = new ArrayList<>();

		String sql = "SELECT sub_name_id, sub_name FROM subjectname";

		switch (key) {
		case "all":
			sql += "";
			break;
		case "sn_id":
			sql += " WHERE sub_name_id =?";
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
			case "sn_id":
				pstmt.setString(1, value);
				break;
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				SubjectName sn = new SubjectName();

				sn.setSub_name_id(rs.getString("sub_name_id"));
				sn.setSub_name(rs.getString("sub_name"));

				result.add(sn);
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

		String sql = "DELETE FROM subjectname WHERE sub_name_id = ?";

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