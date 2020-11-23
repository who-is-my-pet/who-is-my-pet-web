package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBUtil {
	public static void insertBoard(Connection con, String name, String email, String tel, String url, String description) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			con.setAutoCommit(false);
			
			pstmt = con.prepareStatement("INSERT INTO Post (name, email, phoneNumber, webSite, description) VALUES(?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, tel);
			pstmt.setString(4, url);
			pstmt.setString(5, description);
			pstmt.executeUpdate();
			System.out.println("Insert 성공"); 
			
			con.commit();			
			con.setAutoCommit(true);

		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) {pstmt.close();}
		}
	}
}
