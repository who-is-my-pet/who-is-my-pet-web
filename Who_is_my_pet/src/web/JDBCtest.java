package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class JDBCtest {
	public static void main(String[] args) {
		Connection conn = null;
		Properties connectionProps = new Properties();
		connectionProps.put("user", "root");
		connectionProps.put("password", "value");
		
		try {
			conn = DriverManager.getConnection("jdbc:"+"mysql"+"://" + "db-who-is-my-pet.chhwpuwsmntx.ap-northeast-2.rds.amazonaws.com" + ":"+"3306"+"/"+"mydb", connectionProps);
		}catch(SQLException e) {
			
		}
		
	}
}
