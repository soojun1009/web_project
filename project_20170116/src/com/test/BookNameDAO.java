package com.test;

import java.util.*;
import java.sql.*;

public class BookNameDAO {

	
	public int add(BookName bn) {
		int result = 0;

		String sql = "INSERT INTO bookname(bookname_id, bookname, publisher) VALUES ((SELECT bookname_id FROM booknameSeqView), ? , ?)";

		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DatabaseConnection.connect();

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bn.getBookname());
			pstmt.setString(2, bn.getPublisher());

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

	// Ãâ·Â
	public List<BookName> list(String key, String value) {
		List<BookName> result = new ArrayList<>();

		String sql = "SELECT bookname_id, bookname, publisher FROM bookname";

		switch (key) {
		case "all":
			sql += "";
			break;
		case "bn_id":
			sql += " WHERE bookname_id =?";
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
			case "bn_id":
				pstmt.setString(1, value);
				break;
			}

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				BookName bn = new BookName();

				bn.setBookname_id(rs.getString("bookname_id"));
				bn.setBookname(rs.getString("bookname"));
				bn.setPublisher(rs.getString("publisher"));

				result.add(bn);
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

		String sql = "DELETE FROM bookname WHERE bookname_id = ? ";

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