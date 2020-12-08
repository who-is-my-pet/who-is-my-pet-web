package model;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBUtil {
	
	public static ResultSet findUser(Connection con, String mid) {
		String sqlst = "SELECT passwd FROM user WHERE id=";
		
		Statement st;
		try {
			st = con.createStatement();
			
			if(st.execute(sqlst+"'"+mid+"'")) {
				return st.getResultSet();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
	public static void addMember(Connection con, String newId, String newpasswd 
			,String newName, String gender, String age, String insta, String email1, String email2, String description) throws SQLException {
		
		PreparedStatement pstmt = null;
		try {
			con.setAutoCommit(false);
			pstmt = con.prepareStatement("INSERT INTO user(id, passwd, name, age, gender, email, insta_id, description) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, newId);
			pstmt.setString(2, newpasswd);
			pstmt.setString(3, newName);
			pstmt.setString(4, gender);
			pstmt.setString(5,  age);
			pstmt.setString(6, insta);
			pstmt.setString(7, email1+"@"+email2);
			pstmt.setString(8, description);
			//pstmt.setString(8, imgurl);
			//pstmt.setInt(9, animal_id);
			pstmt.executeUpdate();

			con.commit();
			con.setAutoCommit(true);

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			if (pstmt != null) {pstmt.close();}

		}

	}
	
}
