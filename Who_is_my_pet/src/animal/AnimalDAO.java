package animal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;
public class AnimalDAO {
	public ArrayList<AnimalDTO> getAnimalInfo() {
		String SQL = "SELECT name, description, celebs from animal";
		//조회 결과 여러개 담을 객체 
		ArrayList<AnimalDTO> list = new ArrayList<AnimalDTO>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;  

		try {
			Connection conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				AnimalDTO animalDTO = new AnimalDTO(); 
				animalDTO.setName(rs.getString("name"));
				animalDTO.setDescription(rs.getString("description"));
				animalDTO.setCelebs(rs.getString("celebs"));
				list.add(animalDTO);
			}
			for(int i=0; i<list.size(); i++) {
				AnimalDTO tmp = list.get(i); 
				System.out.println(tmp.getName()+tmp.getDescription()+"\n");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
