package user_has_animal;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class UserAnimalDAO {
	public int faceInfo(int user_id, int animal_id) {
		String SQL = "INSERT INTO user_has_animal (user_id, animal_id) VALUES(?,?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, user_id);
			pstmt.setInt(2, animal_id);
			
			return pstmt.executeUpdate();  //반환값은 insert 된 개수 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
